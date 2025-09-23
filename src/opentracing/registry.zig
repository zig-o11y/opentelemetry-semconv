//! Generated from registry.yaml
//! Namespace: opentracing
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Attributes used by the OpenTracing Shim layer.
/// Display name: OpenTracing Attributes
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

pub const RegistryOpentracing = union(enum) {
    /// Parent-child Reference type
    refType: types.EnumAttribute(refTypeValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .refType => types.AttributeInfo{
                .name = "opentracing.ref_type",
                .brief = "Parent-child Reference type",
                .note = "The causal relationship between a child Span and a parent Span.",
                .stability = .development,
                .examples = null,
            },
        };
    }
};

