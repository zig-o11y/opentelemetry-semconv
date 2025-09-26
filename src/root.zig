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
//! const request_size = semconv.http.Registry.requestBodySize;
//! const status_code = semconv.http.Registry.responseStatusCode;
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

    // Test that Registry contains the expected attributes as constants
    try testing.expect(@hasDecl(http.Registry, "http_request_body_size"));
    try testing.expect(@hasDecl(http.Registry, "http_request_method"));

    // Test that we can access individual attribute constants
    try testing.expectEqualStrings("http.request.body.size", http.Registry.http_request_body_size.name);
    try testing.expectEqualStrings("http.request.method", http.Registry.http_request_method.base.name);

    // Test that types are re-exported correctly
    try testing.expectEqual(@TypeOf(types.StabilityLevel.stable), @TypeOf(StabilityLevel.stable));
    try testing.expectEqual(@TypeOf(types.RequirementLevel.required), @TypeOf(RequirementLevel.required));
}

test "attribute validation integration" {
    const testing = std.testing;

    // Test that Registry is now a struct with constants
    const http_registry_type_info = @typeInfo(http.Registry);
    try testing.expect(http_registry_type_info == .@"struct");

    // Test that we can create enum values directly
    const method_enum_value = http.Registry.requestMethodValue.get;
    try testing.expectEqualStrings("GET", method_enum_value.toString());

    // Test that we can get type information about enum attributes too
    try testing.expect(@TypeOf(method_enum_value) == http.Registry.requestMethodValue);

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
pub const app = @import("app/app.zig");
pub const android = @import("android/android.zig");
pub const cassandra = @import("cassandra/cassandra.zig");
pub const client = @import("client/client.zig");
pub const cloud = @import("cloud/cloud.zig");
pub const container = @import("container/registry.zig");
pub const log = @import("log/log.zig");
pub const cloudevents = @import("cloudevents/cloudevents.zig");
pub const cloudfoundry = @import("cloudfoundry/cloudfoundry.zig");
pub const cpu = @import("cpu/cpu.zig");
pub const cpython = @import("cpython/cpython.zig");
pub const deployment = @import("deployment/deployment.zig");
pub const destination = @import("destination/destination.zig");
pub const device = @import("device/device.zig");
pub const disk = @import("disk/disk.zig");
pub const dotnet = @import("dotnet/dotnet.zig");
pub const elasticsearch = @import("elasticsearch/elasticsearch.zig");
pub const enduser = @import("enduser/enduser.zig");
pub const @"error" = @import("error/error.zig");
pub const event = @import("event/event.zig");
pub const faas = @import("faas/faas.zig");
pub const geo = @import("geo/geo.zig");
pub const go = @import("go/go.zig");
pub const graphql = @import("graphql/graphql.zig");
pub const heroku = @import("heroku/heroku.zig");
pub const http = @import("http/http.zig");
pub const ios = @import("ios/ios.zig");
pub const jvm = @import("jvm/jvm.zig");
pub const k8s = @import("k8s/k8s.zig");
pub const linux = @import("linux/linux.zig");
pub const nfs = @import("nfs/nfs.zig");
pub const nodejs = @import("nodejs/nodejs.zig");
pub const oci = @import("oci/oci.zig");
pub const onc_rpc = @import("onc_rpc/onc_rpc.zig");
pub const openai = @import("openai/openai.zig");
pub const opentracing = @import("opentracing/opentracing.zig");
pub const os = @import("os/os.zig");
pub const peer = @import("peer/peer.zig");
pub const pprof = @import("pprof/pprof.zig");
pub const process = @import("process/process.zig");
pub const profile = @import("profile/profile.zig");
pub const rpc = @import("rpc/rpc.zig");
pub const security_rule = @import("security-rule/security-rule.zig");
pub const user_agent = @import("user-agent/user-agent.zig");
pub const server = @import("server/server.zig");
pub const service = @import("service/service.zig");
pub const session = @import("session/session.zig");
pub const signalr = @import("signalr/signalr.zig");
pub const source = @import("source/source.zig");
pub const system = @import("system/system.zig");
pub const telemetry = @import("telemetry/telemetry.zig");
pub const thread = @import("thread/thread.zig");
pub const v8js = @import("v8js/v8js.zig");
pub const zos = @import("zos/zos.zig");
