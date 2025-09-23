//! Generated from registry.yaml
//! Namespace: openai
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This group defines attributes for OpenAI.
/// Display name: OpenAI Attributes
pub const requestServiceTierValue = enum {
    /// The system will utilize scale tier credits until they are exhausted.
    auto,
    /// The system will utilize the default scale tier.
    default,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .auto => "auto",
            .default => "default",
        };
    }
};

pub const RegistryOpenai = union(enum) {
    /// The service tier requested. May be a specific tier, default, or auto.
    requestServiceTier: types.EnumAttribute(requestServiceTierValue),
    /// The service tier used for the response.
    responseServiceTier: types.StringAttribute,
    /// A fingerprint to track any eventual change in the Generative AI environment.
    responseSystemFingerprint: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .requestServiceTier => types.AttributeInfo{
                .name = "openai.request.service_tier",
                .brief = "The service tier requested. May be a specific tier, default, or auto.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "auto",
                    "default"
                },
            },
            .responseServiceTier => types.AttributeInfo{
                .name = "openai.response.service_tier",
                .brief = "The service tier used for the response.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "scale",
                    "default"
                },
            },
            .responseSystemFingerprint => types.AttributeInfo{
                .name = "openai.response.system_fingerprint",
                .brief = "A fingerprint to track any eventual change in the Generative AI environment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "fp_44709d6fcb"
                },
            },
        };
    }
};

