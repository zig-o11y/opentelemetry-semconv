# OpenTelemetry Semantic Conventions for Zig

A strongly-typed semantic convention library for OpenTelemetry instrumentation in Zig applications.

## Overview

This library provides Zig type definitions for OpenTelemetry semantic conventions, allowing you to use semantic convention attributes in a type-safe way in your Zig applications. The library mirrors the structure of the official [OpenTelemetry semantic conventions](https://github.com/open-telemetry/semantic-conventions) repository.

## Features

- **Strongly Typed**: All semantic convention attributes are defined with proper Zig types
- **Comprehensive**: Covers major semantic convention namespaces (HTTP, Network, URL, Server, Client, Error, User Agent, Telemetry)
- **Standards Compliant**: Based on OpenTelemetry specification v1.28.0
- **Zero Dependencies**: Uses only Zig standard library
- **Well Tested**: Comprehensive test coverage for all modules

## Usage

### Basic Usage

```zig
const std = @import("std");
const semconv = @import("opentelemetry-semconv");

pub fn main() !void {
    // Use HTTP semantic conventions
    const method_attr = semconv.http.Attributes.request_method;
    const status_attr = semconv.http.Attributes.response_status_code;
    
    // Use network semantic conventions  
    const transport_attr = semconv.network.Attributes.transport;
    
    // Use error semantic conventions
    const error_type_attr = semconv.err.Attributes.error_type;
    
    std.debug.print("HTTP method attribute: {s}\n", .{method_attr.name});
    std.debug.print("Status: {}\n", .{method_attr.stability});
}
```

### Available Namespaces

All the namespaces from the official OpenTelemetry semconv are defined, most notably:

- `semconv.http` - HTTP semantic conventions
- `semconv.network` - Network-level semantic conventions
- `semconv.url` - URL semantic conventions
- `semconv.server` - Server semantic conventions
- `semconv.client` - Client semantic conventions
- `semconv.err` - Error semantic conventions (note: `error` is a Zig keyword)
- `semconv.user_agent` - User Agent semantic conventions
- `semconv.telemetry` - Telemetry SDK semantic conventions

### Working with Enums

Many semantic conventions include well-known enum values:

```zig
const http_method = semconv.http.HttpRequestMethod.GET;
std.debug.print("HTTP method: {s}\n", .{http_method.toString()});

// Parse from string
if (semconv.http.HttpRequestMethod.fromString("POST")) |method| {
    std.debug.print("Parsed method: {s}\n", .{method.toString()});
}
```

### Helper Functions

The library includes helper functions for common operations:

```zig
// HTTP helpers
const is_error = semconv.http.isErrorStatus(404); // true
const status_class = semconv.http.getStatusClass(200); // 2

// Network helpers
const is_ipv4 = semconv.network.isIPv4Address("192.168.1.1"); // true

// URL helpers
var parsed = semconv.url.ParsedUrl.init("https://example.com/path?query=value");
try parsed.parse(allocator);
```

## Building

### As a Dependency

Fetch the library with `zig build fetch`, then add to your `build.zig`:

```zig
const semconv_dep = b.dependency("opentelemetry_semconv", .{});
exe.root_module.addImport("opentelemetry_semconv", semconv_dep.module("opentelemetry-semconv"));
```

### Building Standalone

```bash
# Run tests
zig test src/root.zig

# Build (if building as executable)
zig build
```

## Architecture

The library is organized as follows:

- `src/types.zig` - Core type definitions for attributes, stability levels, etc.
- `src/*/*.zig` - Individual semantic convention namespace modules, divided by 
- `src/root.zig` - Main library interface

### Type System

The library uses a hierarchical type system:

```zig
// Base attribute type (generic)
Attribute(ValueType)

// Specialized attribute types
StringAttribute = Attribute([]const u8)
IntAttribute = Attribute(i64)
BoolAttribute = Attribute(bool)

// Enum attributes with well-known values
EnumAttribute(EnumType) = struct {
    base: StringAttribute,
    well_known_values: []const EnumType,
}
```

## Testing

Run the test suite:

```bash
zig test src/root.zig
```

All modules include comprehensive tests covering:
- Attribute definitions and metadata
- Enum value parsing and conversion
- Helper function behavior
- Edge cases and validation

## Contributing

This library is generated from the OpenTelemetry semantic conventions specification. To add new semantic conventions:

1. Add the new namespace directory under `src/`
2. Create a `mod.zig` file following the established patterns
3. Export the module in `src/root.zig`
4. Add comprehensive tests
5. Update this README

## License

This project is licensed under the same terms as the OpenTelemetry project.

## Compatibility

- **Zig Version**: 0.14.x
- **OpenTelemetry Spec**: v1.28.0
- **Platforms**: All platforms supported by Zig
