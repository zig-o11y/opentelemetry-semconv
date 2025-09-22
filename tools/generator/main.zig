const std = @import("std");
const parser = @import("parser.zig");
const generator = @import("generator.zig");
const fs = std.fs;
const print = std.debug.print;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    // Skip program name
    _ = args.next();

    const input_arg = args.next() orelse {
        print("Usage: generator <registry_file.yaml> [output_file.zig]\n", .{});
        return;
    };

    const output_arg = args.next() orelse "registry.zig";

    // Simple registry processor
    var processor = RegistryProcessor.init(allocator);
    defer processor.deinit();

    try processor.processRegistryFile(input_arg, output_arg);
}

const RegistryProcessor = struct {
    allocator: std.mem.Allocator,
    parser_instance: parser.RegistryParser,
    generator_instance: generator.RegistryCodeGenerator,

    pub fn init(allocator: std.mem.Allocator) RegistryProcessor {
        return RegistryProcessor{
            .allocator = allocator,
            .parser_instance = parser.RegistryParser.init(allocator),
            .generator_instance = generator.RegistryCodeGenerator.init(allocator),
        };
    }

    pub fn deinit(self: *RegistryProcessor) void {
        _ = self;
    }

    pub fn processRegistryFile(self: *RegistryProcessor, input_file: []const u8, output_file: []const u8) !void {
        print("Processing registry file: {s}\n", .{input_file});

        // Use arena allocator for temporary allocations
        var arena = std.heap.ArenaAllocator.init(self.allocator);
        defer arena.deinit();
        const arena_allocator = arena.allocator();

        // Create parser with arena allocator for temporary data
        var arena_parser = parser.RegistryParser.init(arena_allocator);
        const registry = try arena_parser.parseFile(input_file);

        const zig_code = try self.generator_instance.generateRegistryFile(registry, output_file);
        defer self.allocator.free(zig_code);

        // Create target directory if it doesn't exist
        if (std.fs.path.dirname(output_file)) |dir_path| {
            std.fs.cwd().makePath(dir_path) catch |err| switch (err) {
                error.PathAlreadyExists => {}, // Directory already exists, that's fine
                else => return err, // Re-throw other errors
            };
        }

        try std.fs.cwd().writeFile(.{ .sub_path = output_file, .data = zig_code });
        print("Generated: {s}\n", .{output_file});
    }
};
