//! Generated from registry.yaml
//! Namespace: container
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// A container instance.
/// Display name: Container Attributes
pub const Container = enum {
    /// Container name used by container runtime.
    name,
    /// Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/containers/run/#container-identification). The UUID might be abbreviated.
    id,
    /// The container runtime managing this container.
    runtimeName,
    /// The version of the runtime of this process, as returned by the runtime without modification.
    runtimeVersion,
    /// A description about the runtime which could include, for example details about the CRI/API version being used or other customisations.
    runtimeDescription,
    /// Name of the image the container was built on.
    imageName,
    /// Container image tags. An example can be found in [Docker Image Inspect](https://docs.docker.com/engine/api/v1.43/#tag/Image/operation/ImageInspect). Should be only the `<tag>` section of the full name for example from `registry.example.com/my-org/my-image:<tag>`.
    imageTags,
    /// Runtime specific image identifier. Usually a hash algorithm followed by a UUID.
    imageId,
    /// Repo digests of the container image as provided by the container runtime.
    imageRepoDigests,
    /// The full command run by the container as a single string representing the full command.
    commandLine,
    /// All the command arguments (including the command/executable itself) run by the container.
    commandArgs,
    /// Container labels, `<key>` being the label name, the value being the label value.
    label,
    /// The unique volume ID returned by the CSI ([Container Storage Interface](https://github.com/container-storage-interface/spec)) plugin.
    csiPluginName,

    /// Returns the StringAttribute for this container attribute
    pub fn attribute(self: @This()) types.StringAttribute {
        return switch (self) {
            .name => 
                types.StringAttribute.init(
                    "container.name",
                    "Container name used by container runtime.",
                    .development,
                    .recommended,
                ),
            .id => 
                types.StringAttribute.init(
                    "container.id",
                    "Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/containers/run/#container-identification). The UUID might be abbreviated.",
                    .development,
                    .recommended,
                ),
            .runtimeName => 
                types.StringAttribute.init(
                    "container.runtime.name",
                    "The container runtime managing this container.",
                    .development,
                    .recommended,
                ),
            .runtimeVersion => 
                types.StringAttribute.init(
                    "container.runtime.version",
                    "The version of the runtime of this process, as returned by the runtime without modification.",
                    .development,
                    .recommended,
                ),
            .runtimeDescription => 
                types.StringAttribute.init(
                    "container.runtime.description",
                    "A description about the runtime which could include, for example details about the CRI/API version being used or other customisations.",
                    .development,
                    .recommended,
                ),
            .imageName => 
                types.StringAttribute.init(
                    "container.image.name",
                    "Name of the image the container was built on.",
                    .development,
                    .recommended,
                ),
            .imageTags => 
                types.StringAttribute.init(
                    "container.image.tags",
                    "Container image tags. An example can be found in [Docker Image Inspect](https://docs.docker.com/engine/api/v1.43/#tag/Image/operation/ImageInspect). Should be only the `<tag>` section of the full name for example from `registry.example.com/my-org/my-image:<tag>`.",
                    .development,
                    .recommended,
                ),
            .imageId => 
                types.StringAttribute.init(
                    "container.image.id",
                    "Runtime specific image identifier. Usually a hash algorithm followed by a UUID.",
                    .development,
                    .recommended,
                ),
            .imageRepoDigests => 
                types.StringAttribute.init(
                    "container.image.repo_digests",
                    "Repo digests of the container image as provided by the container runtime.",
                    .development,
                    .recommended,
                ).withNote("If using embedded credentials or sensitive data, it is recommended to remove them to prevent potential leakage."),
            .commandLine => 
                types.StringAttribute.init(
                    "container.command_line",
                    "The full command run by the container as a single string representing the full command.",
                    .development,
                    .recommended,
                ),
            .commandArgs => 
                types.StringAttribute.init(
                    "container.command_args",
                    "All the command arguments (including the command/executable itself) run by the container.",
                    .development,
                    .recommended,
                ),
            .label => 
                types.StringAttribute.init(
                    "container.label",
                    "Container labels, `<key>` being the label name, the value being the label value.",
                    .development,
                    .recommended,
                ),
            .csiPluginName => 
                types.StringAttribute.init(
                    "container.csi.plugin.name",
                    "The unique volume ID returned by the CSI ([Container Storage Interface](https://github.com/container-storage-interface/spec)) plugin.",
                    .development,
                    .recommended,
                ),
        };
    }
};

