//! Generated from registry.yaml
//! Namespace: cloudevents
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
pub const cloudevents_event_id = types.StringAttribute{
    .name = "cloudevents.event_id",
    .brief = "The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
pub const cloudevents_event_source = types.StringAttribute{
    .name = "cloudevents.event_source",
    .brief = "The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
pub const cloudevents_event_spec_version = types.StringAttribute{
    .name = "cloudevents.event_spec_version",
    .brief = "The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
pub const cloudevents_event_type = types.StringAttribute{
    .name = "cloudevents.event_type",
    .brief = "The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
pub const cloudevents_event_subject = types.StringAttribute{
    .name = "cloudevents.event_subject",
    .brief = "The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

