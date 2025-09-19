const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

const parser = @import("parser.zig");
const generator = @import("generator.zig");
const semconv = @import("semconv.zig");

const AutomationTool = struct {
    allocator: Allocator,
    parser: parser.SemconvParser,
    generator: generator.ZigCodeGenerator,
    src_dir: []const u8,

    pub fn init(allocator: Allocator, src_dir: []const u8) AutomationTool {
        return AutomationTool{
            .allocator = allocator,
            .parser = parser.SemconvParser.init(allocator),
            .generator = generator.ZigCodeGenerator.init(allocator),
            .src_dir = src_dir,
        };
    }

    pub fn generateFromLocalYaml(self: *AutomationTool, yaml_path: []const u8, namespace: []const u8) !bool {
        print("Generating {s} from {s}\n", .{ namespace, yaml_path });

        // Parse YAML file
        var semconv_data = self.parser.parseFile(yaml_path) catch |err| {
            print("Error parsing {s}: {}\n", .{ yaml_path, err });
            return false;
        };
        defer semconv_data.deinit(self.allocator);

        // Override namespace
        self.allocator.free(semconv_data.namespace);
        semconv_data.namespace = try self.allocator.dupe(u8, namespace);

        // Create namespace directory
        const namespace_dir = try std.fs.path.join(self.allocator, &[_][]const u8{ self.src_dir, namespace });
        defer self.allocator.free(namespace_dir);

        std.fs.cwd().makeDir(namespace_dir) catch |err| switch (err) {
            error.PathAlreadyExists => {},
            else => {
                print("Error creating directory {s}: {}\n", .{ namespace_dir, err });
                return false;
            },
        };

        // Generate Zig files
        try self.generateZigFiles(semconv_data, namespace_dir);

        // Update root.zig exports
        try self.updateRootExports(namespace);

        print("Successfully generated {s} namespace\n", .{namespace});
        return true;
    }

    pub fn testNamespace(self: *AutomationTool, namespace: []const u8) !void {
        print("Testing {s} namespace:\n", .{namespace});

        const test_files = [_][]const u8{ "registry.yaml", "common.yaml", "spans.yaml", "metrics.yaml" };

        for (test_files) |file| {
            const yaml_path = try std.fmt.allocPrint(self.allocator, "test_data/{s}/{s}", .{ namespace, file });
            defer self.allocator.free(yaml_path);

            // Check if file exists
            if (std.fs.cwd().openFile(yaml_path, .{})) |test_file| {
                test_file.close();

                // Try to parse it
                if (self.parser.parseFile(yaml_path)) |semconv_data| {
                    var data = semconv_data;
                    defer data.deinit(self.allocator);

                    print("  ✓ {s}: {d} groups, {d} spans, {d} metrics\n", .{ file, data.groups.items.len, data.spans.items.len, data.metrics.items.len });
                } else |err| {
                    print("  ✗ {s}: Parse error - {}\n", .{ file, err });
                }
            } else |_| {
                print("  - {s}: Not found\n", .{file});
            }
        }
    }

    fn generateZigFiles(self: *AutomationTool, semconv_data: semconv.SemanticConvention, output_dir: []const u8) !void {
        // Extract base name from file (e.g., "entities" from "entities.yaml")
        const base_name = blk: {
            const file_name = std.fs.path.basename(semconv_data.file_name);
            if (std.mem.endsWith(u8, file_name, ".yaml")) {
                break :blk file_name[0 .. file_name.len - 5]; // Remove ".yaml"
            } else if (std.mem.endsWith(u8, file_name, ".yml")) {
                break :blk file_name[0 .. file_name.len - 4]; // Remove ".yml"
            } else {
                break :blk file_name;
            }
        };

        // Generate the main file (e.g., "entities.zig", "registry.zig")
        const registry_code = try self.generator.generateRegistryFile(semconv_data);
        defer self.allocator.free(registry_code);

        const output_filename = try std.fmt.allocPrint(self.allocator, "{s}.zig", .{base_name});
        defer self.allocator.free(output_filename);

        const registry_path = try std.fs.path.join(self.allocator, &[_][]const u8{ output_dir, output_filename });
        defer self.allocator.free(registry_path);

        try self.writeFile(registry_path, registry_code);
        print("  Generated {s}\n", .{registry_path});

        // Generate common.zig if needed
        if (try self.generator.generateCommonFile(semconv_data)) |common_code| {
            defer self.allocator.free(common_code);

            const common_path = try std.fs.path.join(self.allocator, &[_][]const u8{ output_dir, "common.zig" });
            defer self.allocator.free(common_path);

            try self.writeFile(common_path, common_code);
            print("  Generated {s}\n", .{common_path});
        }

        // Generate spans.zig if needed
        if (try self.generator.generateSpansFile(semconv_data)) |spans_code| {
            defer self.allocator.free(spans_code);

            const spans_path = try std.fs.path.join(self.allocator, &[_][]const u8{ output_dir, "spans.zig" });
            defer self.allocator.free(spans_path);

            try self.writeFile(spans_path, spans_code);
            print("  Generated {s}\n", .{spans_path});
        }

        // Generate metrics.zig if needed
        if (try self.generator.generateMetricsFile(semconv_data)) |metrics_code| {
            defer self.allocator.free(metrics_code);

            const metrics_path = try std.fs.path.join(self.allocator, &[_][]const u8{ output_dir, "metrics.zig" });
            defer self.allocator.free(metrics_path);

            try self.writeFile(metrics_path, metrics_code);
            print("  Generated {s}\n", .{metrics_path});
        }
    }

    fn writeFile(self: *AutomationTool, file_path: []const u8, content: []const u8) !void {
        _ = self;
        const file = try std.fs.cwd().createFile(file_path, .{});
        defer file.close();
        try file.writeAll(content);
    }

    fn updateRootExports(self: *AutomationTool, namespace: []const u8) !void {
        const root_path = try std.fs.path.join(self.allocator, &[_][]const u8{ self.src_dir, "root.zig" });
        defer self.allocator.free(root_path);

        // Read current content
        const file = std.fs.cwd().openFile(root_path, .{}) catch |err| switch (err) {
            error.FileNotFound => {
                print("  Warning: {s} not found, skipping export update\n", .{root_path});
                return;
            },
            else => return err,
        };
        defer file.close();

        const file_size = try file.getEndPos();
        const content = try self.allocator.alloc(u8, file_size);
        defer self.allocator.free(content);

        _ = try file.readAll(content);

        // Check if namespace is already exported
        const export_line = try std.fmt.allocPrint(self.allocator, "pub const {s} = @import(\"{s}/registry.zig\");", .{ namespace, namespace });
        defer self.allocator.free(export_line);

        if (std.mem.indexOf(u8, content, export_line) != null) {
            print("  {s} already exported in root.zig\n", .{namespace});
            return;
        }

        // Add export line (simple append for now)
        const new_content = try std.fmt.allocPrint(self.allocator, "{s}\n{s}", .{ content, export_line });
        defer self.allocator.free(new_content);

        // Write updated content
        const updated_file = try std.fs.cwd().createFile(root_path, .{});
        defer updated_file.close();
        try updated_file.writeAll(new_content);

        print("  Updated {s} to export {s}\n", .{ root_path, namespace });
    }
};

