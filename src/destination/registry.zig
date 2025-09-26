//! Generated from registry.yaml
//! Namespace: destination
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Destination address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
pub const destination_address = types.StringAttribute{
    .name = "destination.address",
    .brief = "Destination address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
    .note = "When observed from the source side, and when communicating through an intermediary, `destination.address` SHOULD represent the destination address behind any intermediaries, for example proxies, if it's available.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Destination port number
pub const destination_port = types.StringAttribute{
    .name = "destination.port",
    .brief = "Destination port number",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

