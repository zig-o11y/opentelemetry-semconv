//! Generated from registry.yaml
//! Namespace: disk
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The disk IO operation direction.
pub const disk_io_direction = types.EnumAttribute(ioDirectionValue){
    .base = types.StringAttribute{
        .name = "disk.io.direction",
        .brief = "The disk IO operation direction.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = ioDirectionValue.read,
};

/// These attributes may be used for any disk related operation.
/// Display name: Disk Attributes
pub const Registry = struct {
    /// The disk IO operation direction.
    pub const ioDirection = disk_io_direction;
};

