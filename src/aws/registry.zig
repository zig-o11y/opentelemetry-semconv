//! AWS semantic conventions
//!
//! This module provides semantic convention attributes for AWS services instrumentation.
//! Based on OpenTelemetry AWS semantic conventions.

const std = @import("std");
const types = @import("../types.zig");

/// General AWS attributes
pub const Attributes = struct {
    /// The AWS request ID as returned in the response headers.
    pub const request_id = types.StringAttribute.init(
        "aws.request_id",
        "The AWS request ID as returned in the response headers `x-amzn-requestid`, `x-amzn-request-id` or `x-amz-request-id`.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "79b9da39-b7ae-508a-a6bc-864b2829c622", "C9ER4AJX75574TDJ" });

    /// The AWS extended request ID as returned in the response header.
    pub const extended_request_id = types.StringAttribute.init(
        "aws.extended_request_id",
        "The AWS extended request ID as returned in the response header `x-amz-id-2`.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"wzHcyEWfmOGDIE5QOhTAqFDoDWP3y8IUvpNINCwL9N4TEHbUw0/gZJ+VZTmCNCWR7fezEN3eCiQ="});
};

/// Amazon DynamoDB attributes
pub const DynamoDbAttributes = struct {
    /// The keys in the RequestItems object field.
    pub const table_names = types.ArrayAttribute.init(
        "aws.dynamodb.table_names",
        .string,
        "The keys in the `RequestItems` object field.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "Users", "Cats" });

    /// The JSON-serialized value of each item in the ConsumedCapacity response field.
    pub const consumed_capacity = types.ArrayAttribute.init(
        "aws.dynamodb.consumed_capacity",
        .string,
        "The JSON-serialized value of each item in the `ConsumedCapacity` response field.",
        .experimental,
        .recommended,
    );

    /// The value of the ProvisionedThroughput.ReadCapacityUnits request parameter.
    pub const provisioned_read_capacity = types.DoubleAttribute.init(
        "aws.dynamodb.provisioned_read_capacity",
        "The value of the `ProvisionedThroughput.ReadCapacityUnits` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_]f64{ 1.0, 2.0 });

    /// The value of the ProvisionedThroughput.WriteCapacityUnits request parameter.
    pub const provisioned_write_capacity = types.DoubleAttribute.init(
        "aws.dynamodb.provisioned_write_capacity",
        "The value of the `ProvisionedThroughput.WriteCapacityUnits` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_]f64{ 1.0, 2.0 });

    /// The value of the ConsistentRead request parameter.
    pub const consistent_read = types.BooleanAttribute.init(
        "aws.dynamodb.consistent_read",
        "The value of the `ConsistentRead` request parameter.",
        .experimental,
        .recommended,
    );

    /// The value of the ProjectionExpression request parameter.
    pub const projection = types.StringAttribute.init(
        "aws.dynamodb.projection",
        "The value of the `ProjectionExpression` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "Title", "Title, Price, Color", "Title, Description, RelatedItems, ProductReviews" });

    /// The value of the Limit request parameter.
    pub const limit = types.IntAttribute.init(
        "aws.dynamodb.limit",
        "The value of the `Limit` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_]i64{10});

    /// The value of the AttributesToGet request parameter.
    pub const attributes_to_get = types.ArrayAttribute.init(
        "aws.dynamodb.attributes_to_get",
        .string,
        "The value of the `AttributesToGet` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "lives", "id" });

    /// The value of the IndexName request parameter.
    pub const index_name = types.StringAttribute.init(
        "aws.dynamodb.index_name",
        "The value of the `IndexName` request parameter.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"name_to_group"});
};

/// Amazon ECS attributes
pub const EcsAttributes = struct {
    /// The Amazon Resource Name (ARN) of an ECS container instance.
    pub const container_arn = types.StringAttribute.init(
        "aws.ecs.container.arn",
        "The Amazon Resource Name (ARN) of an ECS container instance.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"arn:aws:ecs:us-west-1:123456789123:container/32624152-9086-4f0e-acae-1a75b14fe4d9"});

    /// The ARN of an ECS cluster.
    pub const cluster_arn = types.StringAttribute.init(
        "aws.ecs.cluster.arn",
        "The ARN of an ECS cluster.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"arn:aws:ecs:us-west-2:123456789123:cluster/my-cluster"});

    /// The launch type for an ECS task.
    pub const launch_type = types.EnumAttribute.init(
        "aws.ecs.launchtype",
        "The launch type for an ECS task.",
        .experimental,
        .recommended,
    ).withMembers(&[_]types.EnumMember{
        .{ .value = "ec2", .brief = "Amazon EC2", .stability = .experimental },
        .{ .value = "fargate", .brief = "Amazon Fargate", .stability = .experimental },
    });

    /// The ARN of a running ECS task.
    pub const task_arn = types.StringAttribute.init(
        "aws.ecs.task.arn",
        "The ARN of a running ECS task.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{
        "arn:aws:ecs:us-west-1:123456789123:task/10838bed-421f-43ef-870a-f43feacbbb5b",
        "arn:aws:ecs:us-west-1:123456789123:task/my-cluster/task-id/23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd",
    });

    /// The family name of the ECS task definition.
    pub const task_family = types.StringAttribute.init(
        "aws.ecs.task.family",
        "The family name of the ECS task definition used to create the ECS task.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"opentelemetry-family"});

    /// The ID of a running ECS task.
    pub const task_id = types.StringAttribute.init(
        "aws.ecs.task.id",
        "The ID of a running ECS task. The ID MUST be extracted from `task.arn`.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "10838bed-421f-43ef-870a-f43feacbbb5b", "23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd" });

    /// The revision for the task definition.
    pub const task_revision = types.StringAttribute.init(
        "aws.ecs.task.revision",
        "The revision for the task definition used to create the ECS task.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{ "8", "26" });
};

/// Amazon S3 attributes
pub const S3Attributes = struct {
    /// The S3 bucket name the request refers to.
    pub const bucket = types.StringAttribute.init(
        "aws.s3.bucket",
        "The S3 bucket name the request refers to. Corresponds to the `--bucket` parameter of the S3 API operations.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"some-bucket-name"})
        .withNote("The `bucket` attribute is applicable to all S3 operations that reference a bucket, i.e. that require the bucket name as a mandatory parameter. " ++
        "This applies to almost all S3 operations except `list-buckets`.");

    /// The S3 object key the request refers to.
    pub const key = types.StringAttribute.init(
        "aws.s3.key",
        "The S3 object key the request refers to. Corresponds to the `--key` parameter of the S3 API operations.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"someFile.yml"})
        .withNote("The `key` attribute is applicable to all object-related S3 operations, i.e. that require the object key as a mandatory parameter.");

    /// The source object for the copy operation.
    pub const copy_source = types.StringAttribute.init(
        "aws.s3.copy_source",
        "The source object (in the form `bucket`/`key`) for the copy operation.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"someFile.yml"})
        .withNote("The `copy_source` attribute applies to S3 copy operations and corresponds to the `--copy-source` parameter of the copy-object operation within the S3 API.");

    /// Upload ID that identifies the multipart upload.
    pub const upload_id = types.StringAttribute.init(
        "aws.s3.upload_id",
        "Upload ID that identifies the multipart upload.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"dfRtDYWFbkRONycy.Yxwh66Yjlx.cph0gtNBtJ"})
        .withNote("The `upload_id` attribute applies to S3 multipart-upload operations and corresponds to the `--upload-id` parameter of the S3 API multipart operations.");

    /// The part number of the part being uploaded in a multipart-upload operation.
    pub const part_number = types.IntAttribute.init(
        "aws.s3.part_number",
        "The part number of the part being uploaded in a multipart-upload operation. This is a positive integer between 1 and 10,000.",
        .experimental,
        .recommended,
    ).withExamples(&[_]i64{3456})
        .withNote("The `part_number` attribute is only applicable to the upload-part and upload-part-copy operations.");
};

/// Amazon Lambda attributes
pub const LambdaAttributes = struct {
    /// The full invoked ARN as provided on the Context.
    pub const invoked_arn = types.StringAttribute.init(
        "aws.lambda.invoked_arn",
        "The full invoked ARN as provided on the `Context` passed to the function (`Lambda-Runtime-Invoked-Function-Arn` header on the `/runtime/invocation/next` applicable).",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"arn:aws:lambda:us-east-1:123456:function:myfunction:myalias"})
        .withNote("This may be different from `cloud.resource_id` if an alias is involved.");

    /// The UUID of the AWS Lambda EventSource Mapping.
    pub const resource_mapping_id = types.StringAttribute.init(
        "aws.lambda.resource_mapping.id",
        "The UUID of the AWS Lambda EventSource Mapping.",
        .experimental,
        .recommended,
    ).withExamples(&[_][]const u8{"587ad24b-03b9-4413-8202-bbd56b36e5b7"});
};

/// Helper functions for AWS operations
pub const AwsUtils = struct {
    /// Extract region from AWS ARN
    pub fn extractRegionFromArn(arn: []const u8) ?[]const u8 {
        // ARN format: arn:partition:service:region:account-id:resource
        var parts = std.mem.split(u8, arn, ":");
        var i: u8 = 0;
        while (parts.next()) |part| {
            if (i == 3) { // Region is the 4th part (0-indexed)
                if (part.len > 0) return part;
                break;
            }
            i += 1;
        }
        return null;
    }

    /// Extract service from AWS ARN
    pub fn extractServiceFromArn(arn: []const u8) ?[]const u8 {
        // ARN format: arn:partition:service:region:account-id:resource
        var parts = std.mem.split(u8, arn, ":");
        var i: u8 = 0;
        while (parts.next()) |part| {
            if (i == 2) { // Service is the 3rd part (0-indexed)
                if (part.len > 0) return part;
                break;
            }
            i += 1;
        }
        return null;
    }

    /// Extract account ID from AWS ARN
    pub fn extractAccountIdFromArn(arn: []const u8) ?[]const u8 {
        // ARN format: arn:partition:service:region:account-id:resource
        var parts = std.mem.split(u8, arn, ":");
        var i: u8 = 0;
        while (parts.next()) |part| {
            if (i == 4) { // Account ID is the 5th part (0-indexed)
                if (part.len > 0) return part;
                break;
            }
            i += 1;
        }
        return null;
    }

    /// Check if ARN is valid format
    pub fn isValidArn(arn: []const u8) bool {
        if (!std.mem.startsWith(u8, arn, "arn:")) return false;

        var parts = std.mem.split(u8, arn, ":");
        var count: u8 = 0;
        while (parts.next()) |_| {
            count += 1;
        }

        // ARN should have at least 6 parts
        return count >= 6;
    }

    /// Extract ECS task ID from task ARN
    pub fn extractEcsTaskId(task_arn: []const u8) ?[]const u8 {
        // Format: arn:aws:ecs:region:account:task/cluster-name/task-id
        // or: arn:aws:ecs:region:account:task/task-id
        if (std.mem.lastIndexOf(u8, task_arn, "/")) |last_slash| {
            return task_arn[last_slash + 1 ..];
        }
        return null;
    }
};

// Tests
test "AWS ARN parsing" {
    const testing = std.testing;

    const arn = "arn:aws:ecs:us-west-1:123456789123:task/10838bed-421f-43ef-870a-f43feacbbb5b";

    try testing.expect(AwsUtils.isValidArn(arn));
    try testing.expectEqualStrings("us-west-1", AwsUtils.extractRegionFromArn(arn).?);
    try testing.expectEqualStrings("ecs", AwsUtils.extractServiceFromArn(arn).?);
    try testing.expectEqualStrings("123456789123", AwsUtils.extractAccountIdFromArn(arn).?);

    try testing.expect(!AwsUtils.isValidArn("invalid-arn"));
}

test "ECS task ID extraction" {
    const testing = std.testing;

    const task_arn1 = "arn:aws:ecs:us-west-1:123456789123:task/10838bed-421f-43ef-870a-f43feacbbb5b";
    const task_arn2 = "arn:aws:ecs:us-west-1:123456789123:task/my-cluster/task-id/23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd";

    try testing.expectEqualStrings("10838bed-421f-43ef-870a-f43feacbbb5b", AwsUtils.extractEcsTaskId(task_arn1).?);
    try testing.expectEqualStrings("23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd", AwsUtils.extractEcsTaskId(task_arn2).?);
}

test "AWS attribute definitions" {
    const testing = std.testing;

    try testing.expectEqualStrings("aws.request_id", Attributes.request_id.name);
    try testing.expectEqualStrings("aws.s3.bucket", S3Attributes.bucket.name);
    try testing.expectEqualStrings("aws.ecs.launch_type", EcsAttributes.launch_type.base.name);
}
