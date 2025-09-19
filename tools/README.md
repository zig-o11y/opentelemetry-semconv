# OpenTelemetry Semantic Convention Automation Tool

This directory contains a Zig-based automation tool to generate Zig semantic convention files from OpenTelemetry YAML definitions.

## YAML Schema Types

The tool supports two distinct YAML schema types:

### Registry Schema
Registry files define complete attribute specifications and serve as the source of truth for attribute definitions.

**Example**: `test_registry_messaging.yaml`
```yaml
groups:
  - id: messaging
    brief: Messaging semantic conventions
    attributes:
      - id: messaging.system
        type: string
        brief: Messaging system name
        examples: ["kafka", "rabbitmq"]
        stability: stable
        requirement_level: required
```

**Key characteristics:**
- Uses `id` field to define new attributes
- Includes complete specification: `type`, `brief`, `examples`, `stability`, etc.
- Generates constants and type definitions
- Creates `registry.zig` files

### Entity Schema
Entity files reference attributes defined in registry files and specify their requirement levels for specific use cases.

**Example**: `test_entity_messaging.yaml`
```yaml
groups:
  - id: messaging.publisher_entity
    type: entity
    brief: Entity representing a message publisher
    attributes:
      - ref: messaging.system
        requirement_level: required
      - ref: messaging.destination
        requirement_level: optional
```

**Key characteristics:**
- Uses `ref` field to reference existing attributes
- Includes `requirement_level` for each reference
- Must specify `type: entity` in the group definition
- Generates entity struct definitions
- Creates `entities.zig` files

## Test Files

The `tools/fixtures/` directory contains example files for both schemas:

**Registry Schema Examples:**
- `test_registry_simple.yaml` - Basic registry example
- `test_registry_messaging.yaml` - Messaging attributes registry
- `test_registry_temp.yaml` - Various attribute types

**Entity Schema Examples:**
- `test_entity_simple.yaml` - Basic entity example
- `test_entity_messaging.yaml` - Messaging entities
- `test_entity_temp.yaml` - Complex entity examples

## Structure

- `src/main.zig` - Main automation tool executable
- `src/yaml_parser.zig` - Simple YAML parser for semantic convention files
- `src/semconv.zig` - Data structures for semantic conventions
- `src/parser.zig` - Parser that converts YAML to semantic convention structures
- `src/generator.zig` - Zig code generator for registry files
- `src/test.zig` - Unit tests
- `build.zig` - Build configuration

## Building

```bash
cd tools
zig build
```

## Running Tests

```bash
cd tools
zig build test
```

## Usage

### Generate from local YAML file

```bash
zig build run -- local /path/to/registry.yaml namespace_name
```

### Test the tool

```bash
zig build run -- test namespace_name
```

### Help

```bash
zig build run -- help
```

## Examples

Generate a namespace from a local YAML file:
```bash
# Create a test YAML file
cat > test_messaging.yaml << 'EOF'
groups:
  - id: messaging
    brief: Messaging semantic conventions
    attributes:
      - id: messaging.system
        type: string
        brief: Messaging system name
        examples: ["kafka", "rabbitmq"]
        stability: stable
        requirement_level: required
      - id: messaging.destination
        type: string
        brief: Message destination name
        examples: ["user-events", "order-processing"]
        stability: stable
        requirement_level: recommended
EOF

# Generate the Zig code
zig build run -- local test_messaging.yaml messaging
```

This will:
1. Parse the YAML file
2. Generate `../src/messaging/registry.zig` with the semantic convention definitions
3. Update `../src/root.zig` to export the new namespace

## Architecture

The tool uses a pipeline approach:

1. **YAML Parser** - Custom simple YAML parser for OpenTelemetry files
2. **Semantic Convention Parser** - Converts YAML structures to typed data
3. **Code Generator** - Generates idiomatic Zig code from semantic conventions
4. **File Manager** - Handles file I/O and directory creation

## Generated Code Structure

For each namespace, the tool generates:

- `registry.zig` - Main registry with all attributes and utility functions
- `common.zig` - Common attribute groups (if present)
- `spans.zig` - Span definitions (if present)  
- `metrics.zig` - Metric definitions (if present)

The generated code follows the same patterns as the manually created namespaces, ensuring consistency across the entire codebase.

## Benefits

- **Consistency**: All generated code follows the same patterns
- **Speed**: Automates the tedious process of converting YAML to Zig
- **Accuracy**: Reduces human errors in translation
- **Maintainability**: Easy to update when OpenTelemetry specs change
- **Type Safety**: Leverages Zig's type system for semantic conventions
