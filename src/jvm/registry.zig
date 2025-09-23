//! Generated from registry.yaml
//! Namespace: jvm
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines Java Virtual machine related attributes.
/// Display name: Java Virtual Machine (JVM) Attributes
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

pub const RegistryJvm = union(enum) {
    /// Name of the garbage collector action.
    gcAction: types.StringAttribute,
    /// Name of the garbage collector cause.
    gcCause: types.StringAttribute,
    /// Name of the garbage collector.
    gcName: types.StringAttribute,
    /// The type of memory.
    memoryType: types.EnumAttribute(memoryTypeValue),
    /// Name of the memory pool.
    memoryPoolName: types.StringAttribute,
    /// Whether the thread is daemon or not.
    threadDaemon: types.StringAttribute,
    /// State of the thread.
    threadState: types.EnumAttribute(threadStateValue),
    /// Name of the buffer pool.
    bufferPoolName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .gcAction => types.AttributeInfo{
                .name = "jvm.gc.action",
                .brief = "Name of the garbage collector action.",
                .note = "Garbage collector action is generally obtained via [GarbageCollectionNotificationInfo",
                .stability = .stable,
                .examples = &.{
                    "end of minor GC",
                    "end of major GC"
                },
            },
            .gcCause => types.AttributeInfo{
                .name = "jvm.gc.cause",
                .brief = "Name of the garbage collector cause.",
                .note = "Garbage collector cause is generally obtained via [GarbageCollectionNotificationInfo",
                .stability = .development,
                .examples = &.{
                    "System.gc()",
                    "Allocation Failure"
                },
            },
            .gcName => types.AttributeInfo{
                .name = "jvm.gc.name",
                .brief = "Name of the garbage collector.",
                .note = "Garbage collector name is generally obtained via [GarbageCollectionNotificationInfo",
                .stability = .stable,
                .examples = &.{
                    "G1 Young Generation",
                    "G1 Old Generation"
                },
            },
            .memoryType => types.AttributeInfo{
                .name = "jvm.memory.type",
                .brief = "The type of memory.",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "heap",
                    "non_heap"
                },
            },
            .memoryPoolName => types.AttributeInfo{
                .name = "jvm.memory.pool.name",
                .brief = "Name of the memory pool.",
                .note = "Pool names are generally obtained via [MemoryPoolMXBean",
                .stability = .stable,
                .examples = &.{
                    "G1 Old Gen",
                    "G1 Eden space",
                    "G1 Survivor Space"
                },
            },
            .threadDaemon => types.AttributeInfo{
                .name = "jvm.thread.daemon",
                .brief = "Whether the thread is daemon or not.",
                .note = null,
                .stability = .stable,
                .examples = null,
            },
            .threadState => types.AttributeInfo{
                .name = "jvm.thread.state",
                .brief = "State of the thread.",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "runnable",
                    "blocked"
                },
            },
            .bufferPoolName => types.AttributeInfo{
                .name = "jvm.buffer.pool.name",
                .brief = "Name of the buffer pool.",
                .note = "Pool names are generally obtained via [BufferPoolMXBean\n\n",
                .stability = .development,
                .examples = &.{
                    "mapped",
                    "direct"
                },
            },
        };
    }
};

