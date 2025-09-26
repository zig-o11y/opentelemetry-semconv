//! Generated from registry.yaml
//! Namespace: cpu
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The mode of the CPU
pub const cpu_mode = types.EnumAttribute(modeValue){
    .base = types.StringAttribute{
        .name = "cpu.mode",
        .brief = "The mode of the CPU",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = modeValue.user,
};

/// The logical CPU number [0..n-1]
pub const cpu_logical_number = types.StringAttribute{
    .name = "cpu.logical_number",
    .brief = "The logical CPU number [0..n-1]",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

