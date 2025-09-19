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

    pub fn fromString(s: []const u8) AttributeType {
        if (std.mem.eql(u8, s, "string")) return .string;
        if (std.mem.eql(u8, s, "int")) return .int;
        if (std.mem.eql(u8, s, "double")) return .double;
        if (std.mem.eql(u8, s, "boolean")) return .boolean;
        if (std.mem.eql(u8, s, "string[]")) return .string_array;
        if (std.mem.eql(u8, s, "int[]")) return .int_array;
        if (std.mem.eql(u8, s, "double[]")) return .double_array;
        if (std.mem.eql(u8, s, "boolean[]")) return .boolean_array;
        return .string; // Default fallback
    }

    pub fn toZigType(self: AttributeType) []const u8 {
        return switch (self) {
            .string => "[]const u8",
            .int => "i64",
            .double => "f64",
            .boolean => "bool",
            .string_array, .int_array, .double_array, .boolean_array => "types.ArrayAttribute",
        };
    }
};

/// Stability levels for attributes
pub const StabilityLevel = enum {
    stable,
    experimental,
    deprecated,

    pub fn fromString(s: []const u8) StabilityLevel {
        if (std.mem.eql(u8, s, "stable")) return .stable;
        if (std.mem.eql(u8, s, "deprecated")) return .deprecated;
        return .experimental; // Default
    }

    pub fn toZigCode(self: StabilityLevel) []const u8 {
        return switch (self) {
            .stable => "types.StabilityLevel.stable",
            .experimental => "types.StabilityLevel.experimental",
            .deprecated => "types.StabilityLevel.deprecated",
        };
    }
};

/// Requirement levels for attributes
pub const RequirementLevel = enum {
    required,
    conditionally_required,
    recommended,
    opt_in,

    pub fn fromString(s: []const u8) RequirementLevel {
        if (std.mem.eql(u8, s, "required")) return .required;
        if (std.mem.eql(u8, s, "conditionally_required")) return .conditionally_required;
        if (std.mem.eql(u8, s, "opt_in")) return .opt_in;
        return .recommended; // Default
    }

    pub fn toZigCode(self: RequirementLevel) []const u8 {
        return switch (self) {
            .required => "types.RequirementLevel.required",
            .conditionally_required => "types.RequirementLevel.conditionally_required",
            .recommended => "types.RequirementLevel.recommended",
            .opt_in => "types.RequirementLevel.opt_in",
        };
    }
};

/// Represents a semantic convention attribute
pub const Attribute = struct {
    id: []const u8,
    type: AttributeType,
    brief: []const u8,
    note: ?[]const u8 = null,
    examples: ?ArrayList([]const u8) = null,
    tag: ?[]const u8 = null,
    stability: StabilityLevel = .experimental,
    requirement_level: RequirementLevel = .recommended,
    deprecated: ?[]const u8 = null,
    prefix: ?[]const u8 = null,
    enum_values: ?ArrayList([]const u8) = null,

    pub fn deinit(self: *Attribute, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);
        if (self.tag) |tag| allocator.free(tag);
        if (self.deprecated) |deprecated| allocator.free(deprecated);
        if (self.prefix) |prefix| allocator.free(prefix);

        if (self.examples) |*examples| {
            for (examples.items) |example| {
                allocator.free(example);
            }
            examples.deinit();
        }

        if (self.enum_values) |*enum_values| {
            for (enum_values.items) |value| {
                allocator.free(value);
            }
            enum_values.deinit();
        }
    }
};

/// Represents a group of related attributes
pub const AttributeGroup = struct {
    id: []const u8,
    type: []const u8,
    brief: []const u8,
    note: ?[]const u8 = null,
    attributes: ArrayList(Attribute),
    prefix: ?[]const u8 = null,
    extends: ?[]const u8 = null,

    pub fn init(allocator: Allocator) AttributeGroup {
        return AttributeGroup{
            .id = "",
            .type = "attribute_group",
            .brief = "",
            .note = null,
            .attributes = ArrayList(Attribute).init(allocator),
            .prefix = null,
            .extends = null,
        };
    }

    pub fn deinit(self: *AttributeGroup, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.type);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);
        if (self.prefix) |prefix| allocator.free(prefix);
        if (self.extends) |extends| allocator.free(extends);

        for (self.attributes.items) |*attr| {
            attr.deinit(allocator);
        }
        self.attributes.deinit();
    }
};

