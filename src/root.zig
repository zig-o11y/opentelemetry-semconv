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
//! const method = semconv.http.Attributes.http_request_method;
//! const status = semconv.http.Attributes.http_response_status_code;
//!
//! // Use network semantic conventions
//! const transport = semconv.network.Attributes.network_transport;
//! ```

const std = @import("std");

// Core type definitions
pub const types = @import("types.zig");

// Semantic convention modules - registry files (main attribute definitions)
pub const http = @import("http/registry.zig");
pub const network = @import("network/registry.zig");
pub const url = @import("url/registry.zig");
pub const server = @import("server/registry.zig");
pub const client = @import("client/registry.zig");
pub const err = @import("error/registry.zig"); // 'error' is a Zig keyword, so use 'err'
pub const user_agent = @import("user_agent/registry.zig");
pub const telemetry = @import("telemetry/registry.zig");

// Cloud provider namespaces
pub const aws = @import("aws/registry.zig");
pub const azure = @import("azure/registry.zig");
// pub const gcp = @import("gcp/registry.zig"); // TODO: Implement

// Database and messaging
pub const database = @import("database/registry.zig");
// pub const messaging = @import("messaging/registry.zig"); // TODO: Implement

// Additional semantic convention files
pub const http_common = @import("http/common.zig");
pub const http_spans = @import("http/spans.zig");
pub const http_metrics = @import("http/metrics.zig");
pub const network_common = @import("network/common.zig");
pub const server_common = @import("server/common.zig");
pub const url_common = @import("url/common.zig");
pub const client_common = @import("client/common.zig");
pub const telemetry_entities = @import("telemetry/entities.zig");
pub const database_common = @import("database/common.zig");

// Re-export commonly used types for convenience
pub const StabilityLevel = types.StabilityLevel;
pub const RequirementLevel = types.RequirementLevel;
pub const Attribute = types.Attribute;
pub const StringAttribute = types.StringAttribute;
pub const IntAttribute = types.IntAttribute;
pub const DoubleAttribute = types.DoubleAttribute;
pub const BoolAttribute = types.BooleanAttribute;
pub const ArrayAttribute = types.ArrayAttribute;
pub const EnumAttribute = types.EnumAttribute;
pub const AttributeGroup = types.AttributeGroup;
pub const EntityGroup = types.EntityGroup;

/// Library version information
pub const version = "0.1.0";
pub const otel_spec_version = "1.28.0";

/// Get all available semantic convention namespaces
pub fn getAvailableNamespaces() []const []const u8 {
    return &[_][]const u8{
        "http",
        "network",
        "url",
        "server",
        "client",
        "err", // error namespace (renamed due to Zig keyword)
        "user_agent",
        "telemetry",
        "aws",
        "azure",
        "database",
        // TODO: Add more as they're implemented
        // "gcp", "messaging", "k8s", "container", "host", "process", "service", etc.
    };
}

/// Validate that an attribute name follows semantic convention patterns
pub fn isValidAttributeName(name: []const u8) bool {
    if (name.len == 0) return false;

    // Should contain at least one dot for namespace separation
    if (std.mem.indexOf(u8, name, ".") == null) return false;

    // Should not start or end with a dot
    if (name[0] == '.' or name[name.len - 1] == '.') return false;

    // Should start with a letter
    if (!std.ascii.isAlphabetic(name[0])) return false;

    // Should only contain valid characters
    for (name) |c| {
        if (!std.ascii.isAlphanumeric(c) and c != '.' and c != '_') {
            return false;
        }
    }

    return true;
}

/// Check if a namespace is supported by this library
pub fn isNamespaceSupported(namespace: []const u8) bool {
    const namespaces = getAvailableNamespaces();
    for (namespaces) |ns| {
        if (std.mem.eql(u8, namespace, ns)) {
            return true;
        }
    }
    return false;
}

/// Extract namespace from a fully qualified attribute name
pub fn extractNamespace(attribute_name: []const u8) ?[]const u8 {
    if (std.mem.indexOf(u8, attribute_name, ".")) |dot_idx| {
        return attribute_name[0..dot_idx];
    }
    return null;
}

// Tests
test "library interface" {
    const testing = std.testing;

    // Test namespace enumeration
    const namespaces = getAvailableNamespaces();
    try testing.expect(namespaces.len > 0);

    // Test attribute name validation
    try testing.expect(isValidAttributeName("http.request.method"));
    try testing.expect(isValidAttributeName("network.transport"));
    try testing.expect(!isValidAttributeName(""));
    try testing.expect(!isValidAttributeName("invalid")); // No dot
    try testing.expect(!isValidAttributeName(".invalid")); // Starts with dot
    try testing.expect(!isValidAttributeName("invalid.")); // Ends with dot - should be invalid

    // Test namespace support
    try testing.expect(isNamespaceSupported("http"));
    try testing.expect(isNamespaceSupported("network"));
    try testing.expect(!isNamespaceSupported("unknown"));

    // Test namespace extraction
    try testing.expectEqualStrings("http", extractNamespace("http.request.method").?);
    try testing.expectEqualStrings("network", extractNamespace("network.transport").?);
    try testing.expectEqual(@as(?[]const u8, null), extractNamespace("invalid"));
}

test "semantic convention modules" {
    const testing = std.testing;

    // Test that all modules are accessible
    _ = http.Attributes.request_method;
    _ = network.Attributes.transport;
    _ = url.Attributes.full;
    _ = server.Attributes.address;
    _ = client.Attributes.address;
    _ = err.Attributes.error_type;
    _ = user_agent.Attributes.user_agent_original;
    _ = telemetry.Attributes.telemetry_sdk_name;

    // Test that types are re-exported correctly
    try testing.expectEqual(@TypeOf(types.StabilityLevel.stable), @TypeOf(StabilityLevel.stable));
    try testing.expectEqual(@TypeOf(types.RequirementLevel.required), @TypeOf(RequirementLevel.required));
}

test "attribute validation integration" {
    const testing = std.testing;

    // Test with actual attribute names from modules
    try testing.expect(isValidAttributeName(http.Attributes.request_method.base.name)); // EnumAttribute has .base
    try testing.expect(isValidAttributeName(network.Attributes.transport.base.name)); // EnumAttribute has .base
    try testing.expect(isValidAttributeName(err.Attributes.error_type.base.name)); // EnumAttribute has .base

    // Test namespace extraction with real attributes
    try testing.expectEqualStrings("http", extractNamespace(http.Attributes.request_method.base.name).?); // EnumAttribute has .base
    try testing.expectEqualStrings("network", extractNamespace(network.Attributes.transport.base.name).?); // EnumAttribute has .base
    try testing.expectEqualStrings("error", extractNamespace(err.Attributes.error_type.base.name).?); // EnumAttribute has .base
}

pub const test_simple = @import("test_simple/registry.zig");

pub const app = @import("app/registry.zig");
pub const demo = @import("demo/registry.zig");
