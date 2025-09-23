const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;
const semconv = @import("semconv.zig");

/// Simple generator for registry Zig code
pub const RegistryCodeGenerator = struct {
    allocator: Allocator,

    // Zig reserved keywords that need to be escaped with @""
    const zig_keywords = [_][]const u8{ "addrspace", "align", "allowzero", "and", "anyframe", "anytype", "asm", "async", "await", "break", "callconv", "catch", "comptime", "const", "continue", "defer", "else", "enum", "errdefer", "error", "export", "extern", "fn", "for", "if", "inline", "linksection", "noalias", "noinline", "nosuspend", "null", "opaque", "or", "orelse", "packed", "pub", "resume", "return", "struct", "suspend", "switch", "test", "threadlocal", "try", "union", "unreachable", "usingnamespace", "var", "volatile", "while" };

    pub fn init(allocator: Allocator) RegistryCodeGenerator {
        return RegistryCodeGenerator{ .allocator = allocator };
    }

    /// Helper function to format multi-line strings as proper Zig comments
    /// Splits the input string by newlines and prefixes each line with the specified comment prefix
    fn formatMultiLineComment(self: *RegistryCodeGenerator, text: []const u8, comment_prefix: []const u8, lines: *ArrayList([]const u8)) !void {
        var line_iter = std.mem.splitSequence(u8, text, "\n");
        while (line_iter.next()) |line| {
            // Trim whitespace from each line
            const trimmed_line = std.mem.trim(u8, line, " \t\r");
            if (trimmed_line.len > 0) {
                try lines.append(try std.fmt.allocPrint(self.allocator, "{s} {s}", .{ comment_prefix, trimmed_line }));
            } else {
                // For empty lines, just add the comment prefix
                try lines.append(try std.fmt.allocPrint(self.allocator, "{s}", .{comment_prefix}));
            }
        }
    }

    /// Helper function specifically for formatting comments on struct/enum members with proper indentation
    fn formatMemberComment(self: *RegistryCodeGenerator, text: []const u8, indent: []const u8, lines: *ArrayList([]const u8)) !void {
        const comment_prefix = try std.fmt.allocPrint(self.allocator, "{s}///", .{indent});
        defer self.allocator.free(comment_prefix);
        try self.formatMultiLineComment(text, comment_prefix, lines);
    }

    pub fn generateRegistryFile(self: *RegistryCodeGenerator, registry: semconv.Registry, output_file: []const u8) ![]u8 {
        var lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (lines.items) |line| {
                self.allocator.free(line);
            }
            lines.deinit();
        }

        // File header
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Generated from {s}", .{registry.file_name}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Namespace: {s}", .{registry.namespace}));
        try lines.append(try self.allocator.dupe(u8, "//! This file contains semantic convention registry definitions."));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "const std = @import(\"std\");"));

        // Determine correct import path for types.zig based on output file location
        // If the output file is in a subdirectory of src/, use "../types.zig", otherwise use "types.zig"
        const types_import_path = if (std.mem.startsWith(u8, output_file, "src/") and std.mem.indexOf(u8, output_file[4..], "/") != null)
            "../types.zig"
        else
            "types.zig";
        try lines.append(try std.fmt.allocPrint(self.allocator, "const types = @import(\"{s}\");", .{types_import_path}));
        try lines.append(try self.allocator.dupe(u8, ""));

        // Generate registry as a list of attributes
        for (registry.groups.items) |group| {
            try self.generateRegistry(&lines, group);
        }

        const generated_code = try self.joinLines(lines.items);

        // Update root.zig to include this registry
        try self.updateRootZig(output_file, registry.namespace);

        return generated_code;
    }

    fn generateRegistry(self: *RegistryCodeGenerator, lines: *ArrayList([]const u8), group: semconv.AttributeGroup) !void {
        // Group comment - use multi-line comment helper for proper formatting
        try self.formatMultiLineComment(group.brief, "///", lines);
        if (group.display_name) |display_name| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// Display name: {s}", .{display_name}));
        }
        if (group.note) |note| {
            try self.formatMultiLineComment(note, "///", lines);
        }

        // Generate enum types for attributes with enum members
        for (group.attributes.items) |attr| {
            if (attr.enum_members) |enum_members| {
                const variant_name = try self.attributeIdToEnumVariant(attr.id);
                defer self.allocator.free(variant_name);

                const enum_type_name = try std.fmt.allocPrint(self.allocator, "{s}Value", .{variant_name});
                defer self.allocator.free(enum_type_name);

                try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = enum {{", .{enum_type_name}));

                // Generate enum variants
                for (enum_members.items) |member| {
                    // Skip deprecated members to avoid duplicates
                    if (member.deprecated) continue;

                    const member_name = try self.enumIdToName(member.id);
                    defer self.allocator.free(member_name);

                    // Use helper function for multi-line comments
                    try self.formatMemberComment(member.brief, "    ", lines);
                    try lines.append(try std.fmt.allocPrint(self.allocator, "    {s},", .{member_name}));
                }

                // Add toString method
                try lines.append(try self.allocator.dupe(u8, ""));
                try lines.append(try self.allocator.dupe(u8, "    pub fn toString(self: @This()) []const u8 {"));
                try lines.append(try self.allocator.dupe(u8, "        return switch (self) {"));

                for (enum_members.items) |member| {
                    // Skip deprecated members to avoid duplicates
                    if (member.deprecated) continue;

                    const member_name = try self.enumIdToName(member.id);
                    defer self.allocator.free(member_name);

                    try lines.append(try std.fmt.allocPrint(self.allocator, "            .{s} => \"{s}\",", .{ member_name, member.value }));
                }

                try lines.append(try self.allocator.dupe(u8, "        };"));
                try lines.append(try self.allocator.dupe(u8, "    }"));
                try lines.append(try self.allocator.dupe(u8, "};"));
                try lines.append(try self.allocator.dupe(u8, ""));
            }
        }

        // Generate union type for attribute returns
        const union_name = try self.groupIdToUnionName(group.id);
        defer self.allocator.free(union_name);

        // Generate the union(enum) declaration directly
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = union(enum) {{", .{union_name}));

        // Generate union variants with their types
        for (group.attributes.items) |attr| {
            const variant_name = try self.attributeIdToEnumVariant(attr.id);
            defer self.allocator.free(variant_name);

            // Use helper function for multi-line comments
            try self.formatMemberComment(attr.brief, "    ", lines);

            // Check if this is an enum attribute
            if (attr.enum_members) |_| {
                const enum_type_name = try std.fmt.allocPrint(self.allocator, "{s}Value", .{variant_name});
                defer self.allocator.free(enum_type_name);
                try lines.append(try std.fmt.allocPrint(self.allocator, "    {s}: types.EnumAttribute({s}),", .{ variant_name, enum_type_name }));
            } else {
                try lines.append(try std.fmt.allocPrint(self.allocator, "    {s}: types.StringAttribute,", .{variant_name}));
            }
        }

        try lines.append(try self.allocator.dupe(u8, ""));

        // Generate toAttribute method
        try self.generateToAttributeMethod(lines, group);

        try lines.append(try self.allocator.dupe(u8, "};"));
        try lines.append(try self.allocator.dupe(u8, ""));
    }

    fn generateRegistryAttribute(self: *RegistryCodeGenerator, lines: *ArrayList([]const u8), attr: semconv.Attribute, is_last: bool) !void {
        // Start the attribute definition
        const stability_name = try self.stabilityToTypesStability(attr.stability);
        defer self.allocator.free(stability_name);

        // For now, treat all attributes as string attributes with recommended requirement level
        // TODO: Map actual requirement levels from YAML if available
        try lines.append(try self.allocator.dupe(u8, "    types.StringAttribute.init("));
        try lines.append(try std.fmt.allocPrint(self.allocator, "        \"{s}\",", .{attr.id}));

        // Handle brief description (simplified for now)
        const escaped_brief = try self.escapeString(attr.brief);
        defer self.allocator.free(escaped_brief);
        try lines.append(try std.fmt.allocPrint(self.allocator, "        \"{s}\",", .{escaped_brief}));

        try lines.append(try std.fmt.allocPrint(self.allocator, "        .{s},", .{stability_name}));
        try lines.append(try self.allocator.dupe(u8, "        .recommended,"));

        // Close the attribute definition
        if (attr.note) |note| {
            const escaped_note = try self.escapeString(note);
            defer self.allocator.free(escaped_note);
            try lines.append(try std.fmt.allocPrint(self.allocator, "    ).withNote(\"{s}\"){s}", .{ escaped_note, if (is_last) "" else "," }));
        } else {
            try lines.append(try std.fmt.allocPrint(self.allocator, "    ){s}", .{if (is_last) "" else ","}));
        }
    }

    fn generateEnum(self: *RegistryCodeGenerator, lines: *ArrayList([]const u8), attr: semconv.Attribute, field_name: []const u8) !void {
        // Generate enum type
        const enum_name = try self.capitalizeFirst(field_name);
        defer self.allocator.free(enum_name);

        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s} = enum {{", .{enum_name}));

        // Generate enum values
        if (attr.enum_members) |members| {
            for (members.items) |member| {
                // Skip deprecated members to avoid duplicates
                if (member.deprecated) continue;

                const member_name = try self.enumIdToName(member.id);
                defer self.allocator.free(member_name);
                try self.formatMemberComment(member.brief, "        ", lines);
                try lines.append(try std.fmt.allocPrint(self.allocator, "        {s},", .{member_name}));
            }
        }

        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "        pub fn toString(self: @This()) []const u8 {"));
        try lines.append(try self.allocator.dupe(u8, "            return switch (self) {"));

        if (attr.enum_members) |members| {
            for (members.items) |member| {
                // Skip deprecated members to avoid duplicates
                if (member.deprecated) continue;

                const member_name = try self.enumIdToName(member.id);
                defer self.allocator.free(member_name);
                try lines.append(try std.fmt.allocPrint(self.allocator, "                .{s} => \"{s}\",", .{ member_name, member.value }));
            }
        }

        try lines.append(try self.allocator.dupe(u8, "            };"));
        try lines.append(try self.allocator.dupe(u8, "        }"));
        try lines.append(try self.allocator.dupe(u8, "    };"));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s}: []const u8 = \"{s}\";", .{ field_name, attr.id }));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s}_type: type = {s};", .{ field_name, enum_name }));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s}_stability = \"{s}\";", .{ field_name, @tagName(attr.stability) }));
    }

    fn generateToAttributeMethod(self: *RegistryCodeGenerator, lines: *ArrayList([]const u8), group: semconv.AttributeGroup) !void {
        try lines.append(try self.allocator.dupe(u8, "    /// Extract attribute information from this union variant"));
        try lines.append(try self.allocator.dupe(u8, "    pub fn get(self: @This()) types.AttributeInfo {"));
        try lines.append(try self.allocator.dupe(u8, "        return switch (self) {"));

        // Generate switch cases for each attribute
        for (group.attributes.items) |attr| {
            const variant_name = try self.attributeIdToEnumVariant(attr.id);
            defer self.allocator.free(variant_name);

            const stability_name = try self.stabilityToTypesStability(attr.stability);
            defer self.allocator.free(stability_name);

            const escaped_brief = try self.escapeString(attr.brief);
            defer self.allocator.free(escaped_brief);

            // Generate the switch case
            try lines.append(try std.fmt.allocPrint(self.allocator, "            .{s} => types.AttributeInfo{{", .{variant_name}));
            try lines.append(try std.fmt.allocPrint(self.allocator, "                .name = \"{s}\",", .{attr.id}));
            try lines.append(try std.fmt.allocPrint(self.allocator, "                .brief = \"{s}\",", .{escaped_brief}));

            if (attr.note) |note| {
                const escaped_note = try self.escapeString(note);
                defer self.allocator.free(escaped_note);
                try lines.append(try std.fmt.allocPrint(self.allocator, "                .note = \"{s}\",", .{escaped_note}));
            } else {
                try lines.append(try self.allocator.dupe(u8, "                .note = null,"));
            }

            try lines.append(try std.fmt.allocPrint(self.allocator, "                .stability = .{s},", .{stability_name}));

            if (attr.examples) |examples| {
                if (examples.items.len > 0) {
                    try lines.append(try self.allocator.dupe(u8, "                .examples = &.{"));
                    for (examples.items, 0..) |example, i| {
                        const escaped_example = try self.escapeString(example);
                        defer self.allocator.free(escaped_example);
                        const comma = if (i == examples.items.len - 1) "" else ",";
                        try lines.append(try std.fmt.allocPrint(self.allocator, "                    \"{s}\"{s}", .{ escaped_example, comma }));
                    }
                    try lines.append(try self.allocator.dupe(u8, "                },"));
                } else {
                    try lines.append(try self.allocator.dupe(u8, "                .examples = null,"));
                }
            } else {
                try lines.append(try self.allocator.dupe(u8, "                .examples = null,"));
            }

            try lines.append(try self.allocator.dupe(u8, "            },"));
        }

        try lines.append(try self.allocator.dupe(u8, "        };"));
        try lines.append(try self.allocator.dupe(u8, "    }"));
    }

    // Utility functions

    fn namespaceToRegistryName(self: *RegistryCodeGenerator, namespace: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        var capitalize_next = true;
        for (namespace) |c| {
            if (c == '.' or c == '_' or c == '-') {
                capitalize_next = true;
            } else if (capitalize_next) {
                try result.append(std.ascii.toUpper(c));
                capitalize_next = false;
            } else {
                try result.append(c);
            }
        }

        return result.toOwnedSlice();
    }

    fn groupIdToUnionName(self: *RegistryCodeGenerator, group_id: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        var capitalize_next = true;
        for (group_id) |c| {
            if (c == '.' or c == '_' or c == '-') {
                capitalize_next = true;
            } else if (capitalize_next) {
                try result.append(std.ascii.toUpper(c));
                capitalize_next = false;
            } else {
                try result.append(c);
            }
        }

        // If we have an empty result or it starts with a number, prefix with underscore
        if (result.items.len == 0 or std.ascii.isDigit(result.items[0])) {
            var prefixed = ArrayList(u8).init(self.allocator);
            defer prefixed.deinit();
            try prefixed.append('_');
            try prefixed.appendSlice(result.items);
            return prefixed.toOwnedSlice();
        }

        return result.toOwnedSlice();
    }

    fn attributeIdToEnumVariant(self: *RegistryCodeGenerator, id: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        // Find the first dot to skip the namespace prefix
        var start_index: usize = 0;
        if (std.mem.indexOf(u8, id, ".")) |dot_idx| {
            start_index = dot_idx + 1;
        }

        var capitalize_next = false;
        for (id[start_index..]) |c| {
            if (c == '.' or c == '_' or c == '-') {
                capitalize_next = true;
            } else if (capitalize_next) {
                try result.append(std.ascii.toUpper(c));
                capitalize_next = false;
            } else {
                try result.append(c);
            }
        }

        // If we have an empty result or it starts with a number, prefix with underscore
        if (result.items.len == 0 or std.ascii.isDigit(result.items[0])) {
            var prefixed = ArrayList(u8).init(self.allocator);
            defer prefixed.deinit();
            try prefixed.append('_');
            try prefixed.appendSlice(result.items);
            return prefixed.toOwnedSlice();
        }

        return result.toOwnedSlice();
    }

    fn stabilityToTypesStability(self: *RegistryCodeGenerator, stability: semconv.StabilityLevel) ![]u8 {
        const stability_str = switch (stability) {
            .stable => "stable",
            .experimental => "experimental",
            .development => "development",
            .deprecated => "deprecated",
        };
        return try self.allocator.dupe(u8, stability_str);
    }

    fn escapeString(self: *RegistryCodeGenerator, input: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        for (input) |c| {
            switch (c) {
                '"' => try result.appendSlice("\\\""),
                '\\' => try result.appendSlice("\\\\"),
                '\n' => try result.appendSlice("\\n"),
                '\r' => try result.appendSlice("\\r"),
                '\t' => try result.appendSlice("\\t"),
                else => try result.append(c),
            }
        }

        return result.toOwnedSlice();
    }

    fn groupIdToStructName(self: *RegistryCodeGenerator, id: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        var capitalize_next = true;
        for (id) |c| {
            if (c == '.' or c == '_' or c == '-') {
                capitalize_next = true;
            } else if (capitalize_next) {
                try result.append(std.ascii.toUpper(c));
                capitalize_next = false;
            } else {
                try result.append(c);
            }
        }

        return result.toOwnedSlice();
    }

    fn attributeIdToFieldName(self: *RegistryCodeGenerator, id: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        for (id) |c| {
            if (c == '.' or c == '-') {
                try result.append('_');
            } else {
                try result.append(c);
            }
        }

        return result.toOwnedSlice();
    }

    fn enumIdToName(self: *RegistryCodeGenerator, id: []const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        for (id) |c| {
            if (c == '.' or c == '-' or c == ' ') {
                try result.append('_');
            } else {
                try result.append(std.ascii.toLower(c));
            }
        }

        const name = try result.toOwnedSlice();
        defer self.allocator.free(name);

        // Check if the name is a reserved keyword
        for (zig_keywords) |keyword| {
            if (std.mem.eql(u8, name, keyword)) {
                // Escape with @"" syntax
                return try std.fmt.allocPrint(self.allocator, "@\"{s}\"", .{name});
            }
        }

        return try self.allocator.dupe(u8, name);
    }

    fn capitalizeFirst(self: *RegistryCodeGenerator, s: []const u8) ![]u8 {
        if (s.len == 0) return try self.allocator.dupe(u8, s);

        var result = try self.allocator.alloc(u8, s.len);
        result[0] = std.ascii.toUpper(s[0]);
        for (s[1..], 1..) |c, i| {
            result[i] = c;
        }
        return result;
    }

    fn splitNote(self: *RegistryCodeGenerator, note: []const u8) !ArrayList([]const u8) {
        var lines = ArrayList([]const u8).init(self.allocator);

        var start: usize = 0;
        var i: usize = 0;
        while (i < note.len) {
            if (note[i] == '\n') {
                if (i > start) {
                    try lines.append(try self.allocator.dupe(u8, note[start..i]));
                }
                start = i + 1;
            }
            i += 1;
        }

        if (start < note.len) {
            try lines.append(try self.allocator.dupe(u8, note[start..]));
        }

        return lines;
    }

    fn formatExamples(self: *RegistryCodeGenerator, examples: [][]const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        for (examples, 0..) |example, i| {
            if (i > 0) try result.appendSlice(", ");
            try result.append('"');
            try result.appendSlice(example);
            try result.append('"');
        }

        return result.toOwnedSlice();
    }

    fn joinLines(self: *RegistryCodeGenerator, lines: [][]const u8) ![]u8 {
        var total_len: usize = 0;
        for (lines) |line| {
            total_len += line.len + 1; // +1 for newline
        }

        var result = try self.allocator.alloc(u8, total_len);
        var pos: usize = 0;

        for (lines) |line| {
            @memcpy(result[pos .. pos + line.len], line);
            pos += line.len;
            result[pos] = '\n';
            pos += 1;
        }

        return result;
    }

    fn updateRootZig(self: *RegistryCodeGenerator, output_file: []const u8, namespace: []const u8) !void {
        const root_path = "src/root.zig";

        // Escape namespace if it's a reserved keyword
        const escaped_namespace = blk: {
            for (zig_keywords) |keyword| {
                if (std.mem.eql(u8, namespace, keyword)) {
                    break :blk try std.fmt.allocPrint(self.allocator, "@\"{s}\"", .{namespace});
                }
            }
            break :blk try self.allocator.dupe(u8, namespace);
        };
        defer self.allocator.free(escaped_namespace);

        // Read current root.zig content
        const file = std.fs.cwd().openFile(root_path, .{}) catch |err| switch (err) {
            error.FileNotFound => {
                // Create new root.zig if it doesn't exist
                const new_file = try std.fs.cwd().createFile(root_path, .{});
                defer new_file.close();

                const initial_content =
                    \\// Auto-generated exports for OpenTelemetry semantic conventions
                    \\
                ;
                try new_file.writeAll(initial_content);
                const export_line = try std.fmt.allocPrint(self.allocator, "pub const {s} = @import(\"{s}\");\n", .{ escaped_namespace, output_file[4..] }); // Remove "src/" prefix
                defer self.allocator.free(export_line);
                try new_file.writeAll(export_line);
                return;
            },
            else => return err,
        };
        defer file.close();

        const content = try file.readToEndAlloc(self.allocator, 1024 * 1024);
        defer self.allocator.free(content);

        // Check if export already exists (check for both escaped and unescaped versions)
        const expected_export = try std.fmt.allocPrint(self.allocator, "pub const {s} = @import(", .{escaped_namespace});
        defer self.allocator.free(expected_export);

        const expected_export_unescaped = try std.fmt.allocPrint(self.allocator, "pub const {s} = @import(", .{namespace});
        defer self.allocator.free(expected_export_unescaped);

        if (std.mem.indexOf(u8, content, expected_export)) |_| {
            // Export already exists, don't add it again
            return;
        }

        if (std.mem.indexOf(u8, content, expected_export_unescaped)) |_| {
            // Export already exists (unescaped version), don't add it again
            return;
        }

        // Calculate relative path from src/root.zig to the output file
        const relative_path = if (std.mem.startsWith(u8, output_file, "src/"))
            output_file[4..] // Remove "src/" prefix
        else
            output_file;

        // Create new export line
        const export_line = try std.fmt.allocPrint(self.allocator, "pub const {s} = @import(\"{s}\");\n", .{ escaped_namespace, relative_path });
        defer self.allocator.free(export_line);

        // Append to file
        const append_file = try std.fs.cwd().openFile(root_path, .{ .mode = .write_only });
        defer append_file.close();
        try append_file.seekFromEnd(0);
        try append_file.writeAll(export_line);
    }
};
