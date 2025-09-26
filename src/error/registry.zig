//! Generated from registry.yaml
//! Namespace: error
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const typeValue = enum {
    /// A fallback error value to be used when the instrumentation doesn't define a custom value.
    other,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .other => "_OTHER",
        };
    }
};

/// Describes a class of error the operation ended with.
pub const error_type = types.EnumAttribute(typeValue){
    .base = types.StringAttribute{
        .name = "error.type",
        .brief = "Describes a class of error the operation ended with.",
        .note = "The `error.type` SHOULD be predictable, and SHOULD have low cardinality.\n\nWhen `error.type` is set to a type (e.g., an exception type), its\ncanonical class name identifying the type within the artifact SHOULD be used.\n\nInstrumentations SHOULD document the list of errors they report.\n\nThe cardinality of `error.type` within one instrumentation library SHOULD be low.\nTelemetry consumers that aggregate data from multiple instrumentation libraries and applications\nshould be prepared for `error.type` to have high cardinality at query time when no\nadditional filters are applied.\n\nIf the operation has completed successfully, instrumentations SHOULD NOT set `error.type`.\n\nIf a specific domain defines its own set of error identifiers (such as HTTP or gRPC status codes),\nit's RECOMMENDED to:\n\n- Use a domain-specific attribute\n- Set `error.type` to capture all errors, regardless of whether they are defined within the domain-specific set or not.",
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = typeValue.other,
};

/// A message providing more detail about an error in human-readable form.
pub const error_message = types.StringAttribute{
    .name = "error.message",
    .brief = "A message providing more detail about an error in human-readable form.",
    .note = "`error.message` should provide additional context and detail about an error.\nIt is NOT RECOMMENDED to duplicate the value of `error.type` in `error.message`.\nIt is also NOT RECOMMENDED to duplicate the value of `exception.message` in `error.message`.\n\n`error.message` is NOT RECOMMENDED for metrics or spans due to its unbounded cardinality and overlap with span status.\n",
    .stability = .development,
    .requirement_level = .recommended,
};

