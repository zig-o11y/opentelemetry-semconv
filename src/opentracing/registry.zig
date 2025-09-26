//! Generated from registry.yaml
//! Namespace: opentracing
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const refTypeValue = enum {
    /// The parent Span depends on the child Span in some capacity
    child_of,
    /// The parent Span doesn't depend in any way on the result of the child Span
    follows_from,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .child_of => "child_of",
            .follows_from => "follows_from",
        };
    }
};

/// Parent-child Reference type
pub const opentracing_ref_type = types.EnumAttribute(refTypeValue){
    .base = types.StringAttribute{
        .name = "opentracing.ref_type",
        .brief = "Parent-child Reference type",
        .note = "The causal relationship between a child Span and a parent Span.",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = refTypeValue.child_of,
};

