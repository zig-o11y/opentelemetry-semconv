//! Generated from registry.yaml
//! Namespace: app
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes attributes related to client-side applications (e.g. web apps or mobile apps).
/// Display name: Application Attributes
pub const RegistryApp = union(enum) {
    /// A unique identifier representing the installation of an application on a specific device
    installationId: types.StringAttribute,
    /// A number of frame renders that experienced jank.
    jankFrameCount: types.StringAttribute,
    /// The minimum rendering threshold for this jank, in seconds.
    jankThreshold: types.StringAttribute,
    /// The time period, in seconds, for which this jank is being reported.
    jankPeriod: types.StringAttribute,
    /// The x (horizontal) coordinate of a screen coordinate, in screen pixels.
    screenCoordinateX: types.StringAttribute,
    /// The y (vertical) component of a screen coordinate, in screen pixels.
    screenCoordinateY: types.StringAttribute,
    /// An identifier that uniquely differentiates this widget from other widgets in the same application.
    widgetId: types.StringAttribute,
    /// The name of an application widget.
    widgetName: types.StringAttribute,
    /// Unique identifier for a particular build or compilation of the application.
    buildId: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .installationId => types.AttributeInfo{
                .name = "app.installation.id",
                .brief = "A unique identifier representing the installation of an application on a specific device",
                .note = "Its value SHOULD persist across launches of the same application installation, including through application upgrades.\nIt SHOULD change if the application is uninstalled or if all applications of the vendor are uninstalled.\nAdditionally, users might be able to reset this value (e.g. by clearing application data).\nIf an app is installed multiple times on the same device (e.g. in different accounts on Android), each `app.installation.id` SHOULD have a different value.\nIf multiple OpenTelemetry SDKs are used within the same application, they SHOULD use the same value for `app.installation.id`.\nHardware IDs (e.g. serial number, IMEI, MAC address) MUST NOT be used as the `app.installation.id`.\n\nFor iOS, this value SHOULD be equal to the [vendor identifier](https://developer.apple.com/documentation/uikit/uidevice/identifierforvendor).\n\nFor Android, examples of `app.installation.id` implementations include:\n\n- [Firebase Installation ID](https://firebase.google.com/docs/projects/manage-installations).\n- A globally unique UUID which is persisted across sessions in your application.\n- [App set ID](https://developer.android.com/identity/app-set-id).\n- [`Settings.getString(Settings.Secure.ANDROID_ID)`](https://developer.android.com/reference/android/provider/Settings.Secure\n\nMore information about Android identifier best practices can be found in the [Android user data IDs guide](https://developer.android.com/training/articles/user-data-ids).",
                .stability = .development,
                .examples = &.{
                    "2ab2916d-a51f-4ac8-80ee-45ac31a28092"
                },
            },
            .jankFrameCount => types.AttributeInfo{
                .name = "app.jank.frame_count",
                .brief = "A number of frame renders that experienced jank.",
                .note = "Depending on platform limitations, the value provided MAY be approximation.",
                .stability = .development,
                .examples = &.{
                    "9",
                    "42"
                },
            },
            .jankThreshold => types.AttributeInfo{
                .name = "app.jank.threshold",
                .brief = "The minimum rendering threshold for this jank, in seconds.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .jankPeriod => types.AttributeInfo{
                .name = "app.jank.period",
                .brief = "The time period, in seconds, for which this jank is being reported.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .screenCoordinateX => types.AttributeInfo{
                .name = "app.screen.coordinate.x",
                .brief = "The x (horizontal) coordinate of a screen coordinate, in screen pixels.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "0",
                    "131"
                },
            },
            .screenCoordinateY => types.AttributeInfo{
                .name = "app.screen.coordinate.y",
                .brief = "The y (vertical) component of a screen coordinate, in screen pixels.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "12",
                    "99"
                },
            },
            .widgetId => types.AttributeInfo{
                .name = "app.widget.id",
                .brief = "An identifier that uniquely differentiates this widget from other widgets in the same application.",
                .note = "A widget is an application component, typically an on-screen visual GUI element.",
                .stability = .development,
                .examples = &.{
                    "f9bc787d-ff05-48ad-90e1-fca1d46130b3",
                    "submit_order_1829"
                },
            },
            .widgetName => types.AttributeInfo{
                .name = "app.widget.name",
                .brief = "The name of an application widget.",
                .note = "A widget is an application component, typically an on-screen visual GUI element.",
                .stability = .development,
                .examples = &.{
                    "submit",
                    "attack",
                    "Clear Cart"
                },
            },
            .buildId => types.AttributeInfo{
                .name = "app.build_id",
                .brief = "Unique identifier for a particular build or compilation of the application.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "6cff0a7e-cefc-4668-96f5-1273d8b334d0",
                    "9f2b833506aa6973a92fde9733e6271f",
                    "my-app-1.0.0-code-123"
                },
            },
        };
    }
};

