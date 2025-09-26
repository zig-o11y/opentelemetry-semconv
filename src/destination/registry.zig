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

/// These attributes may be used to describe the receiver of a network exchange/packet. These should be used when there is no client/server relationship between the two sides, or when that relationship is unknown. This covers low-level network interactions (e.g. packet tracing) where you don't know if there was a connection or which side initiated it. This also covers unidirectional UDP flows and peer-to-peer communication where the "user-facing" surface of the protocol / API doesn't expose a clear notion of client and server.
/// Display name: Destination Attributes
pub const Registry = struct {
    /// Destination address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
    pub const address = destination_address;
    /// Destination port number
    pub const port = destination_port;
};

