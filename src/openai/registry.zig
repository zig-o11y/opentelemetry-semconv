//! Generated from registry.yaml
//! Namespace: openai
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The service tier requested. May be a specific tier, default, or auto.
pub const openai_request_service_tier = types.EnumAttribute(requestServiceTierValue){
    .base = types.StringAttribute{
        .name = "openai.request.service_tier",
        .brief = "The service tier requested. May be a specific tier, default, or auto.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = requestServiceTierValue.auto,
};

/// The service tier used for the response.
pub const openai_response_service_tier = types.StringAttribute{
    .name = "openai.response.service_tier",
    .brief = "The service tier used for the response.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A fingerprint to track any eventual change in the Generative AI environment.
pub const openai_response_system_fingerprint = types.StringAttribute{
    .name = "openai.response.system_fingerprint",
    .brief = "A fingerprint to track any eventual change in the Generative AI environment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

