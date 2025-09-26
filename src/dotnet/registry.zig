//! Generated from registry.yaml
//! Namespace: dotnet
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const gcHeapGenerationValue = enum {
    /// Generation 0
    gen0,
    /// Generation 1
    gen1,
    /// Generation 2
    gen2,
    /// Large Object Heap
    loh,
    /// Pinned Object Heap
    poh,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .gen0 => "gen0",
            .gen1 => "gen1",
            .gen2 => "gen2",
            .loh => "loh",
            .poh => "poh",
        };
    }
};

/// Name of the garbage collector managed heap generation.
pub const dotnet_gc_heap_generation = types.EnumAttribute(gcHeapGenerationValue){
    .base = types.StringAttribute{
        .name = "dotnet.gc.heap.generation",
        .brief = "Name of the garbage collector managed heap generation.",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = gcHeapGenerationValue.gen0,
};

