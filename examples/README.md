# OpenTelemetry Semantic Conventions - Examples

This directory contains practical examples demonstrating how to use the OpenTelemetry semantic conventions library in Zig applications.

## Building and Running Examples

### Build and run all Examples
```bash
zig build examples
```

## Examples Overview

### Cloud Monitoring Examples (`cloud_monitoring/`)

These examples demonstrate how to use the `cloud` namespace to describe attributes for virtual machines being monitored across different cloud providers:

- **`aws_ec2.zig`** - Monitor an AWS EC2 instance with proper cloud attributes including provider, region, availability zone, and resource ID
- **`gcp_compute.zig`** - Monitor a Google Cloud Compute Engine VM with GCP-specific attributes
- **`azure_vm.zig`** - Monitor an Azure Virtual Machine with Azure-specific resource identifiers
- **`multi_cloud.zig`** - Generic cloud monitoring that works across multiple providers with runtime provider detection

### Basic Usage Examples (`basic_usage/`)

These examples show fundamental usage patterns:

- **`simple_attributes.zig`** - Basic attribute creation, value setting, and metadata access
- **`attribute_info.zig`** - Working with attribute metadata like stability levels, requirements, and documentation

## Key API Patterns Demonstrated

### Attribute Creation
```zig
const semconv = @import("opentelemetry-semconv");

// Create cloud provider attribute
const provider_attr = semconv.cloud.Registry{ .provider = .{ .value = .aws } };

// Access attribute information
const attr_info = provider_attr.get();
```

### Multi-Attribute Resource Description
```zig
const CloudResource = struct {
    provider: semconv.cloud.Registry,
    region: semconv.cloud.Registry,
    account_id: semconv.cloud.Registry,
    resource_id: semconv.cloud.Registry,

    fn describe(self: CloudResource) void {
        // Use attributes for telemetry...
    }
};
```

### Provider-Specific Patterns
Each cloud provider example shows:
- Correct enum values for that provider
- Typical resource ID formats
- Region and availability zone conventions
- Platform-specific attributes

## Learning Path

1. Start with `simple_attributes.zig` to understand basic usage
2. Explore `attribute_info.zig` to see metadata capabilities
3. Check provider-specific examples for your cloud environment
4. Use `multi_cloud.zig` as a template for provider-agnostic monitoring

## Integration Notes

These examples are designed to be:
- **Copy-pasteable** into your own projects
- **Educational** with extensive comments explaining patterns
- **Practical** showing real-world monitoring scenarios
- **Type-safe** leveraging Zig's compile-time guarantees

The examples validate that the improved API (using `Registry` instead of `RegistryXXX`) provides a clean, intuitive interface for OpenTelemetry semantic conventions in Zig.
