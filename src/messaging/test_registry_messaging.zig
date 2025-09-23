//! Messaging semantic conventions for OpenTelemetry
//! Generated from test_registry_messaging.yaml

const std = @import("std");
const types = @import("../types.zig");

// Messaging semantic conventions

/// Messaging system name
/// Examples: "kafka", "rabbitmq", "activemq"
pub const MESSAGING_SYSTEM = types.Attribute([]const u8)
    .init(.{
        .name = "messaging.system",
        .type = []const u8,
        .brief = "Messaging system name",
        .stability = types.StabilityLevel.stable,
        .requirement_level = types.RequirementLevel.required,
        .examples = &[_][]const u8{"kafka", "rabbitmq", "activemq"},
    });

/// Message destination name
/// Examples: "user-events", "order-processing"
pub const MESSAGING_DESTINATION = types.Attribute([]const u8)
    .init(.{
        .name = "messaging.destination",
        .type = []const u8,
        .brief = "Message destination name",
        .stability = types.StabilityLevel.stable,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"user-events", "order-processing"},
    });

/// Type of messaging operation
/// Examples: "publish", "receive", "process"
pub const MESSAGING_OPERATION = types.Attribute([]const u8)
    .init(.{
        .name = "messaging.operation",
        .type = []const u8,
        .brief = "Type of messaging operation",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"publish", "receive", "process"},
    });


/// Messaging semantic convention test_registry_messaging
pub const MESSAGINGTest_registry_messaging = struct {
    // Messaging semantic conventions
    pub const messaging_system = MESSAGING_SYSTEM;
    pub const messaging_destination = MESSAGING_DESTINATION;
    pub const messaging_operation = MESSAGING_OPERATION;

};
