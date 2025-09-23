//! Generated from registry.yaml
//! Namespace: faas
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// FaaS attributes
/// Display name: Function as a Service Attributes
pub const triggerValue = enum {
    /// A response to some data source operation such as a database or filesystem read/write
    datasource,
    /// To provide an answer to an inbound HTTP request
    http,
    /// A function is set to be executed when messages are sent to a messaging system
    pubsub,
    /// A function is scheduled to be executed regularly
    timer,
    /// If none of the others apply
    other,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .datasource => "datasource",
            .http => "http",
            .pubsub => "pubsub",
            .timer => "timer",
            .other => "other",
        };
    }
};

pub const invokedProviderValue = enum {
    /// Alibaba Cloud
    alibaba_cloud,
    /// Amazon Web Services
    aws,
    /// Microsoft Azure
    azure,
    /// Google Cloud Platform
    gcp,
    /// Tencent Cloud
    tencent_cloud,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .alibaba_cloud => "alibaba_cloud",
            .aws => "aws",
            .azure => "azure",
            .gcp => "gcp",
            .tencent_cloud => "tencent_cloud",
        };
    }
};

pub const documentOperationValue = enum {
    /// When a new object is created.
    insert,
    /// When an object is modified.
    edit,
    /// When an object is deleted.
    delete,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .insert => "insert",
            .edit => "edit",
            .delete => "delete",
        };
    }
};

pub const RegistryFaas = union(enum) {
    /// The name of the single function that this runtime instance executes.
    name: types.StringAttribute,
    /// The immutable version of the function being executed.
    version: types.StringAttribute,
    /// The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.
    instance: types.StringAttribute,
    /// The amount of memory available to the serverless function converted to Bytes.
    maxMemory: types.StringAttribute,
    /// Type of the trigger which caused this function invocation.
    trigger: types.EnumAttribute(triggerValue),
    /// The name of the invoked function.
    invokedName: types.StringAttribute,
    /// The cloud provider of the invoked function.
    invokedProvider: types.EnumAttribute(invokedProviderValue),
    /// The cloud region of the invoked function.
    invokedRegion: types.StringAttribute,
    /// The invocation ID of the current function invocation.
    invocationId: types.StringAttribute,
    /// A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
    time: types.StringAttribute,
    /// A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).
    cron: types.StringAttribute,
    /// A boolean that is true if the serverless function is executed for the first time (aka cold-start).
    coldstart: types.StringAttribute,
    /// The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.
    documentCollection: types.StringAttribute,
    /// Describes the type of the operation that was performed on the data.
    documentOperation: types.EnumAttribute(documentOperationValue),
    /// A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
    documentTime: types.StringAttribute,
    /// The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.
    documentName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .name => types.AttributeInfo{
                .name = "faas.name",
                .brief = "The name of the single function that this runtime instance executes.",
                .note = "This is the name of the function as configured/deployed on the FaaS\nplatform and is usually different from the name of the callback\nfunction (which may be stored in the\n[`code.namespace`/`code.function.name`](/docs/general/attributes.md\nspan attributes).\n\nFor some cloud providers, the above definition is ambiguous. The following\ndefinition of function name MUST be used for this attribute\n(and consequently the span name) for the listed cloud providers/products:\n\n- **Azure:**  The full name `<FUNCAPP>/<FUNC>`, i.e., function app name\nfollowed by a forward slash followed by the function name (this form\ncan also be seen in the resource JSON for the function).\nThis means that a span attribute MUST be used, as an Azure function\napp can host multiple functions that would usually share\na TracerProvider (see also the `cloud.resource_id` attribute).",
                .stability = .development,
                .examples = &.{
                    "my-function",
                    "myazurefunctionapp/some-function-name"
                },
            },
            .version => types.AttributeInfo{
                .name = "faas.version",
                .brief = "The immutable version of the function being executed.",
                .note = "Depending on the cloud provider and platform, use:\n\n- **AWS Lambda:** The [function version](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html)\n(an integer represented as a decimal string).\n- **Google Cloud Run (Services):** The [revision](https://cloud.google.com/run/docs/managing/revisions)\n(i.e., the function name plus the revision suffix).\n- **Google Cloud Functions:** The value of the\n[`K_REVISION` environment variable](https://cloud.google.com/functions/docs/env-var\n- **Azure Functions:** Not applicable. Do not set this attribute.",
                .stability = .development,
                .examples = &.{
                    "26",
                    "pinkfroid-00002"
                },
            },
            .instance => types.AttributeInfo{
                .name = "faas.instance",
                .brief = "The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.",
                .note = "- **AWS Lambda:** Use the (full) log stream name.",
                .stability = .development,
                .examples = &.{
                    "2021/06/28/[$LATEST]2f399eb14537447da05ab2a2e39309de"
                },
            },
            .maxMemory => types.AttributeInfo{
                .name = "faas.max_memory",
                .brief = "The amount of memory available to the serverless function converted to Bytes.",
                .note = "It's recommended to set this attribute since e.g. too little memory can easily stop a Java AWS Lambda function from working correctly. On AWS Lambda, the environment variable `AWS_LAMBDA_FUNCTION_MEMORY_SIZE` provides this information (which must be multiplied by 1,048,576).",
                .stability = .development,
                .examples = &.{
                    "134217728"
                },
            },
            .trigger => types.AttributeInfo{
                .name = "faas.trigger",
                .brief = "Type of the trigger which caused this function invocation.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .invokedName => types.AttributeInfo{
                .name = "faas.invoked_name",
                .brief = "The name of the invoked function.",
                .note = "SHOULD be equal to the `faas.name` resource attribute of the invoked function.",
                .stability = .development,
                .examples = &.{
                    "my-function"
                },
            },
            .invokedProvider => types.AttributeInfo{
                .name = "faas.invoked_provider",
                .brief = "The cloud provider of the invoked function.",
                .note = "SHOULD be equal to the `cloud.provider` resource attribute of the invoked function.",
                .stability = .development,
                .examples = null,
            },
            .invokedRegion => types.AttributeInfo{
                .name = "faas.invoked_region",
                .brief = "The cloud region of the invoked function.",
                .note = "SHOULD be equal to the `cloud.region` resource attribute of the invoked function.",
                .stability = .development,
                .examples = &.{
                    "eu-central-1"
                },
            },
            .invocationId => types.AttributeInfo{
                .name = "faas.invocation_id",
                .brief = "The invocation ID of the current function invocation.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "af9d5aa4-a685-4c5f-a22b-444f80b3cc28"
                },
            },
            .time => types.AttributeInfo{
                .name = "faas.time",
                .brief = "A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2020-01-23T13:47:06Z"
                },
            },
            .cron => types.AttributeInfo{
                .name = "faas.cron",
                .brief = "A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "0/5 * * * ? *"
                },
            },
            .coldstart => types.AttributeInfo{
                .name = "faas.coldstart",
                .brief = "A boolean that is true if the serverless function is executed for the first time (aka cold-start).",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .documentCollection => types.AttributeInfo{
                .name = "faas.document.collection",
                .brief = "The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "myBucketName",
                    "myDbName"
                },
            },
            .documentOperation => types.AttributeInfo{
                .name = "faas.document.operation",
                .brief = "Describes the type of the operation that was performed on the data.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .documentTime => types.AttributeInfo{
                .name = "faas.document.time",
                .brief = "A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2020-01-23T13:47:06Z"
                },
            },
            .documentName => types.AttributeInfo{
                .name = "faas.document.name",
                .brief = "The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "myFile.txt",
                    "myTableName"
                },
            },
        };
    }
};

