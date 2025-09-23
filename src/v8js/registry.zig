//! Generated from registry.yaml
//! Namespace: v8js
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes V8 JS Engine Runtime related attributes.
/// Display name: V8 JS Attributes
pub const gcTypeValue = enum {
    /// Major (Mark Sweep Compact).
    major,
    /// Minor (Scavenge).
    minor,
    /// Incremental (Incremental Marking).
    incremental,
    /// Weak Callbacks (Process Weak Callbacks).
    weakcb,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .major => "major",
            .minor => "minor",
            .incremental => "incremental",
            .weakcb => "weakcb",
        };
    }
};

pub const heapSpaceNameValue = enum {
    /// New memory space.
    new_space,
    /// Old memory space.
    old_space,
    /// Code memory space.
    code_space,
    /// Map memory space.
    map_space,
    /// Large object memory space.
    large_object_space,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .new_space => "new_space",
            .old_space => "old_space",
            .code_space => "code_space",
            .map_space => "map_space",
            .large_object_space => "large_object_space",
        };
    }
};

pub const RegistryV8js = union(enum) {
    /// The type of garbage collection.
    gcType: types.EnumAttribute(gcTypeValue),
    /// The name of the space type of heap memory.
    heapSpaceName: types.EnumAttribute(heapSpaceNameValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .gcType => types.AttributeInfo{
                .name = "v8js.gc.type",
                .brief = "The type of garbage collection.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .heapSpaceName => types.AttributeInfo{
                .name = "v8js.heap.space.name",
                .brief = "The name of the space type of heap memory.",
                .note = "Value can be retrieved from value `space_name` of [`v8.getHeapSpaceStatistics()`](https://nodejs.org/api/v8.html",
                .stability = .development,
                .examples = null,
            },
        };
    }
};

