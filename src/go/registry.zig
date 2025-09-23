//! Generated from registry.yaml
//! Namespace: go
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines Go related attributes.
/// Display name: Go Attributes
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

pub const RegistryGo = union(enum) {
    /// The type of memory.
    memoryType: types.EnumAttribute(memoryTypeValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .memoryType => types.AttributeInfo{
                .name = "go.memory.type",
                .brief = "The type of memory.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "other",
                    "stack"
                },
            },
        };
    }
};

