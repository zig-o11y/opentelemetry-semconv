//! Generated from registry.yaml
//! Namespace: zos
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes of a z/OS resource.
/// Display name: z/OS attributes
pub const RegistryZos = union(enum) {
    /// The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.
    smfId: types.StringAttribute,
    /// The name of the SYSPLEX to which the z/OS system belongs too.
    sysplexName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .smfId => types.AttributeInfo{
                .name = "zos.smf.id",
                .brief = "The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "SYS1"
                },
            },
            .sysplexName => types.AttributeInfo{
                .name = "zos.sysplex.name",
                .brief = "The name of the SYSPLEX to which the z/OS system belongs too.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "SYSPLEX1"
                },
            },
        };
    }
};

