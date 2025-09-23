const std = @import("std");
const telemetry_registry = @import("registry.zig");
const types = @import("../types.zig");

/// Telemetry SDK entity definition.
/// The telemetry SDK used to capture data recorded by the instrumentation libraries.
pub const TelemetrySdk = struct {
    /// Name of the telemetry SDK as defined by the vendor.
    pub const name = telemetry_registry.Attributes.telemetry_sdk_name;

    /// Language of the telemetry SDK.
    pub const language = telemetry_registry.Attributes.telemetry_sdk_language;

    /// Version string of the telemetry SDK.
    pub const version = telemetry_registry.Attributes.telemetry_sdk_version;

    /// Entity definition for telemetry SDK
    pub const entity = types.EntityGroup{
        .id = "entity.telemetry.sdk",
        .name = "telemetry.sdk",
        .brief = "The telemetry SDK used to capture data recorded by the instrumentation libraries.",
        .stability = .stable,
    };
};

/// Telemetry distribution entity definition.
/// The distribution of telemetry SDK used to capture data recorded by the instrumentation libraries.
pub const TelemetryDistro = struct {
    /// Name of the telemetry distribution.
    pub const name = telemetry_registry.Attributes.telemetry_distro_name;

    /// Version string of the telemetry distribution.
    pub const version = telemetry_registry.Attributes.telemetry_distro_version;

    /// Entity definition for telemetry distribution
    pub const entity = types.EntityGroup{
        .id = "entity.telemetry.distro",
        .name = "telemetry.distro",
        .brief = "The distribution of telemetry SDK used to capture data recorded by the instrumentation libraries.",
        .stability = .experimental,
    };
};

test "telemetry entities" {
    const testing = std.testing;

    // Test SDK entity
    try testing.expectEqualStrings("entity.telemetry.sdk", TelemetrySdk.entity.id);
    try testing.expectEqualStrings("telemetry.sdk", TelemetrySdk.entity.name);
    try testing.expectEqual(types.StabilityLevel.stable, TelemetrySdk.entity.stability);

    // Test distribution entity
    try testing.expectEqualStrings("entity.telemetry.distro", TelemetryDistro.entity.id);
    try testing.expectEqualStrings("telemetry.distro", TelemetryDistro.entity.name);
    try testing.expectEqual(types.StabilityLevel.experimental, TelemetryDistro.entity.stability);
}
