//! Generated from registry.yaml
//! Namespace: jvm
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const memoryTypeValue = enum {
    /// Heap memory.
    heap,
    /// Non-heap memory
    non_heap,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .heap => "heap",
            .non_heap => "non_heap",
        };
    }
};

pub const threadStateValue = enum {
    /// A thread that has not yet started is in this state.
    new,
    /// A thread executing in the Java virtual machine is in this state.
    runnable,
    /// A thread that is blocked waiting for a monitor lock is in this state.
    blocked,
    /// A thread that is waiting indefinitely for another thread to perform a particular action is in this state.
    waiting,
    /// A thread that is waiting for another thread to perform an action for up to a specified waiting time is in this state.
    timed_waiting,
    /// A thread that has exited is in this state.
    terminated,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .new => "new",
            .runnable => "runnable",
            .blocked => "blocked",
            .waiting => "waiting",
            .timed_waiting => "timed_waiting",
            .terminated => "terminated",
        };
    }
};

/// Name of the garbage collector action.
pub const jvm_gc_action = types.StringAttribute{
    .name = "jvm.gc.action",
    .brief = "Name of the garbage collector action.",
    .note = "Garbage collector action is generally obtained via [GarbageCollectionNotificationInfo",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// Name of the garbage collector cause.
pub const jvm_gc_cause = types.StringAttribute{
    .name = "jvm.gc.cause",
    .brief = "Name of the garbage collector cause.",
    .note = "Garbage collector cause is generally obtained via [GarbageCollectionNotificationInfo",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Name of the garbage collector.
pub const jvm_gc_name = types.StringAttribute{
    .name = "jvm.gc.name",
    .brief = "Name of the garbage collector.",
    .note = "Garbage collector name is generally obtained via [GarbageCollectionNotificationInfo",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// The type of memory.
pub const jvm_memory_type = types.EnumAttribute(memoryTypeValue){
    .base = types.StringAttribute{
        .name = "jvm.memory.type",
        .brief = "The type of memory.",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = memoryTypeValue.heap,
};

/// Name of the memory pool.
pub const jvm_memory_pool_name = types.StringAttribute{
    .name = "jvm.memory.pool.name",
    .brief = "Name of the memory pool.",
    .note = "Pool names are generally obtained via [MemoryPoolMXBean",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// Whether the thread is daemon or not.
pub const jvm_thread_daemon = types.StringAttribute{
    .name = "jvm.thread.daemon",
    .brief = "Whether the thread is daemon or not.",
    .note = null,
    .stability = .stable,
    .requirement_level = .recommended,
};

/// State of the thread.
pub const jvm_thread_state = types.EnumAttribute(threadStateValue){
    .base = types.StringAttribute{
        .name = "jvm.thread.state",
        .brief = "State of the thread.",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = threadStateValue.new,
};

/// Name of the buffer pool.
pub const jvm_buffer_pool_name = types.StringAttribute{
    .name = "jvm.buffer.pool.name",
    .brief = "Name of the buffer pool.",
    .note = "Pool names are generally obtained via [BufferPoolMXBean\n\n",
    .stability = .development,
    .requirement_level = .recommended,
};

/// This document defines Java Virtual machine related attributes.
/// Display name: Java Virtual Machine (JVM) Attributes
pub const Registry = struct {
    /// Name of the garbage collector action.
    pub const gcAction = jvm_gc_action;
    /// Name of the garbage collector cause.
    pub const gcCause = jvm_gc_cause;
    /// Name of the garbage collector.
    pub const gcName = jvm_gc_name;
    /// The type of memory.
    pub const memoryType = jvm_memory_type;
    /// Name of the memory pool.
    pub const memoryPoolName = jvm_memory_pool_name;
    /// Whether the thread is daemon or not.
    pub const threadDaemon = jvm_thread_daemon;
    /// State of the thread.
    pub const threadState = jvm_thread_state;
    /// Name of the buffer pool.
    pub const bufferPoolName = jvm_buffer_pool_name;
};

