//! Generated from registry.yaml
//! Namespace: telemetry
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for telemetry SDK.
/// Display name: Telemetry Attributes
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

pub const RegistryTelemetry = union(enum) {
    /// The name of the telemetry SDK as defined above.
    sdkName: types.StringAttribute,
    /// The language of the telemetry SDK.
    sdkLanguage: types.EnumAttribute(sdkLanguageValue),
    /// The version string of the telemetry SDK.
    sdkVersion: types.StringAttribute,
    /// The name of the auto instrumentation agent or distribution, if used.
    distroName: types.StringAttribute,
    /// The version string of the auto instrumentation agent or distribution, if used.
    distroVersion: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .sdkName => types.AttributeInfo{
                .name = "telemetry.sdk.name",
                .brief = "The name of the telemetry SDK as defined above.",
                .note = "The OpenTelemetry SDK MUST set the `telemetry.sdk.name` attribute to `opentelemetry`.\nIf another SDK, like a fork or a vendor-provided implementation, is used, this SDK MUST set the\n`telemetry.sdk.name` attribute to the fully-qualified class or module name of this SDK's main entry point\nor another suitable identifier depending on the language.\nThe identifier `opentelemetry` is reserved and MUST NOT be used in this case.\nAll custom identifiers SHOULD be stable across different versions of an implementation.",
                .stability = .stable,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .sdkLanguage => types.AttributeInfo{
                .name = "telemetry.sdk.language",
                .brief = "The language of the telemetry SDK.",
                .note = null,
                .stability = .stable,
                .examples = null,
            },
            .sdkVersion => types.AttributeInfo{
                .name = "telemetry.sdk.version",
                .brief = "The version string of the telemetry SDK.",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "1.2.3"
                },
            },
            .distroName => types.AttributeInfo{
                .name = "telemetry.distro.name",
                .brief = "The name of the auto instrumentation agent or distribution, if used.",
                .note = "Official auto instrumentation agents and distributions SHOULD set the `telemetry.distro.name` attribute to\na string starting with `opentelemetry-`, e.g. `opentelemetry-java-instrumentation`.",
                .stability = .development,
                .examples = &.{
                    "parts-unlimited-java"
                },
            },
            .distroVersion => types.AttributeInfo{
                .name = "telemetry.distro.version",
                .brief = "The version string of the auto instrumentation agent or distribution, if used.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1.2.3"
                },
            },
        };
    }
};

