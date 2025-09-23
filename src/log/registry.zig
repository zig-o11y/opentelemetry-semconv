//! Generated from registry.yaml
//! Namespace: log
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines log attributes
/// Display name: General Log Attributes
pub const iostreamValue = enum {
    /// Logs from stdout stream
    stdout,
    /// Events from stderr stream
    stderr,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .stdout => "stdout",
            .stderr => "stderr",
        };
    }
};

pub const RegistryLog = union(enum) {
    /// The stream associated with the log. See below for a list of well-known values.
    iostream: types.EnumAttribute(iostreamValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .iostream => types.AttributeInfo{
                .name = "log.iostream",
                .brief = "The stream associated with the log. See below for a list of well-known values.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
        };
    }
};

/// Attributes for a file to which log was emitted.
/// Display name: Log File Attributes
pub const RegistryLogFile = union(enum) {
    /// The basename of the file.
    fileName: types.StringAttribute,
    /// The full path to the file.
    filePath: types.StringAttribute,
    /// The basename of the file, with symlinks resolved.
    fileNameResolved: types.StringAttribute,
    /// The full path to the file, with symlinks resolved.
    filePathResolved: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .fileName => types.AttributeInfo{
                .name = "log.file.name",
                .brief = "The basename of the file.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "audit.log"
                },
            },
            .filePath => types.AttributeInfo{
                .name = "log.file.path",
                .brief = "The full path to the file.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "/var/log/mysql/audit.log"
                },
            },
            .fileNameResolved => types.AttributeInfo{
                .name = "log.file.name_resolved",
                .brief = "The basename of the file, with symlinks resolved.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "uuid.log"
                },
            },
            .filePathResolved => types.AttributeInfo{
                .name = "log.file.path_resolved",
                .brief = "The full path to the file, with symlinks resolved.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "/var/lib/docker/uuid.log"
                },
            },
        };
    }
};

/// This document defines the generic attributes that may be used in any Log Record.
/// Display name: Log Record Attributes
pub const RegistryLogRecord = union(enum) {
    /// A unique identifier for the Log Record.
    recordUid: types.StringAttribute,
    /// The complete original Log Record.
    recordOriginal: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .recordUid => types.AttributeInfo{
                .name = "log.record.uid",
                .brief = "A unique identifier for the Log Record.",
                .note = "If an id is provided, other log records with the same id will be considered duplicates and can be removed safely. This means, that two distinguishable log records MUST have different values.\n\n The id MAY be an [Universally Unique Lexicographically Sortable Identifier (ULID)](https://github.com/ulid/spec), but other identifiers (e.g. UUID) may be used as needed.",
                .stability = .development,
                .examples = &.{
                    "01ARZ3NDEKTSV4RRFFQ69G5FAV"
                },
            },
            .recordOriginal => types.AttributeInfo{
                .name = "log.record.original",
                .brief = "The complete original Log Record.",
                .note = "This value MAY be added when processing a Log Record which was originally transmitted as a string or equivalent data type AND the Body field of the Log Record does not contain the same value. (e.g. a syslog or a log record read from a file.)",
                .stability = .development,
                .examples = &.{
                    "77 <86>1 2015-08-06T21:58:59.694Z 192.168.2.133 inactive - - - Something happened",
                    "[INFO] 8/3/24 12:34:56 Something happened"
                },
            },
        };
    }
};

