//! Database semantic conventions
//!
//! This module provides semantic convention attributes for database instrumentation.
//! Based on OpenTelemetry database semantic conventions.

const std = @import("std");
const types = @import("../types.zig");

/// Database attribute registry
pub const Attributes = struct {
    /// The name of a collection (table, container) within the database.
    pub const collection_name = types.StringAttribute.init(
        "db.collection.name",
        "The name of a collection (table, container) within the database.",
        .stable,
        .recommended,
    ).withNote("It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization. " ++
        "The collection name SHOULD NOT be extracted from `db.query.text`, when the database system supports query text with multiple collections " ++
        "in non-batch operations.")
        .withExamples(&[_][]const u8{ "public.users", "customers" });

    /// The name of the database, fully qualified within the server address and port.
    pub const namespace = types.StringAttribute.init(
        "db.namespace",
        "The name of the database, fully qualified within the server address and port.",
        .stable,
        .recommended,
    ).withNote("If a database system has multiple namespace components, they SHOULD be concatenated from the most general to the most specific namespace component, " ++
        "using `|` as a separator between the components. Any missing components (and their associated separators) SHOULD be omitted.")
        .withExamples(&[_][]const u8{ "customers", "test.users" });

    /// The name of the operation or command being executed.
    pub const operation_name = types.StringAttribute.init(
        "db.operation.name",
        "The name of the operation or command being executed.",
        .stable,
        .recommended,
    ).withNote("It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization. " ++
        "The operation name SHOULD NOT be extracted from `db.query.text`, when the database system supports query text with multiple operations " ++
        "in non-batch operations.")
        .withExamples(&[_][]const u8{ "findAndModify", "HMSET", "SELECT" });

    /// The database query being executed.
    pub const query_text = types.StringAttribute.init(
        "db.query.text",
        "The database query being executed.",
        .stable,
        .recommended,
    ).withNote("For sanitization see Sanitization of `db.query.text`. For batch operations, if the individual operations are known to have " ++
        "the same query text then that query text SHOULD be used, otherwise all of the individual query texts SHOULD be concatenated " ++
        "with separator `; ` or some other database system specific separator if more applicable.")
        .withExamples(&[_][]const u8{ "SELECT * FROM wuser_table where username = ?", "SET mykey ?" });

    /// Low cardinality summary of a database query.
    pub const query_summary = types.StringAttribute.init(
        "db.query.summary",
        "Low cardinality summary of a database query.",
        .stable,
        .recommended,
    ).withNote("The query summary describes a class of database queries and is useful as a grouping key, especially when analyzing telemetry for database " ++
        "calls involving complex queries.")
        .withExamples(&[_][]const u8{ "SELECT wuser_table", "INSERT shipping_details SELECT orders", "get user by id" });

    /// The name of a stored procedure within the database.
    pub const stored_procedure_name = types.StringAttribute.init(
        "db.stored_procedure.name",
        "The name of a stored procedure within the database.",
        .stable,
        .recommended,
    ).withNote("It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization.")
        .withExamples(&[_][]const u8{"GetCustomer"});

    /// The number of queries included in a batch operation.
    pub const operation_batch_size = types.IntAttribute.init(
        "db.operation.batch.size",
        "The number of queries included in a batch operation.",
        .stable,
        .recommended,
    ).withNote("Operations are only considered batches when they contain two or more operations, and so `db.operation.batch.size` SHOULD never be `1`.")
        .withExamples(&[_]i64{ 2, 3, 4 });

    /// Database response status code.
    pub const response_status_code = types.StringAttribute.init(
        "db.response.status_code",
        "Database response status code.",
        .stable,
        .recommended,
    ).withNote("The status code returned by the database. Usually it represents an error code, but may also represent partial success, warning, " ++
        "or differentiate between various types of successful outcomes.")
        .withExamples(&[_][]const u8{ "102", "ORA-17002", "08P01", "404" });

    /// Number of rows returned by the operation.
    pub const response_returned_rows = types.IntAttribute.init(
        "db.response.returned_rows",
        "Number of rows returned by the operation.",
        .experimental,
        .recommended,
    ).withExamples(&[_]i64{ 10, 30, 1000 });

    /// The database management system (DBMS) product as identified by the client instrumentation.
    pub const system_name = types.EnumAttribute.init(
        "db.system.name",
        "The database management system (DBMS) product as identified by the client instrumentation.",
        .stable,
        .required,
    ).withMembers(&[_]types.EnumMember{
        .{ .value = "other_sql", .brief = "Some other SQL database. Fallback only.", .stability = .experimental },
        .{ .value = "aws.dynamodb", .brief = "Amazon DynamoDB", .stability = .experimental },
        .{ .value = "aws.redshift", .brief = "Amazon Redshift", .stability = .experimental },
        .{ .value = "azure.cosmosdb", .brief = "Azure Cosmos DB", .stability = .experimental },
        .{ .value = "cassandra", .brief = "Apache Cassandra", .stability = .experimental },
        .{ .value = "clickhouse", .brief = "ClickHouse", .stability = .experimental },
        .{ .value = "cockroachdb", .brief = "CockroachDB", .stability = .experimental },
        .{ .value = "couchbase", .brief = "Couchbase", .stability = .experimental },
        .{ .value = "couchdb", .brief = "Apache CouchDB", .stability = .experimental },
        .{ .value = "derby", .brief = "Apache Derby", .stability = .experimental },
        .{ .value = "elasticsearch", .brief = "Elasticsearch", .stability = .experimental },
        .{ .value = "firebird", .brief = "Firebird", .stability = .experimental },
        .{ .value = "h2", .brief = "H2", .stability = .experimental },
        .{ .value = "hbase", .brief = "Apache HBase", .stability = .experimental },
        .{ .value = "hive", .brief = "Apache Hive", .stability = .experimental },
        .{ .value = "hsqldb", .brief = "HyperSQL DataBase", .stability = .experimental },
        .{ .value = "influxdb", .brief = "InfluxDB", .stability = .experimental },
        .{ .value = "mariadb", .brief = "MariaDB", .stability = .stable },
        .{ .value = "memcached", .brief = "Memcached", .stability = .experimental },
        .{ .value = "mongodb", .brief = "MongoDB", .stability = .stable },
        .{ .value = "mssql", .brief = "Microsoft SQL Server", .stability = .stable },
        .{ .value = "mysql", .brief = "MySQL", .stability = .stable },
        .{ .value = "neo4j", .brief = "Neo4j", .stability = .experimental },
        .{ .value = "opensearch", .brief = "OpenSearch", .stability = .experimental },
        .{ .value = "oracle.db", .brief = "Oracle Database", .stability = .experimental },
        .{ .value = "postgresql", .brief = "PostgreSQL", .stability = .stable },
        .{ .value = "redis", .brief = "Redis", .stability = .experimental },
        .{ .value = "sap.hana", .brief = "SAP HANA", .stability = .experimental },
        .{ .value = "sqlite", .brief = "SQLite", .stability = .experimental },
        .{ .value = "teradata", .brief = "Teradata", .stability = .experimental },
        .{ .value = "trino", .brief = "Trino", .stability = .experimental },
    }).withNote("The actual DBMS may differ from the one identified by the client. For example, when using PostgreSQL client libraries to connect to a " ++
        "CockroachDB, the `db.system.name` is set to `postgresql` based on the instrumentation's best knowledge.");

    /// Database client connection state.
    pub const client_connection_state = types.EnumAttribute.init(
        "db.client.connection.state",
        "The state of a connection in the pool",
        .experimental,
        .recommended,
    ).withMembers(&[_]types.EnumMember{
        .{ .value = "idle", .brief = "The connection is idle", .stability = .experimental },
        .{ .value = "used", .brief = "The connection is used", .stability = .experimental },
    });

    /// The name of the connection pool.
    pub const client_connection_pool_name = types.StringAttribute.init(
        "db.client.connection.pool.name",
        "The name of the connection pool; unique within the instrumented application.",
        .experimental,
        .recommended,
    ).withNote("In case the connection pool implementation doesn't provide a name, instrumentation SHOULD use a combination of parameters that would make " ++
        "the name unique, for example, combining attributes `server.address`, `server.port`, and `db.namespace`, formatted as `server.address:server.port/db.namespace`.")
        .withExamples(&[_][]const u8{"myDataSource"});
};

