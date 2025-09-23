//! Generated from registry.yaml
//! Namespace: nfs
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// NFS Server replies check a Reply Cache (repcache), which can have one of 3 result states
/// Display name: NFS Server Reply Cache Attributes
pub const RegistryNfsServerRepcacheStatus = union(enum) {
    /// Linux: one of "hit" (NFSD_STATS_RC_HITS), "miss" (NFSD_STATS_RC_MISSES), or "nocache" (NFSD_STATS_RC_NOCACHE -- uncacheable)
    serverRepcacheStatus: types.StringAttribute,
    /// NFSv4+ operation name.
    operationName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .serverRepcacheStatus => types.AttributeInfo{
                .name = "nfs.server.repcache.status",
                .brief = "Linux: one of \"hit\" (NFSD_STATS_RC_HITS), \"miss\" (NFSD_STATS_RC_MISSES), or \"nocache\" (NFSD_STATS_RC_NOCACHE -- uncacheable)",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "hit"
                },
            },
            .operationName => types.AttributeInfo{
                .name = "nfs.operation.name",
                .brief = "NFSv4+ operation name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "OPEN",
                    "READ",
                    "GETATTR"
                },
            },
        };
    }
};

