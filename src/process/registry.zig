//! Generated from registry.yaml
//! Namespace: process
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const contextSwitchTypeValue = enum {
    ///
    voluntary,
    ///
    involuntary,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .voluntary => "voluntary",
            .involuntary => "involuntary",
        };
    }
};

pub const pagingFaultTypeValue = enum {
    ///
    major,
    ///
    minor,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .major => "major",
            .minor => "minor",
        };
    }
};

/// An operating system process.
/// Display name: Process Attributes
pub const Registry = union(enum) {
    /// Process identifier (PID).
    pid: types.StringAttribute,
    /// Parent Process identifier (PPID).
    parentPid: types.StringAttribute,
    /// Virtual process identifier.
    vpid: types.StringAttribute,
    /// The PID of the process's session leader. This is also the session ID (SID) of the process.
    sessionLeaderPid: types.StringAttribute,
    /// The PID of the process's group leader. This is also the process group ID (PGID) of the process.
    groupLeaderPid: types.StringAttribute,
    /// The GNU build ID as found in the `.note.gnu.build-id` ELF section (hex string).
    executableBuildIdGnu: types.StringAttribute,
    /// The Go build ID as retrieved by `go tool buildid <go executable>`.
    executableBuildIdGo: types.StringAttribute,
    /// Profiling specific build ID for executables. See the OTel specification for Profiles for more information.
    executableBuildIdHtlhash: types.StringAttribute,
    /// The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.
    executableName: types.StringAttribute,
    /// The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.
    executablePath: types.StringAttribute,
    /// The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.
    command: types.StringAttribute,
    /// The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.
    commandLine: types.StringAttribute,
    /// All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.
    commandArgs: types.StringAttribute,
    /// Length of the process.command_args array
    argsCount: types.StringAttribute,
    /// The username of the user that owns the process.
    owner: types.StringAttribute,
    /// The effective user ID (EUID) of the process.
    userId: types.StringAttribute,
    /// The username of the effective user of the process.
    userName: types.StringAttribute,
    /// The real user ID (RUID) of the process.
    realUserId: types.StringAttribute,
    /// The username of the real user of the process.
    realUserName: types.StringAttribute,
    /// The saved user ID (SUID) of the process.
    savedUserId: types.StringAttribute,
    /// The username of the saved user.
    savedUserName: types.StringAttribute,
    /// The name of the runtime of this process.
    runtimeName: types.StringAttribute,
    /// The version of the runtime of this process, as returned by the runtime without modification.
    runtimeVersion: types.StringAttribute,
    /// An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.
    runtimeDescription: types.StringAttribute,
    /// Process title (proctitle)
    title: types.StringAttribute,
    /// The date and time the process was created, in ISO 8601 format.
    creationTime: types.StringAttribute,
    /// The date and time the process exited, in ISO 8601 format.
    exitTime: types.StringAttribute,
    /// The exit code of the process.
    exitCode: types.StringAttribute,
    /// Whether the process is connected to an interactive shell.
    interactive: types.StringAttribute,
    /// The working directory of the process.
    workingDirectory: types.StringAttribute,
    /// Specifies whether the context switches for this data point were voluntary or involuntary.
    contextSwitchType: types.EnumAttribute(contextSwitchTypeValue),
    /// The type of page fault for this data point. Type `major` is for major/hard page faults, and `minor` is for minor/soft page faults.
    pagingFaultType: types.EnumAttribute(pagingFaultTypeValue),
    /// Process environment variables, `<key>` being the environment variable name, the value being the environment variable value.
    environmentVariable: types.StringAttribute,
    /// The control group associated with the process.
    linuxCgroup: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .pid => types.AttributeInfo{
                .name = "process.pid",
                .brief = "Process identifier (PID).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1234"
                },
            },
            .parentPid => types.AttributeInfo{
                .name = "process.parent_pid",
                .brief = "Parent Process identifier (PPID).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "111"
                },
            },
            .vpid => types.AttributeInfo{
                .name = "process.vpid",
                .brief = "Virtual process identifier.",
                .note = "The process ID within a PID namespace. This is not necessarily unique across all processes on the host but it is unique within the process namespace that the process exists within.",
                .stability = .development,
                .examples = &.{
                    "12"
                },
            },
            .sessionLeaderPid => types.AttributeInfo{
                .name = "process.session_leader.pid",
                .brief = "The PID of the process's session leader. This is also the session ID (SID) of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "14"
                },
            },
            .groupLeaderPid => types.AttributeInfo{
                .name = "process.group_leader.pid",
                .brief = "The PID of the process's group leader. This is also the process group ID (PGID) of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "23"
                },
            },
            .executableBuildIdGnu => types.AttributeInfo{
                .name = "process.executable.build_id.gnu",
                .brief = "The GNU build ID as found in the `.note.gnu.build-id` ELF section (hex string).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "c89b11207f6479603b0d49bf291c092c2b719293"
                },
            },
            .executableBuildIdGo => types.AttributeInfo{
                .name = "process.executable.build_id.go",
                .brief = "The Go build ID as retrieved by `go tool buildid <go executable>`.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "foh3mEXu7BLZjsN9pOwG/kATcXlYVCDEFouRMQed_/WwRFB1hPo9LBkekthSPG/x8hMC8emW2cCjXD0_1aY"
                },
            },
            .executableBuildIdHtlhash => types.AttributeInfo{
                .name = "process.executable.build_id.htlhash",
                .brief = "Profiling specific build ID for executables. See the OTel specification for Profiles for more information.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "600DCAFE4A110000F2BF38C493F5FB92"
                },
            },
            .executableName => types.AttributeInfo{
                .name = "process.executable.name",
                .brief = "The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "otelcol"
                },
            },
            .executablePath => types.AttributeInfo{
                .name = "process.executable.path",
                .brief = "The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "/usr/bin/cmd/otelcol"
                },
            },
            .command => types.AttributeInfo{
                .name = "process.command",
                .brief = "The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "cmd/otelcol"
                },
            },
            .commandLine => types.AttributeInfo{
                .name = "process.command_line",
                .brief = "The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "C:\\cmd\\otecol --config=\\\"my directory\\config.yaml\\\""
                },
            },
            .commandArgs => types.AttributeInfo{
                .name = "process.command_args",
                .brief = "All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .argsCount => types.AttributeInfo{
                .name = "process.args_count",
                .brief = "Length of the process.command_args array",
                .note = "This field can be useful for querying or performing bucket analysis on how many arguments were provided to start a process. More arguments may be an indication of suspicious activity.",
                .stability = .development,
                .examples = &.{
                    "4"
                },
            },
            .owner => types.AttributeInfo{
                .name = "process.owner",
                .brief = "The username of the user that owns the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "root"
                },
            },
            .userId => types.AttributeInfo{
                .name = "process.user.id",
                .brief = "The effective user ID (EUID) of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1001"
                },
            },
            .userName => types.AttributeInfo{
                .name = "process.user.name",
                .brief = "The username of the effective user of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "root"
                },
            },
            .realUserId => types.AttributeInfo{
                .name = "process.real_user.id",
                .brief = "The real user ID (RUID) of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1000"
                },
            },
            .realUserName => types.AttributeInfo{
                .name = "process.real_user.name",
                .brief = "The username of the real user of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "operator"
                },
            },
            .savedUserId => types.AttributeInfo{
                .name = "process.saved_user.id",
                .brief = "The saved user ID (SUID) of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1002"
                },
            },
            .savedUserName => types.AttributeInfo{
                .name = "process.saved_user.name",
                .brief = "The username of the saved user.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "operator"
                },
            },
            .runtimeName => types.AttributeInfo{
                .name = "process.runtime.name",
                .brief = "The name of the runtime of this process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "OpenJDK Runtime Environment"
                },
            },
            .runtimeVersion => types.AttributeInfo{
                .name = "process.runtime.version",
                .brief = "The version of the runtime of this process, as returned by the runtime without modification.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "14.0.2"
                },
            },
            .runtimeDescription => types.AttributeInfo{
                .name = "process.runtime.description",
                .brief = "An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Eclipse OpenJ9 Eclipse OpenJ9 VM openj9-0.21.0"
                },
            },
            .title => types.AttributeInfo{
                .name = "process.title",
                .brief = "Process title (proctitle)",
                .note = "In many Unix-like systems, process title (proctitle), is the string that represents the name or command line of a running process, displayed by system monitoring tools like ps, top, and htop.",
                .stability = .development,
                .examples = &.{
                    "cat /etc/hostname",
                    "xfce4-session",
                    "bash"
                },
            },
            .creationTime => types.AttributeInfo{
                .name = "process.creation.time",
                .brief = "The date and time the process was created, in ISO 8601 format.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2023-11-21T09:25:34.853Z"
                },
            },
            .exitTime => types.AttributeInfo{
                .name = "process.exit.time",
                .brief = "The date and time the process exited, in ISO 8601 format.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2023-11-21T09:26:12.315Z"
                },
            },
            .exitCode => types.AttributeInfo{
                .name = "process.exit.code",
                .brief = "The exit code of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "127"
                },
            },
            .interactive => types.AttributeInfo{
                .name = "process.interactive",
                .brief = "Whether the process is connected to an interactive shell.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .workingDirectory => types.AttributeInfo{
                .name = "process.working_directory",
                .brief = "The working directory of the process.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "/root"
                },
            },
            .contextSwitchType => types.AttributeInfo{
                .name = "process.context_switch_type",
                .brief = "Specifies whether the context switches for this data point were voluntary or involuntary.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .pagingFaultType => types.AttributeInfo{
                .name = "process.paging.fault_type",
                .brief = "The type of page fault for this data point. Type `major` is for major/hard page faults, and `minor` is for minor/soft page faults.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .environmentVariable => types.AttributeInfo{
                .name = "process.environment_variable",
                .brief = "Process environment variables, `<key>` being the environment variable name, the value being the environment variable value.",
                .note = "Examples:\n\n- an environment variable `USER` with value `\"ubuntu\"` SHOULD be recorded\nas the `process.environment_variable.USER` attribute with value `\"ubuntu\"`.\n\n- an environment variable `PATH` with value `\"/usr/local/bin:/usr/bin\"`\nSHOULD be recorded as the `process.environment_variable.PATH` attribute\nwith value `\"/usr/local/bin:/usr/bin\"`.\n",
                .stability = .development,
                .examples = &.{
                    "ubuntu",
                    "/usr/local/bin:/usr/bin"
                },
            },
            .linuxCgroup => types.AttributeInfo{
                .name = "process.linux.cgroup",
                .brief = "The control group associated with the process.",
                .note = "Control groups (cgroups) are a kernel feature used to organize and manage process resources. This attribute provides the path(s) to the cgroup(s) associated with the process, which should match the contents of the [proc/PID/cgroup https://man7.org/linux/man-pages/man7/cgroups.7.html file.\n\n",
                .stability = .development,
                .examples = &.{
                    "1:name=systemd:/user.slice/user-1000.slice/session-3.scope",
                    "0::/user.slice/user-1000.slice/user@1000.service/tmux-spawn-0267755b-4639-4a27-90ed-f19f88e53748.scope"
                },
            },
        };
    }
};

