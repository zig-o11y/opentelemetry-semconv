//! Generated from registry.yaml
//! Namespace: cassandra
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This section defines attributes for Cassandra.
/// Display name: Cassandra Attributes
pub const consistencyLevelValue = enum {
    /// All
    all,
    /// Each Quorum
    each_quorum,
    /// Quorum
    quorum,
    /// Local Quorum
    local_quorum,
    /// One
    one,
    /// Two
    two,
    /// Three
    three,
    /// Local One
    local_one,
    /// Any
    any,
    /// Serial
    serial,
    /// Local Serial
    local_serial,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .all => "all",
            .each_quorum => "each_quorum",
            .quorum => "quorum",
            .local_quorum => "local_quorum",
            .one => "one",
            .two => "two",
            .three => "three",
            .local_one => "local_one",
            .any => "any",
            .serial => "serial",
            .local_serial => "local_serial",
        };
    }
};

pub const RegistryCassandra = union(enum) {
    /// The data center of the coordinating node for a query.
    coordinatorDc: types.StringAttribute,
    /// The ID of the coordinating node for a query.
    coordinatorId: types.StringAttribute,
    /// The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).
    consistencyLevel: types.EnumAttribute(consistencyLevelValue),
    /// Whether or not the query is idempotent.
    queryIdempotent: types.StringAttribute,
    /// The fetch size used for paging, i.e. how many rows will be returned at once.
    pageSize: types.StringAttribute,
    /// The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.
    speculativeExecutionCount: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .coordinatorDc => types.AttributeInfo{
                .name = "cassandra.coordinator.dc",
                .brief = "The data center of the coordinating node for a query.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "us-west-2"
                },
            },
            .coordinatorId => types.AttributeInfo{
                .name = "cassandra.coordinator.id",
                .brief = "The ID of the coordinating node for a query.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "be13faa2-8574-4d71-926d-27f16cf8a7af"
                },
            },
            .consistencyLevel => types.AttributeInfo{
                .name = "cassandra.consistency.level",
                .brief = "The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .queryIdempotent => types.AttributeInfo{
                .name = "cassandra.query.idempotent",
                .brief = "Whether or not the query is idempotent.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .pageSize => types.AttributeInfo{
                .name = "cassandra.page.size",
                .brief = "The fetch size used for paging, i.e. how many rows will be returned at once.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "5000"
                },
            },
            .speculativeExecutionCount => types.AttributeInfo{
                .name = "cassandra.speculative_execution.count",
                .brief = "The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "0",
                    "2"
                },
            },
        };
    }
};

