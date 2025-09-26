//! Generated from registry.yaml
//! Namespace: go
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const memoryTypeValue = enum {
    /// Memory allocated from the heap that is reserved for stack space, whether or not it is currently in-use.
    stack,
    /// Memory used by the Go runtime, excluding other categories of memory usage described in this enumeration.
    other,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .stack => "stack",
            .other => "other",
        };
    }
};

/// The type of memory.
pub const go_memory_type = types.EnumAttribute(memoryTypeValue){
    .base = types.StringAttribute{
        .name = "go.memory.type",
        .brief = "The type of memory.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = memoryTypeValue.stack,
};

