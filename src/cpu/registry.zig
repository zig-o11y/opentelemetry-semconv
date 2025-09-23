//! Generated from registry.yaml
//! Namespace: cpu
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Attributes specific to a cpu instance.
/// Display name: CPU Attributes
pub const modeValue = enum {
    /// User
    user,
    /// System
    system,
    /// Nice
    nice,
    /// Idle
    idle,
    /// IO Wait
    iowait,
    /// Interrupt
    interrupt,
    /// Steal
    steal,
    /// Kernel
    kernel,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .user => "user",
            .system => "system",
            .nice => "nice",
            .idle => "idle",
            .iowait => "iowait",
            .interrupt => "interrupt",
            .steal => "steal",
            .kernel => "kernel",
        };
    }
};

pub const RegistryCpu = union(enum) {
    /// The mode of the CPU
    mode: types.EnumAttribute(modeValue),
    /// The logical CPU number [0..n-1]
    logicalNumber: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .mode => types.AttributeInfo{
                .name = "cpu.mode",
                .brief = "The mode of the CPU",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "user",
                    "system"
                },
            },
            .logicalNumber => types.AttributeInfo{
                .name = "cpu.logical_number",
                .brief = "The logical CPU number [0..n-1]",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1"
                },
            },
        };
    }
};

