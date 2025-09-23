//! Generated from registry.yaml
//! Namespace: user-agent
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes user-agent attributes.
/// Display name: User-agent Attributes
pub const RegistryUserAgent = union(enum) {
    /// Value of the [HTTP User-Agent](https://www.rfc-editor.org/rfc/rfc9110.html
    original: types.StringAttribute,
    /// Name of the user-agent extracted from original. Usually refers to the browser's name.
    name: types.StringAttribute,
    /// Version of the user-agent extracted from original. Usually refers to the browser's version
    version: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .original => types.AttributeInfo{
                .name = "user_agent.original",
                .brief = "Value of the [HTTP User-Agent](https://www.rfc-editor.org/rfc/rfc9110.html",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "CERN-LineMode/2.15 libwww/2.17b3",
                    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1",
                    "YourApp/1.0.0 grpc-java-okhttp/1.27.2"
                },
            },
            .name => types.AttributeInfo{
                .name = "user_agent.name",
                .brief = "Name of the user-agent extracted from original. Usually refers to the browser's name.",
                .note = "[Example](https://www.whatsmyua.info) of extracting browser's name from original string. In the case of using a user-agent for non-browser products, such as microservices with multiple names/versions inside the `user_agent.original`, the most significant name SHOULD be selected. In such a scenario it should align with `user_agent.version`",
                .stability = .development,
                .examples = &.{
                    "Safari",
                    "YourApp"
                },
            },
            .version => types.AttributeInfo{
                .name = "user_agent.version",
                .brief = "Version of the user-agent extracted from original. Usually refers to the browser's version",
                .note = "[Example](https://www.whatsmyua.info) of extracting browser's version from original string. In the case of using a user-agent for non-browser products, such as microservices with multiple names/versions inside the `user_agent.original`, the most significant version SHOULD be selected. In such a scenario it should align with `user_agent.name`\n\n",
                .stability = .development,
                .examples = &.{
                    "14.1.2",
                    "1.0.0"
                },
            },
        };
    }
};

/// Describes the OS user-agent attributes.
/// Display name: User-agent OS Attributes
pub const syntheticTypeValue = enum {
    /// Bot source.
    bot,
    /// Synthetic test source.
    @"test",

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .bot => "bot",
            .@"test" => "test",
        };
    }
};

pub const RegistryUserAgentOs = union(enum) {
    /// Human readable operating system name.
    osName: types.StringAttribute,
    /// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md
    osVersion: types.StringAttribute,
    /// Specifies the category of synthetic traffic, such as tests or bots.
    syntheticType: types.EnumAttribute(syntheticTypeValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .osName => types.AttributeInfo{
                .name = "user_agent.os.name",
                .brief = "Human readable operating system name.",
                .note = "For mapping user agent strings to OS names, libraries such as [ua-parser](https://github.com/ua-parser) can be utilized.",
                .stability = .development,
                .examples = &.{
                    "iOS",
                    "Android",
                    "Ubuntu"
                },
            },
            .osVersion => types.AttributeInfo{
                .name = "user_agent.os.version",
                .brief = "The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md",
                .note = "For mapping user agent strings to OS versions, libraries such as [ua-parser](https://github.com/ua-parser) can be utilized.\n\n",
                .stability = .development,
                .examples = &.{
                    "14.2.1",
                    "18.04.1"
                },
            },
            .syntheticType => types.AttributeInfo{
                .name = "user_agent.synthetic.type",
                .brief = "Specifies the category of synthetic traffic, such as tests or bots.",
                .note = "This attribute MAY be derived from the contents of the `user_agent.original` attribute. Components that populate the attribute are responsible for determining what they consider to be synthetic bot or test traffic. This attribute can either be set for self-identification purposes, or on telemetry detected to be generated as a result of a synthetic request. This attribute is useful for distinguishing between genuine client traffic and synthetic traffic generated by bots or tests.",
                .stability = .development,
                .examples = null,
            },
        };
    }
};

