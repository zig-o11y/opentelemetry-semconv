//! Generated from registry.yaml
//! Namespace: oci
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.
pub const oci_manifest_digest = types.StringAttribute{
    .name = "oci.manifest.digest",
    .brief = "The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.",
    .note = "Follows [OCI Image Manifest Specification](https://github.com/opencontainers/image-spec/blob/main/manifest.md), and specifically the [Digest property](https://github.com/opencontainers/image-spec/blob/main/descriptor.md\n\n An example can be found in [Example Image Manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md",
    .stability = .development,
    .requirement_level = .recommended,
};

/// An OCI image manifest.
/// Display name: Open Container Initiative (OCI) Attributes
pub const Registry = struct {
    /// The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.
    pub const manifestDigest = oci_manifest_digest;
};

