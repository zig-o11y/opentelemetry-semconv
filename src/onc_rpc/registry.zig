//! Generated from registry.yaml
//! Namespace: onc_rpc
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// ONC/Sun RPC program version.
pub const onc_rpc_version = types.StringAttribute{
    .name = "onc_rpc.version",
    .brief = "ONC/Sun RPC program version.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// ONC/Sun RPC procedure number.
pub const onc_rpc_procedure_number = types.StringAttribute{
    .name = "onc_rpc.procedure.number",
    .brief = "ONC/Sun RPC procedure number.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// ONC/Sun RPC procedure name.
pub const onc_rpc_procedure_name = types.StringAttribute{
    .name = "onc_rpc.procedure.name",
    .brief = "ONC/Sun RPC procedure name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// ONC/Sun RPC program name.
pub const onc_rpc_program_name = types.StringAttribute{
    .name = "onc_rpc.program.name",
    .brief = "ONC/Sun RPC program name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// This document defines attributes for [ONC RPC (Sun RPC)](https://datatracker.ietf.org/doc/html/rfc5531)
/// Display name: ONC RPC (Sun RPC) attributes
pub const Registry = struct {
    /// ONC/Sun RPC program version.
    pub const version = onc_rpc_version;
    /// ONC/Sun RPC procedure number.
    pub const procedureNumber = onc_rpc_procedure_number;
    /// ONC/Sun RPC procedure name.
    pub const procedureName = onc_rpc_procedure_name;
    /// ONC/Sun RPC program name.
    pub const programName = onc_rpc_program_name;
};

