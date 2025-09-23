//! Generated from registry.yaml
//! Namespace: session
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Session is defined as the period of time encompassing all activities performed by the application and the actions executed by the end user.
///
/// Consequently, a Session is represented as a collection of Logs, Events, and Spans emitted by the Client Application throughout the Session's duration. Each Session is assigned a unique identifier, which is included as an attribute in the Logs, Events, and Spans generated during the Session's lifecycle.
///
/// When a session reaches end of life, typically due to user inactivity or session timeout, a new session identifier will be assigned. The previous session identifier may be provided by the instrumentation so that telemetry backends can link the two sessions.
/// Display name: Session Attributes
pub const RegistrySession = union(enum) {
    /// A unique id to identify a session.
    id: types.StringAttribute,
    /// The previous `session.id` for this user, when known.
    previousId: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .id => types.AttributeInfo{
                .name = "session.id",
                .brief = "A unique id to identify a session.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "00112233-4455-6677-8899-aabbccddeeff"
                },
            },
            .previousId => types.AttributeInfo{
                .name = "session.previous_id",
                .brief = "The previous `session.id` for this user, when known.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "00112233-4455-6677-8899-aabbccddeeff"
                },
            },
        };
    }
};

