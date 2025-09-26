//! Basic usage example showing how to use HTTP and JVM semantic convention attributes
const std = @import("std");
const semconv = @import("opentelemetry-semconv");

pub fn main() !void {
    std.debug.print("OpenTelemetry Semantic Conventions for Zig - Basic Usage Example\n", .{});
    std.debug.print("================================================================\n\n", .{});

    // HTTP attributes examples
    std.debug.print("HTTP Semantic Conventions:\n", .{});
    std.debug.print("--------------------------\n", .{});

    // Access HTTP request method attribute
    const http_method = semconv.http.Registry.http_request_method;
    std.debug.print("HTTP method attribute: {s}\n", .{http_method.base.name});
    std.debug.print("  Brief: {s}\n", .{http_method.base.brief});
    std.debug.print("  Stability: {s}\n", .{@tagName(http_method.base.stability)});

    // Show available HTTP method values
    std.debug.print("  Available method values:\n", .{});
    std.debug.print("    GET: {s}\n", .{semconv.http.Registry.requestMethodValue.get.toString()});
    std.debug.print("    POST: {s}\n", .{semconv.http.Registry.requestMethodValue.post.toString()});
    std.debug.print("    PUT: {s}\n", .{semconv.http.Registry.requestMethodValue.put.toString()});

    // Access HTTP status code attribute
    const http_status = semconv.http.Registry.http_response_status_code;
    std.debug.print("\nHTTP status code attribute: {s}\n", .{http_status.name});
    std.debug.print("  Brief: {s}\n", .{http_status.brief});
    std.debug.print("  Stability: {s}\n", .{@tagName(http_status.stability)});

    std.debug.print("\n", .{});

    // JVM attributes examples
    std.debug.print("JVM Semantic Conventions:\n", .{});
    std.debug.print("-------------------------\n", .{});

    // Access JVM memory type attribute
    const jvm_memory_type = semconv.jvm.Registry.jvm_memory_type;
    std.debug.print("JVM memory type attribute: {s}\n", .{jvm_memory_type.base.name});
    std.debug.print("  Brief: {s}\n", .{jvm_memory_type.base.brief});
    std.debug.print("  Stability: {s}\n", .{@tagName(jvm_memory_type.base.stability)});
    std.debug.print("  Available values:\n", .{});
    std.debug.print("    Heap: {s}\n", .{semconv.jvm.Registry.memoryTypeValue.heap.toString()});
    std.debug.print("    Non-heap: {s}\n", .{semconv.jvm.Registry.memoryTypeValue.non_heap.toString()});

    // Access JVM GC name attribute
    const jvm_gc_name = semconv.jvm.Registry.jvm_gc_name;
    std.debug.print("\nJVM GC name attribute: {s}\n", .{jvm_gc_name.name});
    std.debug.print("  Brief: {s}\n", .{jvm_gc_name.brief});
    std.debug.print("  Stability: {s}\n", .{@tagName(jvm_gc_name.stability)});

    std.debug.print("\n", .{});

    // Show how attributes can be used in practice
    std.debug.print("Practical Usage:\n", .{});
    std.debug.print("----------------\n", .{});
    std.debug.print("To use these attributes with OpenTelemetry spans:\n", .{});
    std.debug.print("  span.setAttribute(\"{s}\", \"GET\");\n", .{http_method.base.name});
    std.debug.print("  span.setAttribute(\"{s}\", 200);\n", .{http_status.name});
    std.debug.print("  span.setAttribute(\"{s}\", \"heap\");\n", .{jvm_memory_type.base.name});
    std.debug.print("  span.setAttribute(\"{s}\", \"G1 Young Generation\");\n", .{jvm_gc_name.name});

    std.debug.print("\nAll attributes are strongly-typed and include metadata for:\n", .{});
    std.debug.print("  - Attribute name\n", .{});
    std.debug.print("  - Brief description\n", .{});
    std.debug.print("  - Stability level\n", .{});
    std.debug.print("  - Requirement level\n", .{});
    std.debug.print("  - Well-known values (for enum attributes)\n", .{});
}