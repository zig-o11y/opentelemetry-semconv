//! Generated from registry.yaml
//! Namespace: cassandra
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The data center of the coordinating node for a query.
pub const cassandra_coordinator_dc = types.StringAttribute{
    .name = "cassandra.coordinator.dc",
    .brief = "The data center of the coordinating node for a query.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The ID of the coordinating node for a query.
pub const cassandra_coordinator_id = types.StringAttribute{
    .name = "cassandra.coordinator.id",
    .brief = "The ID of the coordinating node for a query.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).
pub const cassandra_consistency_level = types.EnumAttribute(consistencyLevelValue){
    .base = types.StringAttribute{
        .name = "cassandra.consistency.level",
        .brief = "The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = consistencyLevelValue.all,
};

/// Whether or not the query is idempotent.
pub const cassandra_query_idempotent = types.StringAttribute{
    .name = "cassandra.query.idempotent",
    .brief = "Whether or not the query is idempotent.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The fetch size used for paging, i.e. how many rows will be returned at once.
pub const cassandra_page_size = types.StringAttribute{
    .name = "cassandra.page.size",
    .brief = "The fetch size used for paging, i.e. how many rows will be returned at once.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.
pub const cassandra_speculative_execution_count = types.StringAttribute{
    .name = "cassandra.speculative_execution.count",
    .brief = "The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// This section defines attributes for Cassandra.
/// Display name: Cassandra Attributes
pub const Registry = struct {
    /// The data center of the coordinating node for a query.
    pub const coordinatorDc = cassandra_coordinator_dc;
    /// The ID of the coordinating node for a query.
    pub const coordinatorId = cassandra_coordinator_id;
    /// The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).
    pub const consistencyLevel = cassandra_consistency_level;
    /// Whether or not the query is idempotent.
    pub const queryIdempotent = cassandra_query_idempotent;
    /// The fetch size used for paging, i.e. how many rows will be returned at once.
    pub const pageSize = cassandra_page_size;
    /// The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.
    pub const speculativeExecutionCount = cassandra_speculative_execution_count;
};

