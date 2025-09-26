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
    // Use Deployment semantic conventions
    const deploy_attr = semconv.deployment.deployment_environment_name;
    const deploy_key = deploy_attr.name;
    const deploy_status = .succeeded;

    // Here you would actually set the attribute on metrics data point, log/event or trace attributes
    std.debug.print("Setting event with attribute: {s} = {s}\n", .{deploy_key, deploy_status.toString()});
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

const http_attr = semconv.http.RegistryHttp{ .requestMethod = .get};
const attribute_name = if(http_attr.get().stability == .stable){
    http_attr.get().name;
} else "custom.http.request.attribute.key"
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
