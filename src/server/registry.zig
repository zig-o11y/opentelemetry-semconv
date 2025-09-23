//! Generated from registry.yaml
//! Namespace: server
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// These attributes may be used to describe the server in a connection-based network interaction where there is one side that initiates the connection (the client is the side that initiates the connection). This covers all TCP network interactions since TCP is connection-based and one side initiates the connection (an exception is made for peer-to-peer communication over TCP where the "user-facing" surface of the protocol / API doesn't expose a clear notion of client and server). This also covers UDP network interactions where one side initiates the interaction, e.g. QUIC (HTTP/3) and DNS.
/// Display name: Server Attributes
pub const RegistryServer = union(enum) {
    /// Server domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
    address: types.StringAttribute,
    /// Server port number.
    port: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .address => types.AttributeInfo{
                .name = "server.address",
                .brief = "Server domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
                .note = "When observed from the client side, and when communicating through an intermediary, `server.address` SHOULD represent the server address behind any intermediaries, for example proxies, if it's available.",
                .stability = .stable,
                .examples = &.{
                    "example.com",
                    "10.1.2.80",
                    "/tmp/my.sock"
                },
            },
            .port => types.AttributeInfo{
                .name = "server.port",
                .brief = "Server port number.",
                .note = "When observed from the client side, and when communicating through an intermediary, `server.port` SHOULD represent the server port behind any intermediaries, for example proxies, if it's available.",
                .stability = .stable,
                .examples = &.{
                    "80",
                    "8080",
                    "443"
                },
            },
        };
    }
};

