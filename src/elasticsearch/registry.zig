//! Generated from registry.yaml
//! Namespace: elasticsearch
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Represents the human-readable identifier of the node/instance to which a request was routed.
pub const elasticsearch_node_name = types.StringAttribute{
    .name = "elasticsearch.node.name",
    .brief = "Represents the human-readable identifier of the node/instance to which a request was routed.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// This section defines attributes for Elasticsearch.
/// Display name: Elasticsearch Attributes
pub const Registry = struct {
    /// Represents the human-readable identifier of the node/instance to which a request was routed.
    pub const nodeName = elasticsearch_node_name;
};

