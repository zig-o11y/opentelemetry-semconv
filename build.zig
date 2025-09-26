const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const test_filter = b.option([]const u8, "test-filter", "filter for tests") orelse &.{};

    // This creates a "module", which represents a collection of source files alongside
    // some compilation options, such as optimization mode and linked system libraries.
    // Every executable or library we compile will be based on one or more modules.
    const lib_mod = b.addModule("opentelemetry-semconv", .{
        // `root_source_file` is the Zig "entry point" of the module. If a module
        // only contains e.g. external object files, you can make this `null`.
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Now, we will create a static library based on the module we created above.
    // This creates a `std.Build.Step.Compile`, which is the build step responsible
    // for actually invoking the compiler.
    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "opentelemetry_semconv",
        .root_module = lib_mod,
    });

    // This declares intent for the library to be installed into the standard
    // location when the user invokes the "install" step (the default step when
    // running `zig build`).
    b.installArtifact(lib);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const lib_unit_tests = b.addTest(.{
        .root_module = lib_mod,
        .filters = &.{test_filter},
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests for generated code and tooling");
    test_step.dependOn(&run_lib_unit_tests.step);

    // Automation tool executable
    const automation_exe = b.addExecutable(.{
        .name = "semconv-generator",
        .root_source_file = b.path("tools/generator/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Add yaml dependency to the automation tool
    const yaml_dep = b.dependency("zig_yaml", .{
        .target = target,
        .optimize = optimize,
    });
    automation_exe.root_module.addImport("yaml", yaml_dep.module("yaml"));

    b.installArtifact(automation_exe);

    // Run command
    const run_cmd = b.addRunArtifact(automation_exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("generate", "Run the automation tool to generate semantic convention files");
    run_step.dependOn(&run_cmd.step);

    // Tests
    const tool_unit_tests = b.addTest(.{
        .root_source_file = b.path("tools/generator/test.zig"),
        .target = target,
        .optimize = .Debug,
        .filters = &.{test_filter},
    });

    // Add yaml dependency to tests too
    tool_unit_tests.root_module.addImport("yaml", yaml_dep.module("yaml"));

    const run_unit_tests = b.addRunArtifact(tool_unit_tests);
    test_step.dependOn(&run_unit_tests.step);

    // Examples step
    const examples_step = b.step("examples", "Build and run all example executables");

    // List of all example files
    const example_files = [_]struct {
        name: []const u8,
        path: []const u8,
    }{
        // Cloud monitoring examples
        .{ .name = "aws_ec2_example", .path = "examples/cloud_monitoring/aws_ec2.zig" },
        .{ .name = "gcp_compute_example", .path = "examples/cloud_monitoring/gcp_compute.zig" },
        .{ .name = "azure_vm_example", .path = "examples/cloud_monitoring/azure_vm.zig" },
        .{ .name = "multi_cloud_example", .path = "examples/cloud_monitoring/multi_cloud.zig" },

        // Basic usage examples
        .{ .name = "minimal_example", .path = "examples/basic_usage/minimal_example.zig" },
        .{ .name = "simple_attributes_example", .path = "examples/basic_usage/simple_attributes.zig" },
        .{ .name = "attribute_info_example", .path = "examples/basic_usage/attribute_info.zig" },
    };

    // Create executable for each example
    for (example_files) |example| {
        const example_exe = b.addExecutable(.{
            .name = example.name,
            .root_source_file = b.path(example.path),
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
