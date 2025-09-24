//! OpenTelemetry Semantic Conventions for Zig
//!
//! This library provides strongly-typed semantic convention attributes
//! for OpenTelemetry instrumentation in Zig applications.
//!
//! ## Usage
//!
//! ```zig
//! const semconv = @import("opentelemetry-semconv");
//!
//! // Use HTTP semantic conventions
//! const request_size = semconv.http.RegistryHttp.http_request_size;
//! const status_code = semconv.http.RegistryHttp.http_response_status_code;
//! ```

const std = @import("std");

// Core type definitions
pub const types = @import("types.zig");

// Re-export commonly used types for convenience
pub const StabilityLevel = types.StabilityLevel;
pub const RequirementLevel = types.RequirementLevel;

/// Validates that an attribute name follows semantic convention naming rules.
/// Returns true if the name is valid, false otherwise.
pub fn isValidAttributeName(name: []const u8) bool {
    if (name.len == 0) return false;

    // Must start with a lowercase letter
    if (!std.ascii.isLower(name[0])) return false;

    // Check each character
    for (name) |char| {
        if (!std.ascii.isAlphanumeric(char) and char != '.' and char != '_') {
            return false;
        }
    }

    return true;
}

/// Extracts the namespace from an attribute name (e.g., "http.request.method" -> "http").
/// Returns null if the attribute name doesn't contain a namespace.
pub fn extractNamespace(attributeName: []const u8) ?[]const u8 {
    if (std.mem.indexOf(u8, attributeName, ".")) |dot_index| {
        return attributeName[0..dot_index];
    }
    return null;
}

/// Returns true if the given string represents a valid namespace.
/// Namespaces follow semantic convention naming rules.
pub fn isValidNamespace(namespace: []const u8) bool {
    if (namespace.len == 0) return false;

    // Must start with a lowercase letter
    if (!std.ascii.isLower(namespace[0])) return false;

    // Check each character - only letters and underscores allowed
    for (namespace) |char| {
        if (!std.ascii.isLower(char) and char != '_') {
            return false;
        }
    }

    return true;
}

test "module integration" {
    const testing = std.testing;

    // Test that all modules are accessible and contain expected data
    // Test union(enum) type information
    try testing.expect(@TypeOf(@as(http.RegistryHttp, http.RegistryHttp{ .requestBodySize = undefined })) == http.RegistryHttp);

    // Test that we can access enum variants
    try testing.expect(@TypeOf(@as(http.RegistryHttp, http.RegistryHttp{ .requestMethod = undefined })) == http.RegistryHttp);

    // Test that types are re-exported correctly
    try testing.expectEqual(@TypeOf(types.StabilityLevel.stable), @TypeOf(StabilityLevel.stable));
    try testing.expectEqual(@TypeOf(types.RequirementLevel.required), @TypeOf(RequirementLevel.required));
}

test "attribute validation integration" {
    const testing = std.testing;

    // Test union(enum) field types
    const http_union_type_info = @typeInfo(http.RegistryHttp);
    try testing.expect(http_union_type_info == .@"union");

    // Test that we can create enum values
    const method_enum_value = http.requestMethodValue.get;
    try testing.expectEqualStrings("GET", method_enum_value.toString());

    // Test that we can get type information about enum attributes too
    try testing.expect(@TypeOf(method_enum_value) == http.requestMethodValue);

    // Test with hardcoded examples for attribute name validation
    try testing.expect(isValidAttributeName("http.request.body.size"));
    try testing.expect(isValidAttributeName("http.response.status_code"));
    try testing.expectEqualStrings("http", extractNamespace("http.request.body.size").?);
    try testing.expectEqualStrings("http", extractNamespace("http.response.status_code").?);
}
test "namespace validation" {
    const testing = std.testing;

    // Valid namespaces
    try testing.expect(isValidNamespace("http"));
    try testing.expect(isValidNamespace("network"));
    try testing.expect(isValidNamespace("user_agent"));

    // Invalid namespaces
    try testing.expect(!isValidNamespace(""));
    try testing.expect(!isValidNamespace("HTTP")); // uppercase
    try testing.expect(!isValidNamespace("http.request")); // contains dot
    try testing.expect(!isValidNamespace("123abc")); // starts with number
}

