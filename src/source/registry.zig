//! Generated from registry.yaml
//! Namespace: source
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Source address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
pub const source_address = types.StringAttribute{
    .name = "source.address",
    .brief = "Source address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
    .note = "When observed from the destination side, and when communicating through an intermediary, `source.address` SHOULD represent the source address behind any intermediaries, for example proxies, if it's available.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Source port number
pub const source_port = types.StringAttribute{
    .name = "source.port",
    .brief = "Source port number",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

