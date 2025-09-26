//! Generated from registry.yaml
//! Namespace: session
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A unique id to identify a session.
pub const session_id = types.StringAttribute{
    .name = "session.id",
    .brief = "A unique id to identify a session.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The previous `session.id` for this user, when known.
pub const session_previous_id = types.StringAttribute{
    .name = "session.previous_id",
    .brief = "The previous `session.id` for this user, when known.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

