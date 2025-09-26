//! Generated from registry.yaml
//! Namespace: cloudfoundry
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A guid or another name describing the event source.
pub const cloudfoundry_system_id = types.StringAttribute{
    .name = "cloudfoundry.system.id",
    .brief = "A guid or another name describing the event source.",
    .note = "CloudFoundry defines the `source_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the component name, e.g. \"gorouter\", for\nCloudFoundry components.\n\nWhen system components are instrumented, values from the\n[Bosh spec](https://bosh.io/docs/jobs/\nshould be used. The `system.id` should be set to\n`spec.deployment/spec.name`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// A guid describing the concrete instance of the event source.
pub const cloudfoundry_system_instance_id = types.StringAttribute{
    .name = "cloudfoundry.system.instance.id",
    .brief = "A guid describing the concrete instance of the event source.",
    .note = "CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the vm id for CloudFoundry components.\n\nWhen system components are instrumented, values from the\n[Bosh spec](https://bosh.io/docs/jobs/\nshould be used. The `system.instance.id` should be set to `spec.id`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the application.
pub const cloudfoundry_app_name = types.StringAttribute{
    .name = "cloudfoundry.app.name",
    .brief = "The name of the application.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.application_name`. This is the same value\nas reported by `cf apps`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The guid of the application.
pub const cloudfoundry_app_id = types.StringAttribute{
    .name = "cloudfoundry.app.id",
    .brief = "The guid of the application.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.application_id`. This is the same value as\nreported by `cf app <app-name> --guid`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The index of the application instance. 0 when just one instance is active.
pub const cloudfoundry_app_instance_id = types.StringAttribute{
    .name = "cloudfoundry.app.instance.id",
    .brief = "The index of the application instance. 0 when just one instance is active.",
    .note = "CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api\nIt is used for logs and metrics emitted by CloudFoundry. It is\nsupposed to contain the application instance index for applications\ndeployed on the runtime.\n\nApplication instrumentation should use the value from environment\nvariable `CF_INSTANCE_INDEX`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the CloudFoundry space the application is running in.
pub const cloudfoundry_space_name = types.StringAttribute{
    .name = "cloudfoundry.space.name",
    .brief = "The name of the CloudFoundry space the application is running in.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.space_name`. This is the same value as\nreported by `cf spaces`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The guid of the CloudFoundry space the application is running in.
pub const cloudfoundry_space_id = types.StringAttribute{
    .name = "cloudfoundry.space.id",
    .brief = "The guid of the CloudFoundry space the application is running in.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.space_id`. This is the same value as\nreported by `cf space <space-name> --guid`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the CloudFoundry organization the app is running in.
pub const cloudfoundry_org_name = types.StringAttribute{
    .name = "cloudfoundry.org.name",
    .brief = "The name of the CloudFoundry organization the app is running in.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.org_name`. This is the same value as\nreported by `cf orgs`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The guid of the CloudFoundry org the application is running in.
pub const cloudfoundry_org_id = types.StringAttribute{
    .name = "cloudfoundry.org.id",
    .brief = "The guid of the CloudFoundry org the application is running in.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.org_id`. This is the same value as\nreported by `cf org <org-name> --guid`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID identifying the process.
pub const cloudfoundry_process_id = types.StringAttribute{
    .name = "cloudfoundry.process.id",
    .brief = "The UID identifying the process.",
    .note = "Application instrumentation should use the value from environment\nvariable `VCAP_APPLICATION.process_id`. It is supposed to be equal to\n`VCAP_APPLICATION.app_id` for applications deployed to the runtime.\nFor system components, this could be the actual PID.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The type of process.
pub const cloudfoundry_process_type = types.StringAttribute{
    .name = "cloudfoundry.process.type",
    .brief = "The type of process.",
    .note = "CloudFoundry applications can consist of multiple jobs. Usually the\nmain process will be of type `web`. There can be additional background\ntasks or side-cars with different process types.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// CloudFoundry resource attributes.
/// Display name: CloudFoundry Attributes
pub const Registry = struct {
    /// A guid or another name describing the event source.
    pub const systemId = cloudfoundry_system_id;
    /// A guid describing the concrete instance of the event source.
    pub const systemInstanceId = cloudfoundry_system_instance_id;
    /// The name of the application.
    pub const appName = cloudfoundry_app_name;
    /// The guid of the application.
    pub const appId = cloudfoundry_app_id;
    /// The index of the application instance. 0 when just one instance is active.
    pub const appInstanceId = cloudfoundry_app_instance_id;
    /// The name of the CloudFoundry space the application is running in.
    pub const spaceName = cloudfoundry_space_name;
    /// The guid of the CloudFoundry space the application is running in.
    pub const spaceId = cloudfoundry_space_id;
    /// The name of the CloudFoundry organization the app is running in.
    pub const orgName = cloudfoundry_org_name;
    /// The guid of the CloudFoundry org the application is running in.
    pub const orgId = cloudfoundry_org_id;
    /// The UID identifying the process.
    pub const processId = cloudfoundry_process_id;
    /// The type of process.
    pub const processType = cloudfoundry_process_type;
};

