//! Generated from registry.yaml
//! Namespace: enduser
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes the end user.
/// Display name: End User Attributes
pub const RegistryEnduser = union(enum) {
    /// Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.
    id: types.StringAttribute,
    /// Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.
    pseudoId: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .id => types.AttributeInfo{
                .name = "enduser.id",
                .brief = "Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.",
                .note = "Unique identifier of an end user in the system.\n\n> [!Warning]\n> This field contains sensitive (PII) information.",
                .stability = .development,
                .examples = &.{
                    "username"
                },
            },
            .pseudoId => types.AttributeInfo{
                .name = "enduser.pseudo.id",
                .brief = "Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.",
                .note = "Pseudonymous identifier of an end user.\n\n> [!Warning]\n> This field contains sensitive (linkable PII) information.",
                .stability = .development,
                .examples = &.{
                    "QdH5CAWJgqVT4rOr0qtumf"
                },
            },
        };
    }
};

