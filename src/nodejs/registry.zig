//! Generated from registry.yaml
//! Namespace: nodejs
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const eventloopStateValue = enum {
    /// Active time.
    active,
    /// Idle time.
    idle,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .active => "active",
            .idle => "idle",
        };
    }
};

/// The state of event loop time.
pub const nodejs_eventloop_state = types.EnumAttribute(eventloopStateValue){
    .base = types.StringAttribute{
        .name = "nodejs.eventloop.state",
        .brief = "The state of event loop time.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = eventloopStateValue.active,
};