/// Database semantic convention group
pub const Group = types.AttributeGroup{
    .id = "registry.db",
    .brief = "This group defines the attributes used to describe telemetry in the context of databases.",
    .stability = .stable,
};

/// Helper functions for database operations
pub const DatabaseUtils = struct {
    /// Check if a database system name is a SQL-based system
    pub fn isSqlSystem(system: []const u8) bool {
        const sql_systems = [_][]const u8{ "mysql", "postgresql", "mssql", "oracle.db", "sqlite", "mariadb", "h2", "hsqldb", "derby", "cockroachdb", "teradata" };

        for (sql_systems) |sql_system| {
            if (std.mem.eql(u8, system, sql_system)) {
                return true;
            }
        }

        return false;
    }

    /// Check if a database system name is a NoSQL system
    pub fn isNoSqlSystem(system: []const u8) bool {
        const nosql_systems = [_][]const u8{ "mongodb", "cassandra", "redis", "memcached", "couchdb", "couchbase", "neo4j", "elasticsearch", "opensearch", "hbase" };

        for (nosql_systems) |nosql_system| {
            if (std.mem.eql(u8, system, nosql_system)) {
                return true;
            }
        }

        return false;
    }

    /// Check if a database system is cloud-native
    pub fn isCloudNative(system: []const u8) bool {
        return std.mem.startsWith(u8, system, "aws.") or
            std.mem.startsWith(u8, system, "azure.") or
            std.mem.startsWith(u8, system, "gcp.");
    }

    /// Sanitize query text by removing potential sensitive information
    pub fn sanitizeQueryText(allocator: std.mem.Allocator, query: []const u8) ![]const u8 {
        // Basic sanitization - replace string literals with placeholders
        var result = std.ArrayList(u8).init(allocator);
        defer result.deinit();

        var in_string = false;
        var quote_char: u8 = 0;
        var i: usize = 0;

        while (i < query.len) {
            const c = query[i];

            if (!in_string and (c == '\'' or c == '"')) {
                // Start of string literal
                in_string = true;
                quote_char = c;
                try result.append(c);
                try result.appendSlice("?");
                i += 1;

                // Skip to end of string
                while (i < query.len and query[i] != quote_char) {
                    i += 1;
                }
                if (i < query.len) {
                    try result.append(quote_char);
                    i += 1;
                }
                in_string = false;
            } else {
                try result.append(c);
                i += 1;
            }
        }

        return result.toOwnedSlice();
    }
};

