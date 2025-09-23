//! Core types for OpenTelemetry semantic conventions
//!
//! This module provides common types and structures used across all semantic
//! convention modules to represent attributes, stability levels, and requirement levels.

const std = @import("std");

/// Stability level of a semantic convention attribute
pub const StabilityLevel = enum {
    /// The attribute is stable and should not change in backward-incompatible ways
    stable,
    /// The attribute is in development and may change
    development,
    /// The attribute is deprecated and should not be used
    deprecated,
    /// The attribute is experimental (alias for development)
    experimental,

    pub fn toString(self: StabilityLevel) []const u8 {
        return switch (self) {
            .stable => "stable",
            .development => "development",
            .deprecated => "deprecated",
            .experimental => "experimental",
        };
    }
};

/// Requirement level of a semantic convention attribute
pub const RequirementLevel = enum {
    /// The attribute MUST be provided
    required,
    /// The attribute SHOULD be provided when available
    recommended,
    /// The attribute MAY be provided but is not required or recommended by default
    opt_in,
    /// The attribute is required under specific conditions
    conditionally_required,

    pub fn toString(self: RequirementLevel) []const u8 {
        return switch (self) {
            .required => "Required",
            .recommended => "Recommended",
            .opt_in => "Opt-In",
            .conditionally_required => "Conditionally Required",
        };
    }
};

/// Type of attribute value
pub const AttributeType = enum {
    string,
    int,
    double,
    boolean,
    string_array,
    int_array,
    double_array,
    boolean_array,

    pub fn toString(self: AttributeType) []const u8 {
        return switch (self) {
            .string => "string",
            .int => "int",
            .double => "double",
            .boolean => "boolean",
            .string_array => "string[]",
            .int_array => "int[]",
            .double_array => "double[]",
            .boolean_array => "boolean[]",
        };
    }
};

/// A semantic convention attribute definition
pub fn Attribute(comptime ValueType: type) type {
    return struct {
        const Self = @This();

        /// The attribute name/key
        name: []const u8,
        /// Human-readable description
        brief: []const u8,
        /// Additional notes or documentation
        note: ?[]const u8 = null,
        /// Stability level
        stability: StabilityLevel,
        /// Requirement level
        requirement_level: RequirementLevel,
        /// Optional condition for conditionally required attributes
        requirement_condition: ?[]const u8 = null,
        /// Example values
        examples: ?[]const ValueType = null,
        /// Deprecated reason if applicable
        deprecated_reason: ?[]const u8 = null,

        pub fn init(
            name: []const u8,
            brief: []const u8,
            stability: StabilityLevel,
            requirement_level: RequirementLevel,
        ) Self {
            return Self{
                .name = name,
                .brief = brief,
                .stability = stability,
                .requirement_level = requirement_level,
            };
        }

        pub fn withNote(self: Self, note: []const u8) Self {
            var result = self;
            result.note = note;
            return result;
        }

        pub fn withCondition(self: Self, condition: []const u8) Self {
            var result = self;
            result.requirement_condition = condition;
            return result;
        }

        pub fn withExamples(self: Self, examples: []const ValueType) Self {
            var result = self;
            result.examples = examples;
            return result;
        }

        pub fn withDeprecation(self: Self, reason: []const u8) Self {
            var result = self;
            result.deprecated_reason = reason;
            result.stability = .deprecated;
            return result;
        }
    };
}

/// String attribute
pub const StringAttribute = Attribute([]const u8);

/// Integer attribute
pub const IntAttribute = Attribute(i64);

/// Double attribute
pub const DoubleAttribute = Attribute(f64);

/// Boolean attribute
pub const BooleanAttribute = Attribute(bool);

/// String array attribute
pub const StringArrayAttribute = Attribute([]const []const u8);

/// Integer array attribute
pub const IntArrayAttribute = Attribute([]const i64);

/// Double array attribute
pub const DoubleArrayAttribute = Attribute([]const f64);

/// Boolean array attribute
pub const BooleanArrayAttribute = Attribute([]const bool);

