//! Generated from registry.yaml
//! Namespace: oci
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// An OCI image manifest.
/// Display name: Open Container Initiative (OCI) Attributes
pub const RegistryOciManifest = union(enum) {
    /// The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.
    manifestDigest: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .manifestDigest => types.AttributeInfo{
                .name = "oci.manifest.digest",
                .brief = "The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.",
                .note = "Follows [OCI Image Manifest Specification](https://github.com/opencontainers/image-spec/blob/main/manifest.md), and specifically the [Digest property](https://github.com/opencontainers/image-spec/blob/main/descriptor.md\n\n An example can be found in [Example Image Manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md",
                .stability = .development,
                .examples = &.{
                    "sha256:e4ca62c0d62f3e886e684806dfe9d4e0cda60d54986898173c1083856cfda0f4"
                },
            },
        };
    }
};

