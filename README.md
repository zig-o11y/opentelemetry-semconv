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
    const http_method_attr = semconv.http.Registry.http_request_method;
    const method_value = semconv.http.Registry.requestMethodValue.get;

    // Use JVM semantic conventions
    const jvm_version_attr = semconv.jvm.Registry.jvm_version;

    // Here you would actually set the attribute on metrics data point, log/event or trace attributes
    std.debug.print("HTTP Method: {s} = {s}\n", .{ http_method_attr.base.name, method_value.toString() });
    std.debug.print("JVM Version attribute: {s}\n", .{jvm_version_attr.name});
}
```

### Available Namespaces

All the namespaces from the official OpenTelemetry semconv are defined, most notably:

- `semconv.http` - HTTP semantic conventions
- `semconv.network` - Network-level semantic conventions
- `semconv.url` - URL semantic conventions
- `semconv.server` - Server semantic conventions
- `semconv.client` - Client semantic conventions
- `semconv."@error"` - Error semantic conventions
- `semconv.user_agent` - User Agent semantic conventions
- `semconv.telemetry` - Telemetry SDK semantic conventions

### Working with Enums

Many semantic conventions include well-known enum values, for example for `http`:

```zig
const semconv = @import("opentelemetry-semconv");

// Access HTTP request method attribute and enum values
const http_method_attr = semconv.http.Registry.http_request_method;
const get_method = semconv.http.Registry.requestMethodValue.get;

// Check stability and use the attribute
const attribute_name = if (http_method_attr.base.stability == .stable)
    http_method_attr.base.name
else
    "custom.http.request.method";

std.debug.print("Attribute: {s}, Method: {s}\n", .{ attribute_name, get_method.toString() });
```

You can use stability levels to discern if an attribute should be in place.

Each attribute comes with examples, and the enums allow type-safe assertions.

## Building

### As a Dependency

Fetch the library with `zig build fetch --save`, then add to your `build.zig`:

```zig
const semconv_dep = b.dependency("opentelemetry_semconv", .{});
exe.root_module.addImport("opentelemetry-semconv", semconv_dep.module("opentelemetry-semconv"));
```

### Building Standalone

```bash
# Build (if building as executable)
zig build
```

## Architecture

The library is organized as follows:

- `src/types.zig` - Core type definitions for attributes, stability levels, etc.
- `src/*/*.zig` - Individual semantic convention namespace modules
- `src/root.zig` - Main library interface

### Type System

The library uses a hierarchical type system:

```zig
// Base attribute types
StringAttribute = struct {
    name: []const u8,
    brief: []const u8,
    note: ?[]const u8,
    stability: StabilityLevel,
    requirement_level: RequirementLevel,
}

// Enum attributes with well-known values
EnumAttribute(EnumType) = struct {
    base: StringAttribute,
    well_known_values: EnumType,
}

// Accessing attributes
const http_method = semconv.http.Registry.http_request_method; // EnumAttribute
const http_body_size = semconv.http.Registry.http_request_body_size; // StringAttribute
```

## Testing

Run the test suite:

```bash
zig build test
```

All modules include comprehensive tests covering:
- Attribute definitions and metadata
- Enum value parsing and conversion
- Helper function behavior
- Edge cases and validation


## Compatibility

- **Zig Version**: 0.14.x+
- **OpenTelemetry Spec**: v1.28.0
- **Platforms**: All platforms supported by Zig
