const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;
const HashMap = std.HashMap;
const Allocator = std.mem.Allocator;

/// Simple YAML value representation
pub const YamlValue = union(enum) {
    string: []const u8,
    integer: i64,
    float: f64,
    boolean: bool,
    null_value: void,
    array: ArrayList(YamlValue),
    object: HashMap([]const u8, YamlValue, std.hash_map.StringContext, std.hash_map.default_max_load_percentage),

    pub fn deinit(self: *YamlValue, allocator: Allocator) void {
        switch (self.*) {
            .string => |s| allocator.free(s),
            .array => |*arr| {
                for (arr.items) |*item| {
                    item.deinit(allocator);
                }
                arr.deinit();
            },
            .object => |*obj| {
                var iter = obj.iterator();
                while (iter.next()) |entry| {
                    allocator.free(entry.key_ptr.*);
                    entry.value_ptr.deinit(allocator);
                }
                obj.deinit();
            },
            else => {},
        }
    }

    pub fn asString(self: YamlValue) ?[]const u8 {
        return switch (self) {
            .string => |s| s,
            else => null,
        };
    }

    pub fn asArray(self: YamlValue) ?ArrayList(YamlValue) {
        return switch (self) {
            .array => |arr| arr,
            else => null,
        };
    }

    pub fn asObject(self: YamlValue) ?HashMap([]const u8, YamlValue, std.hash_map.StringContext, std.hash_map.default_max_load_percentage) {
        return switch (self) {
            .object => |obj| obj,
            else => null,
        };
    }

    pub fn get(self: YamlValue, key: []const u8) ?YamlValue {
        return switch (self) {
            .object => |obj| obj.get(key),
            else => null,
        };
    }
};

