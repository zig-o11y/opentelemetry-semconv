//! Generated from registry.yaml
//! Namespace: android
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const appStateValue = enum {
    /// Any time before Activity.onResume() or, if the app has no Activity, Context.startService() has been called in the app for the first time.
    created,
    /// Any time after Activity.onPause() or, if the app has no Activity, Context.stopService() has been called when the app was in the foreground state.
    background,
    /// Any time after Activity.onResume() or, if the app has no Activity, Context.startService() has been called when the app was in either the created or background states.
    foreground,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .created => "created",
            .background => "background",
            .foreground => "foreground",
        };
    }
};

/// Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found in the [Android API levels documentation](https://developer.android.com/guide/topics/manifest/uses-sdk-element
pub const android_os_api_level = types.StringAttribute{
    .name = "android.os.api_level",
    .brief = "Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found in the [Android API levels documentation](https://developer.android.com/guide/topics/manifest/uses-sdk-element",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// This attribute represents the state of the application.
pub const android_app_state = types.EnumAttribute(appStateValue){
    .base = types.StringAttribute{
        .name = "android.app.state",
        .brief = "This attribute represents the state of the application.",
        .note = "The Android lifecycle states are defined in [Activity lifecycle callbacks](https://developer.android.com/guide/components/activities/activity-lifecycle and from which the `OS identifiers` are derived.",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = appStateValue.created,
};

/// The Android platform on which the Android application is running.
/// Display name: Android Attributes
pub const Registry = struct {
    /// Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found in the [Android API levels documentation](https://developer.android.com/guide/topics/manifest/uses-sdk-element
    pub const osApiLevel = android_os_api_level;
    /// This attribute represents the state of the application.
    pub const appState = android_app_state;
};

