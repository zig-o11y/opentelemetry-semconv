//! Generated from registry.yaml
//! Namespace: cpython
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const gcGenerationValue = enum {
    /// Generation 0
    generation_0,
    /// Generation 1
    generation_1,
    /// Generation 2
    generation_2,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .generation_0 => "",
            .generation_1 => "",
            .generation_2 => "",
        };
    }
};

/// Value of the garbage collector collection generation.
pub const cpython_gc_generation = types.EnumAttribute(gcGenerationValue){
    .base = types.StringAttribute{
        .name = "cpython.gc.generation",
        .brief = "Value of the garbage collector collection generation.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = gcGenerationValue.generation_0,
};

