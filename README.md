# OpenTelemetry Semantic Conventions for Zig

A strongly-typed semantic convention library for OpenTelemetry instrumentation in Zig applications.

## Overview

This library provides Zig type definitions for OpenTelemetry semantic conventions, allowing you to use semantic convention attributes, metrics, resources, and traces in a type-safe way in your Zig applications. The library is generated from the official [OpenTelemetry semantic conventions](https://github.com/open-telemetry/semantic-conventions) specification.

## Features

- **Strongly Typed**: All semantic convention attributes are defined with proper Zig types
- **Comprehensive**: Covers all semantic convention namespaces (attributes, metrics, resources, traces)
- **Standards Compliant**: Based on OpenTelemetry specification v1.36.0
- **Zero Dependencies**: Uses only Zig standard library
- **Auto-generated**: Generated directly from the official semantic conventions specification
- **Rich Metadata**: Includes stability levels, requirement levels, descriptions, and well-known enum values

## Usage

### Basic Usage

```zig
const std = @import("std");
const semconv = @import("opentelemetry-semconv");

pub fn main() !void {
    // Accessing attributes from the attribute namespace
    const http_method = semconv.attribute.http_request_method;
    std.debug.assert(std.mem.eql(u8, http_method.base.name, "http.request.method"));
    std.debug.assert(http_method.base.stability == .stable);

    // Attribute with enum values
    const method_get = semconv.attribute.http_request_methodValue.get;
    std.debug.assert(std.mem.eql(u8, method_get.toString(), "GET"));

    // Accessing metrics from the metric namespace
    const http_server_duration = semconv.metric.http_server_request_duration;
    std.debug.assert(http_server_duration.instrument == .histogram);
    std.debug.assert(std.mem.eql(u8, http_server_duration.unit, "s"));

    // Accessing resource attributes
    const service_name = semconv.resource.service_name;
    std.debug.assert(service_name.requirement_level == .required);

    // Accessing trace attributes
    const db_operation_name = semconv.trace.db_operation_name;
    std.debug.assert(db_operation_name.stability == .stable);
}
```

### Available Namespaces

The library provides four main namespaces:

- `semconv.attribute` - All attribute definitions
- `semconv.metric` - All metric definitions
- `semconv.resource` - Resource attribute definitions
- `semconv.trace` - Trace-specific attribute definitions

### Working with Stability Levels

Use stability information to filter attributes and make informed decisions:

```zig
const semconv = @import("opentelemetry-semconv");

// Check if an attribute is stable
const http_method = semconv.attribute.http_request_method;
if (http_method.base.stability == .stable) {
    // Safe to use in production
}

// Filter experimental attributes
const android_state = semconv.attribute.android_app_state;
if (android_state.base.stability == .development) {
    // Handle experimental attribute
}
```

### Working with Enum Attributes

Many attributes include type-safe enum values:

```zig
const semconv = @import("opentelemetry-semconv");

// Access HTTP request method attribute
const http_method = semconv.attribute.http_request_method;

// Use well-known enum values
const methods = [_]@TypeOf(semconv.attribute.http_request_methodValue.get){
    semconv.attribute.http_request_methodValue.get,
    semconv.attribute.http_request_methodValue.post,
    semconv.attribute.http_request_methodValue.put,
    semconv.attribute.http_request_methodValue.delete,
};

// Convert to string
const method_str = methods[0].toString(); // "GET"
```

### Working with Metrics

Access metric metadata including instrument type, unit, and value type:

```zig
const semconv = @import("opentelemetry-semconv");

const http_duration = semconv.metric.http_server_request_duration;
// Metric name: "http.server.request.duration"
// Instrument type: .histogram
// Unit: "s" (seconds)
// Stability: .stable
// Value type: .double
```

## Building

### As a Dependency

Fetch the library with `zig fetch --save "git+https://zig-o11y/opentelemetry-semconv"`, then add to your `build.zig`:

```zig
const semconv_dep = b.dependency("opentelemetry_semconv", .{});
exe.root_module.addImport("opentelemetry-semconv", semconv_dep.module("opentelemetry-semconv"));
```

### Building Standalone

```bash
# Build the library
zig build

# Run tests
zig build test

# Run examples
zig build examples

# Generate code from spec (requires Docker)
zig build generate
```

## Examples

The repository includes two example files:

- [examples/basic.zig](examples/basic.zig) - Shows how to access attributes, metrics, resources, and traces
- [examples/advanced.zig](examples/advanced.zig) - Demonstrates stability filtering, enum handling, and type system usage

Run the examples:

```bash
zig build examples
```

## Architecture

The library is organized as follows:

- [src/lib.zig](src/lib.zig) - Main library interface exporting all namespaces
- [src/types.zig](src/types.zig) - Core type definitions for attributes, metrics, stability levels, etc.
- [src/attribute.zig](src/attribute.zig) - All attribute definitions (auto-generated)
- [src/metric.zig](src/metric.zig) - All metric definitions (auto-generated)
- [src/resource.zig](src/resource.zig) - Resource attribute definitions (auto-generated)
- [src/trace.zig](src/trace.zig) - Trace attribute definitions (auto-generated)

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

// Metric type
Metric = struct {
    name: []const u8,
    brief: []const u8,
    stability: StabilityLevel,
    instrument: InstrumentType,
    unit: []const u8,
    value_type: MetricValueType,
}
```

### Stability Levels

- `.stable` - The attribute is stable and should not change in backward-incompatible ways
- `.development` - The attribute is in development and may change
- `.deprecated` - The attribute is deprecated and should not be used
- `.experimental` - The attribute is experimental (alias for development)

### Requirement Levels

- `.required` - The attribute MUST be provided
- `.recommended` - The attribute SHOULD be provided when available
- `.opt_in` - The attribute MAY be provided but is not required or recommended by default
- `.conditionally_required` - The attribute is required under specific conditions

## Code Generation

This library is auto-generated from the OpenTelemetry semantic conventions specification using [Weaver](https://github.com/open-telemetry/weaver).

To regenerate the code:

```bash
zig build generate
```

This will run the generation script that downloads the latest semantic conventions and generates the Zig code.

## Testing

Run the tests:

```bash
zig build test
```

## Contributing

Contributions are welcome! Please note that most of the code is auto-generated from the OpenTelemetry specification. If you want to add features or fix bugs, focus on:

- [src/types.zig](src/types.zig) - Core type definitions
- [build.zig](build.zig) - Build configuration
- [scripts/](scripts/) - Code generation scripts and templates
- [examples/](examples/) - Example files
