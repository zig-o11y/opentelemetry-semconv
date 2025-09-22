const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

/// Preprocessor to handle YAML features that zig-yaml doesn't support yet:
/// - literal block scalars (`>` and `|`)
/// - complex type definitions with square brackets
pub const YamlPreprocessor = struct {
    allocator: Allocator,

    const BlockScalarInfo = struct {
        colon_pos: usize,
        indicator: u8, // '>' or '|'
    };

    pub fn init(allocator: Allocator) YamlPreprocessor {
        return YamlPreprocessor{ .allocator = allocator };
    }

    /// Convert YAML with unsupported features to standard YAML that zig-yaml can handle
    pub fn preprocessContent(self: *YamlPreprocessor, content: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        var lines = std.mem.splitSequence(u8, content, "\n");
        var in_block_scalar = false;
        var block_type: u8 = 0; // '>' for folded, '|' for literal
        var block_indent: usize = 0;
        var collected_lines = ArrayList([]const u8).init(self.allocator);
        defer collected_lines.deinit();
        var key_line: ?[]const u8 = null;

        while (lines.next()) |line| {
            if (in_block_scalar) {
                const line_indent = countLeadingSpaces(line);

                // Check if we're still in the block scalar
                if (line.len == 0 or line_indent > block_indent) {
                    // Still in block scalar, collect the line
                    try collected_lines.append(line);
                } else {
                    // End of block scalar, process what we collected
                    try self.writeBlockScalar(&result, key_line.?, block_type, collected_lines.items, block_indent);

                    // Reset state
                    in_block_scalar = false;
                    collected_lines.clearRetainingCapacity();
                    key_line = null;

                    // Check if this line starts a new block scalar
                    if (self.isBlockScalarLine(line)) |info| {
                        // This line starts a new block scalar
                        in_block_scalar = true;
                        block_type = info.indicator;
                        block_indent = countLeadingSpaces(line);
                        key_line = line[0 .. info.colon_pos + 1]; // Keep the key part
                    } else {
                        // Process this line normally (with template type quoting if needed)
                        const processed_line = try self.quoteTemplateTypesIfNeeded(line);
                        defer self.allocator.free(processed_line);
                        try result.appendSlice(processed_line);
                        try result.append('\n');
                    }
                }
            } else {
                // Check if this line starts a block scalar
                if (self.isBlockScalarLine(line)) |info| {
                    // Found block scalar
                    in_block_scalar = true;
                    block_type = info.indicator;
                    block_indent = countLeadingSpaces(line);
                    key_line = line[0 .. info.colon_pos + 1]; // Keep the key part
                } else {
                    // Normal line, process for template types and copy
                    const processed_line = try self.quoteTemplateTypesIfNeeded(line);
                    defer self.allocator.free(processed_line);
                    try result.appendSlice(processed_line);
                    try result.append('\n');
                }
            }
        }

        // Handle case where file ends with a block scalar
        if (in_block_scalar) {
            try self.writeBlockScalar(&result, key_line.?, block_type, collected_lines.items, block_indent);
        }

        return try result.toOwnedSlice();
    }

    fn quoteTemplateTypesIfNeeded(self: *YamlPreprocessor, line: []const u8) ![]u8 {
        // Check if line contains a type definition with template[...] syntax
        if (std.mem.indexOf(u8, line, "type:") == null) {
            // Not a type line, return a copy
            return try self.allocator.dupe(u8, line);
        }

        // Look for template[...] pattern
        if (std.mem.indexOf(u8, line, "template[") == null) {
            // No template syntax, return a copy
            return try self.allocator.dupe(u8, line);
        }

        // Find the colon position
        const colon_pos = std.mem.indexOf(u8, line, ":") orelse {
            return try self.allocator.dupe(u8, line);
        };

        // Extract the key part and value part
        const key_part = line[0 .. colon_pos + 1];
        var value_start = colon_pos + 1;

        // Skip whitespace after colon
        while (value_start < line.len and line[value_start] == ' ') {
            value_start += 1;
        }

        if (value_start >= line.len) {
            // No value part
            return try self.allocator.dupe(u8, line);
        }

        const value_part = line[value_start..];

        // Create new line with quoted value
        var result = ArrayList(u8).init(self.allocator);
        try result.appendSlice(key_part);
        try result.append(' ');
        try result.append('"');
        try result.appendSlice(value_part);
        try result.append('"');

        return try result.toOwnedSlice();
    }

    fn writeBlockScalar(self: *YamlPreprocessor, result: *ArrayList(u8), key_line: []const u8, block_type: u8, lines: []const []const u8, base_indent: usize) !void {
        // Write the key
        try result.appendSlice(key_line);
        try result.appendSlice(" ");

        // Combine all the lines into a single string
        var content = ArrayList(u8).init(self.allocator);
        defer content.deinit();

        var first_content_line = true;
        for (lines) |line| {
            if (line.len == 0) {
                // Empty line
                if (block_type == '|') {
                    // For literal blocks, preserve empty lines as \n
                    try content.append('\n');
                } else {
                    // For folded blocks, empty lines become paragraph breaks
                    try content.append('\n');
                    try content.append('\n');
                }
            } else {
                // Remove the base indentation
                const trimmed = if (line.len > base_indent) line[base_indent..] else line;
                const content_line = std.mem.trim(u8, trimmed, " \t");

                if (content_line.len > 0) {
                    if (!first_content_line) {
                        if (block_type == '|') {
                            // Literal block: preserve line breaks
                            try content.append('\n');
                        } else {
                            // Folded block: lines become spaces
                            try content.appendSlice(" ");
                        }
                    }
                    try content.appendSlice(content_line);
                    first_content_line = false;
                }
            }
        }

        // Write the content as a quoted string
        try result.append('"');

        // Escape quotes and newlines in the content
        const content_str = content.items;
        var i: usize = 0;
        while (i < content_str.len) {
            const char = content_str[i];
            if (char == '"') {
                try result.appendSlice("\\\"");
            } else if (char == '\\') {
                try result.appendSlice("\\\\");
            } else if (char == '\n') {
                try result.appendSlice("\\n");
            } else {
                try result.append(char);
            }
            i += 1;
        }

        try result.append('"');
        try result.append('\n');
    }

    fn countLeadingSpaces(line: []const u8) usize {
        var count: usize = 0;
        for (line) |char| {
            if (char == ' ') {
                count += 1;
            } else {
                break;
            }
        }
        return count;
    }

    fn isBlockScalarLine(self: *YamlPreprocessor, line: []const u8) ?BlockScalarInfo {
        _ = self; // unused but needed for method signature

        // Find the colon first
        const colon_pos = std.mem.indexOf(u8, line, ":") orelse return null;

        // Look for block scalar indicators after the colon
        var pos = colon_pos + 1;

        // Skip whitespace after colon
        while (pos < line.len and (line[pos] == ' ' or line[pos] == '\t')) {
            pos += 1;
        }

        // Check if we found a block scalar indicator
        if (pos < line.len) {
            const char = line[pos];
            if (char == '>' or char == '|') {
                // Make sure this is the end of the line (possibly with trailing whitespace)
                var end_pos = pos + 1;
                while (end_pos < line.len and (line[end_pos] == ' ' or line[end_pos] == '\t')) {
                    end_pos += 1;
                }
                if (end_pos == line.len) {
                    return BlockScalarInfo{ .colon_pos = colon_pos, .indicator = char };
                }
            }
        }

        return null;
    }
};