/// Generic array attribute union for any array type
pub const ArrayAttribute = union(enum) {
    string: StringArrayAttribute,
    int: IntArrayAttribute,
    double: DoubleArrayAttribute,
    boolean: BooleanArrayAttribute,

    /// Get the attribute name regardless of the specific array type
    pub fn getName(self: ArrayAttribute) []const u8 {
        return switch (self) {
            .string => |attr| attr.name,
            .int => |attr| attr.name,
            .double => |attr| attr.name,
            .boolean => |attr| attr.name,
        };
    }

    /// Get the stability level regardless of the specific array type
    pub fn getStability(self: ArrayAttribute) StabilityLevel {
        return switch (self) {
            .string => |attr| attr.stability,
            .int => |attr| attr.stability,
            .double => |attr| attr.stability,
            .boolean => |attr| attr.stability,
        };
    }

    /// Get the requirement level regardless of the specific array type
    pub fn getRequirementLevel(self: ArrayAttribute) RequirementLevel {
        return switch (self) {
            .string => |attr| attr.requirement_level,
            .int => |attr| attr.requirement_level,
            .double => |attr| attr.requirement_level,
            .boolean => |attr| attr.requirement_level,
        };
    }

    /// Get the brief description regardless of the specific array type
    pub fn getBrief(self: ArrayAttribute) []const u8 {
        return switch (self) {
            .string => |attr| attr.brief,
            .int => |attr| attr.brief,
            .double => |attr| attr.brief,
            .boolean => |attr| attr.brief,
        };
    }

    /// Create a string array attribute
    pub fn stringArray(attr: StringArrayAttribute) ArrayAttribute {
        return ArrayAttribute{ .string = attr };
    }

    /// Create an integer array attribute
    pub fn intArray(attr: IntArrayAttribute) ArrayAttribute {
        return ArrayAttribute{ .int = attr };
    }

    /// Create a double array attribute
    pub fn doubleArray(attr: DoubleArrayAttribute) ArrayAttribute {
        return ArrayAttribute{ .double = attr };
    }

    /// Create a boolean array attribute
    pub fn booleanArray(attr: BooleanArrayAttribute) ArrayAttribute {
        return ArrayAttribute{ .boolean = attr };
    }
};

/// Enum attribute with well-known values
pub fn EnumAttribute(comptime EnumType: type) type {
    return struct {
        const Self = @This();

        /// The base attribute definition
        base: StringAttribute,
        /// Well-known enum values
        well_known_values: []const EnumType,

        pub fn init(
            name: []const u8,
            brief: []const u8,
            stability: StabilityLevel,
            requirement_level: RequirementLevel,
            well_known_values: []const EnumType,
        ) Self {
            return Self{
                .base = StringAttribute.init(name, brief, stability, requirement_level),
                .well_known_values = well_known_values,
            };
        }

        pub fn withNote(self: Self, note: []const u8) Self {
            var result = self;
            result.base = result.base.withNote(note);
            return result;
        }

        pub fn withCondition(self: Self, condition: []const u8) Self {
            var result = self;
            result.base = result.base.withCondition(condition);
            return result;
        }

        pub fn withExamples(self: Self, examples: []const []const u8) Self {
            var result = self;
            result.base = result.base.withExamples(examples);
            return result;
        }

        pub fn withDeprecation(self: Self, reason: []const u8) Self {
            var result = self;
            result.base = result.base.withDeprecation(reason);
            return result;
        }
    };
}

/// A semantic convention group containing related attributes
pub const AttributeGroup = struct {
    /// Group identifier
    id: []const u8,
    /// Group description
    brief: []const u8,
    /// Group stability
    stability: StabilityLevel,
    /// Optional note
    note: ?[]const u8 = null,
};

/// A semantic convention entity group definition
pub const EntityGroup = struct {
    /// Entity identifier
    id: []const u8,
    /// Entity name
    name: []const u8,
    /// Entity description
    brief: []const u8,
    /// Entity stability
    stability: StabilityLevel,
    /// Optional note
    note: ?[]const u8 = null,
};