// Tests
test "database system classification" {
    const testing = std.testing;

    // Test SQL systems
    try testing.expect(DatabaseUtils.isSqlSystem("mysql"));
    try testing.expect(DatabaseUtils.isSqlSystem("postgresql"));
    try testing.expect(DatabaseUtils.isSqlSystem("mssql"));
    try testing.expect(!DatabaseUtils.isSqlSystem("mongodb"));

    // Test NoSQL systems
    try testing.expect(DatabaseUtils.isNoSqlSystem("mongodb"));
    try testing.expect(DatabaseUtils.isNoSqlSystem("redis"));
    try testing.expect(DatabaseUtils.isNoSqlSystem("cassandra"));
    try testing.expect(!DatabaseUtils.isNoSqlSystem("mysql"));

    // Test cloud-native systems
    try testing.expect(DatabaseUtils.isCloudNative("aws.dynamodb"));
    try testing.expect(DatabaseUtils.isCloudNative("azure.cosmosdb"));
    try testing.expect(!DatabaseUtils.isCloudNative("mysql"));
}

test "database attribute definitions" {
    const testing = std.testing;

    try testing.expectEqualStrings("db.collection.name", Attributes.collection_name.name);
    try testing.expectEqualStrings("db.namespace", Attributes.namespace.name);
    try testing.expectEqualStrings("db.operation.name", Attributes.operation_name.name);
    try testing.expectEqualStrings("db.system.name", Attributes.system_name.base.name);

    // Test stability levels
    try testing.expectEqual(types.StabilityLevel.stable, Attributes.collection_name.stability);
    try testing.expectEqual(types.StabilityLevel.stable, Attributes.system_name.base.stability);
}

test "query sanitization" {
    const testing = std.testing;
    const allocator = testing.allocator;

    const sanitized = try DatabaseUtils.sanitizeQueryText(allocator, "SELECT * FROM users WHERE name = 'john'");
    defer allocator.free(sanitized);

    try testing.expectEqualStrings("SELECT * FROM users WHERE name = '?'", sanitized);
}
