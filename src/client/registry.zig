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

/// These attributes may be used to describe the client in a connection-based network interaction where there is one side that initiates the connection (the client is the side that initiates the connection). This covers all TCP network interactions since TCP is connection-based and one side initiates the connection (an exception is made for peer-to-peer communication over TCP where the "user-facing" surface of the protocol / API doesn't expose a clear notion of client and server). This also covers UDP network interactions where one side initiates the interaction, e.g. QUIC (HTTP/3) and DNS.
/// Display name: Client Attributes
pub const Registry = struct {
    /// Client address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
    pub const address = client_address;
    /// Client port number.
    pub const port = client_port;
};

