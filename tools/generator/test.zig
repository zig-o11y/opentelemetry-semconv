const std = @import("std");
const testing = std.testing;

const yaml = @import("yaml");
const semconv = @import("semconv.zig");
const parser = @import("parser.zig");
const generator = @import("generator.zig");

test "YAML parser basic functionality" {
    const allocator = testing.allocator;

    const yaml_content =
        \\groups:
        \\  - id: test.group
        \\    brief: Test group
        \\    attributes:
        \\      - id: test.attr
        \\        type: string
        \\        brief: Test attribute
        \\        examples: ["example1", "example2"]
    ;

    var yaml_parser: yaml.Yaml = .{ .source = yaml_content };
    try yaml_parser.load(allocator);
    defer yaml_parser.deinit(allocator);

    // Basic validation
    try testing.expect(yaml_parser.docs.items.len > 0);
    const root = yaml_parser.docs.items[0];
    try testing.expect(root == .map);

    const groups = root.map.get("groups");
    try testing.expect(groups != null);
    try testing.expect(groups.? == .list);
}

test "Code generation from parsed registry file" {
    const allocator = testing.allocator;

    // Parse actual test file
    var registry_parser = parser.RegistryParser.init(allocator);
    var http_semconv = try registry_parser.parseFile("tools/fixtures/http/registry.yaml");
    defer http_semconv.deinit(allocator);

    // Generate code
    var code_generator = generator.RegistryCodeGenerator.init(allocator);
    const registry_code = try code_generator.generateRegistryFile(http_semconv, "anything.zig");
    defer allocator.free(registry_code);

    // Basic validation - check that generated code contains expected elements
    try testing.expect(std.mem.indexOf(u8, registry_code, "pub const RegistryHttp = union(enum) {") != null);
    try testing.expect(std.mem.indexOf(u8, registry_code, "requestBodySize: types.StringAttribute") != null);
    try testing.expect(std.mem.indexOf(u8, registry_code, "requestMethod: types.EnumAttribute(requestMethodValue)") != null);
    try testing.expect(std.mem.indexOf(u8, registry_code, "pub const requestMethodValue = enum {") != null);
}