/// Represents an attribute reference (used in entities)
pub const AttributeReference = struct {
    ref: []const u8,
    requirement_level: ?[]const u8 = null,
    examples: ?ArrayList([]const u8) = null,

    pub fn deinit(self: *AttributeReference, allocator: Allocator) void {
        allocator.free(self.ref);
        if (self.requirement_level) |requirement_level| allocator.free(requirement_level);
        if (self.examples) |*examples| {
            for (examples.items) |example| {
                allocator.free(example);
            }
            examples.deinit();
        }
    }
};

/// Represents an entity definition
pub const Entity = struct {
    id: []const u8,
    type: []const u8,
    name: ?[]const u8 = null,
    brief: []const u8,
    note: ?[]const u8 = null,
    stability: ?[]const u8 = null,
    attributes: ArrayList(AttributeReference),

    pub fn init(allocator: Allocator) Entity {
        return Entity{
            .id = "",
            .type = "entity",
            .name = null,
            .brief = "",
            .note = null,
            .stability = null,
            .attributes = ArrayList(AttributeReference).init(allocator),
        };
    }

    pub fn deinit(self: *Entity, allocator: Allocator) void {
        allocator.free(self.id);
        allocator.free(self.type);
        if (self.name) |name| allocator.free(name);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);
        if (self.stability) |stability| allocator.free(stability);

        for (self.attributes.items) |*attr_ref| {
            attr_ref.deinit(allocator);
        }
        self.attributes.deinit();
    }
};

/// Represents a span definition
pub const SpanDefinition = struct {
    span_name: []const u8,
    type: []const u8,
    brief: []const u8,
    note: ?[]const u8 = null,
    attributes: ?ArrayList([]const u8) = null,
    events: ?ArrayList([]const u8) = null,

    pub fn deinit(self: *SpanDefinition, allocator: Allocator) void {
        allocator.free(self.span_name);
        allocator.free(self.type);
        allocator.free(self.brief);
        if (self.note) |note| allocator.free(note);

        if (self.attributes) |*attributes| {
            for (attributes.items) |attr| {
                allocator.free(attr);
            }
            attributes.deinit();
        }

        if (self.events) |*events| {
            for (events.items) |event| {
                allocator.free(event);
            }
            events.deinit();
        }
    }
};

/// Represents a metric definition
pub const MetricDefinition = struct {
    metric_name: []const u8,
    type: []const u8,
    brief: []const u8,
    instrument: []const u8,
    unit: ?[]const u8 = null,
    note: ?[]const u8 = null,
    attributes: ?ArrayList([]const u8) = null,

    pub fn deinit(self: *MetricDefinition, allocator: Allocator) void {
        allocator.free(self.metric_name);
        allocator.free(self.type);
        allocator.free(self.brief);
        allocator.free(self.instrument);
        if (self.unit) |unit| allocator.free(unit);
        if (self.note) |note| allocator.free(note);

        if (self.attributes) |*attributes| {
            for (attributes.items) |attr| {
                allocator.free(attr);
            }
            attributes.deinit();
        }
    }
};

/// Represents a complete semantic convention file
pub const SemanticConvention = struct {
    groups: ArrayList(AttributeGroup),
    entities: ArrayList(Entity),
    spans: ArrayList(SpanDefinition),
    metrics: ArrayList(MetricDefinition),
    file_name: []const u8,
    namespace: []const u8,

    pub fn init(allocator: Allocator) SemanticConvention {
        return SemanticConvention{
            .groups = ArrayList(AttributeGroup).init(allocator),
            .entities = ArrayList(Entity).init(allocator),
            .spans = ArrayList(SpanDefinition).init(allocator),
            .metrics = ArrayList(MetricDefinition).init(allocator),
            .file_name = "",
            .namespace = "",
        };
    }

    pub fn deinit(self: *SemanticConvention, allocator: Allocator) void {
        for (self.groups.items) |*group| {
            group.deinit(allocator);
        }
        self.groups.deinit();

        for (self.entities.items) |*entity| {
            entity.deinit(allocator);
        }
        self.entities.deinit();

        for (self.spans.items) |*span| {
            span.deinit(allocator);
        }
        self.spans.deinit();

        for (self.metrics.items) |*metric| {
            metric.deinit(allocator);
        }
        self.metrics.deinit();

        allocator.free(self.file_name);
        allocator.free(self.namespace);
    }
};
