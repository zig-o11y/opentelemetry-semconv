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

/// Process identifier (PID).
pub const process_pid = types.StringAttribute{
    .name = "process.pid",
    .brief = "Process identifier (PID).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Parent Process identifier (PPID).
pub const process_parent_pid = types.StringAttribute{
    .name = "process.parent_pid",
    .brief = "Parent Process identifier (PPID).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Virtual process identifier.
pub const process_vpid = types.StringAttribute{
    .name = "process.vpid",
    .brief = "Virtual process identifier.",
    .note = "The process ID within a PID namespace. This is not necessarily unique across all processes on the host but it is unique within the process namespace that the process exists within.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The PID of the process's session leader. This is also the session ID (SID) of the process.
pub const process_session_leader_pid = types.StringAttribute{
    .name = "process.session_leader.pid",
    .brief = "The PID of the process's session leader. This is also the session ID (SID) of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The PID of the process's group leader. This is also the process group ID (PGID) of the process.
pub const process_group_leader_pid = types.StringAttribute{
    .name = "process.group_leader.pid",
    .brief = "The PID of the process's group leader. This is also the process group ID (PGID) of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The GNU build ID as found in the `.note.gnu.build-id` ELF section (hex string).
pub const process_executable_build_id_gnu = types.StringAttribute{
    .name = "process.executable.build_id.gnu",
    .brief = "The GNU build ID as found in the `.note.gnu.build-id` ELF section (hex string).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The Go build ID as retrieved by `go tool buildid <go executable>`.
pub const process_executable_build_id_go = types.StringAttribute{
    .name = "process.executable.build_id.go",
    .brief = "The Go build ID as retrieved by `go tool buildid <go executable>`.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Profiling specific build ID for executables. See the OTel specification for Profiles for more information.
pub const process_executable_build_id_htlhash = types.StringAttribute{
    .name = "process.executable.build_id.htlhash",
    .brief = "Profiling specific build ID for executables. See the OTel specification for Profiles for more information.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.
pub const process_executable_name = types.StringAttribute{
    .name = "process.executable.name",
    .brief = "The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.
pub const process_executable_path = types.StringAttribute{
    .name = "process.executable.path",
    .brief = "The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.
pub const process_command = types.StringAttribute{
    .name = "process.command",
    .brief = "The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.
pub const process_command_line = types.StringAttribute{
    .name = "process.command_line",
    .brief = "The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.
pub const process_command_args = types.StringAttribute{
    .name = "process.command_args",
    .brief = "All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Length of the process.command_args array
pub const process_args_count = types.StringAttribute{
    .name = "process.args_count",
    .brief = "Length of the process.command_args array",
    .note = "This field can be useful for querying or performing bucket analysis on how many arguments were provided to start a process. More arguments may be an indication of suspicious activity.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The username of the user that owns the process.
pub const process_owner = types.StringAttribute{
    .name = "process.owner",
    .brief = "The username of the user that owns the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The effective user ID (EUID) of the process.
pub const process_user_id = types.StringAttribute{
    .name = "process.user.id",
    .brief = "The effective user ID (EUID) of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The username of the effective user of the process.
pub const process_user_name = types.StringAttribute{
    .name = "process.user.name",
    .brief = "The username of the effective user of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The real user ID (RUID) of the process.
pub const process_real_user_id = types.StringAttribute{
    .name = "process.real_user.id",
    .brief = "The real user ID (RUID) of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The username of the real user of the process.
pub const process_real_user_name = types.StringAttribute{
    .name = "process.real_user.name",
    .brief = "The username of the real user of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The saved user ID (SUID) of the process.
pub const process_saved_user_id = types.StringAttribute{
    .name = "process.saved_user.id",
    .brief = "The saved user ID (SUID) of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The username of the saved user.
pub const process_saved_user_name = types.StringAttribute{
    .name = "process.saved_user.name",
    .brief = "The username of the saved user.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the runtime of this process.
pub const process_runtime_name = types.StringAttribute{
    .name = "process.runtime.name",
    .brief = "The name of the runtime of this process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The version of the runtime of this process, as returned by the runtime without modification.
pub const process_runtime_version = types.StringAttribute{
    .name = "process.runtime.version",
    .brief = "The version of the runtime of this process, as returned by the runtime without modification.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.
pub const process_runtime_description = types.StringAttribute{
    .name = "process.runtime.description",
    .brief = "An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Process title (proctitle)
pub const process_title = types.StringAttribute{
    .name = "process.title",
    .brief = "Process title (proctitle)",
    .note = "In many Unix-like systems, process title (proctitle), is the string that represents the name or command line of a running process, displayed by system monitoring tools like ps, top, and htop.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The date and time the process was created, in ISO 8601 format.
pub const process_creation_time = types.StringAttribute{
    .name = "process.creation.time",
    .brief = "The date and time the process was created, in ISO 8601 format.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The date and time the process exited, in ISO 8601 format.
pub const process_exit_time = types.StringAttribute{
    .name = "process.exit.time",
    .brief = "The date and time the process exited, in ISO 8601 format.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The exit code of the process.
pub const process_exit_code = types.StringAttribute{
    .name = "process.exit.code",
    .brief = "The exit code of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Whether the process is connected to an interactive shell.
pub const process_interactive = types.StringAttribute{
    .name = "process.interactive",
    .brief = "Whether the process is connected to an interactive shell.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The working directory of the process.
pub const process_working_directory = types.StringAttribute{
    .name = "process.working_directory",
    .brief = "The working directory of the process.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Specifies whether the context switches for this data point were voluntary or involuntary.
pub const process_context_switch_type = types.EnumAttribute(contextSwitchTypeValue){
    .base = types.StringAttribute{
        .name = "process.context_switch_type",
        .brief = "Specifies whether the context switches for this data point were voluntary or involuntary.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = contextSwitchTypeValue.voluntary,
};

/// The type of page fault for this data point. Type `major` is for major/hard page faults, and `minor` is for minor/soft page faults.
pub const process_paging_fault_type = types.EnumAttribute(pagingFaultTypeValue){
    .base = types.StringAttribute{
        .name = "process.paging.fault_type",
        .brief = "The type of page fault for this data point. Type `major` is for major/hard page faults, and `minor` is for minor/soft page faults.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = pagingFaultTypeValue.major,
};

/// Process environment variables, `<key>` being the environment variable name, the value being the environment variable value.
pub const process_environment_variable = types.StringAttribute{
    .name = "process.environment_variable",
    .brief = "Process environment variables, `<key>` being the environment variable name, the value being the environment variable value.",
    .note = "Examples:\n\n- an environment variable `USER` with value `\"ubuntu\"` SHOULD be recorded\nas the `process.environment_variable.USER` attribute with value `\"ubuntu\"`.\n\n- an environment variable `PATH` with value `\"/usr/local/bin:/usr/bin\"`\nSHOULD be recorded as the `process.environment_variable.PATH` attribute\nwith value `\"/usr/local/bin:/usr/bin\"`.\n",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The control group associated with the process.
pub const process_linux_cgroup = types.StringAttribute{
    .name = "process.linux.cgroup",
    .brief = "The control group associated with the process.",
    .note = "Control groups (cgroups) are a kernel feature used to organize and manage process resources. This attribute provides the path(s) to the cgroup(s) associated with the process, which should match the contents of the [proc/PID/cgroup https://man7.org/linux/man-pages/man7/cgroups.7.html file.\n\n",
    .stability = .development,
    .requirement_level = .recommended,
};

