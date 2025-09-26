//! Generated from registry.yaml
//! Namespace: linux
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The Linux Slab memory state
pub const linux_memory_slab_state = types.EnumAttribute(memorySlabStateValue){
    .base = types.StringAttribute{
        .name = "linux.memory.slab.state",
        .brief = "The Linux Slab memory state",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = memorySlabStateValue.reclaimable,
};

