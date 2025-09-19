const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;
const semconv = @import("semconv.zig");

/// Generator for Zig semantic convention code
pub const ZigCodeGenerator = struct {
    allocator: Allocator,

    pub fn init(allocator: Allocator) ZigCodeGenerator {
        return ZigCodeGenerator{ .allocator = allocator };
    }

    pub fn generateRegistryFile(self: *ZigCodeGenerator, semconv_data: semconv.SemanticConvention) ![]u8 {
        var lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (lines.items) |line| {
                self.allocator.free(line);
            }
            lines.deinit();
        }

        const namespace_title = toTitleCase(self.allocator, semconv_data.namespace) catch semconv_data.namespace;
        defer if (!std.mem.eql(u8, namespace_title, semconv_data.namespace)) self.allocator.free(namespace_title);

        const namespace_upper = toUpperCase(self.allocator, semconv_data.namespace) catch semconv_data.namespace;
        defer if (!std.mem.eql(u8, namespace_upper, semconv_data.namespace)) self.allocator.free(namespace_upper);

        // File header
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! {s} semantic conventions for OpenTelemetry", .{namespace_title}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Generated from {s}", .{semconv_data.file_name}));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "const std = @import(\"std\");"));
        try lines.append(try self.allocator.dupe(u8, "const types = @import(\"../types.zig\");"));
        try lines.append(try self.allocator.dupe(u8, ""));

        // Generate attribute constants for all groups
        for (semconv_data.groups.items) |group| {
            if (group.attributes.items.len > 0) {
                try self.generateGroupAttributes(&lines, group);
                try lines.append(try self.allocator.dupe(u8, ""));
            }
        }

        // Generate utility functions if needed
        if (self.needsUtils(semconv_data.namespace)) {
            try self.generateUtils(&lines, semconv_data.namespace);
            try lines.append(try self.allocator.dupe(u8, ""));
        }

        // Generate registry structure
        const file_base_name = blk: {
            const file_name = std.fs.path.basename(semconv_data.file_name);
            if (std.mem.endsWith(u8, file_name, ".yaml")) {
                break :blk file_name[0 .. file_name.len - 5]; // Remove ".yaml"
            } else if (std.mem.endsWith(u8, file_name, ".yml")) {
                break :blk file_name[0 .. file_name.len - 4]; // Remove ".yml"
            } else {
                break :blk file_name;
            }
        };
        try self.generateRegistryStruct(&lines, semconv_data, namespace_upper, namespace_title, file_base_name);

        return try self.joinLines(lines.items);
    }

    pub fn generateCommonFile(self: *ZigCodeGenerator, semconv_data: semconv.SemanticConvention) !?[]u8 {
        var attribute_groups = ArrayList(semconv.AttributeGroup).init(self.allocator);
        defer attribute_groups.deinit();

        // Find attribute groups with valid IDs
        for (semconv_data.groups.items) |group| {
            if (std.mem.eql(u8, group.type, "attribute_group") and group.id.len > 0) {
                try attribute_groups.append(group);
            }
        }

        if (attribute_groups.items.len == 0) {
            return null;
        }

        var lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (lines.items) |line| {
                self.allocator.free(line);
            }
            lines.deinit();
        }

        const namespace_title = toTitleCase(self.allocator, semconv_data.namespace) catch semconv_data.namespace;
        defer if (!std.mem.eql(u8, namespace_title, semconv_data.namespace)) self.allocator.free(namespace_title);

        // File header
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! {s} common attribute groups", .{namespace_title}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Generated from {s}", .{semconv_data.file_name}));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "const std = @import(\"std\");"));
        try lines.append(try self.allocator.dupe(u8, "const types = @import(\"../types.zig\");"));
        try lines.append(try self.allocator.dupe(u8, "const registry = @import(\"registry.zig\");"));
        try lines.append(try self.allocator.dupe(u8, ""));

        for (attribute_groups.items) |group| {
            try self.generateAttributeGroupStruct(&lines, group);
            try lines.append(try self.allocator.dupe(u8, ""));
        }

        return try self.joinLines(lines.items);
    }

    pub fn generateSpansFile(self: *ZigCodeGenerator, semconv_data: semconv.SemanticConvention) !?[]u8 {
        if (semconv_data.spans.items.len == 0) {
            return null;
        }

        var lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (lines.items) |line| {
                self.allocator.free(line);
            }
            lines.deinit();
        }

        const namespace_title = toTitleCase(self.allocator, semconv_data.namespace) catch semconv_data.namespace;
        defer if (!std.mem.eql(u8, namespace_title, semconv_data.namespace)) self.allocator.free(namespace_title);

        // File header
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! {s} span definitions", .{namespace_title}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Generated from {s}", .{semconv_data.file_name}));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "const std = @import(\"std\");"));
        try lines.append(try self.allocator.dupe(u8, "const types = @import(\"../types.zig\");"));
        try lines.append(try self.allocator.dupe(u8, ""));

        for (semconv_data.spans.items) |span| {
            try self.generateSpanStruct(&lines, span);
            try lines.append(try self.allocator.dupe(u8, ""));
        }

        return try self.joinLines(lines.items);
    }

    pub fn generateMetricsFile(self: *ZigCodeGenerator, semconv_data: semconv.SemanticConvention) !?[]u8 {
        if (semconv_data.metrics.items.len == 0) {
            return null;
        }

        var lines = ArrayList([]const u8).init(self.allocator);
        defer {
            for (lines.items) |line| {
                self.allocator.free(line);
            }
            lines.deinit();
        }

        const namespace_title = toTitleCase(self.allocator, semconv_data.namespace) catch semconv_data.namespace;
        defer if (!std.mem.eql(u8, namespace_title, semconv_data.namespace)) self.allocator.free(namespace_title);

        // File header
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! {s} metric definitions", .{namespace_title}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "//! Generated from {s}", .{semconv_data.file_name}));
        try lines.append(try self.allocator.dupe(u8, ""));
        try lines.append(try self.allocator.dupe(u8, "const std = @import(\"std\");"));
        try lines.append(try self.allocator.dupe(u8, "const types = @import(\"../types.zig\");"));
        try lines.append(try self.allocator.dupe(u8, ""));

        for (semconv_data.metrics.items) |metric| {
            try self.generateMetricStruct(&lines, metric);
            try lines.append(try self.allocator.dupe(u8, ""));
        }

        return try self.joinLines(lines.items);
    }

    fn generateGroupAttributes(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), group: semconv.AttributeGroup) !void {
        try lines.append(try std.fmt.allocPrint(self.allocator, "// {s}", .{group.brief}));
        if (group.note) |note| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "// {s}", .{note}));
        }
        try lines.append(try self.allocator.dupe(u8, ""));

        for (group.attributes.items) |attr| {
            try self.generateAttributeConstant(lines, attr, group.prefix);
        }
    }

    fn generateAttributeConstant(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), attr: semconv.Attribute, group_prefix: ?[]const u8) !void {
        // Create constant name
        var attr_id = attr.id;
        if (group_prefix) |prefix| {
            if (std.mem.startsWith(u8, attr_id, prefix)) {
                const prefix_len = prefix.len;
                if (attr_id.len > prefix_len and attr_id[prefix_len] == '.') {
                    attr_id = attr_id[prefix_len + 1 ..];
                }
            }
        }

        const const_name = try toConstantName(self.allocator, attr_id);
        defer self.allocator.free(const_name);

        const zig_type = attr.type.toZigType();
        const stability = attr.stability.toZigCode();
        const requirement = attr.requirement_level.toZigCode();

        // Documentation comments
        try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{attr.brief}));
        if (attr.note) |note| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{note}));
        }
        if (attr.examples) |examples| {
            if (examples.items.len > 0) {
                const examples_str = try self.formatExamples(examples.items[0..@min(3, examples.items.len)]);
                defer self.allocator.free(examples_str);
                try lines.append(try std.fmt.allocPrint(self.allocator, "/// Examples: {s}", .{examples_str}));
            }
        }
        if (attr.deprecated) |deprecated| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// @deprecated {s}", .{deprecated}));
        }

        // Attribute definition
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = types.Attribute({s})", .{ const_name, zig_type }));
        try lines.append(try self.allocator.dupe(u8, "    .init(.{"));
        try lines.append(try std.fmt.allocPrint(self.allocator, "        .name = \"{s}\",", .{attr.id}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "        .type = {s},", .{zig_type}));

        const escaped_brief = try escapeString(self.allocator, attr.brief);
        defer self.allocator.free(escaped_brief);
        try lines.append(try std.fmt.allocPrint(self.allocator, "        .brief = \"{s}\",", .{escaped_brief}));

        try lines.append(try std.fmt.allocPrint(self.allocator, "        .stability = {s},", .{stability}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "        .requirement_level = {s},", .{requirement}));

        if (attr.note) |note| {
            const escaped_note = try escapeString(self.allocator, note);
            defer self.allocator.free(escaped_note);
            try lines.append(try std.fmt.allocPrint(self.allocator, "        .note = \"{s}\",", .{escaped_note}));
        }

        if (attr.examples) |examples| {
            if (examples.items.len > 0) {
                const examples_array = try self.formatExamplesArray(examples.items);
                defer self.allocator.free(examples_array);
                try lines.append(try std.fmt.allocPrint(self.allocator, "        .examples = {s},", .{examples_array}));
            }
        }

        try lines.append(try self.allocator.dupe(u8, "    });"));
        try lines.append(try self.allocator.dupe(u8, ""));
    }

    fn generateRegistryStruct(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), semconv_data: semconv.SemanticConvention, namespace_upper: []const u8, namespace_title: []const u8, file_base_name: []const u8) !void {
        const file_title = toTitleCase(self.allocator, file_base_name) catch file_base_name;
        defer if (!std.mem.eql(u8, file_title, file_base_name)) self.allocator.free(file_title);

        try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s} semantic convention {s}", .{ namespace_title, file_base_name }));
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s}{s} = struct {{", .{ namespace_upper, file_title }));

        for (semconv_data.groups.items) |group| {
            if (group.attributes.items.len > 0) {
                try lines.append(try std.fmt.allocPrint(self.allocator, "    // {s}", .{group.brief}));
                for (group.attributes.items) |attr| {
                    var attr_id = attr.id;
                    if (group.prefix) |prefix| {
                        if (std.mem.startsWith(u8, attr_id, prefix)) {
                            const prefix_len = prefix.len;
                            if (attr_id.len > prefix_len and attr_id[prefix_len] == '.') {
                                attr_id = attr_id[prefix_len + 1 ..];
                            }
                        }
                    }

                    const const_name = try toConstantName(self.allocator, attr_id);
                    defer self.allocator.free(const_name);

                    const lowercase_name = try toLowerCase(self.allocator, const_name);
                    defer self.allocator.free(lowercase_name);

                    try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s} = {s};", .{ lowercase_name, const_name }));
                }
                try lines.append(try self.allocator.dupe(u8, ""));
            }
        }

        // Process entities
        for (semconv_data.entities.items) |entity| {
            if (entity.attributes.items.len > 0) {
                try lines.append(try std.fmt.allocPrint(self.allocator, "    // Entity: {s}", .{entity.brief}));
                for (entity.attributes.items) |attr_ref| {
                    // Convert attribute reference to constant name (e.g., "app.installation.id" -> "APP_INSTALLATION_ID")
                    const ref_const_name = try toConstantName(self.allocator, attr_ref.ref);
                    defer self.allocator.free(ref_const_name);

                    // Convert to lowercase field name (e.g., "APP_INSTALLATION_ID" -> "app_installation_id")
                    const field_name = try toLowerCase(self.allocator, ref_const_name);
                    defer self.allocator.free(field_name);

                    if (attr_ref.requirement_level) |requirement_level| {
                        try lines.append(try std.fmt.allocPrint(self.allocator, "    // Requirement Level: {s}", .{requirement_level}));
                    }
                    // Reference the constant from the global scope or registry
                    try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s} = {s}; // ref: {s}", .{ field_name, ref_const_name, attr_ref.ref }));
                }
                try lines.append(try self.allocator.dupe(u8, ""));
            }
        }

        try lines.append(try self.allocator.dupe(u8, "};"));
    }

    fn generateAttributeGroupStruct(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), group: semconv.AttributeGroup) !void {
        const struct_name = try toStructName(self.allocator, group.id);
        defer self.allocator.free(struct_name);

        try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{group.brief}));
        if (group.note) |note| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{note}));
        }
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = struct {{", .{struct_name}));

        for (group.attributes.items) |attr| {
            var attr_id = attr.id;
            if (group.prefix) |prefix| {
                if (std.mem.startsWith(u8, attr_id, prefix)) {
                    const prefix_len = prefix.len;
                    if (attr_id.len > prefix_len and attr_id[prefix_len] == '.') {
                        attr_id = attr_id[prefix_len + 1 ..];
                    }
                }
            }

            const const_name = try toConstantName(self.allocator, attr_id);
            defer self.allocator.free(const_name);

            const lowercase_name = try toLowerCase(self.allocator, const_name);
            defer self.allocator.free(lowercase_name);

            try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const {s} = registry.{s};", .{ lowercase_name, const_name }));
        }

        try lines.append(try self.allocator.dupe(u8, "};"));
    }

    fn generateSpanStruct(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), span: semconv.SpanDefinition) !void {
        const struct_name = try toStructName(self.allocator, span.span_name);
        defer self.allocator.free(struct_name);

        try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{span.brief}));
        if (span.note) |note| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{note}));
        }
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = struct {{", .{struct_name}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const name = \"{s}\";", .{span.span_name}));

        if (span.attributes) |attributes| {
            if (attributes.items.len > 0) {
                try lines.append(try self.allocator.dupe(u8, "    pub const attributes = &[_][]const u8{"));
                for (attributes.items) |attr| {
                    try lines.append(try std.fmt.allocPrint(self.allocator, "        \"{s}\",", .{attr}));
                }
                try lines.append(try self.allocator.dupe(u8, "    };"));
            }
        }

        if (span.events) |events| {
            if (events.items.len > 0) {
                try lines.append(try self.allocator.dupe(u8, "    pub const events = &[_][]const u8{"));
                for (events.items) |event| {
                    try lines.append(try std.fmt.allocPrint(self.allocator, "        \"{s}\",", .{event}));
                }
                try lines.append(try self.allocator.dupe(u8, "    };"));
            }
        }

        try lines.append(try self.allocator.dupe(u8, "};"));
    }

    fn generateMetricStruct(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), metric: semconv.MetricDefinition) !void {
        const struct_name = try toStructName(self.allocator, metric.metric_name);
        defer self.allocator.free(struct_name);

        try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{metric.brief}));
        if (metric.note) |note| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "/// {s}", .{note}));
        }
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = struct {{", .{struct_name}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const name = \"{s}\";", .{metric.metric_name}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const instrument = \"{s}\";", .{metric.instrument}));

        if (metric.unit) |unit| {
            try lines.append(try std.fmt.allocPrint(self.allocator, "    pub const unit = \"{s}\";", .{unit}));
        }

        if (metric.attributes) |attributes| {
            if (attributes.items.len > 0) {
                try lines.append(try self.allocator.dupe(u8, "    pub const attributes = &[_][]const u8{"));
                for (attributes.items) |attr| {
                    try lines.append(try std.fmt.allocPrint(self.allocator, "        \"{s}\",", .{attr}));
                }
                try lines.append(try self.allocator.dupe(u8, "    };"));
            }
        }

        try lines.append(try self.allocator.dupe(u8, "};"));
    }

    fn generateUtils(self: *ZigCodeGenerator, lines: *ArrayList([]const u8), namespace: []const u8) !void {
        const utils_name = try std.fmt.allocPrint(self.allocator, "{s}Utils", .{toTitleCase(self.allocator, namespace) catch namespace});
        defer self.allocator.free(utils_name);

        try lines.append(try std.fmt.allocPrint(self.allocator, "/// Utility functions for {s} semantic conventions", .{namespace}));
        try lines.append(try std.fmt.allocPrint(self.allocator, "pub const {s} = struct {{", .{utils_name}));

        if (std.mem.eql(u8, namespace, "database")) {
            try lines.append(try self.allocator.dupe(u8, "    /// Classify database system type"));
            try lines.append(try self.allocator.dupe(u8, "    pub fn classifySystem(system: []const u8) []const u8 {"));
            try lines.append(try self.allocator.dupe(u8, "        // Implementation would go here"));
            try lines.append(try self.allocator.dupe(u8, "        _ = system;"));
            try lines.append(try self.allocator.dupe(u8, "        return \"unknown\";"));
            try lines.append(try self.allocator.dupe(u8, "    }"));
            try lines.append(try self.allocator.dupe(u8, ""));
            try lines.append(try self.allocator.dupe(u8, "    /// Sanitize database query for logging"));
            try lines.append(try self.allocator.dupe(u8, "    pub fn sanitizeQuery(query: []const u8) []const u8 {"));
            try lines.append(try self.allocator.dupe(u8, "        // Implementation would go here"));
            try lines.append(try self.allocator.dupe(u8, "        _ = query;"));
            try lines.append(try self.allocator.dupe(u8, "        return \"[sanitized]\";"));
            try lines.append(try self.allocator.dupe(u8, "    }"));
        } else if (std.mem.eql(u8, namespace, "aws")) {
            try lines.append(try self.allocator.dupe(u8, "    /// Parse AWS ARN components"));
            try lines.append(try self.allocator.dupe(u8, "    pub fn parseArn(arn: []const u8) ?struct { service: []const u8, region: []const u8, resource: []const u8 } {"));
            try lines.append(try self.allocator.dupe(u8, "        // Implementation would go here"));
            try lines.append(try self.allocator.dupe(u8, "        _ = arn;"));
            try lines.append(try self.allocator.dupe(u8, "        return null;"));
            try lines.append(try self.allocator.dupe(u8, "    }"));
        } else if (std.mem.eql(u8, namespace, "azure")) {
            try lines.append(try self.allocator.dupe(u8, "    /// Validate Azure resource provider namespace"));
            try lines.append(try self.allocator.dupe(u8, "    pub fn validateResourceProvider(provider: []const u8) bool {"));
            try lines.append(try self.allocator.dupe(u8, "        // Implementation would go here"));
            try lines.append(try self.allocator.dupe(u8, "        _ = provider;"));
            try lines.append(try self.allocator.dupe(u8, "        return true;"));
            try lines.append(try self.allocator.dupe(u8, "    }"));
        }

        try lines.append(try self.allocator.dupe(u8, "};"));
    }

    fn needsUtils(self: *ZigCodeGenerator, namespace: []const u8) bool {
        _ = self;
        return std.mem.eql(u8, namespace, "database") or
            std.mem.eql(u8, namespace, "aws") or
            std.mem.eql(u8, namespace, "azure") or
            std.mem.eql(u8, namespace, "gcp");
    }

    fn formatExamples(self: *ZigCodeGenerator, examples: [][]const u8) ![]u8 {
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

    fn formatExamplesArray(self: *ZigCodeGenerator, examples: [][]const u8) ![]u8 {
        var result = ArrayList(u8).init(self.allocator);
        defer result.deinit();

        try result.appendSlice("&[_][]const u8{");
        for (examples, 0..) |example, i| {
            if (i > 0) try result.appendSlice(", ");
            try result.append('"');
            try result.appendSlice(example);
            try result.append('"');
        }
        try result.append('}');

        return result.toOwnedSlice();
    }

    fn joinLines(self: *ZigCodeGenerator, lines: [][]const u8) ![]u8 {
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
};

// Utility functions for string conversion

fn toConstantName(allocator: Allocator, name: []const u8) ![]u8 {
    var result = ArrayList(u8).init(allocator);
    defer result.deinit();

    for (name) |c| {
        if (c == '.' or c == '-') {
            try result.append('_');
        } else {
            try result.append(std.ascii.toUpper(c));
        }
    }

    return result.toOwnedSlice();
}

fn toStructName(allocator: Allocator, name: []const u8) ![]u8 {
    var result = ArrayList(u8).init(allocator);
    defer result.deinit();

    var capitalize_next = true;
    for (name) |c| {
        if (c == '.' or c == '-' or c == '_') {
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

fn toLowerCase(allocator: Allocator, s: []const u8) ![]u8 {
    var result = try allocator.alloc(u8, s.len);
    for (s, 0..) |c, i| {
        result[i] = std.ascii.toLower(c);
    }
    return result;
}

fn toUpperCase(allocator: Allocator, s: []const u8) ![]u8 {
    var result = try allocator.alloc(u8, s.len);
    for (s, 0..) |c, i| {
        result[i] = std.ascii.toUpper(c);
    }
    return result;
}

fn toTitleCase(allocator: Allocator, s: []const u8) ![]u8 {
    if (s.len == 0) return try allocator.dupe(u8, s);

    var result = try allocator.alloc(u8, s.len);
    result[0] = std.ascii.toUpper(s[0]);
    for (s[1..], 1..) |c, i| {
        result[i] = c;
    }
    return result;
}

fn escapeString(allocator: Allocator, s: []const u8) ![]u8 {
    var result = ArrayList(u8).init(allocator);
    defer result.deinit();

    for (s) |c| {
        switch (c) {
            '\\' => try result.appendSlice("\\\\"),
            '"' => try result.appendSlice("\\\""),
            '\n' => try result.appendSlice("\\n"),
            '\r' => try result.appendSlice("\\r"),
            '\t' => try result.appendSlice("\\t"),
            else => try result.append(c),
        }
    }

    return result.toOwnedSlice();
}
