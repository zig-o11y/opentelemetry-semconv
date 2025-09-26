//! Generated from registry.yaml
//! Namespace: os
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const typeValue = enum {
    /// Microsoft Windows
    windows,
    /// Linux
    linux,
    /// Apple Darwin
    darwin,
    /// FreeBSD
    freebsd,
    /// NetBSD
    netbsd,
    /// OpenBSD
    openbsd,
    /// DragonFly BSD
    dragonflybsd,
    /// HP-UX (Hewlett Packard Unix)
    hpux,
    /// AIX (Advanced Interactive eXecutive)
    aix,
    /// SunOS, Oracle Solaris
    solaris,
    /// IBM z/OS
    zos,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .windows => "windows",
            .linux => "linux",
            .darwin => "darwin",
            .freebsd => "freebsd",
            .netbsd => "netbsd",
            .openbsd => "openbsd",
            .dragonflybsd => "dragonflybsd",
            .hpux => "hpux",
            .aix => "aix",
            .solaris => "solaris",
            .zos => "zos",
        };
    }
};

/// The operating system type.
pub const os_type = types.EnumAttribute(typeValue){
    .base = types.StringAttribute{
        .name = "os.type",
        .brief = "The operating system type.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = typeValue.windows,
};

/// Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.
pub const os_description = types.StringAttribute{
    .name = "os.description",
    .brief = "Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Human readable operating system name.
pub const os_name = types.StringAttribute{
    .name = "os.name",
    .brief = "Human readable operating system name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md
pub const os_version = types.StringAttribute{
    .name = "os.version",
    .brief = "The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Unique identifier for a particular build or compilation of the operating system.
pub const os_build_id = types.StringAttribute{
    .name = "os.build_id",
    .brief = "Unique identifier for a particular build or compilation of the operating system.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The operating system (OS) on which the process represented by this resource is running.
/// Display name: Operating System Attributes
/// In case of virtualized environments, this is the operating system as it is observed by the process, i.e., the virtualized guest rather than the underlying host.
pub const Registry = struct {
    /// The operating system type.
    pub const @"type" = os_type;
    /// Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.
    pub const description = os_description;
    /// Human readable operating system name.
    pub const name = os_name;
    /// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md
    pub const version = os_version;
    /// Unique identifier for a particular build or compilation of the operating system.
    pub const buildId = os_build_id;
};

