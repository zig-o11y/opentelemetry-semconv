//! Generated from registry.yaml
//! Namespace: nfs
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Linux: one of "hit" (NFSD_STATS_RC_HITS), "miss" (NFSD_STATS_RC_MISSES), or "nocache" (NFSD_STATS_RC_NOCACHE -- uncacheable)
pub const nfs_server_repcache_status = types.StringAttribute{
    .name = "nfs.server.repcache.status",
    .brief = "Linux: one of \"hit\" (NFSD_STATS_RC_HITS), \"miss\" (NFSD_STATS_RC_MISSES), or \"nocache\" (NFSD_STATS_RC_NOCACHE -- uncacheable)",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// NFSv4+ operation name.
pub const nfs_operation_name = types.StringAttribute{
    .name = "nfs.operation.name",
    .brief = "NFSv4+ operation name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

