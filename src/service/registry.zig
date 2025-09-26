//! Generated from registry.yaml
//! Namespace: service
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Logical name of the service.
pub const service_name = types.StringAttribute{
    .name = "service.name",
    .brief = "Logical name of the service.",
    .note = "MUST be the same for all instances of horizontally scaled services. If the value was not specified, SDKs MUST fallback to `unknown_service:` concatenated with [`process.executable.name`](process.md), e.g. `unknown_service:bash`. If `process.executable.name` is not available, the value MUST be set to `unknown_service`.",
    .stability = .stable,
    .requirement_level = .recommended,
};

/// The version string of the service API or implementation. The format is not defined by these conventions.
pub const service_version = types.StringAttribute{
    .name = "service.version",
    .brief = "The version string of the service API or implementation. The format is not defined by these conventions.",
    .note = null,
    .stability = .stable,
    .requirement_level = .recommended,
};

/// A namespace for `service.name`.
pub const service_namespace = types.StringAttribute{
    .name = "service.namespace",
    .brief = "A namespace for `service.name`.",
    .note = "A string value having a meaning that helps to distinguish a group of services, for example the team name that owns a group of services. `service.name` is expected to be unique within the same namespace. If `service.namespace` is not specified in the Resource then `service.name` is expected to be unique for all services that have no explicit namespace defined (so the empty/unspecified namespace is simply one more valid namespace). Zero-length namespace string is assumed equal to unspecified namespace.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The string ID of the service instance.
pub const service_instance_id = types.StringAttribute{
    .name = "service.instance.id",
    .brief = "The string ID of the service instance.",
    .note = "MUST be unique for each instance of the same `service.namespace,service.name` pair (in other words\n`service.namespace,service.name,service.instance.id` triplet MUST be globally unique). The ID helps to\ndistinguish instances of the same service that exist at the same time (e.g. instances of a horizontally scaled\nservice).\n\nImplementations, such as SDKs, are recommended to generate a random Version 1 or Version 4 [RFC\n4122](https://www.ietf.org/rfc/rfc4122.txt) UUID, but are free to use an inherent unique ID as the source of\nthis value if stability is desirable. In that case, the ID SHOULD be used as source of a UUID Version 5 and\nSHOULD use the following UUID as the namespace: `4d63009a-8d0f-11ee-aad7-4c796ed8e320`.\n\nUUIDs are typically recommended, as only an opaque value for the purposes of identifying a service instance is\nneeded. Similar to what can be seen in the man page for the\n[`/etc/machine-id`](https://www.freedesktop.org/software/systemd/man/latest/machine-id.html) file, the underlying\ndata, such as pod name and namespace should be treated as confidential, being the user's choice to expose it\nor not via another resource attribute.\n\nFor applications running behind an application server (like unicorn), we do not recommend using one identifier\nfor all processes participating in the application. Instead, it's recommended each division (e.g. a worker\nthread in unicorn) to have its own instance.id.\n\nIt's not recommended for a Collector to set `service.instance.id` if it can't unambiguously determine the\nservice instance that is generating that telemetry. For instance, creating an UUID based on `pod.name` will\nlikely be wrong, as the Collector might not know from which container within that pod the telemetry originated.\nHowever, Collectors can set the `service.instance.id` if they can unambiguously determine the service instance\nfor that telemetry. This is typically the case for scraping receivers, as they know the target address and\nport.",
    .stability = .development,
    .requirement_level = .recommended,
};

