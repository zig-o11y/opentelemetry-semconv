//! Generated from registry.yaml
//! Namespace: heroku
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Time and date the release was created
pub const heroku_release_creation_timestamp = types.StringAttribute{
    .name = "heroku.release.creation_timestamp",
    .brief = "Time and date the release was created",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Commit hash for the current release
pub const heroku_release_commit = types.StringAttribute{
    .name = "heroku.release.commit",
    .brief = "Commit hash for the current release",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Unique identifier for the application
pub const heroku_app_id = types.StringAttribute{
    .name = "heroku.app.id",
    .brief = "Unique identifier for the application",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// This document defines attributes for the Heroku platform on which application/s are running.
/// Display name: Heroku Attributes
pub const Registry = struct {
    /// Time and date the release was created
    pub const releaseCreationTimestamp = heroku_release_creation_timestamp;
    /// Commit hash for the current release
    pub const releaseCommit = heroku_release_commit;
    /// Unique identifier for the application
    pub const appId = heroku_app_id;
};

