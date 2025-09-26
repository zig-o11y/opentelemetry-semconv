//! Generated from registry.yaml
//! Namespace: device
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A unique identifier representing the device
pub const device_id = types.StringAttribute{
    .name = "device.id",
    .brief = "A unique identifier representing the device",
    .note = "Its value SHOULD be identical for all apps on a device and it SHOULD NOT change if an app is uninstalled and re-installed.\nHowever, it might be resettable by the user for all apps on a device.\nHardware IDs (e.g. vendor-specific serial number, IMEI or MAC address) MAY be used as values.\n\nMore information about Android identifier best practices can be found in the [Android user data IDs guide](https://developer.android.com/training/articles/user-data-ids).\n\n> [!WARNING]\n>\n> This attribute may contain sensitive (PII) information. Caution should be taken when storing personal data or anything which can identify a user. GDPR and data protection laws may apply,\n> ensure you do your own due diligence.\n>\n> Due to these reasons, this identifier is not recommended for consumer applications and will likely result in rejection from both Google Play and App Store.\n> However, it may be appropriate for specific enterprise scenarios, such as kiosk devices or enterprise-managed devices, with appropriate compliance clearance.\n> Any instrumentation providing this identifier MUST implement it as an opt-in feature.\n>\n> See [`app.installation.id`](/docs/registry/attributes/app.md",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the device manufacturer
pub const device_manufacturer = types.StringAttribute{
    .name = "device.manufacturer",
    .brief = "The name of the device manufacturer",
    .note = "The Android OS provides this field via [Build](https://developer.android.com/reference/android/os/Build iOS apps SHOULD hardcode the value `Apple`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The model identifier for the device
pub const device_model_identifier = types.StringAttribute{
    .name = "device.model.identifier",
    .brief = "The model identifier for the device",
    .note = "It's recommended this value represents a machine-readable version of the model identifier rather than the market or consumer-friendly name of the device.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The marketing name for the device model
pub const device_model_name = types.StringAttribute{
    .name = "device.model.name",
    .brief = "The marketing name for the device model",
    .note = "It's recommended this value represents a human-readable version of the device model rather than a machine-readable alternative.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Describes device attributes.
/// Display name: Device Attributes
pub const Registry = struct {
    /// A unique identifier representing the device
    pub const id = device_id;
    /// The name of the device manufacturer
    pub const manufacturer = device_manufacturer;
    /// The model identifier for the device
    pub const modelIdentifier = device_model_identifier;
    /// The marketing name for the device model
    pub const modelName = device_model_name;
};

