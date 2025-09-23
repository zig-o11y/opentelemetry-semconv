//! Demo semantic conventions for OpenTelemetry
//! Generated from test_app_simple.yaml

const std = @import("std");
const types = @import("../types.zig");

// Test attributes

/// A unique identifier
pub const APP_INSTALLATION_ID = types.Attribute([]const u8)
    .init(.{
        .name = "app.installation.id",
        .type = []const u8,
        .brief = "A unique identifier",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });

/// A number of frame renders
pub const APP_JANK_FRAME_COUNT = types.Attribute(i64)
    .init(.{
        .name = "app.jank.frame_count",
        .type = i64,
        .brief = "A number of frame renders",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });


/// Demo semantic convention registry
pub const DEMORegistry = struct {
    // Test attributes
    pub const app_installation_id = APP_INSTALLATION_ID;
    pub const app_jank_frame_count = APP_JANK_FRAME_COUNT;

};
