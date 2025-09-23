//! Generated from registry.yaml
//! Namespace: onc_rpc
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for [ONC RPC (Sun RPC)](https://datatracker.ietf.org/doc/html/rfc5531)
/// Display name: ONC RPC (Sun RPC) attributes
pub const RegistryOncRpc = union(enum) {
    /// ONC/Sun RPC program version.
    version: types.StringAttribute,
    /// ONC/Sun RPC procedure number.
    procedureNumber: types.StringAttribute,
    /// ONC/Sun RPC procedure name.
    procedureName: types.StringAttribute,
    /// ONC/Sun RPC program name.
    programName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .version => types.AttributeInfo{
                .name = "onc_rpc.version",
                .brief = "ONC/Sun RPC program version.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .procedureNumber => types.AttributeInfo{
                .name = "onc_rpc.procedure.number",
                .brief = "ONC/Sun RPC procedure number.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .procedureName => types.AttributeInfo{
                .name = "onc_rpc.procedure.name",
                .brief = "ONC/Sun RPC procedure name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "OPEN",
                    "READ",
                    "GETATTR"
                },
            },
            .programName => types.AttributeInfo{
                .name = "onc_rpc.program.name",
                .brief = "ONC/Sun RPC program name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "portmapper",
                    "nfs"
                },
            },
        };
    }
};

