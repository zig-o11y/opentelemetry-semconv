//! Generated from registry.yaml
//! Namespace: cpython
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines CPython related attributes.
/// Display name: CPython attributes
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

pub const RegistryCpython = union(enum) {
    /// Value of the garbage collector collection generation.
    gcGeneration: types.EnumAttribute(gcGenerationValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .gcGeneration => types.AttributeInfo{
                .name = "cpython.gc.generation",
                .brief = "Value of the garbage collector collection generation.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "0",
                    "1",
                    "2"
                },
            },
        };
    }
};

