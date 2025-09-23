//! Generated from registry.yaml
//! Namespace: peer
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Operations that access some remote service.
/// Display name: Peer Attributes
pub const RegistryPeer = union(enum) {
    /// The [`service.name`](/docs/resource/README.md of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.
    service: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .service => types.AttributeInfo{
                .name = "peer.service",
                .brief = "The [`service.name`](/docs/resource/README.md of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "AuthTokenCache"
                },
            },
        };
    }
};

