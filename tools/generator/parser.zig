const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;
const yaml = @import("yaml");
const semconv = @import("semconv.zig");
const YamlPreprocessor = @import("yaml_preprocessor.zig").YamlPreprocessor;

/// Simple parser for registry YAML files only
pub const RegistryParser = struct {
    allocator: Allocator,

    pub fn init(allocator: Allocator) RegistryParser {
        return RegistryParser{ .allocator = allocator };
    }

    pub fn parseFile(self: *RegistryParser, file_path: []const u8) !semconv.Registry {
        // Read file content
        const file = try std.fs.cwd().openFile(file_path, .{});
        defer file.close();

        const file_size = try file.getEndPos();
        const content = try self.allocator.alloc(u8, file_size);
        defer self.allocator.free(content);

        _ = try file.readAll(content);

        // Preprocess YAML to handle block scalars that zig-yaml doesn't support yet
        var preprocessor = YamlPreprocessor.init(self.allocator);
        const processed_content = try preprocessor.preprocessContent(content);
        defer self.allocator.free(processed_content);

        // Parse YAML using zig-yaml library
        var yaml_parser = yaml.Yaml{ .source = processed_content };
        defer yaml_parser.deinit(self.allocator);

        // Load the YAML into an untyped representation
        try yaml_parser.load(self.allocator);

        // Convert to registry
        return self.yamlToRegistry(&yaml_parser, file_path);
    }

    fn yamlToRegistry(self: *RegistryParser, yaml_doc: *yaml.Yaml, file_path: []const u8) !semconv.Registry {
        var result = semconv.Registry.init(self.allocator);

        // Extract file name and namespace
        const file_name = std.fs.path.basename(file_path);
        result.file_name = try self.allocator.dupe(u8, file_name);

        const dir_path = std.fs.path.dirname(file_path) orelse "";
        const namespace = std.fs.path.basename(dir_path);
        result.namespace = try self.allocator.dupe(u8, namespace);

        // Access the loaded documents
        if (yaml_doc.docs.items.len == 0) return result;

        const first_doc = yaml_doc.docs.items[0];

        // The document should be a mapping with a "groups" key
        if (first_doc != .map) return result;

        const root_map = first_doc.map;
        if (root_map.get("groups")) |groups_node| {
            // Parse groups
            if (groups_node == .list) {
                const groups_list = groups_node.list;

                // Standard processing: each item is a group
                for (groups_list) |group_item| {
                    const group = try self.parseAttributeGroup(group_item);
                    try result.groups.append(group);
                }
            }
        }

        return result;
    }

    fn parseAttributeGroup(self: *RegistryParser, yaml_value: yaml.Yaml.Value) !semconv.AttributeGroup {
        var group = semconv.AttributeGroup.init(self.allocator);

        if (yaml_value != .map) return error.InvalidGroup;
        const obj = yaml_value.map;

        // Required fields
        if (obj.get("id")) |id_value| {
            if (id_value == .string) {
                group.id = try self.allocator.dupe(u8, id_value.string);
            } else {
                group.id = try self.allocator.dupe(u8, "");
            }
        } else {
            group.id = try self.allocator.dupe(u8, "");
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value == .string) {
                group.brief = try self.allocator.dupe(u8, brief_value.string);
            } else {
                group.brief = try self.allocator.dupe(u8, "");
            }
        } else {
            group.brief = try self.allocator.dupe(u8, "");
        }

        // Optional fields
        if (obj.get("type")) |type_value| {
            if (type_value == .string) {
                group.type = try self.allocator.dupe(u8, type_value.string);
            }
        } else {
            group.type = try self.allocator.dupe(u8, "attribute_group");
        }

        if (obj.get("display_name")) |display_name_value| {
            if (display_name_value == .string) {
                group.display_name = try self.allocator.dupe(u8, display_name_value.string);
            }
        }

        if (obj.get("note")) |note_value| {
            if (note_value == .string) {
                group.note = try self.allocator.dupe(u8, note_value.string);
            }
        }

        // Parse attributes
        if (obj.get("attributes")) |attrs_value| {
            if (attrs_value == .list) {
                const attrs_array = attrs_value.list;
                for (attrs_array) |attr_value| {
                    if (self.parseAttribute(attr_value)) |attr| {
                        try group.attributes.append(attr);
                    } else |err| {
                        // Extract attribute ID for error reporting
                        if (attr_value == .map) {
                            const attr_obj = attr_value.map;
                            if (attr_obj.get("id")) |id_value| {
                                if (id_value == .string) {
                                    std.debug.print("Warning: Failed to parse attribute '{s}': {}\n", .{ id_value.string, err });
                                } else {
                                    std.debug.print("Warning: Failed to parse attribute (no ID): {}\n", .{err});
                                }
                            } else {
                                std.debug.print("Warning: Failed to parse attribute (no ID field): {}\n", .{err});
                            }
                        } else {
                            std.debug.print("Warning: Failed to parse attribute (not object): {}\n", .{err});
                        }
                    }
                }
            }
        }

        return group;
    }

    fn parseAttribute(self: *RegistryParser, yaml_value: yaml.Yaml.Value) !semconv.Attribute {
        if (yaml_value != .map) {
            std.debug.print("Warning: Expected object for attribute, got: {any}\n", .{yaml_value});
            return error.InvalidAttribute;
        }
        const obj = yaml_value.map;
        var attr = semconv.Attribute{
            .id = "",
            .type = .string,
            .brief = "",
        };

        // Required fields
        if (obj.get("id")) |id_value| {
            if (id_value == .string) {
                attr.id = try self.allocator.dupe(u8, id_value.string);
            } else {
                attr.id = try self.allocator.dupe(u8, "");
            }
        } else {
            attr.id = try self.allocator.dupe(u8, "");
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value == .string) {
                attr.brief = try self.allocator.dupe(u8, brief_value.string);
            } else {
                attr.brief = try self.allocator.dupe(u8, "");
            }
        } else {
            attr.brief = try self.allocator.dupe(u8, "");
        }

        // Parse type - can be string or object with members
        if (obj.get("type")) |type_value| {
            if (type_value == .string) {
                attr.type = semconv.AttributeType.fromString(type_value.string);
            } else if (type_value == .map) {
                // This is an enum type with members
                attr.type = .enum_type;
                const type_obj = type_value.map;
                if (type_obj.get("members")) |members_value| {
                    if (members_value == .list) {
                        const members_array = members_value.list;
                        attr.enum_members = ArrayList(semconv.EnumMember).init(self.allocator);
                        for (members_array) |member_value| {
                            if (self.parseEnumMember(member_value)) |member| {
                                try attr.enum_members.?.append(member);
                            } else |err| {
                                std.debug.print("Warning: Failed to parse enum member: {}\n", .{err});
                            }
                        }
                    }
                }
            }
        }

        // Optional fields
        if (obj.get("note")) |note_value| {
            if (note_value == .string) {
                attr.note = try self.allocator.dupe(u8, note_value.string);
            }
        }

        // Stability
        if (obj.get("stability")) |stability_value| {
            if (stability_value == .string) {
                attr.stability = semconv.StabilityLevel.fromString(stability_value.string);
            }
        }

        // Examples
        if (obj.get("examples")) |examples_value| {
            attr.examples = ArrayList([]const u8).init(self.allocator);

            if (examples_value == .list) {
                const examples_array = examples_value.list;
                for (examples_array) |example_value| {
                    if (example_value == .string) {
                        try attr.examples.?.append(try self.allocator.dupe(u8, example_value.string));
                    } else if (example_value == .int) {
                        const example_str = try std.fmt.allocPrint(self.allocator, "{d}", .{example_value.int});
                        try attr.examples.?.append(example_str);
                    }
                }
            } else if (examples_value == .string) {
                try attr.examples.?.append(try self.allocator.dupe(u8, examples_value.string));
            } else if (examples_value == .int) {
                const example_str = try std.fmt.allocPrint(self.allocator, "{d}", .{examples_value.int});
                try attr.examples.?.append(example_str);
            }
        }

        return attr;
    }

    fn parseEnumMember(self: *RegistryParser, yaml_value: yaml.Yaml.Value) !semconv.EnumMember {
        if (yaml_value != .map) return error.InvalidEnumMember;
        const obj = yaml_value.map;

        var member = semconv.EnumMember{
            .id = "",
            .value = "",
            .brief = "",
        };

        if (obj.get("id")) |id_value| {
            if (id_value == .string) {
                member.id = try self.allocator.dupe(u8, id_value.string);
            } else {
                member.id = try self.allocator.dupe(u8, "");
            }
        } else {
            member.id = try self.allocator.dupe(u8, "");
        }

        if (obj.get("value")) |value_value| {
            if (value_value == .string) {
                member.value = try self.allocator.dupe(u8, value_value.string);
            } else {
                member.value = try self.allocator.dupe(u8, "");
            }
        } else {
            member.value = try self.allocator.dupe(u8, "");
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value == .string) {
                member.brief = try self.allocator.dupe(u8, brief_value.string);
            } else {
                member.brief = try self.allocator.dupe(u8, "");
            }
        } else {
            member.brief = try self.allocator.dupe(u8, "");
        }

        if (obj.get("stability")) |stability_value| {
            if (stability_value == .string) {
                member.stability = semconv.StabilityLevel.fromString(stability_value.string);
            }
        }

        return member;
    }
};
