//! Generated from registry.yaml
//! Namespace: server
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Server domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
pub const server_address = types.StringAttribute{
    .name = "server.address",
    .brief = "Server domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
    .note = "When observed from the client side, and when communicating through an intermediary, `server.address` SHOULD represent the server address behind any intermediaries, for example proxies, if it's available.",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// Server port number.
pub const server_port = types.StringAttribute{
    .name = "server.port",
    .brief = "Server port number.",
    .note = "When observed from the client side, and when communicating through an intermediary, `server.port` SHOULD represent the server port behind any intermediaries, for example proxies, if it's available.",
    .stability = .stable,
    .requirement_level = .recommended,
};

