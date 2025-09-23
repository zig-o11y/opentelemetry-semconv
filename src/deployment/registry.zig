//! Generated from registry.yaml
//! Namespace: deployment
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for software deployments.
/// Display name: Deployment Attributes
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

pub const RegistryDeployment = union(enum) {
    /// The name of the deployment.
    name: types.StringAttribute,
    /// The id of the deployment.
    id: types.StringAttribute,
    /// The status of the deployment.
    status: types.EnumAttribute(statusValue),
    /// Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).
    environmentName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .name => types.AttributeInfo{
                .name = "deployment.name",
                .brief = "The name of the deployment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "deploy my app",
                    "deploy-frontend"
                },
            },
            .id => types.AttributeInfo{
                .name = "deployment.id",
                .brief = "The id of the deployment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1208"
                },
            },
            .status => types.AttributeInfo{
                .name = "deployment.status",
                .brief = "The status of the deployment.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .environmentName => types.AttributeInfo{
                .name = "deployment.environment.name",
                .brief = "Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).",
                .note = "`deployment.environment.name` does not affect the uniqueness constraints defined through\nthe `service.namespace`, `service.name` and `service.instance.id` resource attributes.\nThis implies that resources carrying the following attribute combinations MUST be\nconsidered to be identifying the same service:\n\n- `service.name=frontend`, `deployment.environment.name=production`\n- `service.name=frontend`, `deployment.environment.name=staging`.",
                .stability = .development,
                .examples = &.{
                    "staging",
                    "production"
                },
            },
        };
    }
};

