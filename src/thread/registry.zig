//! Generated from registry.yaml
//! Namespace: thread
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// These attributes may be used for any operation to store information about a thread that started a span.
/// Display name: Thread Attributes
pub const RegistryThread = union(enum) {
    /// Current "managed" thread ID (as opposed to OS thread ID).
    id: types.StringAttribute,
    /// Current thread name.
    name: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .id => types.AttributeInfo{
                .name = "thread.id",
                .brief = "Current \"managed\" thread ID (as opposed to OS thread ID).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "42"
                },
            },
            .name => types.AttributeInfo{
                .name = "thread.name",
                .brief = "Current thread name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "main"
                },
            },
        };
    }
};

