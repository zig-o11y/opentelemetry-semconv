//! Generated from registry.yaml
//! Namespace: cloudevents
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines attributes for CloudEvents.
/// Display name: CloudEvents Attributes
pub const RegistryCloudevents = union(enum) {
    /// The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
    eventId: types.StringAttribute,
    /// The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
    eventSource: types.StringAttribute,
    /// The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
    eventSpecVersion: types.StringAttribute,
    /// The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
    eventType: types.StringAttribute,
    /// The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md
    eventSubject: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .eventId => types.AttributeInfo{
                .name = "cloudevents.event_id",
                .brief = "The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "123e4567-e89b-12d3-a456-426614174000",
                    "1"
                },
            },
            .eventSource => types.AttributeInfo{
                .name = "cloudevents.event_source",
                .brief = "The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "https://github.com/cloudevents",
                    "/cloudevents/spec/pull/123",
                    "my-service"
                },
            },
            .eventSpecVersion => types.AttributeInfo{
                .name = "cloudevents.event_spec_version",
                .brief = "The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .eventType => types.AttributeInfo{
                .name = "cloudevents.event_type",
                .brief = "The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "com.github.pull_request.opened",
                    "com.example.object.deleted.v2"
                },
            },
            .eventSubject => types.AttributeInfo{
                .name = "cloudevents.event_subject",
                .brief = "The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "mynewfile.jpg"
                },
            },
        };
    }
};

