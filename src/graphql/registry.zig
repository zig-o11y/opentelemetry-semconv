//! Generated from registry.yaml
//! Namespace: graphql
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The name of the operation being executed.
pub const graphql_operation_name = types.StringAttribute{
    .name = "graphql.operation.name",
    .brief = "The name of the operation being executed.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The type of the operation being executed.
pub const graphql_operation_type = types.EnumAttribute(operationTypeValue){
    .base = types.StringAttribute{
        .name = "graphql.operation.type",
        .brief = "The type of the operation being executed.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = operationTypeValue.query,
};

/// The GraphQL document being executed.
pub const graphql_document = types.StringAttribute{
    .name = "graphql.document",
    .brief = "The GraphQL document being executed.",
    .note = "The value may be sanitized to exclude sensitive information.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// This document defines attributes for GraphQL.
/// Display name: GraphQL Attributes
pub const Registry = struct {
    /// The name of the operation being executed.
    pub const operationName = graphql_operation_name;
    /// The type of the operation being executed.
    pub const operationType = graphql_operation_type;
    /// The GraphQL document being executed.
    pub const document = graphql_document;
};

