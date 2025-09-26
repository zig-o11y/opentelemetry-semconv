//! Generated from registry.yaml
//! Namespace: event
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Identifies the class / type of event.
pub const event_name = types.StringAttribute{
    .name = "event.name",
    .brief = "Identifies the class / type of event.",
    .note = "This attribute SHOULD be used by non-OTLP exporters when destination does not support `EventName` or equivalent field. This attribute MAY be used by applications using existing logging libraries so that it can be used to set the `EventName` field by Collector or SDK components.",
    .stability = .development,
    .requirement_level = .recommended,
};

