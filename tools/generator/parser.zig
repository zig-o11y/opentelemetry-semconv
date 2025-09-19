const std = @import("std");
const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;
const yaml_parser = @import("yaml_parser.zig");
const semconv = @import("semconv.zig");

const SpanParseError = error{
    InvalidSpan,
    InvalidGroup,
    InvalidAttribute,
    InvalidMetric,
};

/// Parser that converts YAML values to semantic convention structures
pub const SemconvParser = struct {
    allocator: Allocator,

    pub fn init(allocator: Allocator) SemconvParser {
        return SemconvParser{ .allocator = allocator };
    }

    pub fn parseFile(self: *SemconvParser, file_path: []const u8) !semconv.SemanticConvention {
        // Read file content
        const file = try std.fs.cwd().openFile(file_path, .{});
        defer file.close();

        const file_size = try file.getEndPos();
        const content = try self.allocator.alloc(u8, file_size);
        defer self.allocator.free(content);

        _ = try file.readAll(content);

        // Parse YAML using clean method to avoid memory leaks
        var yaml_value = try yaml_parser.YamlParser.parseClean(self.allocator, content);
        defer yaml_value.deinit(self.allocator);

        // Convert to semantic convention
        return self.yamlToSemanticConvention(yaml_value, file_path);
    }

    pub fn yamlToSemanticConvention(self: *SemconvParser, yaml_value: yaml_parser.YamlValue, file_path: []const u8) !semconv.SemanticConvention {
        var result = semconv.SemanticConvention.init(self.allocator);

        // Extract file name and namespace
        const file_name = std.fs.path.basename(file_path);
        result.file_name = try self.allocator.dupe(u8, file_name);

        const dir_path = std.fs.path.dirname(file_path) orelse "";
        const namespace = std.fs.path.basename(dir_path);
        result.namespace = try self.allocator.dupe(u8, namespace);

        const root_obj = yaml_value.asObject() orelse return result;

        // Parse groups
        if (root_obj.get("groups")) |groups_value| {
            if (groups_value.asArray()) |groups_array| {
                for (groups_array.items) |group_value| {
                    // Check group type first
                    const group_obj = group_value.asObject() orelse continue;
                    const group_type = if (group_obj.get("type")) |type_value|
                        type_value.asString() orelse "attribute_group"
                    else
                        "attribute_group";

                    // Only parse attribute_group types for now
                    // TODO: Add proper entity parsing support
                    if (std.mem.eql(u8, group_type, "attribute_group")) {
                        if (self.parseAttributeGroup(group_value)) |group| {
                            try result.groups.append(group);
                        } else |err| {
                            std.debug.print("Warning: Failed to parse attribute group: {}\n", .{err});
                        }
                    } else if (std.mem.eql(u8, group_type, "entity")) {
                        if (self.parseEntity(group_value)) |entity| {
                            try result.entities.append(entity);
                        } else |err| {
                            std.debug.print("Warning: Failed to parse entity: {}\n", .{err});
                        }
                    }
                    // Skip other types for now
                }
            }
        }

        // Parse spans
        if (root_obj.get("spans")) |spans_value| {
            if (spans_value.asArray()) |spans_array| {
                for (spans_array.items) |span_value| {
                    if (self.parseSpanDefinition(span_value)) |span| {
                        try result.spans.append(span);
                    } else |err| {
                        std.debug.print("Warning: Failed to parse span: {}\n", .{err});
                    }
                }
            }
        }

        // Parse metrics
        if (root_obj.get("metrics")) |metrics_value| {
            if (metrics_value.asArray()) |metrics_array| {
                for (metrics_array.items) |metric_value| {
                    if (self.parseMetricDefinition(metric_value)) |metric| {
                        try result.metrics.append(metric);
                    } else |err| {
                        std.debug.print("Warning: Failed to parse metric: {}\n", .{err});
                    }
                }
            }
        }

        return result;
    }

    fn parseAttributeGroup(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.AttributeGroup {
        var group = semconv.AttributeGroup.init(self.allocator);

        const obj = yaml_value.asObject() orelse return error.InvalidGroup;

        // Required fields
        if (obj.get("id")) |id_value| {
            if (id_value.asString()) |id| {
                group.id = try self.allocator.dupe(u8, id);
            }
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value.asString()) |brief| {
                group.brief = try self.allocator.dupe(u8, brief);
            }
        }

        // Optional fields
        if (obj.get("type")) |type_value| {
            if (type_value.asString()) |type_str| {
                group.type = try self.allocator.dupe(u8, type_str);
            }
        } else {
            group.type = try self.allocator.dupe(u8, "attribute_group");
        }

        if (obj.get("note")) |note_value| {
            if (note_value.asString()) |note| {
                group.note = try self.allocator.dupe(u8, note);
            }
        }

        if (obj.get("prefix")) |prefix_value| {
            if (prefix_value.asString()) |prefix| {
                group.prefix = try self.allocator.dupe(u8, prefix);
            }
        }

        if (obj.get("extends")) |extends_value| {
            if (extends_value.asString()) |extends| {
                group.extends = try self.allocator.dupe(u8, extends);
            }
        }

        // Parse attributes
        if (obj.get("attributes")) |attrs_value| {
            if (attrs_value.asArray()) |attrs_array| {
                for (attrs_array.items) |attr_value| {
                    if (self.parseAttribute(attr_value)) |attr| {
                        try group.attributes.append(attr);
                    } else |err| {
                        std.debug.print("Warning: Failed to parse attribute: {}\n", .{err});
                    }
                }
            }
        }

        return group;
    }

    fn parseEntity(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.Entity {
        var entity = semconv.Entity.init(self.allocator);

        const obj = yaml_value.asObject() orelse return error.InvalidEntity;

        // Required fields
        if (obj.get("id")) |id_value| {
            if (id_value.asString()) |id| {
                entity.id = try self.allocator.dupe(u8, id);
            }
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value.asString()) |brief| {
                entity.brief = try self.allocator.dupe(u8, brief);
            }
        }

        // Optional fields
        if (obj.get("type")) |type_value| {
            if (type_value.asString()) |type_str| {
                entity.type = try self.allocator.dupe(u8, type_str);
            }
        } else {
            entity.type = try self.allocator.dupe(u8, "entity");
        }

        if (obj.get("name")) |name_value| {
            if (name_value.asString()) |name| {
                entity.name = try self.allocator.dupe(u8, name);
            }
        }

        if (obj.get("note")) |note_value| {
            if (note_value.asString()) |note| {
                entity.note = try self.allocator.dupe(u8, note);
            }
        }

        if (obj.get("stability")) |stability_value| {
            if (stability_value.asString()) |stability| {
                entity.stability = try self.allocator.dupe(u8, stability);
            }
        }

        // Parse attribute references
        if (obj.get("attributes")) |attrs_value| {
            if (attrs_value.asArray()) |attrs_array| {
                for (attrs_array.items) |attr_value| {
                    if (self.parseAttributeReference(attr_value)) |attr_ref| {
                        try entity.attributes.append(attr_ref);
                    } else |err| {
                        std.debug.print("Warning: Failed to parse attribute reference: {}\n", .{err});
                    }
                }
            }
        }

        return entity;
    }

    fn parseAttributeReference(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.AttributeReference {
        const obj = yaml_value.asObject() orelse return error.InvalidAttributeReference;

        var attr_ref = semconv.AttributeReference{
            .ref = "",
            .requirement_level = null,
        };

        // Required ref field
        if (obj.get("ref")) |ref_value| {
            if (ref_value.asString()) |ref| {
                attr_ref.ref = try self.allocator.dupe(u8, ref);
            }
        }

        // Optional requirement_level field
        if (obj.get("requirement_level")) |requirement_level_value| {
            if (requirement_level_value.asString()) |requirement_level| {
                attr_ref.requirement_level = try self.allocator.dupe(u8, requirement_level);
            }
        }

        return attr_ref;
    }

    fn parseAttribute(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.Attribute {
        const obj = yaml_value.asObject() orelse return error.InvalidAttribute;

        var attr = semconv.Attribute{
            .id = "",
            .type = .string,
            .brief = "",
        };

        // Required fields
        if (obj.get("id")) |id_value| {
            if (id_value.asString()) |id| {
                attr.id = try self.allocator.dupe(u8, id);
            }
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value.asString()) |brief| {
                attr.brief = try self.allocator.dupe(u8, brief);
            }
        }

        // Type
        if (obj.get("type")) |type_value| {
            if (type_value.asString()) |type_str| {
                attr.type = semconv.AttributeType.fromString(type_str);
            }
        }

        // Optional fields
        if (obj.get("note")) |note_value| {
            if (note_value.asString()) |note| {
                attr.note = try self.allocator.dupe(u8, note);
            }
        }

        if (obj.get("tag")) |tag_value| {
            if (tag_value.asString()) |tag| {
                attr.tag = try self.allocator.dupe(u8, tag);
            }
        }

        if (obj.get("deprecated")) |deprecated_value| {
            if (deprecated_value.asString()) |deprecated| {
                attr.deprecated = try self.allocator.dupe(u8, deprecated);
            }
        }

        if (obj.get("prefix")) |prefix_value| {
            if (prefix_value.asString()) |prefix| {
                attr.prefix = try self.allocator.dupe(u8, prefix);
            }
        }

        // Stability
        if (obj.get("stability")) |stability_value| {
            if (stability_value.asString()) |stability_str| {
                attr.stability = semconv.StabilityLevel.fromString(stability_str);
            }
        }

        // Requirement level
        if (obj.get("requirement_level")) |req_value| {
            if (req_value.asString()) |req_str| {
                attr.requirement_level = semconv.RequirementLevel.fromString(req_str);
            }
        }

        // Examples
        if (obj.get("examples")) |examples_value| {
            attr.examples = ArrayList([]const u8).init(self.allocator);

            if (examples_value.asArray()) |examples_array| {
                for (examples_array.items) |example_value| {
                    if (example_value.asString()) |example| {
                        try attr.examples.?.append(try self.allocator.dupe(u8, example));
                    }
                }
            } else if (examples_value.asString()) |example| {
                try attr.examples.?.append(try self.allocator.dupe(u8, example));
            }
        }

        // Enum values (from members or allow_custom_values)
        if (obj.get("members")) |members_value| {
            if (members_value.asArray()) |members_array| {
                attr.enum_values = ArrayList([]const u8).init(self.allocator);

                for (members_array.items) |member_value| {
                    if (member_value.asObject()) |member_obj| {
                        if (member_obj.get("id")) |id_value| {
                            if (id_value.asString()) |id| {
                                try attr.enum_values.?.append(try self.allocator.dupe(u8, id));
                            }
                        } else if (member_obj.get("value")) |value_value| {
                            if (value_value.asString()) |value| {
                                try attr.enum_values.?.append(try self.allocator.dupe(u8, value));
                            }
                        }
                    } else if (member_value.asString()) |member_str| {
                        try attr.enum_values.?.append(try self.allocator.dupe(u8, member_str));
                    }
                }
            }
        }

        return attr;
    }

    fn parseSpanDefinition(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.SpanDefinition {
        const obj = yaml_value.asObject() orelse return error.InvalidSpan;

        var span = semconv.SpanDefinition{
            .span_name = "",
            .type = "span",
            .brief = "",
        };

        // Required fields
        if (obj.get("span_name")) |name_value| {
            if (name_value.asString()) |name| {
                span.span_name = try self.allocator.dupe(u8, name);
            }
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value.asString()) |brief| {
                span.brief = try self.allocator.dupe(u8, brief);
            }
        }

        // Optional fields
        if (obj.get("type")) |type_value| {
            if (type_value.asString()) |type_str| {
                span.type = try self.allocator.dupe(u8, type_str);
            }
        } else {
            span.type = try self.allocator.dupe(u8, "span");
        }

        if (obj.get("note")) |note_value| {
            if (note_value.asString()) |note| {
                span.note = try self.allocator.dupe(u8, note);
            }
        }

        // Attributes
        if (obj.get("attributes")) |attrs_value| {
            if (attrs_value.asArray()) |attrs_array| {
                span.attributes = ArrayList([]const u8).init(self.allocator);
                for (attrs_array.items) |attr_value| {
                    if (attr_value.asString()) |attr| {
                        try span.attributes.?.append(try self.allocator.dupe(u8, attr));
                    }
                }
            }
        }

        // Events
        if (obj.get("events")) |events_value| {
            if (events_value.asArray()) |events_array| {
                span.events = ArrayList([]const u8).init(self.allocator);
                for (events_array.items) |event_value| {
                    if (event_value.asString()) |event| {
                        try span.events.?.append(try self.allocator.dupe(u8, event));
                    }
                }
            }
        }

        return span;
    }

    fn parseMetricDefinition(self: *SemconvParser, yaml_value: yaml_parser.YamlValue) !semconv.MetricDefinition {
        const obj = yaml_value.asObject() orelse return error.InvalidMetric;

        var metric = semconv.MetricDefinition{
            .metric_name = "",
            .type = "metric",
            .brief = "",
            .instrument = "counter",
        };

        // Required fields
        if (obj.get("metric_name")) |name_value| {
            if (name_value.asString()) |name| {
                metric.metric_name = try self.allocator.dupe(u8, name);
            }
        }

        if (obj.get("brief")) |brief_value| {
            if (brief_value.asString()) |brief| {
                metric.brief = try self.allocator.dupe(u8, brief);
            }
        }

        if (obj.get("instrument")) |instrument_value| {
            if (instrument_value.asString()) |instrument| {
                metric.instrument = try self.allocator.dupe(u8, instrument);
            }
        } else {
            metric.instrument = try self.allocator.dupe(u8, "counter");
        }

        // Optional fields
        if (obj.get("type")) |type_value| {
            if (type_value.asString()) |type_str| {
                metric.type = try self.allocator.dupe(u8, type_str);
            }
        } else {
            metric.type = try self.allocator.dupe(u8, "metric");
        }

        if (obj.get("unit")) |unit_value| {
            if (unit_value.asString()) |unit| {
                metric.unit = try self.allocator.dupe(u8, unit);
            }
        }

        if (obj.get("note")) |note_value| {
            if (note_value.asString()) |note| {
                metric.note = try self.allocator.dupe(u8, note);
            }
        }

        // Attributes
        if (obj.get("attributes")) |attrs_value| {
            if (attrs_value.asArray()) |attrs_array| {
                metric.attributes = ArrayList([]const u8).init(self.allocator);
                for (attrs_array.items) |attr_value| {
                    if (attr_value.asString()) |attr| {
                        try metric.attributes.?.append(try self.allocator.dupe(u8, attr));
                    }
                }
            }
        }

        return metric;
    }
};
