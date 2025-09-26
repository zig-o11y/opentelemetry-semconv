//! Generated from registry.yaml
//! Namespace: telemetry
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const sdkLanguageValue = enum {
    ///
    cpp,
    ///
    dotnet,
    ///
    erlang,
    ///
    go,
    ///
    java,
    ///
    nodejs,
    ///
    php,
    ///
    python,
    ///
    ruby,
    ///
    rust,
    ///
    swift,
    ///
    webjs,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .cpp => "cpp",
            .dotnet => "dotnet",
            .erlang => "erlang",
            .go => "go",
            .java => "java",
            .nodejs => "nodejs",
            .php => "php",
            .python => "python",
            .ruby => "ruby",
            .rust => "rust",
            .swift => "swift",
            .webjs => "webjs",
        };
    }
};

/// The name of the telemetry SDK as defined above.
pub const telemetry_sdk_name = types.StringAttribute{
    .name = "telemetry.sdk.name",
    .brief = "The name of the telemetry SDK as defined above.",
    .note = "The OpenTelemetry SDK MUST set the `telemetry.sdk.name` attribute to `opentelemetry`.\nIf another SDK, like a fork or a vendor-provided implementation, is used, this SDK MUST set the\n`telemetry.sdk.name` attribute to the fully-qualified class or module name of this SDK's main entry point\nor another suitable identifier depending on the language.\nThe identifier `opentelemetry` is reserved and MUST NOT be used in this case.\nAll custom identifiers SHOULD be stable across different versions of an implementation.",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// The language of the telemetry SDK.
pub const telemetry_sdk_language = types.EnumAttribute(sdkLanguageValue){
    .base = types.StringAttribute{
        .name = "telemetry.sdk.language",
        .brief = "The language of the telemetry SDK.",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = sdkLanguageValue.cpp,
};

/// The version string of the telemetry SDK.
pub const telemetry_sdk_version = types.StringAttribute{
    .name = "telemetry.sdk.version",
    .brief = "The version string of the telemetry SDK.",
    .note = null,
    .stability = .stable,
    .requirement_level = .recommended,
};

/// The name of the auto instrumentation agent or distribution, if used.
pub const telemetry_distro_name = types.StringAttribute{
    .name = "telemetry.distro.name",
    .brief = "The name of the auto instrumentation agent or distribution, if used.",
    .note = "Official auto instrumentation agents and distributions SHOULD set the `telemetry.distro.name` attribute to\na string starting with `opentelemetry-`, e.g. `opentelemetry-java-instrumentation`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The version string of the auto instrumentation agent or distribution, if used.
pub const telemetry_distro_version = types.StringAttribute{
    .name = "telemetry.distro.version",
    .brief = "The version string of the auto instrumentation agent or distribution, if used.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