/// Simple YAML parser for OpenTelemetry semantic convention files
pub const YamlParser = struct {
    allocator: Allocator,
    source: []const u8,
    pos: usize,
    line: usize,
    col: usize,

    const ParseError = error{
        OutOfMemory,
        InvalidSyntax,
        UnexpectedEndOfInput,
    };

    pub fn init(allocator: Allocator, source: []const u8) YamlParser {
        return YamlParser{
            .allocator = allocator,
            .source = source,
            .pos = 0,
            .line = 1,
            .col = 1,
        };
    }

    pub fn parse(self: *YamlParser) ParseError!YamlValue {
        self.skipWhitespace();
        return self.parseValue();
    }

    /// Parse using an arena allocator, then copy to final allocator to avoid leaks
    pub fn parseClean(allocator: Allocator, source: []const u8) ParseError!YamlValue {
        var arena = std.heap.ArenaAllocator.init(allocator);
        defer arena.deinit();

        var parser = YamlParser.init(arena.allocator(), source);
        const temp_result = try parser.parse();

        // Deep copy the result to the main allocator
        return copyYamlValue(allocator, temp_result);
    }

    fn copyYamlValue(allocator: Allocator, value: YamlValue) ParseError!YamlValue {
        switch (value) {
            .string => |s| return YamlValue{ .string = try allocator.dupe(u8, s) },
            .integer => |i| return YamlValue{ .integer = i },
            .float => |f| return YamlValue{ .float = f },
            .boolean => |b| return YamlValue{ .boolean = b },
            .null_value => return YamlValue{ .null_value = {} },
            .array => |arr| {
                var new_arr = ArrayList(YamlValue).init(allocator);
                for (arr.items) |item| {
                    try new_arr.append(try copyYamlValue(allocator, item));
                }
                return YamlValue{ .array = new_arr };
            },
            .object => |obj| {
                var new_obj = HashMap([]const u8, YamlValue, std.hash_map.StringContext, std.hash_map.default_max_load_percentage).init(allocator);
                var iter = obj.iterator();
                while (iter.next()) |entry| {
                    const key_copy = try allocator.dupe(u8, entry.key_ptr.*);
                    const value_copy = try copyYamlValue(allocator, entry.value_ptr.*);
                    try new_obj.put(key_copy, value_copy);
                }
                return YamlValue{ .object = new_obj };
            },
        }
    }

    fn parseValue(self: *YamlParser) ParseError!YamlValue {
        self.skipWhitespace();

        if (self.pos >= self.source.len) {
            return YamlValue{ .null_value = {} };
        }

        const ch = self.source[self.pos];

        // Handle different value types
        switch (ch) {
            '{' => return self.parseInlineBracketObject(),
            '[' => return self.parseArray(),
            '"', '\'' => return self.parseQuotedString(),
            '-' => {
                // Could be negative number or array item or YAML list
                if (self.pos + 1 < self.source.len) {
                    const next_ch = self.source[self.pos + 1];
                    if (next_ch == ' ' or next_ch == '\t' or next_ch == '\n') {
                        // This is a YAML list item
                        return self.parseArray();
                    } else if (std.ascii.isDigit(next_ch)) {
                        // This is a negative number
                        return self.parseNumber();
                    }
                }
                return self.parseUnquotedString();
            },
            '0'...'9' => return self.parseNumber(),
            't', 'f' => return self.parseBoolean(),
            'n' => return self.parseNull(),
            else => {
                // Check if this looks like an object (has key: somewhere)
                const rest_of_line = self.source[self.pos..];
                if (std.mem.indexOf(u8, rest_of_line, ":")) |colon_pos| {
                    // Check if the colon is before a newline
                    if (std.mem.indexOf(u8, rest_of_line[0..colon_pos], "\n") == null) {
                        return self.parseObject();
                    }
                }
                return self.parseUnquotedString();
            },
        }
    }

    // Handle inline objects with { }
    fn parseInlineBracketObject(self: *YamlParser) ParseError!YamlValue {
        var obj = HashMap([]const u8, YamlValue, std.hash_map.StringContext, std.hash_map.default_max_load_percentage).init(self.allocator);

        self.pos += 1; // Skip '{'
        self.skipWhitespace();

        while (self.pos < self.source.len and self.source[self.pos] != '}') {
            // Parse key
            const key_start = self.pos;
            while (self.pos < self.source.len and self.source[self.pos] != ':') {
                self.pos += 1;
            }

            if (self.pos >= self.source.len) break;

            const key = try self.allocator.dupe(u8, std.mem.trim(u8, self.source[key_start..self.pos], " \t"));

            self.pos += 1; // Skip ':'
            self.skipWhitespace();

            const value = try self.parseValue();
            try obj.put(key, value);

            self.skipWhitespace();
            if (self.pos < self.source.len and self.source[self.pos] == ',') {
                self.pos += 1;
                self.skipWhitespace();
            }
        }

        if (self.pos < self.source.len) self.pos += 1; // Skip '}'

        return YamlValue{ .object = obj };
    }

    fn parseObject(self: *YamlParser) ParseError!YamlValue {
        // Check if this is the start of an array (line starts with -)
        if (self.pos < self.source.len and self.source[self.pos] == '-') {
            return self.parseArray();
        }

        var obj = HashMap([]const u8, YamlValue, std.hash_map.StringContext, std.hash_map.default_max_load_percentage).init(self.allocator);

        // If we're not at the start of a line, this might be an object that started on a previous line
        const start_indent = self.getCurrentIndent();

        while (self.pos < self.source.len) {
            self.skipWhitespace();
            if (self.pos >= self.source.len) break;

            const current_indent = self.getCurrentIndent();
            if (current_indent < start_indent and obj.count() > 0) break;

            // Check if we've hit an array
            if (self.source[self.pos] == '-') {
                // This line starts an array, not an object
                break;
            }

            // Parse key
            const key_start = self.pos;
            while (self.pos < self.source.len and self.source[self.pos] != ':') {
                self.pos += 1;
            }

            if (self.pos >= self.source.len) break;

            const key = try self.allocator.dupe(u8, std.mem.trim(u8, self.source[key_start..self.pos], " \t"));

            // Skip ':'
            self.pos += 1;
            self.skipWhitespace();

            // Check if the value is on the next line
            var value: YamlValue = undefined;
            if (self.pos < self.source.len and self.source[self.pos] == '\n') {
                // Value is on next line(s) - could be an array or nested object
                self.skipToNextLine();
                self.skipWhitespace();

                if (self.pos < self.source.len and self.source[self.pos] == '-') {
                    // This is an array
                    value = try self.parseArray();
                } else {
                    // This is either a nested object or a simple value
                    value = try self.parseValue();
                }
            } else {
                // Value is on the same line
                value = try self.parseValue();
            }

            try obj.put(key, value);

            // Move to next line if we're not already there
            if (self.pos < self.source.len and self.source[self.pos] != '\n') {
                self.skipToNextLine();
            }
        }

        return YamlValue{ .object = obj };
    }

    fn parseArray(self: *YamlParser) ParseError!YamlValue {
        var arr = ArrayList(YamlValue).init(self.allocator);

        if (self.pos < self.source.len and self.source[self.pos] == '[') {
            // JSON-style array
            self.pos += 1;
            self.skipWhitespace();

            while (self.pos < self.source.len and self.source[self.pos] != ']') {
                const value = try self.parseValue();
                try arr.append(value);

                self.skipWhitespace();
                if (self.pos < self.source.len and self.source[self.pos] == ',') {
                    self.pos += 1;
                    self.skipWhitespace();
                }
            }

            if (self.pos < self.source.len) self.pos += 1; // Skip ']'
        } else {
            // YAML-style array with -
            const start_indent = self.getCurrentIndent();

            while (self.pos < self.source.len) {
                self.skipWhitespace();
                if (self.pos >= self.source.len) break;

                const current_indent = self.getCurrentIndent();
                if (current_indent < start_indent) break;

                if (self.source[self.pos] != '-') break;

                self.pos += 1; // Skip '-'
                self.skipWhitespace();

                // Parse the array item which could be an object or simple value
                var value: YamlValue = undefined;

                // Check if the value starts on the next line (nested object)
                if (self.pos < self.source.len and self.source[self.pos] == '\n') {
                    self.skipToNextLine();
                    self.skipWhitespace();
                    value = try self.parseValue();
                } else {
                    // Value is on the same line or continues from current position
                    value = try self.parseValue();
                }

                try arr.append(value);

                // The parseValue() should have left us at the right position
                // for the next iteration to find the next array item
            }
        }

        return YamlValue{ .array = arr };
    }

    fn parseQuotedString(self: *YamlParser) ParseError!YamlValue {
        const quote_char = self.source[self.pos];
        self.pos += 1;

        const start = self.pos;
        while (self.pos < self.source.len and self.source[self.pos] != quote_char) {
            if (self.source[self.pos] == '\\') {
                self.pos += 2; // Skip escape sequence
            } else {
                self.pos += 1;
            }
        }

        const content = try self.allocator.dupe(u8, self.source[start..self.pos]);
        if (self.pos < self.source.len) self.pos += 1; // Skip closing quote

        return YamlValue{ .string = content };
    }

    fn parseUnquotedString(self: *YamlParser) ParseError!YamlValue {
        const start = self.pos;

        // Handle special YAML scalar indicators
        if (self.pos < self.source.len and (self.source[self.pos] == '>' or self.source[self.pos] == '|')) {
            return self.parseMultilineString();
        }

        while (self.pos < self.source.len) {
            const ch = self.source[self.pos];
            if (ch == '\n' or ch == '\r' or ch == ':' or ch == '#') {
                break;
            }
            self.pos += 1;
        }

        const content = std.mem.trim(u8, self.source[start..self.pos], " \t");
        const result = try self.allocator.dupe(u8, content);

        return YamlValue{ .string = result };
    }

    fn parseMultilineString(self: *YamlParser) ParseError!YamlValue {
        const indicator = self.source[self.pos]; // '>' or '|'
        self.pos += 1;

        // Skip to end of current line
        while (self.pos < self.source.len and self.source[self.pos] != '\n') {
            self.pos += 1;
        }
        if (self.pos < self.source.len) {
            self.pos += 1; // Skip newline
        }

        // Get the indentation level of the multiline content
        self.skipWhitespace();
        const content_indent = self.getCurrentIndent();

        var content_lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (content_lines.items) |line| {
                self.allocator.free(line);
            }
            content_lines.deinit();
        }

        // Collect all lines that are part of this multiline string
        while (self.pos < self.source.len) {
            const current_indent = self.getCurrentIndent();

            // If we hit a line with less indentation than our content, we're done
            if (current_indent < content_indent) {
                break;
            }

            // Skip empty lines but include them in output
            if (self.pos < self.source.len and self.source[self.pos] == '\n') {
                try content_lines.append(try self.allocator.dupe(u8, ""));
                self.pos += 1;
                continue;
            }

            // Extract the line content (removing the base indentation)
            const line_start = self.pos;
            while (self.pos < self.source.len and self.source[self.pos] != '\n') {
                self.pos += 1;
            }

            if (line_start < self.pos) {
                // Remove the base indentation from this line
                const raw_line = self.source[line_start..self.pos];
                var line_content = raw_line;

                // Skip leading spaces up to content_indent
                const spaces_to_skip = @min(content_indent, raw_line.len);
                var i: usize = 0;
                while (i < spaces_to_skip and i < raw_line.len and raw_line[i] == ' ') {
                    i += 1;
                }
                if (i < raw_line.len) {
                    line_content = raw_line[i..];
                } else {
                    line_content = "";
                }

                try content_lines.append(try self.allocator.dupe(u8, line_content));
            }

            if (self.pos < self.source.len) {
                self.pos += 1; // Skip newline
            }
        }

        // Join the lines according to the indicator
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        for (content_lines.items, 0..) |line, i| {
            if (i > 0) {
                if (indicator == '>') {
                    // Folded style: replace newlines with spaces, but preserve paragraph breaks
                    if (line.len == 0 or content_lines.items[i - 1].len == 0) {
                        try result.append('\n');
                    } else {
                        try result.append(' ');
                    }
                } else {
                    // Literal style: preserve newlines
                    try result.append('\n');
                }
            }
            try result.appendSlice(line);
        }

        return YamlValue{ .string = try result.toOwnedSlice() };
    }

    fn parseNumber(self: *YamlParser) ParseError!YamlValue {
        const start = self.pos;

        if (self.source[self.pos] == '-') self.pos += 1;

        while (self.pos < self.source.len and (std.ascii.isDigit(self.source[self.pos]) or self.source[self.pos] == '.')) {
            self.pos += 1;
        }

        const number_str = self.source[start..self.pos];

        if (std.mem.indexOf(u8, number_str, ".")) |_| {
            const value = std.fmt.parseFloat(f64, number_str) catch return YamlValue{ .string = try self.allocator.dupe(u8, number_str) };
            return YamlValue{ .float = value };
        } else {
            const value = std.fmt.parseInt(i64, number_str, 10) catch return YamlValue{ .string = try self.allocator.dupe(u8, number_str) };
            return YamlValue{ .integer = value };
        }
    }

    fn parseBoolean(self: *YamlParser) ParseError!YamlValue {
        if (self.pos + 4 <= self.source.len and std.mem.eql(u8, self.source[self.pos .. self.pos + 4], "true")) {
            self.pos += 4;
            return YamlValue{ .boolean = true };
        } else if (self.pos + 5 <= self.source.len and std.mem.eql(u8, self.source[self.pos .. self.pos + 5], "false")) {
            self.pos += 5;
            return YamlValue{ .boolean = false };
        } else {
            return self.parseUnquotedString();
        }
    }

    fn parseNull(self: *YamlParser) ParseError!YamlValue {
        if (self.pos + 4 <= self.source.len and std.mem.eql(u8, self.source[self.pos .. self.pos + 4], "null")) {
            self.pos += 4;
            return YamlValue{ .null_value = {} };
        } else {
            return self.parseUnquotedString();
        }
    }

    fn skipWhitespace(self: *YamlParser) void {
        while (self.pos < self.source.len) {
            const ch = self.source[self.pos];
            if (ch == ' ' or ch == '\t') {
                self.pos += 1;
                self.col += 1;
            } else if (ch == '\n') {
                self.pos += 1;
                self.line += 1;
                self.col = 1;
            } else if (ch == '\r') {
                self.pos += 1;
                if (self.pos < self.source.len and self.source[self.pos] == '\n') {
                    self.pos += 1;
                }
                self.line += 1;
                self.col = 1;
            } else if (ch == '#') {
                // Skip comment
                while (self.pos < self.source.len and self.source[self.pos] != '\n') {
                    self.pos += 1;
                }
            } else {
                break;
            }
        }
    }

    fn skipToNextLine(self: *YamlParser) void {
        while (self.pos < self.source.len and self.source[self.pos] != '\n') {
            self.pos += 1;
        }
        if (self.pos < self.source.len) {
            self.pos += 1;
            self.line += 1;
            self.col = 1;
        }
    }

    fn getCurrentIndent(self: *YamlParser) usize {
        var indent: usize = 0;
        var i = self.pos;

        // Go back to start of line
        while (i > 0 and self.source[i - 1] != '\n') {
            i -= 1;
        }

        // Count spaces/tabs
        while (i < self.source.len and (self.source[i] == ' ' or self.source[i] == '\t')) {
            indent += 1;
            i += 1;
        }

        return indent;
    }
};
