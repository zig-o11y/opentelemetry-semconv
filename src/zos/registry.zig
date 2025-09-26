//! Generated from registry.yaml
//! Namespace: zos
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.
pub const zos_smf_id = types.StringAttribute{
    .name = "zos.smf.id",
    .brief = "The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the SYSPLEX to which the z/OS system belongs too.
pub const zos_sysplex_name = types.StringAttribute{
    .name = "zos.sysplex.name",
    .brief = "The name of the SYSPLEX to which the z/OS system belongs too.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

