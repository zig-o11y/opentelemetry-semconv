//! Generated from registry.yaml
//! Namespace: system
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const memoryStateValue = enum {
    /// Actual used virtual memory in bytes.
    used,
    ///
    free,
    ///
    buffers,
    ///
    cached,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .used => "used",
            .free => "free",
            .buffers => "buffers",
            .cached => "cached",
        };
    }
};

pub const pagingStateValue = enum {
    ///
    used,
    ///
    free,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .used => "used",
            .free => "free",
        };
    }
};

pub const pagingTypeValue = enum {
    ///
    major,
    ///
    minor,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .major => "major",
            .minor => "minor",
        };
    }
};

pub const pagingDirectionValue = enum {
    ///
    in,
    ///
    out,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .in => "in",
            .out => "out",
        };
    }
};

pub const filesystemStateValue = enum {
    ///
    used,
    ///
    free,
    ///
    reserved,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .used => "used",
            .free => "free",
            .reserved => "reserved",
        };
    }
};

pub const filesystemTypeValue = enum {
    ///
    fat32,
    ///
    exfat,
    ///
    ntfs,
    ///
    refs,
    ///
    hfsplus,
    ///
    ext4,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .fat32 => "fat32",
            .exfat => "exfat",
            .ntfs => "ntfs",
            .refs => "refs",
            .hfsplus => "hfsplus",
            .ext4 => "ext4",
        };
    }
};

pub const processStatusValue = enum {
    ///
    running,
    ///
    sleeping,
    ///
    stopped,
    ///
    defunct,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .running => "running",
            .sleeping => "sleeping",
            .stopped => "stopped",
            .defunct => "defunct",
        };
    }
};

/// The device identifier
pub const system_device = types.StringAttribute{
    .name = "system.device",
    .brief = "The device identifier",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The memory state
pub const system_memory_state = types.EnumAttribute(memoryStateValue){
    .base = types.StringAttribute{
        .name = "system.memory.state",
        .brief = "The memory state",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = memoryStateValue.used,
};

/// The memory paging state
pub const system_paging_state = types.EnumAttribute(pagingStateValue){
    .base = types.StringAttribute{
        .name = "system.paging.state",
        .brief = "The memory paging state",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = pagingStateValue.used,
};

/// The memory paging type
pub const system_paging_type = types.EnumAttribute(pagingTypeValue){
    .base = types.StringAttribute{
        .name = "system.paging.type",
        .brief = "The memory paging type",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = pagingTypeValue.major,
};

/// The paging access direction
pub const system_paging_direction = types.EnumAttribute(pagingDirectionValue){
    .base = types.StringAttribute{
        .name = "system.paging.direction",
        .brief = "The paging access direction",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = pagingDirectionValue.in,
};

/// The filesystem state
pub const system_filesystem_state = types.EnumAttribute(filesystemStateValue){
    .base = types.StringAttribute{
        .name = "system.filesystem.state",
        .brief = "The filesystem state",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = filesystemStateValue.used,
};

/// The filesystem type
pub const system_filesystem_type = types.EnumAttribute(filesystemTypeValue){
    .base = types.StringAttribute{
        .name = "system.filesystem.type",
        .brief = "The filesystem type",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = filesystemTypeValue.fat32,
};

/// The filesystem mode
pub const system_filesystem_mode = types.StringAttribute{
    .name = "system.filesystem.mode",
    .brief = "The filesystem mode",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The filesystem mount path
pub const system_filesystem_mountpoint = types.StringAttribute{
    .name = "system.filesystem.mountpoint",
    .brief = "The filesystem mount path",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html
pub const system_process_status = types.EnumAttribute(processStatusValue){
    .base = types.StringAttribute{
        .name = "system.process.status",
        .brief = "The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = processStatusValue.running,
};

/// Describes System attributes
/// Display name: General System Attributes
pub const Registry = struct {
    /// The device identifier
    pub const device = system_device;
    /// The memory state
    pub const memoryState = system_memory_state;
    /// The memory paging state
    pub const pagingState = system_paging_state;
    /// The memory paging type
    pub const pagingType = system_paging_type;
    /// The paging access direction
    pub const pagingDirection = system_paging_direction;
    /// The filesystem state
    pub const filesystemState = system_filesystem_state;
    /// The filesystem type
    pub const filesystemType = system_filesystem_type;
    /// The filesystem mode
    pub const filesystemMode = system_filesystem_mode;
    /// The filesystem mount path
    pub const filesystemMountpoint = system_filesystem_mountpoint;
    /// The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html
    pub const processStatus = system_process_status;
};

