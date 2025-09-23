//! Generated from registry.yaml
//! Namespace: elasticsearch
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This section defines attributes for Elasticsearch.
/// Display name: Elasticsearch Attributes
pub const RegistryElasticsearch = union(enum) {
    /// Represents the human-readable identifier of the node/instance to which a request was routed.
    nodeName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .nodeName => types.AttributeInfo{
                .name = "elasticsearch.node.name",
                .brief = "Represents the human-readable identifier of the node/instance to which a request was routed.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "instance-0000000001"
                },
            },
        };
    }
};

