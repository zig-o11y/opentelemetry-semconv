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

