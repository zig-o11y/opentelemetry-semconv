//! Generated from registry.yaml
//! Namespace: thread
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Current "managed" thread ID (as opposed to OS thread ID).
pub const thread_id = types.StringAttribute{
    .name = "thread.id",
    .brief = "Current \"managed\" thread ID (as opposed to OS thread ID).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Current thread name.
pub const thread_name = types.StringAttribute{
    .name = "thread.name",
    .brief = "Current thread name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// These attributes may be used for any operation to store information about a thread that started a span.
/// Display name: Thread Attributes
pub const Registry = struct {
    /// Current "managed" thread ID (as opposed to OS thread ID).
    pub const id = thread_id;
    /// Current thread name.
    pub const name = thread_name;
};

