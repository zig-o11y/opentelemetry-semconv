//! Generated from registry.yaml
//! Namespace: cloudfoundry
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// CloudFoundry resource attributes.
/// Display name: CloudFoundry Attributes
pub const RegistryCloudfoundry = union(enum) {
    /// A guid or another name describing the event source.
    systemId: types.StringAttribute,
    /// A guid describing the concrete instance of the event source.
    systemInstanceId: types.StringAttribute,
    /// The name of the application.
    appName: types.StringAttribute,
    /// The guid of the application.
    appId: types.StringAttribute,
    /// The index of the application instance. 0 when just one instance is active.
    appInstanceId: types.StringAttribute,
    /// The name of the CloudFoundry space the application is running in.
    spaceName: types.StringAttribute,
    /// The guid of the CloudFoundry space the application is running in.
    spaceId: types.StringAttribute,
    /// The name of the CloudFoundry organization the app is running in.
    orgName: types.StringAttribute,
    /// The guid of the CloudFoundry org the application is running in.
    orgId: types.StringAttribute,
    /// The UID identifying the process.
    processId: types.StringAttribute,
    /// The type of process.
    processType: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .systemId => types.AttributeInfo{
                .name = "cloudfoundry.system.id",
                .brief = "A guid or another name describing the event source.",
                .note = "CloudFoundry defines the `source_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the component name, e.g. \"gorouter\", for\nCloudFoundry components.\n\nWhen system components are instrumented, values from the\n[Bosh spec](https://bosh.io/docs/jobs/\nshould be used. The `system.id` should be set to\n`spec.deployment/spec.name`.",
                .stability = .development,
                .examples = &.{
                    "cf/gorouter"
                },
            },
            .systemInstanceId => types.AttributeInfo{
                .name = "cloudfoundry.system.instance.id",
                .brief = "A guid describing the concrete instance of the event source.",
                .note = "CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the vm id for CloudFoundry components.\n\nWhen system components are instrumented, values from the\n[Bosh spec](https://bosh.io/docs/jobs/\nshould be used. The `system.instance.id` should be set to `spec.id`.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .appName => types.AttributeInfo{
                .name = "cloudfoundry.app.name",
                .brief = "The name of the application.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.application_name`. This is the same value\nas reported by `cf apps`.",
                .stability = .development,
                .examples = &.{
                    "my-app-name"
                },
            },
            .appId => types.AttributeInfo{
                .name = "cloudfoundry.app.id",
                .brief = "The guid of the application.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.application_id`. This is the same value as\nreported by `cf app <app-name> --guid`.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .appInstanceId => types.AttributeInfo{
                .name = "cloudfoundry.app.instance.id",
                .brief = "The index of the application instance. 0 when just one instance is active.",
                .note = "CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the application instance index for applications\ndeployed on the runtime.\n\nApplication instrumentation should use the value from environment\nvariable `CF_INSTANCE_INDEX`.",
                .stability = .development,
                .examples = &.{
                    "0",
                    "1"
                },
            },
            .spaceName => types.AttributeInfo{
                .name = "cloudfoundry.space.name",
                .brief = "The name of the CloudFoundry space the application is running in.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.space_name`. This is the same value as\nreported by `cf spaces`.",
                .stability = .development,
                .examples = &.{
                    "my-space-name"
                },
            },
            .spaceId => types.AttributeInfo{
                .name = "cloudfoundry.space.id",
                .brief = "The guid of the CloudFoundry space the application is running in.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.space_id`. This is the same value as\nreported by `cf space <space-name> --guid`.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .orgName => types.AttributeInfo{
                .name = "cloudfoundry.org.name",
                .brief = "The name of the CloudFoundry organization the app is running in.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.org_name`. This is the same value as\nreported by `cf orgs`.",
                .stability = .development,
                .examples = &.{
                    "my-org-name"
                },
            },
            .orgId => types.AttributeInfo{
                .name = "cloudfoundry.org.id",
                .brief = "The guid of the CloudFoundry org the application is running in.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.org_id`. This is the same value as\nreported by `cf org <org-name> --guid`.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .processId => types.AttributeInfo{
                .name = "cloudfoundry.process.id",
                .brief = "The UID identifying the process.",
                .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.process_id`. It is supposed to be equal to\n`VCAP_APPLICATION.app_id` for applications deployed to the runtime.\nFor system components, this could be the actual PID.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .processType => types.AttributeInfo{
                .name = "cloudfoundry.process.type",
                .brief = "The type of process.",
                .note = "CloudFoundry applications can consist of multiple jobs. Usually the\nmain process will be of type `web`. There can be additional background\ntasks or side-cars with different process types.",
                .stability = .development,
                .examples = &.{
                    "web"
                },
            },
        };
    }
};

