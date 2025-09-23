//! Generated from registry.yaml
//! Namespace: ios
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This group describes iOS-specific attributes.
/// Display name: iOS Attributes
pub const appStateValue = enum {
    /// The app has become `active`. Associated with UIKit notification `applicationDidBecomeActive`.
    active,
    /// The app is now `inactive`. Associated with UIKit notification `applicationWillResignActive`.
    inactive,
    /// The app is now in the background. This value is associated with UIKit notification `applicationDidEnterBackground`.
    background,
    /// The app is now in the foreground. This value is associated with UIKit notification `applicationWillEnterForeground`.
    foreground,
    /// The app is about to terminate. Associated with UIKit notification `applicationWillTerminate`.
    terminate,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .active => "active",
            .inactive => "inactive",
            .background => "background",
            .foreground => "foreground",
            .terminate => "terminate",
        };
    }
};

pub const RegistryIos = union(enum) {
    /// This attribute represents the state of the application.
    appState: types.EnumAttribute(appStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .appState => types.AttributeInfo{
                .name = "ios.app.state",
                .brief = "This attribute represents the state of the application.",
                .note = "The iOS lifecycle states are defined in the [UIApplicationDelegate documentation](https://developer.apple.com/documentation/uikit/uiapplicationdelegate), and from which the `OS terminology` column values are derived.",
                .stability = .development,
                .examples = null,
            },
        };
    }
};

