//! Generated from registry.yaml
//! Namespace: peer
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The [`service.name`](/docs/resource/README.md of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.
pub const peer_service = types.StringAttribute{
    .name = "peer.service",
    .brief = "The [`service.name`](/docs/resource/README.md of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Operations that access some remote service.
/// Display name: Peer Attributes
pub const Registry = struct {
    /// The [`service.name`](/docs/resource/README.md of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.
    pub const service = peer_service;
};

