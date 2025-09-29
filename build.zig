const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.addModule("opentelemetry-semconv", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "opentelemetry-semconv",
        .root_module = lib_mod,
    });

    b.installArtifact(lib);

    const lib_unit_tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_lib_unit_tests.step);

    // Examples step
    const examples_step = b.step("examples", "Build and run all example executables");

    // Basic example showing HTTP and JVM attribute usage
    const example_files: []const []const u8 = &.{
        "basic_usage.zig",
    };

    // Create executable for each example
    for (example_files) |example| {
        const example_exe = b.addExecutable(.{
            .name = std.mem.trim(u8, example, ".zig"),
            .root_source_file = try b.path("examples").join(b.allocator, example),
            .target = target,
            .optimize = optimize,
        });

        // Add the semconv module to each example
        example_exe.root_module.addImport("opentelemetry-semconv", lib_mod);

        // Install the example executable
        const run_examples = b.addRunArtifact(example_exe);

        // Add to examples step
        examples_step.dependOn(&example_exe.step);
        examples_step.dependOn(&run_examples.step);
    }
}
