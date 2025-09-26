//! Generated from registry.yaml
//! Namespace: faas
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The name of the single function that this runtime instance executes.
pub const faas_name = types.StringAttribute{
    .name = "faas.name",
    .brief = "The name of the single function that this runtime instance executes.",
    .note = "This is the name of the function as configured/deployed on the FaaS\nplatform and is usually different from the name of the callback\nfunction (which may be stored in the\n[`code.namespace`/`code.function.name`](/docs/general/attributes.md\nspan attributes).\n\nFor some cloud providers, the above definition is ambiguous. The following\ndefinition of function name MUST be used for this attribute\n(and consequently the span name) for the listed cloud providers/products:\n\n- **Azure:**  The full name `<FUNCAPP>/<FUNC>`, i.e., function app name\nfollowed by a forward slash followed by the function name (this form\ncan also be seen in the resource JSON for the function).\nThis means that a span attribute MUST be used, as an Azure function\napp can host multiple functions that would usually share\na TracerProvider (see also the `cloud.resource_id` attribute).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The immutable version of the function being executed.
pub const faas_version = types.StringAttribute{
    .name = "faas.version",
    .brief = "The immutable version of the function being executed.",
    .note = "Depending on the cloud provider and platform, use:\n\n- **AWS Lambda:** The [function version](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html)\n(an integer represented as a decimal string).\n- **Google Cloud Run (Services):** The [revision](https://cloud.google.com/run/docs/managing/revisions)\n(i.e., the function name plus the revision suffix).\n- **Google Cloud Functions:** The value of the\n[`K_REVISION` environment variable](https://cloud.google.com/functions/docs/env-var\n- **Azure Functions:** Not applicable. Do not set this attribute.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.
pub const faas_instance = types.StringAttribute{
    .name = "faas.instance",
    .brief = "The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.",
    .note = "- **AWS Lambda:** Use the (full) log stream name.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The amount of memory available to the serverless function converted to Bytes.
pub const faas_max_memory = types.StringAttribute{
    .name = "faas.max_memory",
    .brief = "The amount of memory available to the serverless function converted to Bytes.",
    .note = "It's recommended to set this attribute since e.g. too little memory can easily stop a Java AWS Lambda function from working correctly. On AWS Lambda, the environment variable `AWS_LAMBDA_FUNCTION_MEMORY_SIZE` provides this information (which must be multiplied by 1,048,576).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Type of the trigger which caused this function invocation.
pub const faas_trigger = types.EnumAttribute(triggerValue){
    .base = types.StringAttribute{
        .name = "faas.trigger",
        .brief = "Type of the trigger which caused this function invocation.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = triggerValue.datasource,
};

/// The name of the invoked function.
pub const faas_invoked_name = types.StringAttribute{
    .name = "faas.invoked_name",
    .brief = "The name of the invoked function.",
    .note = "SHOULD be equal to the `faas.name` resource attribute of the invoked function.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The cloud provider of the invoked function.
pub const faas_invoked_provider = types.EnumAttribute(invokedProviderValue){
    .base = types.StringAttribute{
        .name = "faas.invoked_provider",
        .brief = "The cloud provider of the invoked function.",
        .note = "SHOULD be equal to the `cloud.provider` resource attribute of the invoked function.",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = invokedProviderValue.alibaba_cloud,
};

/// The cloud region of the invoked function.
pub const faas_invoked_region = types.StringAttribute{
    .name = "faas.invoked_region",
    .brief = "The cloud region of the invoked function.",
    .note = "SHOULD be equal to the `cloud.region` resource attribute of the invoked function.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The invocation ID of the current function invocation.
pub const faas_invocation_id = types.StringAttribute{
    .name = "faas.invocation_id",
    .brief = "The invocation ID of the current function invocation.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
pub const faas_time = types.StringAttribute{
    .name = "faas.time",
    .brief = "A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).
pub const faas_cron = types.StringAttribute{
    .name = "faas.cron",
    .brief = "A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A boolean that is true if the serverless function is executed for the first time (aka cold-start).
pub const faas_coldstart = types.StringAttribute{
    .name = "faas.coldstart",
    .brief = "A boolean that is true if the serverless function is executed for the first time (aka cold-start).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.
pub const faas_document_collection = types.StringAttribute{
    .name = "faas.document.collection",
    .brief = "The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Describes the type of the operation that was performed on the data.
pub const faas_document_operation = types.EnumAttribute(documentOperationValue){
    .base = types.StringAttribute{
        .name = "faas.document.operation",
        .brief = "Describes the type of the operation that was performed on the data.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = documentOperationValue.insert,
};

/// A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
pub const faas_document_time = types.StringAttribute{
    .name = "faas.document.time",
    .brief = "A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.
pub const faas_document_name = types.StringAttribute{
    .name = "faas.document.name",
    .brief = "The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// FaaS attributes
/// Display name: Function as a Service Attributes
pub const Registry = struct {
    /// The name of the single function that this runtime instance executes.
    pub const name = faas_name;
    /// The immutable version of the function being executed.
    pub const version = faas_version;
    /// The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.
    pub const instance = faas_instance;
    /// The amount of memory available to the serverless function converted to Bytes.
    pub const maxMemory = faas_max_memory;
    /// Type of the trigger which caused this function invocation.
    pub const trigger = faas_trigger;
    /// The name of the invoked function.
    pub const invokedName = faas_invoked_name;
    /// The cloud provider of the invoked function.
    pub const invokedProvider = faas_invoked_provider;
    /// The cloud region of the invoked function.
    pub const invokedRegion = faas_invoked_region;
    /// The invocation ID of the current function invocation.
    pub const invocationId = faas_invocation_id;
    /// A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
    pub const time = faas_time;
    /// A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).
    pub const cron = faas_cron;
    /// A boolean that is true if the serverless function is executed for the first time (aka cold-start).
    pub const coldstart = faas_coldstart;
    /// The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.
    pub const documentCollection = faas_document_collection;
    /// Describes the type of the operation that was performed on the data.
    pub const documentOperation = faas_document_operation;
    /// A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
    pub const documentTime = faas_document_time;
    /// The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.
    pub const documentName = faas_document_name;
};

