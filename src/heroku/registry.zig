//! Generated from registry.yaml
//! Namespace: heroku
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for the Heroku platform on which application/s are running.
/// Display name: Heroku Attributes
pub const RegistryHeroku = union(enum) {
    /// Time and date the release was created
    releaseCreationTimestamp: types.StringAttribute,
    /// Commit hash for the current release
    releaseCommit: types.StringAttribute,
    /// Unique identifier for the application
    appId: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .releaseCreationTimestamp => types.AttributeInfo{
                .name = "heroku.release.creation_timestamp",
                .brief = "Time and date the release was created",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2022-10-23T18:00:42Z"
                },
            },
            .releaseCommit => types.AttributeInfo{
                .name = "heroku.release.commit",
                .brief = "Commit hash for the current release",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "e6134959463efd8966b20e75b913cafe3f5ec"
                },
            },
            .appId => types.AttributeInfo{
                .name = "heroku.app.id",
                .brief = "Unique identifier for the application",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2daa2797-e42b-4624-9322-ec3f968df4da"
                },
            },
        };
    }
};

