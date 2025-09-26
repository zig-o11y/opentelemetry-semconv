//! Generated from registry.yaml
//! Namespace: app
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A unique identifier representing the installation of an application on a specific device
pub const app_installation_id = types.StringAttribute{
    .name = "app.installation.id",
    .brief = "A unique identifier representing the installation of an application on a specific device",
    .note = "Its value SHOULD persist across launches of the same application installation, including through application upgrades.\nIt SHOULD change if the application is uninstalled or if all applications of the vendor are uninstalled.\nAdditionally, users might be able to reset this value (e.g. by clearing application data).\nIf an app is installed multiple times on the same device (e.g. in different accounts on Android), each `app.installation.id` SHOULD have a different value.\nIf multiple OpenTelemetry SDKs are used within the same application, they SHOULD use the same value for `app.installation.id`.\nHardware IDs (e.g. serial number, IMEI, MAC address) MUST NOT be used as the `app.installation.id`.\n\nFor iOS, this value SHOULD be equal to the [vendor identifier](https://developer.apple.com/documentation/uikit/uidevice/identifierforvendor).\n\nFor Android, examples of `app.installation.id` implementations include:\n\n- [Firebase Installation ID](https://firebase.google.com/docs/projects/manage-installations).\n- A globally unique UUID which is persisted across sessions in your application.\n- [App set ID](https://developer.android.com/identity/app-set-id).\n- [`Settings.getString(Settings.Secure.ANDROID_ID)`](https://developer.android.com/reference/android/provider/Settings.Secure\n\nMore information about Android identifier best practices can be found in the [Android user data IDs guide](https://developer.android.com/training/articles/user-data-ids).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// A number of frame renders that experienced jank.
pub const app_jank_frame_count = types.StringAttribute{
    .name = "app.jank.frame_count",
    .brief = "A number of frame renders that experienced jank.",
    .note = "Depending on platform limitations, the value provided MAY be approximation.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The minimum rendering threshold for this jank, in seconds.
pub const app_jank_threshold = types.StringAttribute{
    .name = "app.jank.threshold",
    .brief = "The minimum rendering threshold for this jank, in seconds.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The time period, in seconds, for which this jank is being reported.
pub const app_jank_period = types.StringAttribute{
    .name = "app.jank.period",
    .brief = "The time period, in seconds, for which this jank is being reported.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The x (horizontal) coordinate of a screen coordinate, in screen pixels.
pub const app_screen_coordinate_x = types.StringAttribute{
    .name = "app.screen.coordinate.x",
    .brief = "The x (horizontal) coordinate of a screen coordinate, in screen pixels.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The y (vertical) component of a screen coordinate, in screen pixels.
pub const app_screen_coordinate_y = types.StringAttribute{
    .name = "app.screen.coordinate.y",
    .brief = "The y (vertical) component of a screen coordinate, in screen pixels.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// An identifier that uniquely differentiates this widget from other widgets in the same application.
pub const app_widget_id = types.StringAttribute{
    .name = "app.widget.id",
    .brief = "An identifier that uniquely differentiates this widget from other widgets in the same application.",
    .note = "A widget is an application component, typically an on-screen visual GUI element.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of an application widget.
pub const app_widget_name = types.StringAttribute{
    .name = "app.widget.name",
    .brief = "The name of an application widget.",
    .note = "A widget is an application component, typically an on-screen visual GUI element.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Unique identifier for a particular build or compilation of the application.
pub const app_build_id = types.StringAttribute{
    .name = "app.build_id",
    .brief = "Unique identifier for a particular build or compilation of the application.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Describes attributes related to client-side applications (e.g. web apps or mobile apps).
/// Display name: Application Attributes
pub const Registry = struct {
    /// A unique identifier representing the installation of an application on a specific device
    pub const installationId = app_installation_id;
    /// A number of frame renders that experienced jank.
    pub const jankFrameCount = app_jank_frame_count;
    /// The minimum rendering threshold for this jank, in seconds.
    pub const jankThreshold = app_jank_threshold;
    /// The time period, in seconds, for which this jank is being reported.
    pub const jankPeriod = app_jank_period;
    /// The x (horizontal) coordinate of a screen coordinate, in screen pixels.
    pub const screenCoordinateX = app_screen_coordinate_x;
    /// The y (vertical) component of a screen coordinate, in screen pixels.
    pub const screenCoordinateY = app_screen_coordinate_y;
    /// An identifier that uniquely differentiates this widget from other widgets in the same application.
    pub const widgetId = app_widget_id;
    /// The name of an application widget.
    pub const widgetName = app_widget_name;
    /// Unique identifier for a particular build or compilation of the application.
    pub const buildId = app_build_id;
};

