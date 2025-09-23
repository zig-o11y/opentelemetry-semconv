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

// Semantic convention modules - registry files (main attribute definitions)
pub const http = @import("http/registry.zig");
pub const container = @import("container/registry.zig");

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
    try testing.expect(@TypeOf(@as(http.Http, http.Http{ .requestBodySize = undefined })) == http.Http);

    // Test that we can access enum variants
    try testing.expect(@TypeOf(@as(http.Http, http.Http{ .requestMethod = undefined })) == http.Http);

    // Test that types are re-exported correctly
    try testing.expectEqual(@TypeOf(types.StabilityLevel.stable), @TypeOf(StabilityLevel.stable));
    try testing.expectEqual(@TypeOf(types.RequirementLevel.required), @TypeOf(RequirementLevel.required));
}

test "attribute validation integration" {
    const testing = std.testing;

    // Test union(enum) field types
    const http_union_type_info = @typeInfo(http.Http);
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
