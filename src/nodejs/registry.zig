//! Generated from registry.yaml
//! Namespace: nodejs
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes Node.js related attributes.
/// Display name: Node.js Attributes
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

pub const RegistryNodejs = union(enum) {
    /// The state of event loop time.
    eventloopState: types.EnumAttribute(eventloopStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .eventloopState => types.AttributeInfo{
                .name = "nodejs.eventloop.state",
                .brief = "The state of event loop time.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
        };
    }
};

