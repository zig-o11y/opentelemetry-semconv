//! Messaging semantic conventions for OpenTelemetry
//! Generated from test_entity_messaging.yaml

const std = @import("std");
const types = @import("../types.zig");

/// Messaging semantic convention test_entity_messaging
pub const MESSAGINGTest_entity_messaging = struct {
    // Entity: Entity representing a message consumer
    // Requirement Level: required
    pub const messaging_system = MESSAGING_SYSTEM; // ref: messaging.system
    // Requirement Level: recommended
    pub const messaging_destination = MESSAGING_DESTINATION; // ref: messaging.destination
    // Requirement Level: required
    pub const messaging_operation = MESSAGING_OPERATION; // ref: messaging.operation

};
