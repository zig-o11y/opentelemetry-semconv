//! Generated from registry.yaml
//! Namespace: source
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// These attributes may be used to describe the sender of a network exchange/packet. These should be used when there is no client/server relationship between the two sides, or when that relationship is unknown. This covers low-level network interactions (e.g. packet tracing) where you don't know if there was a connection or which side initiated it. This also covers unidirectional UDP flows and peer-to-peer communication where the "user-facing" surface of the protocol / API doesn't expose a clear notion of client and server.
/// Display name: Source Attributes
pub const RegistrySource = union(enum) {
    /// Source address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
    address: types.StringAttribute,
    /// Source port number
    port: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .address => types.AttributeInfo{
                .name = "source.address",
                .brief = "Source address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.",
                .note = "When observed from the destination side, and when communicating through an intermediary, `source.address` SHOULD represent the source address behind any intermediaries, for example proxies, if it's available.",
                .stability = .development,
                .examples = &.{
                    "source.example.com",
                    "10.1.2.80",
                    "/tmp/my.sock"
                },
            },
            .port => types.AttributeInfo{
                .name = "source.port",
                .brief = "Source port number",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "3389",
                    "2888"
                },
            },
        };
    }
};