/// Test helper to verify attribute definitions
pub fn expectValidAttribute(comptime attr: anytype) void {
    // Compile-time validation
    if (attr.name.len == 0) {
        @compileError("Attribute name cannot be empty");
    }
    if (attr.brief.len == 0) {
        @compileError("Attribute brief cannot be empty");
    }
}

// Tests
test "StringAttribute creation" {
    const attr = StringAttribute.init(
        "test.name",
        "A test attribute",
        .stable,
        .recommended,
    );

    try std.testing.expectEqualStrings("test.name", attr.name);
    try std.testing.expectEqualStrings("A test attribute", attr.brief);
    try std.testing.expectEqual(StabilityLevel.stable, attr.stability);
    try std.testing.expectEqual(RequirementLevel.recommended, attr.requirement_level);
    try std.testing.expectEqual(@as(?[]const u8, null), attr.note);
}

test "Attribute with note and condition" {
    const attr = StringAttribute.init(
        "test.conditional",
        "A conditional attribute",
        .development,
        .conditionally_required,
    ).withNote("This is a note").withCondition("If something is true");

    try std.testing.expectEqualStrings("This is a note", attr.note.?);
    try std.testing.expectEqualStrings("If something is true", attr.requirement_condition.?);
}

test "StabilityLevel string conversion" {
    try std.testing.expectEqualStrings("stable", StabilityLevel.stable.toString());
    try std.testing.expectEqualStrings("development", StabilityLevel.development.toString());
    try std.testing.expectEqualStrings("deprecated", StabilityLevel.deprecated.toString());
}

test "RequirementLevel string conversion" {
    try std.testing.expectEqualStrings("Required", RequirementLevel.required.toString());
    try std.testing.expectEqualStrings("Recommended", RequirementLevel.recommended.toString());
    try std.testing.expectEqualStrings("Opt-In", RequirementLevel.opt_in.toString());
    try std.testing.expectEqualStrings("Conditionally Required", RequirementLevel.conditionally_required.toString());
}

test "ArrayAttribute union" {
    // Test string array attribute
    const string_attr = StringArrayAttribute.init(
        "test.strings",
        "A string array attribute",
        .stable,
        .recommended,
    );
    const array_attr_string = ArrayAttribute.stringArray(string_attr);

    try std.testing.expectEqualStrings("test.strings", array_attr_string.getName());
    try std.testing.expectEqual(StabilityLevel.stable, array_attr_string.getStability());
    try std.testing.expectEqual(RequirementLevel.recommended, array_attr_string.getRequirementLevel());
    try std.testing.expectEqualStrings("A string array attribute", array_attr_string.getBrief());

    // Test int array attribute
    const int_attr = IntArrayAttribute.init(
        "test.numbers",
        "An integer array attribute",
        .development,
        .opt_in,
    );
    const array_attr_int = ArrayAttribute.intArray(int_attr);

    try std.testing.expectEqualStrings("test.numbers", array_attr_int.getName());
    try std.testing.expectEqual(StabilityLevel.development, array_attr_int.getStability());
    try std.testing.expectEqual(RequirementLevel.opt_in, array_attr_int.getRequirementLevel());

    // Test boolean array attribute
    const bool_attr = BooleanArrayAttribute.init(
        "test.flags",
        "A boolean array attribute",
        .deprecated,
        .conditionally_required,
    );
    const array_attr_bool = ArrayAttribute.booleanArray(bool_attr);

    try std.testing.expectEqualStrings("test.flags", array_attr_bool.getName());
    try std.testing.expectEqual(StabilityLevel.deprecated, array_attr_bool.getStability());
    try std.testing.expectEqual(RequirementLevel.conditionally_required, array_attr_bool.getRequirementLevel());

    // Test double array attribute
    const double_attr = DoubleArrayAttribute.init(
        "test.values",
        "A double array attribute",
        .stable,
        .required,
    );
    const array_attr_double = ArrayAttribute.doubleArray(double_attr);

    try std.testing.expectEqualStrings("test.values", array_attr_double.getName());
    try std.testing.expectEqual(StabilityLevel.stable, array_attr_double.getStability());
    try std.testing.expectEqual(RequirementLevel.required, array_attr_double.getRequirementLevel());
}
