//! Generated from registry.yaml
//! Namespace: log
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The stream associated with the log. See below for a list of well-known values.
pub const log_iostream = types.EnumAttribute(iostreamValue){
    .base = types.StringAttribute{
        .name = "log.iostream",
        .brief = "The stream associated with the log. See below for a list of well-known values.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = iostreamValue.stdout,
};

/// The basename of the file.
pub const log_file_name = types.StringAttribute{
    .name = "log.file.name",
    .brief = "The basename of the file.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The full path to the file.
pub const log_file_path = types.StringAttribute{
    .name = "log.file.path",
    .brief = "The full path to the file.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The basename of the file, with symlinks resolved.
pub const log_file_name_resolved = types.StringAttribute{
    .name = "log.file.name_resolved",
    .brief = "The basename of the file, with symlinks resolved.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The full path to the file, with symlinks resolved.
pub const log_file_path_resolved = types.StringAttribute{
    .name = "log.file.path_resolved",
    .brief = "The full path to the file, with symlinks resolved.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A unique identifier for the Log Record.
pub const log_record_uid = types.StringAttribute{
    .name = "log.record.uid",
    .brief = "A unique identifier for the Log Record.",
    .note = "If an id is provided, other log records with the same id will be considered duplicates and can be removed safely. This means, that two distinguishable log records MUST have different values.\n\n The id MAY be an [Universally Unique Lexicographically Sortable Identifier (ULID)](https://github.com/ulid/spec), but other identifiers (e.g. UUID) may be used as needed.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The complete original Log Record.
pub const log_record_original = types.StringAttribute{
    .name = "log.record.original",
    .brief = "The complete original Log Record.",
    .note = "This value MAY be added when processing a Log Record which was originally transmitted as a string or equivalent data type AND the Body field of the Log Record does not contain the same value. (e.g. a syslog or a log record read from a file.)",
    .stability = .development,
    .requirement_level = .recommended,
};

/// This document defines log attributes
/// Display name: General Log Attributes
pub const Registry = struct {
    /// The stream associated with the log. See below for a list of well-known values.
    pub const iostream = log_iostream;
    /// The basename of the file.
    pub const fileName = log_file_name;
    /// The full path to the file.
    pub const filePath = log_file_path;
    /// The basename of the file, with symlinks resolved.
    pub const fileNameResolved = log_file_name_resolved;
    /// The full path to the file, with symlinks resolved.
    pub const filePathResolved = log_file_path_resolved;
    /// A unique identifier for the Log Record.
    pub const recordUid = log_record_uid;
    /// The complete original Log Record.
    pub const recordOriginal = log_record_original;
};

