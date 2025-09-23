//! Generated from registry.yaml
//! Namespace: disk
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// These attributes may be used for any disk related operation.
/// Display name: Disk Attributes
pub const ioDirectionValue = enum {
    ///
    read,
    ///
    write,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .read => "read",
            .write => "write",
        };
    }
};

pub const RegistryDisk = union(enum) {
    /// The disk IO operation direction.
    ioDirection: types.EnumAttribute(ioDirectionValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .ioDirection => types.AttributeInfo{
                .name = "disk.io.direction",
                .brief = "The disk IO operation direction.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "read"
                },
            },
        };
    }
};

