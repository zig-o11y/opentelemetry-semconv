//! Generated from registry.yaml
//! Namespace: linux
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes Linux Memory attributes
/// Display name: Linux Memory Attributes
pub const memorySlabStateValue = enum {
    ///
    reclaimable,
    ///
    unreclaimable,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .reclaimable => "reclaimable",
            .unreclaimable => "unreclaimable",
        };
    }
};

pub const RegistryLinuxMemory = union(enum) {
    /// The Linux Slab memory state
    memorySlabState: types.EnumAttribute(memorySlabStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .memorySlabState => types.AttributeInfo{
                .name = "linux.memory.slab.state",
                .brief = "The Linux Slab memory state",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "reclaimable",
                    "unreclaimable"
                },
            },
        };
    }
};