test "attribute name validation" {
    const testing = std.testing;

    // Valid attribute names
    try testing.expect(isValidAttributeName("http.request.method"));
    try testing.expect(isValidAttributeName("network.transport"));
    try testing.expect(isValidAttributeName("user_agent.original"));
    try testing.expect(isValidAttributeName("simple_name"));
    try testing.expect(isValidAttributeName("name123"));

    // Invalid attribute names
    try testing.expect(!isValidAttributeName(""));
    try testing.expect(!isValidAttributeName("HTTP.request.method")); // uppercase start
    try testing.expect(!isValidAttributeName("123.invalid")); // starts with number
    try testing.expect(!isValidAttributeName("invalid-name")); // contains hyphen
    try testing.expect(!isValidAttributeName("invalid name")); // contains space
    try testing.expect(!isValidAttributeName("invalid@name")); // contains special char
}

test "namespace extraction" {
    const testing = std.testing;

    // Test namespace extraction from various attribute names
    try testing.expectEqualStrings("http", extractNamespace("http.request.method").?);
    try testing.expectEqualStrings("network", extractNamespace("network.transport").?);
    try testing.expectEqualStrings("user", extractNamespace("user.agent.original").?);

    // Test attributes without namespace
    try testing.expect(extractNamespace("simple_name") == null);
    try testing.expect(extractNamespace("no_dots_here") == null);
}

// Semantic convention modules - registry files (main attribute definitions)
pub const app = @import("app/registry.zig");
pub const android = @import("android/registry.zig");
pub const cassandra = @import("cassandra/registry.zig");
pub const client = @import("client/registry.zig");
pub const cloud = @import("cloud/registry.zig");
pub const container = @import("container/registry.zig");
pub const log = @import("log/registry.zig");
pub const cloudevents = @import("cloudevents/registry.zig");
pub const cloudfoundry = @import("cloudfoundry/registry.zig");
pub const cpu = @import("cpu/registry.zig");
pub const cpython = @import("cpython/registry.zig");
pub const deployment = @import("deployment/registry.zig");
pub const destination = @import("destination/registry.zig");
pub const device = @import("device/registry.zig");
pub const disk = @import("disk/registry.zig");
pub const dotnet = @import("dotnet/registry.zig");
pub const elasticsearch = @import("elasticsearch/registry.zig");
pub const enduser = @import("enduser/registry.zig");
pub const @"error" = @import("error/registry.zig");
pub const event = @import("event/registry.zig");
pub const faas = @import("faas/registry.zig");
pub const geo = @import("geo/registry.zig");
pub const go = @import("go/registry.zig");
pub const graphql = @import("graphql/registry.zig");
pub const heroku = @import("heroku/registry.zig");
pub const http = @import("http/registry.zig");
pub const ios = @import("ios/registry.zig");
pub const jvm = @import("jvm/registry.zig");
pub const k8s = @import("k8s/registry.zig");
pub const linux = @import("linux/registry.zig");
pub const nfs = @import("nfs/registry.zig");
pub const nodejs = @import("nodejs/registry.zig");
pub const oci = @import("oci/registry.zig");
pub const onc_rpc = @import("onc_rpc/registry.zig");
pub const openai = @import("openai/registry.zig");
pub const opentracing = @import("opentracing/registry.zig");
pub const os = @import("os/registry.zig");
pub const peer = @import("peer/registry.zig");
pub const pprof = @import("pprof/registry.zig");
pub const profile = @import("profile/registry.zig");
pub const rpc = @import("rpc/registry.zig");
pub const security_rule = @import("security-rule/registry.zig");
pub const user_agent = @import("user-agent/registry.zig");
pub const server = @import("server/registry.zig");
pub const service = @import("service/registry.zig");
pub const session = @import("session/registry.zig");
pub const signalr = @import("signalr/registry.zig");
pub const source = @import("source/registry.zig");
pub const system = @import("system/registry.zig");
pub const telemetry = @import("telemetry/registry.zig");
pub const thread = @import("thread/registry.zig");
pub const v8js = @import("v8js/registry.zig");
pub const zos = @import("zos/registry.zig");
pub const process = @import("process/registry.zig");
