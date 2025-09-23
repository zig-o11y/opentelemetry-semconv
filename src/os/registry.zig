//! Generated from registry.yaml
//! Namespace: os
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// The operating system (OS) on which the process represented by this resource is running.
/// Display name: Operating System Attributes
/// In case of virtualized environments, this is the operating system as it is observed by the process, i.e., the virtualized guest rather than the underlying host.
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

pub const RegistryOs = union(enum) {
    /// The operating system type.
    type: types.EnumAttribute(typeValue),
    /// Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.
    description: types.StringAttribute,
    /// Human readable operating system name.
    name: types.StringAttribute,
    /// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md
    version: types.StringAttribute,
    /// Unique identifier for a particular build or compilation of the operating system.
    buildId: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .type => types.AttributeInfo{
                .name = "os.type",
                .brief = "The operating system type.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .description => types.AttributeInfo{
                .name = "os.description",
                .brief = "Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Microsoft Windows [Version 10.0.18363.778]",
                    "Ubuntu 18.04.1 LTS"
                },
            },
            .name => types.AttributeInfo{
                .name = "os.name",
                .brief = "Human readable operating system name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "iOS",
                    "Android",
                    "Ubuntu"
                },
            },
            .version => types.AttributeInfo{
                .name = "os.version",
                .brief = "The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "14.2.1",
                    "18.04.1"
                },
            },
            .buildId => types.AttributeInfo{
                .name = "os.build_id",
                .brief = "Unique identifier for a particular build or compilation of the operating system.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "TQ3C.230805.001.B2",
                    "22621"
                },
            },
        };
    }
};

