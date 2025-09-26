//! Generated from registry.yaml
//! Namespace: enduser
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.
pub const enduser_id = types.StringAttribute{
    .name = "enduser.id",
    .brief = "Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.",
    .note = "Unique identifier of an end user in the system.\n\n> [!Warning]\n> This field contains sensitive (PII) information.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.
pub const enduser_pseudo_id = types.StringAttribute{
    .name = "enduser.pseudo.id",
    .brief = "Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.",
    .note = "Pseudonymous identifier of an end user.\n\n> [!Warning]\n> This field contains sensitive (linkable PII) information.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Describes the end user.
/// Display name: End User Attributes
pub const Registry = struct {
    /// Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.
    pub const id = enduser_id;
    /// Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.
    pub const pseudoId = enduser_pseudo_id;
};

