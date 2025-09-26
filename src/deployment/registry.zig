//! Generated from registry.yaml
//! Namespace: deployment
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const statusValue = enum {
    /// failed
    failed,
    /// succeeded
    succeeded,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .failed => "failed",
            .succeeded => "succeeded",
        };
    }
};

/// The name of the deployment.
pub const deployment_name = types.StringAttribute{
    .name = "deployment.name",
    .brief = "The name of the deployment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The id of the deployment.
pub const deployment_id = types.StringAttribute{
    .name = "deployment.id",
    .brief = "The id of the deployment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The status of the deployment.
pub const deployment_status = types.EnumAttribute(statusValue){
    .base = types.StringAttribute{
        .name = "deployment.status",
        .brief = "The status of the deployment.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = statusValue.failed,
};

/// Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).
pub const deployment_environment_name = types.StringAttribute{
    .name = "deployment.environment.name",
    .brief = "Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).",
    .note = "`deployment.environment.name` does not affect the uniqueness constraints defined through\nthe `service.namespace`, `service.name` and `service.instance.id` resource attributes.\nThis implies that resources carrying the following attribute combinations MUST be\nconsidered to be identifying the same service:\n\n- `service.name=frontend`, `deployment.environment.name=production`\n- `service.name=frontend`, `deployment.environment.name=staging`.",
    .stability = .development,
    .requirement_level = .recommended,
};

