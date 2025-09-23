const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

/// Attribute types supported by OpenTelemetry
pub const AttributeType = enum {
    string,
    int,
    double,
    boolean,
    string_array,
    int_array,
    double_array,
    boolean_array,
    template,
    enum_type,

    pub fn fromString(s: []const u8) AttributeType {
        if (std.mem.eql(u8, s, "string")) return .string;
        if (std.mem.eql(u8, s, "int")) return .int;
        if (std.mem.eql(u8, s, "double")) return .double;
        if (std.mem.eql(u8, s, "boolean")) return .boolean;
        if (std.mem.eql(u8, s, "string[]")) return .string_array;
        if (std.mem.eql(u8, s, "int[]")) return .int_array;
        if (std.mem.eql(u8, s, "double[]")) return .double_array;
        if (std.mem.eql(u8, s, "boolean[]")) return .boolean_array;
        if (std.mem.startsWith(u8, s, "template[")) return .template;
        return .string; // Default fallback
    }

    pub fn toZigType(self: AttributeType) []const u8 {
        return switch (self) {
            .string => "[]const u8",
            .int => "i64",
            .double => "f64",
            .boolean => "bool",
            .string_array, .int_array, .double_array, .boolean_array => "[]const []const u8",
            .template => "[]const u8",
            .enum_type => "[]const u8",
        };
    }
};

/// Stability levels for attributes
pub const StabilityLevel = enum {
    stable,
    experimental,
    development,
    deprecated,

    pub fn fromString(s: []const u8) StabilityLevel {
        if (std.mem.eql(u8, s, "stable")) return .stable;
        if (std.mem.eql(u8, s, "development")) return .development;
        if (std.mem.eql(u8, s, "deprecated")) return .deprecated;
        return .experimental; // Default
    }
};

/// Enum member definition
pub const EnumMember = struct {
    id: []const u8,
    value: []const u8,
    brief: []const u8,
    stability: StabilityLevel = .experimental,
    deprecated: bool = false,

    pub fn deinit(self: *EnumMember, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.value);
        allocator.free(self.brief);
    }
};

/// Represents a semantic convention attribute
pub const Attribute = struct {
    id: []const u8,
    type: AttributeType,
    brief: []const u8,
    note: ?[]const u8 = null,
    examples: ?ArrayList([]const u8) = null,
    stability: StabilityLevel = .experimental,
    enum_members: ?ArrayList(EnumMember) = null,

    pub fn deinit(self: *Attribute, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);

        if (self.examples) |*examples| {
            for (examples.items) |example| {
                allocator.free(example);
            }
            examples.deinit();
        }

        if (self.enum_members) |*members| {
            for (members.items) |*member| {
                member.deinit(allocator);
            }
            members.deinit();
        }
    }
};

/// Represents a group of related attributes
pub const AttributeGroup = struct {
    id: []const u8,
    type: []const u8,
    display_name: ?[]const u8 = null,
    brief: []const u8,
    note: ?[]const u8 = null,
    attributes: ArrayList(Attribute),

    pub fn init(allocator: Allocator) AttributeGroup {
        return AttributeGroup{
            .id = "",
            .type = "attribute_group",
            .display_name = null,
            .brief = "",
            .note = null,
            .attributes = ArrayList(Attribute).init(allocator),
        };
    }

    pub fn deinit(self: *AttributeGroup, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.type);
        if (self.display_name) |display_name| allocator.free(display_name);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);

        for (self.attributes.items) |*attr| {
            attr.deinit(allocator);
        }
        self.attributes.deinit();
    }
};

/// Represents a registry file (simplified version for registry-only parsing)
pub const Registry = struct {
    groups: ArrayList(AttributeGroup),
    file_name: []const u8,
    namespace: []const u8,

    pub fn init(allocator: Allocator) Registry {
        return Registry{
            .groups = ArrayList(AttributeGroup).init(allocator),
            .file_name = "",
            .namespace = "",
        };
    }

    pub fn deinit(self: *Registry, allocator: Allocator) void {
        for (self.groups.items) |*group| {
            group.deinit(allocator);
        }
        self.groups.deinit();

        allocator.free(self.file_name);
        allocator.free(self.namespace);
    }
};
