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

/// Session is defined as the period of time encompassing all activities performed by the application and the actions executed by the end user.
///
/// Consequently, a Session is represented as a collection of Logs, Events, and Spans emitted by the Client Application throughout the Session's duration. Each Session is assigned a unique identifier, which is included as an attribute in the Logs, Events, and Spans generated during the Session's lifecycle.
///
/// When a session reaches end of life, typically due to user inactivity or session timeout, a new session identifier will be assigned. The previous session identifier may be provided by the instrumentation so that telemetry backends can link the two sessions.
/// Display name: Session Attributes
pub const Registry = struct {
    /// A unique id to identify a session.
    pub const id = session_id;
    /// The previous `session.id` for this user, when known.
    pub const previousId = session_previous_id;
};

