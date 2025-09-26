//! Generated from registry.yaml
//! Namespace: profile
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const frameTypeValue = enum {
    /// [.NET](https://wikipedia.org/wiki/.NET)
    dotnet,
    /// [JVM](https://wikipedia.org/wiki/Java_virtual_machine)
    jvm,
    /// [Kernel](https://wikipedia.org/wiki/Kernel_(operating_system))
    kernel,
    /// Can be one of but not limited to [C](https://wikipedia.org/wiki/C_(programming_language)), [C++](https://wikipedia.org/wiki/C%2B%2B), [Go](https://wikipedia.org/wiki/Go_(programming_language)) or [Rust](https://wikipedia.org/wiki/Rust_(programming_language)). If possible, a more precise value MUST be used.
    native,
    /// [Perl](https://wikipedia.org/wiki/Perl)
    perl,
    /// [PHP](https://wikipedia.org/wiki/PHP)
    php,
    /// [Python](https://wikipedia.org/wiki/Python_(programming_language))
    cpython,
    /// [Ruby](https://wikipedia.org/wiki/Ruby_(programming_language))
    ruby,
    /// [V8JS](https://wikipedia.org/wiki/V8_(JavaScript_engine))
    v8js,
    /// [Erlang](https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine))
    beam,
    /// [Go](https://wikipedia.org/wiki/Go_(programming_language)),
    go,
    /// [Rust](https://wikipedia.org/wiki/Rust_(programming_language))
    rust,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .dotnet => "dotnet",
            .jvm => "jvm",
            .kernel => "kernel",
            .native => "native",
            .perl => "perl",
            .php => "php",
            .cpython => "cpython",
            .ruby => "ruby",
            .v8js => "v8js",
            .beam => "beam",
            .go => "go",
            .rust => "rust",
        };
    }
};

/// Describes the interpreter or compiler of a single frame.
pub const profile_frame_type = types.EnumAttribute(frameTypeValue){
    .base = types.StringAttribute{
        .name = "profile.frame.type",
        .brief = "Describes the interpreter or compiler of a single frame.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = frameTypeValue.dotnet,
};

