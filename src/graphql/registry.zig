//! Generated from registry.yaml
//! Namespace: graphql
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for GraphQL.
/// Display name: GraphQL Attributes
pub const operationTypeValue = enum {
    /// GraphQL query
    query,
    /// GraphQL mutation
    mutation,
    /// GraphQL subscription
    subscription,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .query => "query",
            .mutation => "mutation",
            .subscription => "subscription",
        };
    }
};

pub const RegistryGraphql = union(enum) {
    /// The name of the operation being executed.
    operationName: types.StringAttribute,
    /// The type of the operation being executed.
    operationType: types.EnumAttribute(operationTypeValue),
    /// The GraphQL document being executed.
    document: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .operationName => types.AttributeInfo{
                .name = "graphql.operation.name",
                .brief = "The name of the operation being executed.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "findBookById"
                },
            },
            .operationType => types.AttributeInfo{
                .name = "graphql.operation.type",
                .brief = "The type of the operation being executed.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "query",
                    "mutation",
                    "subscription"
                },
            },
            .document => types.AttributeInfo{
                .name = "graphql.document",
                .brief = "The GraphQL document being executed.",
                .note = "The value may be sanitized to exclude sensitive information.",
                .stability = .development,
                .examples = &.{
                    "query findBookById { bookById(id: ?) { name } }"
                },
            },
        };
    }
};

