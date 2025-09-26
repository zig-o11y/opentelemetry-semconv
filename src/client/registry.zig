//! Generated from registry.yaml
//! Namespace: client
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Client address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
pub const client_address = types.StringAttribute{
    .name = "client.address",
    .brief = "Client address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
    .note = "When observed from the server side, and when communicating through an intermediary, `client.address` SHOULD represent the client address behind any intermediaries,  for example proxies, if it's available.",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// Client port number.
pub const client_port = types.StringAttribute{
    .name = "client.port",
    .brief = "Client port number.",
    .note = "When observed from the server side, and when communicating through an intermediary, `client.port` SHOULD represent the client port behind any intermediaries,  for example proxies, if it's available.\n\n",
    .stability = .stable,
    .requirement_level = .recommended,
};

