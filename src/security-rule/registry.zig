//! Generated from registry.yaml
//! Namespace: security-rule
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A categorization value keyword used by the entity using the rule for detection of this event
pub const security_rule_category = types.StringAttribute{
    .name = "security_rule.category",
    .brief = "A categorization value keyword used by the entity using the rule for detection of this event",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The description of the rule generating the event.
pub const security_rule_description = types.StringAttribute{
    .name = "security_rule.description",
    .brief = "The description of the rule generating the event.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Name of the license under which the rule used to generate this event is made available.
pub const security_rule_license = types.StringAttribute{
    .name = "security_rule.license",
    .brief = "Name of the license under which the rule used to generate this event is made available.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the rule or signature generating the event.
pub const security_rule_name = types.StringAttribute{
    .name = "security_rule.name",
    .brief = "The name of the rule or signature generating the event.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Reference URL to additional information about the rule used to generate this event.
pub const security_rule_reference = types.StringAttribute{
    .name = "security_rule.reference",
    .brief = "Reference URL to additional information about the rule used to generate this event.",
    .note = "The URL can point to the vendor’s documentation about the rule. If that’s not available, it can also be a link to a more general page describing this type of alert.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.
pub const security_rule_ruleset_name = types.StringAttribute{
    .name = "security_rule.ruleset.name",
    .brief = "Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.
pub const security_rule_uuid = types.StringAttribute{
    .name = "security_rule.uuid",
    .brief = "A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The version / revision of the rule being used for analysis.
pub const security_rule_version = types.StringAttribute{
    .name = "security_rule.version",
    .brief = "The version / revision of the rule being used for analysis.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Describes security rule attributes. Rule fields are used to capture the specifics of any observer or agent rules that generate alerts or other notable events.
/// Display name: Security Rule
pub const Registry = struct {
    /// A categorization value keyword used by the entity using the rule for detection of this event
    pub const category = security_rule_category;
    /// The description of the rule generating the event.
    pub const description = security_rule_description;
    /// Name of the license under which the rule used to generate this event is made available.
    pub const license = security_rule_license;
    /// The name of the rule or signature generating the event.
    pub const name = security_rule_name;
    /// Reference URL to additional information about the rule used to generate this event.
    pub const reference = security_rule_reference;
    /// Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.
    pub const rulesetName = security_rule_ruleset_name;
    /// A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.
    pub const uuid = security_rule_uuid;
    /// The version / revision of the rule being used for analysis.
    pub const version = security_rule_version;
};

