//! Generated from registry.yaml
//! Namespace: security-rule
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Describes security rule attributes. Rule fields are used to capture the specifics of any observer or agent rules that generate alerts or other notable events.
/// Display name: Security Rule
pub const RegistrySecurityRule = union(enum) {
    /// A categorization value keyword used by the entity using the rule for detection of this event
    category: types.StringAttribute,
    /// The description of the rule generating the event.
    description: types.StringAttribute,
    /// Name of the license under which the rule used to generate this event is made available.
    license: types.StringAttribute,
    /// The name of the rule or signature generating the event.
    name: types.StringAttribute,
    /// Reference URL to additional information about the rule used to generate this event.
    reference: types.StringAttribute,
    /// Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.
    rulesetName: types.StringAttribute,
    /// A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.
    uuid: types.StringAttribute,
    /// The version / revision of the rule being used for analysis.
    version: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .category => types.AttributeInfo{
                .name = "security_rule.category",
                .brief = "A categorization value keyword used by the entity using the rule for detection of this event",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Attempted Information Leak"
                },
            },
            .description => types.AttributeInfo{
                .name = "security_rule.description",
                .brief = "The description of the rule generating the event.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Block requests to public DNS over HTTPS / TLS protocols"
                },
            },
            .license => types.AttributeInfo{
                .name = "security_rule.license",
                .brief = "Name of the license under which the rule used to generate this event is made available.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Apache 2.0"
                },
            },
            .name => types.AttributeInfo{
                .name = "security_rule.name",
                .brief = "The name of the rule or signature generating the event.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "BLOCK_DNS_over_TLS"
                },
            },
            .reference => types.AttributeInfo{
                .name = "security_rule.reference",
                .brief = "Reference URL to additional information about the rule used to generate this event.",
                .note = "The URL can point to the vendor’s documentation about the rule. If that’s not available, it can also be a link to a more general page describing this type of alert.",
                .stability = .development,
                .examples = &.{
                    "https://en.wikipedia.org/wiki/DNS_over_TLS"
                },
            },
            .rulesetName => types.AttributeInfo{
                .name = "security_rule.ruleset.name",
                .brief = "Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Standard_Protocol_Filters"
                },
            },
            .uuid => types.AttributeInfo{
                .name = "security_rule.uuid",
                .brief = "A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "550e8400-e29b-41d4-a716-446655440000",
                    "1100110011"
                },
            },
            .version => types.AttributeInfo{
                .name = "security_rule.version",
                .brief = "The version / revision of the rule being used for analysis.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1.0.0"
                },
            },
        };
    }
};

