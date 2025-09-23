//! Generated from registry.yaml
//! Namespace: android
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The Android platform on which the Android application is running.
/// Display name: Android Attributes
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

pub const RegistryAndroid = union(enum) {
    /// Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found in the [Android API levels documentation](https://developer.android.com/guide/topics/manifest/uses-sdk-element
    osApiLevel: types.StringAttribute,
    /// This attribute represents the state of the application.
    appState: types.EnumAttribute(appStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .osApiLevel => types.AttributeInfo{
                .name = "android.os.api_level",
                .brief = "Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found in the [Android API levels documentation](https://developer.android.com/guide/topics/manifest/uses-sdk-element",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "33",
                    "32"
                },
            },
            .appState => types.AttributeInfo{
                .name = "android.app.state",
                .brief = "This attribute represents the state of the application.",
                .note = "The Android lifecycle states are defined in [Activity lifecycle callbacks](https://developer.android.com/guide/components/activities/activity-lifecycle and from which the `OS identifiers` are derived.",
                .stability = .development,
                .examples = &.{
                    "created"
                },
            },
        };
    }
};

