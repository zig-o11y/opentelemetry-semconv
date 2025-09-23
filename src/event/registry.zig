//! Generated from registry.yaml
//! Namespace: event
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Attributes for Events represented using Log Records.
/// Display name: Event Attributes
pub const RegistryEvent = union(enum) {
    /// Identifies the class / type of event.
    name: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .name => types.AttributeInfo{
                .name = "event.name",
                .brief = "Identifies the class / type of event.",
                .note = "This attribute SHOULD be used by non-OTLP exporters when destination does not support `EventName` or equivalent field. This attribute MAY be used by applications using existing logging libraries so that it can be used to set the `EventName` field by Collector or SDK components.",
                .stability = .development,
                .examples = &.{
                    "browser.mouse.click",
                    "device.app.lifecycle"
                },
            },
        };
    }
};

