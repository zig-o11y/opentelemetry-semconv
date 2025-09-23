//! Generated from registry.yaml
//! Namespace: system
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes System attributes
/// Display name: General System Attributes
pub const RegistrySystem = union(enum) {
    /// The device identifier
    device: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .device => types.AttributeInfo{
                .name = "system.device",
                .brief = "The device identifier",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "(identifier)"
                },
            },
        };
    }
};

/// Describes System Memory attributes
/// Display name: System Memory Attributes
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

pub const RegistrySystemMemory = union(enum) {
    /// The memory state
    memoryState: types.EnumAttribute(memoryStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .memoryState => types.AttributeInfo{
                .name = "system.memory.state",
                .brief = "The memory state",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "free",
                    "cached"
                },
            },
        };
    }
};

/// Describes System Memory Paging attributes
/// Display name: System Paging Attributes
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

pub const RegistrySystemPaging = union(enum) {
    /// The memory paging state
    pagingState: types.EnumAttribute(pagingStateValue),
    /// The memory paging type
    pagingType: types.EnumAttribute(pagingTypeValue),
    /// The paging access direction
    pagingDirection: types.EnumAttribute(pagingDirectionValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .pagingState => types.AttributeInfo{
                .name = "system.paging.state",
                .brief = "The memory paging state",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "free"
                },
            },
            .pagingType => types.AttributeInfo{
                .name = "system.paging.type",
                .brief = "The memory paging type",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "minor"
                },
            },
            .pagingDirection => types.AttributeInfo{
                .name = "system.paging.direction",
                .brief = "The paging access direction",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "in"
                },
            },
        };
    }
};

/// Describes Filesystem attributes
/// Display name: Filesystem Attributes
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

pub const RegistrySystemFilesystem = union(enum) {
    /// The filesystem state
    filesystemState: types.EnumAttribute(filesystemStateValue),
    /// The filesystem type
    filesystemType: types.EnumAttribute(filesystemTypeValue),
    /// The filesystem mode
    filesystemMode: types.StringAttribute,
    /// The filesystem mount path
    filesystemMountpoint: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .filesystemState => types.AttributeInfo{
                .name = "system.filesystem.state",
                .brief = "The filesystem state",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "used"
                },
            },
            .filesystemType => types.AttributeInfo{
                .name = "system.filesystem.type",
                .brief = "The filesystem type",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "ext4"
                },
            },
            .filesystemMode => types.AttributeInfo{
                .name = "system.filesystem.mode",
                .brief = "The filesystem mode",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "rw, ro"
                },
            },
            .filesystemMountpoint => types.AttributeInfo{
                .name = "system.filesystem.mountpoint",
                .brief = "The filesystem mount path",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "/mnt/data"
                },
            },
        };
    }
};

/// Describes System Process attributes
/// Display name: System Process Attributes
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

pub const RegistrySystemProcess = union(enum) {
    /// The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html
    processStatus: types.EnumAttribute(processStatusValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .processStatus => types.AttributeInfo{
                .name = "system.process.status",
                .brief = "The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "running"
                },
            },
        };
    }
};

