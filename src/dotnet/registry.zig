//! Generated from registry.yaml
//! Namespace: dotnet
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines .NET related attributes.
/// Display name: .NET Attributes
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

pub const RegistryDotnet = union(enum) {
    /// Name of the garbage collector managed heap generation.
    gcHeapGeneration: types.EnumAttribute(gcHeapGenerationValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .gcHeapGeneration => types.AttributeInfo{
                .name = "dotnet.gc.heap.generation",
                .brief = "Name of the garbage collector managed heap generation.",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "gen0",
                    "gen1",
                    "gen2"
                },
            },
        };
    }
};