const Command = enum {
    help,
    local,
    test_ns,

    fn fromString(s: []const u8) ?Command {
        if (std.mem.eql(u8, s, "help")) return .help;
        if (std.mem.eql(u8, s, "local")) return .local;
        if (std.mem.eql(u8, s, "test")) return .test_ns;
        return null;
    }
};

fn printUsage(program_name: []const u8) void {
    print("Usage: {s} <command> [args...]\n", .{program_name});
    print("\nCommands:\n", .{});
    print("  local <yaml_file> <namespace>  Generate from local YAML file\n", .{});
    print("  test <namespace>               Test tool on namespace\n", .{});
    print("  help                          Show this help\n", .{});
    print("\nExamples:\n", .{});
    print("  {s} local ./test_data/messaging/registry.yaml messaging\n", .{program_name});
    print("  {s} test database\n", .{program_name});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) std.debug.panic("Memory leak detected", .{});

    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        printUsage(args[0]);
        return;
    }

    const command = Command.fromString(args[1]) orelse {
        print("Unknown command: {s}\n", .{args[1]});
        printUsage(args[0]);
        return;
    };

    // Default src directory (relative to build.zig directory)
    const src_dir = "src";
    var tool = AutomationTool.init(allocator, src_dir);

    switch (command) {
        .help => {
            printUsage(args[0]);
        },
        .local => {
            if (args.len != 4) {
                print("Usage: {s} local <yaml_file> <namespace>\n", .{args[0]});
                return;
            }

            const yaml_file = args[2];
            const namespace = args[3];

            if (tool.generateFromLocalYaml(yaml_file, namespace)) |_| {} else |err| {
                print("Error: {}\n", .{err});
                std.process.exit(1);
            }
        },
        .test_ns => {
            if (args.len != 3) {
                print("Usage: {s} test <namespace>\n", .{args[0]});
                return;
            }

            const namespace = args[2];
            try tool.testNamespace(namespace);
        },
    }
}
