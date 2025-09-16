// DO NOT EDIT, this is an auto-generated file
//
// If you want to update the file:
// - Edit the template at scripts/templates/registry/zig/attribute.zig.j2
// - Run the script at scripts/generate-consts-from-spec.sh

//! # Semantic Attributes
//!
//! The entire set of semantic attributes (or [conventions](https://opentelemetry.io/docs/concepts/semantic-conventions/)) defined by the project. The resource, metric, and trace modules reference these attributes.

/// This attribute represents the state of the application.

/// 
/// Notes: The Android lifecycle states are defined in [Activity lifecycle callbacks](https://developer.android.com/guide/components/activities/activity-lifecycle#lc), and from which the `OS identifiers` are derived.
/// 
/// Examples:
///     created
pub const ANDROID_APP_STATE: []const u8 = "android.app.state";

/// Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found [here](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels).

/// 
/// Examples:
///     33
///     32
pub const ANDROID_OS_API_LEVEL: []const u8 = "android.os.api_level";

/// Deprecated. Use `android.app.state` body field instead.
/// 
/// Note: This attribute is deprecated. Use `android.app.state` body field instead.
pub const ANDROID_STATE: []const u8 = "android.state";

/// A unique identifier representing the installation of an application on a specific device

/// 
/// Notes: Its value SHOULD persist across launches of the same application installation, including through application upgrades. It SHOULD change if the application is uninstalled or if all applications of the vendor are uninstalled. Additionally, users might be able to reset this value (e.g. by clearing application data). If an app is installed multiple times on the same device (e.g. in different accounts on Android), each `app.installation.id` SHOULD have a different value. If multiple OpenTelemetry SDKs are used within the same application, they SHOULD use the same value for `app.installation.id`. Hardware IDs (e.g. serial number, IMEI, MAC address) MUST NOT be used as the `app.installation.id`. For iOS, this value SHOULD be equal to the [vendor identifier](https://developer.apple.com/documentation/uikit/uidevice/identifierforvendor). For Android, examples of `app.installation.id` implementations include: - [Firebase Installation ID](https://firebase.google.com/docs/projects/manage-installations). - A globally unique UUID which is persisted across sessions in your application. - [App set ID](https://developer.android.com/identity/app-set-id). - [`Settings.getString(Settings.Secure.ANDROID_ID)`](https://developer.android.com/reference/android/provider/Settings.Secure#ANDROID_ID). More information about Android identifier best practices can be found [here](https://developer.android.com/training/articles/user-data-ids).
/// 
/// Examples:
///     2ab2916d-a51f-4ac8-80ee-45ac31a28092
pub const APP_INSTALLATION_ID: []const u8 = "app.installation.id";

/// The x (horizontal) coordinate of a screen coordinate, in screen pixels.
/// 
/// Examples:
///     0
///     131
pub const APP_SCREEN_COORDINATE_X: []const u8 = "app.screen.coordinate.x";

/// The y (vertical) component of a screen coordinate, in screen pixels.

/// 
/// Examples:
///     12
///     99
pub const APP_SCREEN_COORDINATE_Y: []const u8 = "app.screen.coordinate.y";

/// An identifier that uniquely differentiates this widget from other widgets in the same application.

/// 
/// Notes: A widget is an application component, typically an on-screen visual GUI element.
/// 
/// Examples:
///     f9bc787d-ff05-48ad-90e1-fca1d46130b3
///     submit_order_1829
pub const APP_WIDGET_ID: []const u8 = "app.widget.id";

/// The name of an application widget.
/// 
/// Notes: A widget is an application component, typically an on-screen visual GUI element.
/// 
/// Examples:
///     submit
///     attack
///     Clear Cart
pub const APP_WIDGET_NAME: []const u8 = "app.widget.name";

/// The provenance filename of the built attestation which directly relates to the build artifact filename. This filename SHOULD accompany the artifact at publish time. See the [SLSA Relationship](https://slsa.dev/spec/v1.0/distributing-provenance#relationship-between-artifacts-and-attestations) specification for more information.

/// 
/// Examples:
///     golang-binary-amd64-v0.1.0.attestation
///     docker-image-amd64-v0.1.0.intoto.json1
///     release-1.tar.gz.attestation
///     file-name-package.tar.gz.intoto.json1
pub const ARTIFACT_ATTESTATION_FILENAME: []const u8 = "artifact.attestation.filename";

/// The full [hash value (see glossary)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-5.pdf), of the built attestation. Some envelopes in the [software attestation space](https://github.com/in-toto/attestation/tree/main/spec) also refer to this as the **digest**.

/// 
/// Examples:
///     1b31dfcd5b7f9267bf2ff47651df1cfb9147b9e4df1f335accf65b4cda498408
pub const ARTIFACT_ATTESTATION_HASH: []const u8 = "artifact.attestation.hash";

/// The id of the build [software attestation](https://slsa.dev/attestation-model).

/// 
/// Examples:
///     123
pub const ARTIFACT_ATTESTATION_ID: []const u8 = "artifact.attestation.id";

/// The human readable file name of the artifact, typically generated during build and release processes. Often includes the package name and version in the file name.

/// 
/// Notes: This file name can also act as the [Package Name](https://slsa.dev/spec/v1.0/terminology#package-model) in cases where the package ecosystem maps accordingly. Additionally, the artifact [can be published](https://slsa.dev/spec/v1.0/terminology#software-supply-chain) for others, but that is not a guarantee.
/// 
/// Examples:
///     golang-binary-amd64-v0.1.0
///     docker-image-amd64-v0.1.0
///     release-1.tar.gz
///     file-name-package.tar.gz
pub const ARTIFACT_FILENAME: []const u8 = "artifact.filename";

/// The full [hash value (see glossary)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-5.pdf), often found in checksum.txt on a release of the artifact and used to verify package integrity.

/// 
/// Notes: The specific algorithm used to create the cryptographic hash value is not defined. In situations where an artifact has multiple cryptographic hashes, it is up to the implementer to choose which hash value to set here; this should be the most secure hash algorithm that is suitable for the situation and consistent with the corresponding attestation. The implementer can then provide the other hash values through an additional set of attribute extensions as they deem necessary.
/// 
/// Examples:
///     9ff4c52759e2c4ac70b7d517bc7fcdc1cda631ca0045271ddd1b192544f8a3e9
pub const ARTIFACT_HASH: []const u8 = "artifact.hash";

/// The [Package URL](https://github.com/package-url/purl-spec) of the [package artifact](https://slsa.dev/spec/v1.0/terminology#package-model) provides a standard way to identify and locate the packaged artifact.

/// 
/// Examples:
///     pkg:github/package-url/purl-spec@1209109710924
///     pkg:npm/foo@12.12.3
pub const ARTIFACT_PURL: []const u8 = "artifact.purl";

/// The version of the artifact.

/// 
/// Examples:
///     v0.1.0
///     1.2.1
///     122691-build
pub const ARTIFACT_VERSION: []const u8 = "artifact.version";

/// ASP.NET Core exception middleware handling result
/// 
/// Examples:
///     handled
///     unhandled
pub const ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT: []const u8 = "aspnetcore.diagnostics.exception.result";

/// Full type name of the [`IExceptionHandler`](https://learn.microsoft.com/dotnet/api/microsoft.aspnetcore.diagnostics.iexceptionhandler) implementation that handled the exception.
/// 
/// Examples:
///     Contoso.MyHandler
pub const ASPNETCORE_DIAGNOSTICS_HANDLER_TYPE: []const u8 = "aspnetcore.diagnostics.handler.type";

/// Rate limiting policy name.
/// 
/// Examples:
///     fixed
///     sliding
///     token
pub const ASPNETCORE_RATE_LIMITING_POLICY: []const u8 = "aspnetcore.rate_limiting.policy";

/// Rate-limiting result, shows whether the lease was acquired or contains a rejection reason
/// 
/// Examples:
///     acquired
///     request_canceled
pub const ASPNETCORE_RATE_LIMITING_RESULT: []const u8 = "aspnetcore.rate_limiting.result";

/// Flag indicating if request was handled by the application pipeline.
/// 
/// Examples:
///     true
pub const ASPNETCORE_REQUEST_IS_UNHANDLED: []const u8 = "aspnetcore.request.is_unhandled";

/// A value that indicates whether the matched route is a fallback route.
/// 
/// Examples:
///     true
pub const ASPNETCORE_ROUTING_IS_FALLBACK: []const u8 = "aspnetcore.routing.is_fallback";

/// Match result - success or failure
/// 
/// Examples:
///     success
///     failure
pub const ASPNETCORE_ROUTING_MATCH_STATUS: []const u8 = "aspnetcore.routing.match_status";

/// The unique identifier of the AWS Bedrock Guardrail. A [guardrail](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html) helps safeguard and prevent unwanted behavior from model responses or user messages.

/// 
/// Examples:
///     sgi5gkybzqak
pub const AWS_BEDROCK_GUARDRAIL_ID: []const u8 = "aws.bedrock.guardrail.id";

/// The unique identifier of the AWS Bedrock Knowledge base. A [knowledge base](https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html) is a bank of information that can be queried by models to generate more relevant responses and augment prompts.

/// 
/// Examples:
///     XFWUPB9PAW
pub const AWS_BEDROCK_KNOWLEDGE_BASE_ID: []const u8 = "aws.bedrock.knowledge_base.id";

/// The JSON-serialized value of each item in the `AttributeDefinitions` request field.
/// 
/// Examples:
///     [\"{ \\"AttributeName\\": \\"string\\", \\"AttributeType\\": \\"string\\" }\"]
pub const AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS: []const u8 = "aws.dynamodb.attribute_definitions";

/// The value of the `AttributesToGet` request parameter.
/// 
/// Examples:
///     [\"lives\", \"id\"]
pub const AWS_DYNAMODB_ATTRIBUTES_TO_GET: []const u8 = "aws.dynamodb.attributes_to_get";

/// The value of the `ConsistentRead` request parameter.
pub const AWS_DYNAMODB_CONSISTENT_READ: []const u8 = "aws.dynamodb.consistent_read";

/// The JSON-serialized value of each item in the `ConsumedCapacity` response field.
/// 
/// Examples:
///     [\"{ \\"CapacityUnits\\": number, \\"GlobalSecondaryIndexes\\": { \\"string\\" : { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }, \\"LocalSecondaryIndexes\\": { \\"string\\" : { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }, \\"ReadCapacityUnits\\": number, \\"Table\\": { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number }, \\"TableName\\": \\"string\\", \\"WriteCapacityUnits\\": number }\"]
pub const AWS_DYNAMODB_CONSUMED_CAPACITY: []const u8 = "aws.dynamodb.consumed_capacity";

/// The value of the `Count` response parameter.
/// 
/// Examples:
///     10
pub const AWS_DYNAMODB_COUNT: []const u8 = "aws.dynamodb.count";

/// The value of the `ExclusiveStartTableName` request parameter.
/// 
/// Examples:
///     Users
///     CatsTable
pub const AWS_DYNAMODB_EXCLUSIVE_START_TABLE: []const u8 = "aws.dynamodb.exclusive_start_table";

/// The JSON-serialized value of each item in the `GlobalSecondaryIndexUpdates` request field.
/// 
/// Examples:
///     [\"{ \\"Create\\": { \\"IndexName\\": \\"string\\", \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" }, \\"ProvisionedThroughput\\": { \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }\"]
pub const AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES: []const u8 = "aws.dynamodb.global_secondary_index_updates";

/// The JSON-serialized value of each item of the `GlobalSecondaryIndexes` request field
/// 
/// Examples:
///     [\"{ \\"IndexName\\": \\"string\\", \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" }, \\"ProvisionedThroughput\\": { \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }\"]
pub const AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES: []const u8 = "aws.dynamodb.global_secondary_indexes";

/// The value of the `IndexName` request parameter.
/// 
/// Examples:
///     name_to_group
pub const AWS_DYNAMODB_INDEX_NAME: []const u8 = "aws.dynamodb.index_name";

/// The JSON-serialized value of the `ItemCollectionMetrics` response field.
/// 
/// Examples:
///     { \"string\" : [ { \"ItemCollectionKey\": { \"string\" : { \"B\": blob, \"BOOL\": boolean, \"BS\": [ blob ], \"L\": [ \"AttributeValue\" ], \"M\": { \"string\" : \"AttributeValue\" }, \"N\": \"string\", \"NS\": [ \"string\" ], \"NULL\": boolean, \"S\": \"string\", \"SS\": [ \"string\" ] } }, \"SizeEstimateRangeGB\": [ number ] } ] }
pub const AWS_DYNAMODB_ITEM_COLLECTION_METRICS: []const u8 = "aws.dynamodb.item_collection_metrics";

/// The value of the `Limit` request parameter.
/// 
/// Examples:
///     10
pub const AWS_DYNAMODB_LIMIT: []const u8 = "aws.dynamodb.limit";

/// The JSON-serialized value of each item of the `LocalSecondaryIndexes` request field.
/// 
/// Examples:
///     [\"{ \\"IndexArn\\": \\"string\\", \\"IndexName\\": \\"string\\", \\"IndexSizeBytes\\": number, \\"ItemCount\\": number, \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" } }\"]
pub const AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES: []const u8 = "aws.dynamodb.local_secondary_indexes";

/// The value of the `ProjectionExpression` request parameter.
/// 
/// Examples:
///     Title
///     Title, Price, Color
///     Title, Description, RelatedItems, ProductReviews
pub const AWS_DYNAMODB_PROJECTION: []const u8 = "aws.dynamodb.projection";

/// The value of the `ProvisionedThroughput.ReadCapacityUnits` request parameter.
/// 
/// Examples:
///     1.0
///     2.0
pub const AWS_DYNAMODB_PROVISIONED_READ_CAPACITY: []const u8 = "aws.dynamodb.provisioned_read_capacity";

/// The value of the `ProvisionedThroughput.WriteCapacityUnits` request parameter.
/// 
/// Examples:
///     1.0
///     2.0
pub const AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY: []const u8 = "aws.dynamodb.provisioned_write_capacity";

/// The value of the `ScanIndexForward` request parameter.
pub const AWS_DYNAMODB_SCAN_FORWARD: []const u8 = "aws.dynamodb.scan_forward";

/// The value of the `ScannedCount` response parameter.
/// 
/// Examples:
///     50
pub const AWS_DYNAMODB_SCANNED_COUNT: []const u8 = "aws.dynamodb.scanned_count";

/// The value of the `Segment` request parameter.
/// 
/// Examples:
///     10
pub const AWS_DYNAMODB_SEGMENT: []const u8 = "aws.dynamodb.segment";

/// The value of the `Select` request parameter.
/// 
/// Examples:
///     ALL_ATTRIBUTES
///     COUNT
pub const AWS_DYNAMODB_SELECT: []const u8 = "aws.dynamodb.select";

/// The number of items in the `TableNames` response parameter.
/// 
/// Examples:
///     20
pub const AWS_DYNAMODB_TABLE_COUNT: []const u8 = "aws.dynamodb.table_count";

/// The keys in the `RequestItems` object field.
/// 
/// Examples:
///     [\"Users\", \"Cats\"]
pub const AWS_DYNAMODB_TABLE_NAMES: []const u8 = "aws.dynamodb.table_names";

/// The value of the `TotalSegments` request parameter.
/// 
/// Examples:
///     100
pub const AWS_DYNAMODB_TOTAL_SEGMENTS: []const u8 = "aws.dynamodb.total_segments";

/// The ARN of an [ECS cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html).

/// 
/// Examples:
///     arn:aws:ecs:us-west-2:123456789123:cluster/my-cluster
pub const AWS_ECS_CLUSTER_ARN: []const u8 = "aws.ecs.cluster.arn";

/// The Amazon Resource Name (ARN) of an [ECS container instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html).

/// 
/// Examples:
///     arn:aws:ecs:us-west-1:123456789123:container/32624152-9086-4f0e-acae-1a75b14fe4d9
pub const AWS_ECS_CONTAINER_ARN: []const u8 = "aws.ecs.container.arn";

/// The [launch type](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html) for an ECS task.

pub const AWS_ECS_LAUNCHTYPE: []const u8 = "aws.ecs.launchtype";

/// The ARN of a running [ECS task](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids).

/// 
/// Examples:
///     arn:aws:ecs:us-west-1:123456789123:task/10838bed-421f-43ef-870a-f43feacbbb5b
///     arn:aws:ecs:us-west-1:123456789123:task/my-cluster/task-id/23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd
pub const AWS_ECS_TASK_ARN: []const u8 = "aws.ecs.task.arn";

/// The family name of the [ECS task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html) used to create the ECS task.

/// 
/// Examples:
///     opentelemetry-family
pub const AWS_ECS_TASK_FAMILY: []const u8 = "aws.ecs.task.family";

/// The ID of a running ECS task. The ID MUST be extracted from `task.arn`.

/// 
/// Examples:
///     10838bed-421f-43ef-870a-f43feacbbb5b
///     23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd
pub const AWS_ECS_TASK_ID: []const u8 = "aws.ecs.task.id";

/// The revision for the task definition used to create the ECS task.

/// 
/// Examples:
///     8
///     26
pub const AWS_ECS_TASK_REVISION: []const u8 = "aws.ecs.task.revision";

/// The ARN of an EKS cluster.

/// 
/// Examples:
///     arn:aws:ecs:us-west-2:123456789123:cluster/my-cluster
pub const AWS_EKS_CLUSTER_ARN: []const u8 = "aws.eks.cluster.arn";

/// The AWS extended request ID as returned in the response header `x-amz-id-2`.
/// 
/// Examples:
///     wzHcyEWfmOGDIE5QOhTAqFDoDWP3y8IUvpNINCwL9N4TEHbUw0/gZJ+VZTmCNCWR7fezEN3eCiQ=
pub const AWS_EXTENDED_REQUEST_ID: []const u8 = "aws.extended_request_id";

/// The name of the AWS Kinesis [stream](https://docs.aws.amazon.com/streams/latest/dev/introduction.html) the request refers to. Corresponds to the `--stream-name` parameter of the Kinesis [describe-stream](https://docs.aws.amazon.com/cli/latest/reference/kinesis/describe-stream.html) operation.

/// 
/// Examples:
///     some-stream-name
pub const AWS_KINESIS_STREAM_NAME: []const u8 = "aws.kinesis.stream_name";

/// The full invoked ARN as provided on the `Context` passed to the function (`Lambda-Runtime-Invoked-Function-Arn` header on the `/runtime/invocation/next` applicable).

/// 
/// Notes: This may be different from `cloud.resource_id` if an alias is involved.
/// 
/// Examples:
///     arn:aws:lambda:us-east-1:123456:function:myfunction:myalias
pub const AWS_LAMBDA_INVOKED_ARN: []const u8 = "aws.lambda.invoked_arn";

/// The UUID of the [AWS Lambda EvenSource Mapping](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-eventsourcemapping.html). An event source is mapped to a lambda function. It's contents are read by Lambda and used to trigger a function. This isn't available in the lambda execution context or the lambda runtime environtment. This is going to be populated by the AWS SDK for each language when that UUID is present. Some of these operations are Create/Delete/Get/List/Update EventSourceMapping.

/// 
/// Examples:
///     587ad24b-03b9-4413-8202-bbd56b36e5b7
pub const AWS_LAMBDA_RESOURCE_MAPPING_ID: []const u8 = "aws.lambda.resource_mapping.id";

/// The Amazon Resource Name(s) (ARN) of the AWS log group(s).

/// 
/// Notes: See the [log group ARN format documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html#CWL_ARN_Format).
/// 
/// Examples:
///     [\"arn:aws:logs:us-west-1:123456789012:log-group:/aws/my/group:*\"]
pub const AWS_LOG_GROUP_ARNS: []const u8 = "aws.log.group.arns";

/// The name(s) of the AWS log group(s) an application is writing to.

/// 
/// Notes: Multiple log groups must be supported for cases like multi-container applications, where a single application has sidecar containers, and each write to their own log group.
/// 
/// Examples:
///     [\"/aws/lambda/my-function\", \"opentelemetry-service\"]
pub const AWS_LOG_GROUP_NAMES: []const u8 = "aws.log.group.names";

/// The ARN(s) of the AWS log stream(s).

/// 
/// Notes: See the [log stream ARN format documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html#CWL_ARN_Format). One log group can contain several log streams, so these ARNs necessarily identify both a log group and a log stream.
/// 
/// Examples:
///     [\"arn:aws:logs:us-west-1:123456789012:log-group:/aws/my/group:log-stream:logs/main/10838bed-421f-43ef-870a-f43feacbbb5b\"]
pub const AWS_LOG_STREAM_ARNS: []const u8 = "aws.log.stream.arns";

/// The name(s) of the AWS log stream(s) an application is writing to.

/// 
/// Examples:
///     [\"logs/main/10838bed-421f-43ef-870a-f43feacbbb5b\"]
pub const AWS_LOG_STREAM_NAMES: []const u8 = "aws.log.stream.names";

/// The AWS request ID as returned in the response headers `x-amzn-requestid`, `x-amzn-request-id` or `x-amz-request-id`.
/// 
/// Examples:
///     79b9da39-b7ae-508a-a6bc-864b2829c622
///     C9ER4AJX75574TDJ
pub const AWS_REQUEST_ID: []const u8 = "aws.request_id";

/// The S3 bucket name the request refers to. Corresponds to the `--bucket` parameter of the [S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) operations.
/// 
/// Notes: The `bucket` attribute is applicable to all S3 operations that reference a bucket, i.e. that require the bucket name as a mandatory parameter. This applies to almost all S3 operations except `list-buckets`.
/// 
/// Examples:
///     some-bucket-name
pub const AWS_S3_BUCKET: []const u8 = "aws.s3.bucket";

/// The source object (in the form `bucket`/`key`) for the copy operation.
/// 
/// Notes: The `copy_source` attribute applies to S3 copy operations and corresponds to the `--copy-source` parameter of the [copy-object operation within the S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/copy-object.html). This applies in particular to the following operations: - [copy-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/copy-object.html) - [upload-part-copy](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part-copy.html)
/// 
/// Examples:
///     someFile.yml
pub const AWS_S3_COPY_SOURCE: []const u8 = "aws.s3.copy_source";

/// The delete request container that specifies the objects to be deleted.
/// 
/// Notes: The `delete` attribute is only applicable to the [delete-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/delete-object.html) operation. The `delete` attribute corresponds to the `--delete` parameter of the [delete-objects operation within the S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/delete-objects.html).
/// 
/// Examples:
///     Objects=[{Key=string,VersionId=string},{Key=string,VersionId=string}],Quiet=boolean
pub const AWS_S3_DELETE: []const u8 = "aws.s3.delete";

/// The S3 object key the request refers to. Corresponds to the `--key` parameter of the [S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) operations.
/// 
/// Notes: The `key` attribute is applicable to all object-related S3 operations, i.e. that require the object key as a mandatory parameter. This applies in particular to the following operations: - [copy-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/copy-object.html) - [delete-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/delete-object.html) - [get-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/get-object.html) - [head-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/head-object.html) - [put-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/put-object.html) - [restore-object](https://docs.aws.amazon.com/cli/latest/reference/s3api/restore-object.html) - [select-object-content](https://docs.aws.amazon.com/cli/latest/reference/s3api/select-object-content.html) - [abort-multipart-upload](https://docs.aws.amazon.com/cli/latest/reference/s3api/abort-multipart-upload.html) - [complete-multipart-upload](https://docs.aws.amazon.com/cli/latest/reference/s3api/complete-multipart-upload.html) - [create-multipart-upload](https://docs.aws.amazon.com/cli/latest/reference/s3api/create-multipart-upload.html) - [list-parts](https://docs.aws.amazon.com/cli/latest/reference/s3api/list-parts.html) - [upload-part](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part.html) - [upload-part-copy](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part-copy.html)
/// 
/// Examples:
///     someFile.yml
pub const AWS_S3_KEY: []const u8 = "aws.s3.key";

/// The part number of the part being uploaded in a multipart-upload operation. This is a positive integer between 1 and 10,000.
/// 
/// Notes: The `part_number` attribute is only applicable to the [upload-part](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part.html) and [upload-part-copy](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part-copy.html) operations. The `part_number` attribute corresponds to the `--part-number` parameter of the [upload-part operation within the S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part.html).
/// 
/// Examples:
///     3456
pub const AWS_S3_PART_NUMBER: []const u8 = "aws.s3.part_number";

/// Upload ID that identifies the multipart upload.
/// 
/// Notes: The `upload_id` attribute applies to S3 multipart-upload operations and corresponds to the `--upload-id` parameter of the [S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) multipart operations. This applies in particular to the following operations: - [abort-multipart-upload](https://docs.aws.amazon.com/cli/latest/reference/s3api/abort-multipart-upload.html) - [complete-multipart-upload](https://docs.aws.amazon.com/cli/latest/reference/s3api/complete-multipart-upload.html) - [list-parts](https://docs.aws.amazon.com/cli/latest/reference/s3api/list-parts.html) - [upload-part](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part.html) - [upload-part-copy](https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part-copy.html)
/// 
/// Examples:
///     dfRtDYWFbkRONycy.Yxwh66Yjlx.cph0gtNBtJ
pub const AWS_S3_UPLOAD_ID: []const u8 = "aws.s3.upload_id";

/// The ARN of the Secret stored in the Secrets Mangger

/// 
/// Examples:
///     arn:aws:secretsmanager:us-east-1:123456789012:secret:SecretName-6RandomCharacters
pub const AWS_SECRETSMANAGER_SECRET_ARN: []const u8 = "aws.secretsmanager.secret.arn";

/// The ARN of the AWS SNS Topic. An Amazon SNS [topic](https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html) is a logical access point that acts as a communication channel.

/// 
/// Examples:
///     arn:aws:sns:us-east-1:123456789012:mystack-mytopic-NZJ5JSMVGFIE
pub const AWS_SNS_TOPIC_ARN: []const u8 = "aws.sns.topic.arn";

/// The URL of the AWS SQS Queue. It's a unique identifier for a queue in Amazon Simple Queue Service (SQS) and is used to access the queue and perform actions on it.

/// 
/// Examples:
///     https://sqs.us-east-1.amazonaws.com/123456789012/MyQueue
pub const AWS_SQS_QUEUE_URL: []const u8 = "aws.sqs.queue.url";

/// The ARN of the AWS Step Functions Activity.

/// 
/// Examples:
///     arn:aws:states:us-east-1:123456789012:activity:get-greeting
pub const AWS_STEP_FUNCTIONS_ACTIVITY_ARN: []const u8 = "aws.step_functions.activity.arn";

/// The ARN of the AWS Step Functions State Machine.

/// 
/// Examples:
///     arn:aws:states:us-east-1:123456789012:stateMachine:myStateMachine:1
pub const AWS_STEP_FUNCTIONS_STATE_MACHINE_ARN: []const u8 = "aws.step_functions.state_machine.arn";

/// Deprecated, use `azure.resource_provider.namespace` instead.

/// 
/// Examples:
///     Microsoft.Storage
///     Microsoft.KeyVault
///     Microsoft.ServiceBus
/// 
/// Note: This attribute is deprecated. Replaced by `azure.resource_provider.namespace`.
pub const AZ_NAMESPACE: []const u8 = "az.namespace";

/// Deprecated, use `azure.service.request.id` instead.
/// 
/// Examples:
///     00000000-0000-0000-0000-000000000000
/// 
/// Note: This attribute is deprecated. Replaced by `azure.service.request.id`.
pub const AZ_SERVICE_REQUEST_ID: []const u8 = "az.service_request_id";

/// The unique identifier of the client instance.
/// 
/// Examples:
///     3ba4827d-4422-483f-b59f-85b74211c11d
///     storage-client-1
pub const AZURE_CLIENT_ID: []const u8 = "azure.client.id";

/// Cosmos client connection mode.
pub const AZURE_COSMOSDB_CONNECTION_MODE: []const u8 = "azure.cosmosdb.connection.mode";

/// Account or request [consistency level](https://learn.microsoft.com/azure/cosmos-db/consistency-levels).
/// 
/// Examples:
///     Eventual
///     ConsistentPrefix
///     BoundedStaleness
///     Strong
///     Session
pub const AZURE_COSMOSDB_CONSISTENCY_LEVEL: []const u8 = "azure.cosmosdb.consistency.level";

/// List of regions contacted during operation in the order that they were contacted. If there is more than one region listed, it indicates that the operation was performed on multiple regions i.e. cross-regional call.

/// 
/// Notes: Region name matches the format of `displayName` in [Azure Location API](https://learn.microsoft.com/rest/api/subscription/subscriptions/list-locations?view=rest-subscription-2021-10-01&tabs=HTTP#location)
/// 
/// Examples:
///     [\"North Central US\", \"Australia East\", \"Australia Southeast\"]
pub const AZURE_COSMOSDB_OPERATION_CONTACTED_REGIONS: []const u8 = "azure.cosmosdb.operation.contacted_regions";

/// The number of request units consumed by the operation.

/// 
/// Examples:
///     46.18
///     1.0
pub const AZURE_COSMOSDB_OPERATION_REQUEST_CHARGE: []const u8 = "azure.cosmosdb.operation.request_charge";

/// Request payload size in bytes.
pub const AZURE_COSMOSDB_REQUEST_BODY_SIZE: []const u8 = "azure.cosmosdb.request.body.size";

/// Cosmos DB sub status code.
/// 
/// Examples:
///     1000
///     1002
pub const AZURE_COSMOSDB_RESPONSE_SUB_STATUS_CODE: []const u8 = "azure.cosmosdb.response.sub_status_code";

/// [Azure Resource Provider Namespace](https://learn.microsoft.com/azure/azure-resource-manager/management/azure-services-resource-providers) as recognized by the client.

/// 
/// Examples:
///     Microsoft.Storage
///     Microsoft.KeyVault
///     Microsoft.ServiceBus
pub const AZURE_RESOURCE_PROVIDER_NAMESPACE: []const u8 = "azure.resource_provider.namespace";

/// The unique identifier of the service request. It's generated by the Azure service and returned with the response.
/// 
/// Examples:
///     00000000-0000-0000-0000-000000000000
pub const AZURE_SERVICE_REQUEST_ID: []const u8 = "azure.service.request.id";

/// Array of brand name and version separated by a space
/// 
/// Notes: This value is intended to be taken from the [UA client hints API](https://wicg.github.io/ua-client-hints/#interface) (`navigator.userAgentData.brands`).
/// 
/// Examples:
///     [\" Not A;Brand 99\", \"Chromium 99\", \"Chrome 99\"]
pub const BROWSER_BRANDS: []const u8 = "browser.brands";

/// Preferred language of the user using the browser
/// 
/// Notes: This value is intended to be taken from the Navigator API `navigator.language`.
/// 
/// Examples:
///     en
///     en-US
///     fr
///     fr-FR
pub const BROWSER_LANGUAGE: []const u8 = "browser.language";

/// A boolean that is true if the browser is running on a mobile device
/// 
/// Notes: This value is intended to be taken from the [UA client hints API](https://wicg.github.io/ua-client-hints/#interface) (`navigator.userAgentData.mobile`). If unavailable, this attribute SHOULD be left unset.
pub const BROWSER_MOBILE: []const u8 = "browser.mobile";

/// The platform on which the browser is running
/// 
/// Notes: This value is intended to be taken from the [UA client hints API](https://wicg.github.io/ua-client-hints/#interface) (`navigator.userAgentData.platform`). If unavailable, the legacy `navigator.platform` API SHOULD NOT be used instead and this attribute SHOULD be left unset in order for the values to be consistent. The list of possible values is defined in the [W3C User-Agent Client Hints specification](https://wicg.github.io/ua-client-hints/#sec-ch-ua-platform). Note that some (but not all) of these values can overlap with values in the [`os.type` and `os.name` attributes](./os.md). However, for consistency, the values in the `browser.platform` attribute should capture the exact value that the user agent provides.
/// 
/// Examples:
///     Windows
///     macOS
///     Android
pub const BROWSER_PLATFORM: []const u8 = "browser.platform";

/// The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).

pub const CASSANDRA_CONSISTENCY_LEVEL: []const u8 = "cassandra.consistency.level";

/// The data center of the coordinating node for a query.

/// 
/// Examples:
///     us-west-2
pub const CASSANDRA_COORDINATOR_DC: []const u8 = "cassandra.coordinator.dc";

/// The ID of the coordinating node for a query.

/// 
/// Examples:
///     be13faa2-8574-4d71-926d-27f16cf8a7af
pub const CASSANDRA_COORDINATOR_ID: []const u8 = "cassandra.coordinator.id";

/// The fetch size used for paging, i.e. how many rows will be returned at once.

/// 
/// Examples:
///     5000
pub const CASSANDRA_PAGE_SIZE: []const u8 = "cassandra.page.size";

/// Whether or not the query is idempotent.

pub const CASSANDRA_QUERY_IDEMPOTENT: []const u8 = "cassandra.query.idempotent";

/// The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.

/// 
/// Examples:
///     0
///     2
pub const CASSANDRA_SPECULATIVE_EXECUTION_COUNT: []const u8 = "cassandra.speculative_execution.count";

/// The kind of action a pipeline run is performing.

/// 
/// Examples:
///     BUILD
///     RUN
///     SYNC
pub const CICD_PIPELINE_ACTION_NAME: []const u8 = "cicd.pipeline.action.name";

/// The human readable name of the pipeline within a CI/CD system.

/// 
/// Examples:
///     Build and Test
///     Lint
///     Deploy Go Project
///     deploy_to_environment
pub const CICD_PIPELINE_NAME: []const u8 = "cicd.pipeline.name";

/// The result of a pipeline run.

/// 
/// Examples:
///     success
///     failure
///     timeout
///     skipped
pub const CICD_PIPELINE_RESULT: []const u8 = "cicd.pipeline.result";

/// The unique identifier of a pipeline run within a CI/CD system.

/// 
/// Examples:
///     120912
pub const CICD_PIPELINE_RUN_ID: []const u8 = "cicd.pipeline.run.id";

/// The pipeline run goes through these states during its lifecycle.

/// 
/// Examples:
///     pending
///     executing
///     finalizing
pub const CICD_PIPELINE_RUN_STATE: []const u8 = "cicd.pipeline.run.state";

/// The [URL](https://wikipedia.org/wiki/URL) of the pipeline run, providing the complete address in order to locate and identify the pipeline run.

/// 
/// Examples:
///     https://github.com/open-telemetry/semantic-conventions/actions/runs/9753949763?pr=1075
pub const CICD_PIPELINE_RUN_URL_FULL: []const u8 = "cicd.pipeline.run.url.full";

/// The human readable name of a task within a pipeline. Task here most closely aligns with a [computing process](https://wikipedia.org/wiki/Pipeline_(computing)) in a pipeline. Other terms for tasks include commands, steps, and procedures.

/// 
/// Examples:
///     Run GoLang Linter
///     Go Build
///     go-test
///     deploy_binary
pub const CICD_PIPELINE_TASK_NAME: []const u8 = "cicd.pipeline.task.name";

/// The unique identifier of a task run within a pipeline.

/// 
/// Examples:
///     12097
pub const CICD_PIPELINE_TASK_RUN_ID: []const u8 = "cicd.pipeline.task.run.id";

/// The result of a task run.

/// 
/// Examples:
///     success
///     failure
///     timeout
///     skipped
pub const CICD_PIPELINE_TASK_RUN_RESULT: []const u8 = "cicd.pipeline.task.run.result";

/// The [URL](https://wikipedia.org/wiki/URL) of the pipeline task run, providing the complete address in order to locate and identify the pipeline task run.

/// 
/// Examples:
///     https://github.com/open-telemetry/semantic-conventions/actions/runs/9753949763/job/26920038674?pr=1075
pub const CICD_PIPELINE_TASK_RUN_URL_FULL: []const u8 = "cicd.pipeline.task.run.url.full";

/// The type of the task within a pipeline.

/// 
/// Examples:
///     build
///     test
///     deploy
pub const CICD_PIPELINE_TASK_TYPE: []const u8 = "cicd.pipeline.task.type";

/// The name of a component of the CICD system.
/// 
/// Examples:
///     controller
///     scheduler
///     agent
pub const CICD_SYSTEM_COMPONENT: []const u8 = "cicd.system.component";

/// The unique identifier of a worker within a CICD system.
/// 
/// Examples:
///     abc123
///     10.0.1.2
///     controller
pub const CICD_WORKER_ID: []const u8 = "cicd.worker.id";

/// The name of a worker within a CICD system.
/// 
/// Examples:
///     agent-abc
///     controller
///     Ubuntu LTS
pub const CICD_WORKER_NAME: []const u8 = "cicd.worker.name";

/// The state of a CICD worker / agent.

/// 
/// Examples:
///     idle
///     busy
///     down
pub const CICD_WORKER_STATE: []const u8 = "cicd.worker.state";

/// The [URL](https://wikipedia.org/wiki/URL) of the worker, providing the complete address in order to locate and identify the worker.
/// 
/// Examples:
///     https://cicd.example.org/worker/abc123
pub const CICD_WORKER_URL_FULL: []const u8 = "cicd.worker.url.full";

/// Client address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
/// 
/// Notes: When observed from the server side, and when communicating through an intermediary, `client.address` SHOULD represent the client address behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     client.example.com
///     10.1.2.80
///     /tmp/my.sock
pub const CLIENT_ADDRESS: []const u8 = "client.address";

/// Client port number.
/// 
/// Notes: When observed from the server side, and when communicating through an intermediary, `client.port` SHOULD represent the client port behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     65123
pub const CLIENT_PORT: []const u8 = "client.port";

/// The cloud account ID the resource is assigned to.

/// 
/// Examples:
///     111111111111
///     opentelemetry
pub const CLOUD_ACCOUNT_ID: []const u8 = "cloud.account.id";

/// Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.

/// 
/// Notes: Availability zones are called "zones" on Alibaba Cloud and Google Cloud.
/// 
/// Examples:
///     us-east-1c
pub const CLOUD_AVAILABILITY_ZONE: []const u8 = "cloud.availability_zone";

/// The cloud platform in use.

/// 
/// Notes: The prefix of the service SHOULD match the one specified in `cloud.provider`.
pub const CLOUD_PLATFORM: []const u8 = "cloud.platform";

/// Name of the cloud provider.

pub const CLOUD_PROVIDER: []const u8 = "cloud.provider";

/// The geographical region within a cloud provider. When associated with a resource, this attribute specifies the region where the resource operates. When calling services or APIs deployed on a cloud, this attribute identifies the region where the called destination is deployed.

/// 
/// Notes: Refer to your provider's docs to see the available regions, for example [Alibaba Cloud regions](https://www.alibabacloud.com/help/doc-detail/40654.htm), [AWS regions](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/), [Azure regions](https://azure.microsoft.com/global-infrastructure/geographies/), [Google Cloud regions](https://cloud.google.com/about/locations), or [Tencent Cloud regions](https://www.tencentcloud.com/document/product/213/6091).
/// 
/// Examples:
///     us-central1
///     us-east-1
pub const CLOUD_REGION: []const u8 = "cloud.region";

/// Cloud provider-specific native identifier of the monitored cloud resource (e.g. an [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) on AWS, a [fully qualified resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) on Azure, a [full resource name](https://google.aip.dev/122#full-resource-names) on GCP)

/// 
/// Notes: On some cloud providers, it may not be possible to determine the full ID at startup, so it may be necessary to set `cloud.resource_id` as a span attribute instead. The exact value to use for `cloud.resource_id` depends on the cloud provider. The following well-known definitions MUST be used if you set this attribute and they apply: - **AWS Lambda:** The function [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).  Take care not to use the "invoked ARN" directly but replace any  [alias suffix](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html)  with the resolved function version, as the same runtime instance may be invocable with  multiple different aliases. - **GCP:** The [URI of the resource](https://cloud.google.com/iam/docs/full-resource-names) - **Azure:** The [Fully Qualified Resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) of the invoked function,  *not* the function app, having the form  `/subscriptions/[SUBSCRIPTION_GUID]/resourceGroups/[RG]/providers/Microsoft.Web/sites/[FUNCAPP]/functions/[FUNC]`.  This means that a span attribute MUST be used, as an Azure function app can host multiple functions that would usually share  a TracerProvider.
/// 
/// Examples:
///     arn:aws:lambda:REGION:ACCOUNT_ID:function:my-function
///     //run.googleapis.com/projects/PROJECT_ID/locations/LOCATION_ID/services/SERVICE_ID
///     /subscriptions/<SUBSCRIPTION_GUID>/resourceGroups/<RG>/providers/Microsoft.Web/sites/<FUNCAPP>/functions/<FUNC>
pub const CLOUD_RESOURCE_ID: []const u8 = "cloud.resource_id";

/// The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#id) uniquely identifies the event.

/// 
/// Examples:
///     123e4567-e89b-12d3-a456-426614174000
///     0001
pub const CLOUDEVENTS_EVENT_ID: []const u8 = "cloudevents.event_id";

/// The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#source-1) identifies the context in which an event happened.

/// 
/// Examples:
///     https://github.com/cloudevents
///     /cloudevents/spec/pull/123
///     my-service
pub const CLOUDEVENTS_EVENT_SOURCE: []const u8 = "cloudevents.event_source";

/// The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#specversion) which the event uses.

/// 
/// Examples:
///     1.0
pub const CLOUDEVENTS_EVENT_SPEC_VERSION: []const u8 = "cloudevents.event_spec_version";

/// The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#subject) of the event in the context of the event producer (identified by source).

/// 
/// Examples:
///     mynewfile.jpg
pub const CLOUDEVENTS_EVENT_SUBJECT: []const u8 = "cloudevents.event_subject";

/// The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#type) contains a value describing the type of event related to the originating occurrence.

/// 
/// Examples:
///     com.github.pull_request.opened
///     com.example.object.deleted.v2
pub const CLOUDEVENTS_EVENT_TYPE: []const u8 = "cloudevents.event_type";

/// The guid of the application.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.application_id`. This is the same value as reported by `cf app [app-name] --guid`.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const CLOUDFOUNDRY_APP_ID: []const u8 = "cloudfoundry.app.id";

/// The index of the application instance. 0 when just one instance is active.

/// 
/// Notes: CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api#v2-envelope). It is used for logs and metrics emitted by CloudFoundry. It is supposed to contain the application instance index for applications deployed on the runtime. Application instrumentation should use the value from environment variable `CF_INSTANCE_INDEX`.
/// 
/// Examples:
///     0
///     1
pub const CLOUDFOUNDRY_APP_INSTANCE_ID: []const u8 = "cloudfoundry.app.instance.id";

/// The name of the application.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.application_name`. This is the same value as reported by `cf apps`.
/// 
/// Examples:
///     my-app-name
pub const CLOUDFOUNDRY_APP_NAME: []const u8 = "cloudfoundry.app.name";

/// The guid of the CloudFoundry org the application is running in.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.org_id`. This is the same value as reported by `cf org [org-name] --guid`.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const CLOUDFOUNDRY_ORG_ID: []const u8 = "cloudfoundry.org.id";

/// The name of the CloudFoundry organization the app is running in.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.org_name`. This is the same value as reported by `cf orgs`.
/// 
/// Examples:
///     my-org-name
pub const CLOUDFOUNDRY_ORG_NAME: []const u8 = "cloudfoundry.org.name";

/// The UID identifying the process.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.process_id`. It is supposed to be equal to `VCAP_APPLICATION.app_id` for applications deployed to the runtime. For system components, this could be the actual PID.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const CLOUDFOUNDRY_PROCESS_ID: []const u8 = "cloudfoundry.process.id";

/// The type of process.

/// 
/// Notes: CloudFoundry applications can consist of multiple jobs. Usually the main process will be of type `web`. There can be additional background tasks or side-cars with different process types.
/// 
/// Examples:
///     web
pub const CLOUDFOUNDRY_PROCESS_TYPE: []const u8 = "cloudfoundry.process.type";

/// The guid of the CloudFoundry space the application is running in.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.space_id`. This is the same value as reported by `cf space [space-name] --guid`.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const CLOUDFOUNDRY_SPACE_ID: []const u8 = "cloudfoundry.space.id";

/// The name of the CloudFoundry space the application is running in.

/// 
/// Notes: Application instrumentation should use the value from environment variable `VCAP_APPLICATION.space_name`. This is the same value as reported by `cf spaces`.
/// 
/// Examples:
///     my-space-name
pub const CLOUDFOUNDRY_SPACE_NAME: []const u8 = "cloudfoundry.space.name";

/// A guid or another name describing the event source.

/// 
/// Notes: CloudFoundry defines the `source_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api#v2-envelope). It is used for logs and metrics emitted by CloudFoundry. It is supposed to contain the component name, e.g. "gorouter", for CloudFoundry components. When system components are instrumented, values from the [Bosh spec](https://bosh.io/docs/jobs/#properties-spec) should be used. The `system.id` should be set to `spec.deployment/spec.name`.
/// 
/// Examples:
///     cf/gorouter
pub const CLOUDFOUNDRY_SYSTEM_ID: []const u8 = "cloudfoundry.system.id";

/// A guid describing the concrete instance of the event source.

/// 
/// Notes: CloudFoundry defines the `instance_id` in the [Loggregator v2 envelope](https://github.com/cloudfoundry/loggregator-api#v2-envelope). It is used for logs and metrics emitted by CloudFoundry. It is supposed to contain the vm id for CloudFoundry components. When system components are instrumented, values from the [Bosh spec](https://bosh.io/docs/jobs/#properties-spec) should be used. The `system.instance.id` should be set to `spec.id`.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const CLOUDFOUNDRY_SYSTEM_INSTANCE_ID: []const u8 = "cloudfoundry.system.instance.id";

/// Deprecated, use `code.column.number`

/// 
/// Examples:
///     16
/// 
/// Note: This attribute is deprecated. Replaced by `code.column.number`.
pub const CODE_COLUMN: []const u8 = "code.column";

/// The column number in `code.file.path` best representing the operation. It SHOULD point within the code unit named in `code.function.name`. This attribute MUST NOT be used on the Profile signal since the data is already captured in 'message Line'. This constraint is imposed to prevent redundancy and maintain data integrity.

/// 
/// Examples:
///     16
pub const CODE_COLUMN_NUMBER: []const u8 = "code.column.number";

/// The source code file name that identifies the code unit as uniquely as possible (preferably an absolute file path). This attribute MUST NOT be used on the Profile signal since the data is already captured in 'message Function'. This constraint is imposed to prevent redundancy and maintain data integrity.

/// 
/// Examples:
///     /usr/local/MyApplication/content_root/app/index.php
pub const CODE_FILE_PATH: []const u8 = "code.file.path";

/// Deprecated, use `code.file.path` instead

/// 
/// Examples:
///     /usr/local/MyApplication/content_root/app/index.php
/// 
/// Note: This attribute is deprecated. Replaced by `code.file.path`.
pub const CODE_FILEPATH: []const u8 = "code.filepath";

/// Deprecated, use `code.function.name` instead

/// 
/// Examples:
///     serveRequest
/// 
/// Note: This attribute is deprecated. Value should be included in `code.function.name` which is expected to be a fully-qualified name.

pub const CODE_FUNCTION: []const u8 = "code.function";

/// The method or function fully-qualified name without arguments. The value should fit the natural representation of the language runtime, which is also likely the same used within `code.stacktrace` attribute value. This attribute MUST NOT be used on the Profile signal since the data is already captured in 'message Function'. This constraint is imposed to prevent redundancy and maintain data integrity.

/// 
/// Notes: Values and format depends on each language runtime, thus it is impossible to provide an exhaustive list of examples. The values are usually the same (or prefixes of) the ones found in native stack trace representation stored in `code.stacktrace` without information on arguments. Examples: * Java method: `com.example.MyHttpService.serveRequest` * Java anonymous class method: `com.mycompany.Main$1.myMethod` * Java lambda method: `com.mycompany.Main$$Lambda/0x0000748ae4149c00.myMethod` * PHP function: `GuzzleHttp\Client::transfer` * Go function: `github.com/my/repo/pkg.foo.func5` * Elixir: `OpenTelemetry.Ctx.new` * Erlang: `opentelemetry_ctx:new` * Rust: `playground::my_module::my_cool_func` * C function: `fopen`
/// 
/// Examples:
///     com.example.MyHttpService.serveRequest
///     GuzzleHttp\Client::transfer
///     fopen
pub const CODE_FUNCTION_NAME: []const u8 = "code.function.name";

/// The line number in `code.file.path` best representing the operation. It SHOULD point within the code unit named in `code.function.name`. This attribute MUST NOT be used on the Profile signal since the data is already captured in 'message Line'. This constraint is imposed to prevent redundancy and maintain data integrity.

/// 
/// Examples:
///     42
pub const CODE_LINE_NUMBER: []const u8 = "code.line.number";

/// Deprecated, use `code.line.number` instead

/// 
/// Examples:
///     42
/// 
/// Note: This attribute is deprecated. Replaced by `code.line.number`.
pub const CODE_LINENO: []const u8 = "code.lineno";

/// Deprecated, namespace is now included into `code.function.name`

/// 
/// Examples:
///     com.example.MyHttpService
/// 
/// Note: This attribute is deprecated. Value should be included in `code.function.name` which is expected to be a fully-qualified name.

pub const CODE_NAMESPACE: []const u8 = "code.namespace";

/// A stacktrace as a string in the natural representation for the language runtime. The representation is identical to [`exception.stacktrace`](/docs/exceptions/exceptions-spans.md#stacktrace-representation). This attribute MUST NOT be used on the Profile signal since the data is already captured in 'message Location'. This constraint is imposed to prevent redundancy and maintain data integrity.

/// 
/// Examples:
///     at com.example.GenerateTrace.methodB(GenerateTrace.java:13)\n at com.example.GenerateTrace.methodA(GenerateTrace.java:9)\n at com.example.GenerateTrace.main(GenerateTrace.java:5)\n
pub const CODE_STACKTRACE: []const u8 = "code.stacktrace";

/// The command used to run the container (i.e. the command name).

/// 
/// Notes: If using embedded credentials or sensitive data, it is recommended to remove them to prevent potential leakage.
/// 
/// Examples:
///     otelcontribcol
pub const CONTAINER_COMMAND: []const u8 = "container.command";

/// All the command arguments (including the command/executable itself) run by the container.

/// 
/// Examples:
///     [\"otelcontribcol\", \"--config\", \"config.yaml\"]
pub const CONTAINER_COMMAND_ARGS: []const u8 = "container.command_args";

/// The full command run by the container as a single string representing the full command.

/// 
/// Examples:
///     otelcontribcol --config config.yaml
pub const CONTAINER_COMMAND_LINE: []const u8 = "container.command_line";

/// Deprecated, use `cpu.mode` instead.
/// 
/// Examples:
///     user
///     kernel
/// 
/// Note: This attribute is deprecated. Replaced by `cpu.mode`.
pub const CONTAINER_CPU_STATE: []const u8 = "container.cpu.state";

/// The name of the CSI ([Container Storage Interface](https://github.com/container-storage-interface/spec)) plugin used by the volume.

/// 
/// Notes: This can sometimes be referred to as a "driver" in CSI implementations. This should represent the `name` field of the GetPluginInfo RPC.
/// 
/// Examples:
///     pd.csi.storage.gke.io
pub const CONTAINER_CSI_PLUGIN_NAME: []const u8 = "container.csi.plugin.name";

/// The unique volume ID returned by the CSI ([Container Storage Interface](https://github.com/container-storage-interface/spec)) plugin.

/// 
/// Notes: This can sometimes be referred to as a "volume handle" in CSI implementations. This should represent the `Volume.volume_id` field in CSI spec.
/// 
/// Examples:
///     projects/my-gcp-project/zones/my-gcp-zone/disks/my-gcp-disk
pub const CONTAINER_CSI_VOLUME_ID: []const u8 = "container.csi.volume.id";

/// Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/containers/run/#container-identification). The UUID might be abbreviated.

/// 
/// Examples:
///     a3bf90e006b2
pub const CONTAINER_ID: []const u8 = "container.id";

/// Runtime specific image identifier. Usually a hash algorithm followed by a UUID.

/// 
/// Notes: Docker defines a sha256 of the image id; `container.image.id` corresponds to the `Image` field from the Docker container inspect [API](https://docs.docker.com/engine/api/v1.43/#tag/Container/operation/ContainerInspect) endpoint. K8s defines a link to the container registry repository with digest `"imageID": "registry.azurecr.io /namespace/service/dockerfile@sha256:bdeabd40c3a8a492eaf9e8e44d0ebbb84bac7ee25ac0cf8a7159d25f62555625"`. The ID is assigned by the container runtime and can vary in different environments. Consider using `oci.manifest.digest` if it is important to identify the same image in different environments/runtimes.
/// 
/// Examples:
///     sha256:19c92d0a00d1b66d897bceaa7319bee0dd38a10a851c60bcec9474aa3f01e50f
pub const CONTAINER_IMAGE_ID: []const u8 = "container.image.id";

/// Name of the image the container was built on.

/// 
/// Examples:
///     gcr.io/opentelemetry/operator
pub const CONTAINER_IMAGE_NAME: []const u8 = "container.image.name";

/// Repo digests of the container image as provided by the container runtime.

/// 
/// Notes: [Docker](https://docs.docker.com/engine/api/v1.43/#tag/Image/operation/ImageInspect) and [CRI](https://github.com/kubernetes/cri-api/blob/c75ef5b473bbe2d0a4fc92f82235efd665ea8e9f/pkg/apis/runtime/v1/api.proto#L1237-L1238) report those under the `RepoDigests` field.
/// 
/// Examples:
///     [\"example@sha256:afcc7f1ac1b49db317a7196c902e61c6c3c4607d63599ee1a82d702d249a0ccb\", \"internal.registry.example.com:5000/example@sha256:b69959407d21e8a062e0416bf13405bb2b71ed7a84dde4158ebafacfa06f5578\"]
pub const CONTAINER_IMAGE_REPO_DIGESTS: []const u8 = "container.image.repo_digests";

/// Container image tags. An example can be found in [Docker Image Inspect](https://docs.docker.com/engine/api/v1.43/#tag/Image/operation/ImageInspect). Should be only the `<tag>` section of the full name for example from `registry.example.com/my-org/my-image:<tag>`.

/// 
/// Examples:
///     [\"v1.27.1\", \"3.5.7-0\"]
pub const CONTAINER_IMAGE_TAGS: []const u8 = "container.image.tags";

/// Container labels, ``key`` being the label name, the value being the label value.

/// 
/// Notes: For example, a docker container label `app` with value `nginx` SHOULD be recorded as the `container.label.app` attribute with value `"nginx"`.
/// 
/// Examples:
///     nginx
pub const CONTAINER_LABEL: []const u8 = "container.label";

/// Deprecated, use `container.label` instead.
/// 
/// Examples:
///     nginx
/// 
/// Note: This attribute is deprecated. Replaced by `container.label`.
pub const CONTAINER_LABELS: []const u8 = "container.labels";

/// Container name used by container runtime.

/// 
/// Examples:
///     opentelemetry-autoconf
pub const CONTAINER_NAME: []const u8 = "container.name";

/// The container runtime managing this container.

/// 
/// Examples:
///     docker
///     containerd
///     rkt
pub const CONTAINER_RUNTIME: []const u8 = "container.runtime";

/// The logical CPU number [0..n-1]
/// 
/// Examples:
///     1
pub const CPU_LOGICAL_NUMBER: []const u8 = "cpu.logical_number";

/// The mode of the CPU
/// 
/// Examples:
///     user
///     system
pub const CPU_MODE: []const u8 = "cpu.mode";

/// Value of the garbage collector collection generation.
/// 
/// Examples:
///     0
///     1
///     2
pub const CPYTHON_GC_GENERATION: []const u8 = "cpython.gc.generation";

/// Deprecated, use `cassandra.consistency.level` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.consistency.level`.
pub const DB_CASSANDRA_CONSISTENCY_LEVEL: []const u8 = "db.cassandra.consistency_level";

/// Deprecated, use `cassandra.coordinator.dc` instead.
/// 
/// Examples:
///     us-west-2
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.coordinator.dc`.
pub const DB_CASSANDRA_COORDINATOR_DC: []const u8 = "db.cassandra.coordinator.dc";

/// Deprecated, use `cassandra.coordinator.id` instead.
/// 
/// Examples:
///     be13faa2-8574-4d71-926d-27f16cf8a7af
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.coordinator.id`.
pub const DB_CASSANDRA_COORDINATOR_ID: []const u8 = "db.cassandra.coordinator.id";

/// Deprecated, use `cassandra.query.idempotent` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.query.idempotent`.
pub const DB_CASSANDRA_IDEMPOTENCE: []const u8 = "db.cassandra.idempotence";

/// Deprecated, use `cassandra.page.size` instead.
/// 
/// Examples:
///     5000
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.page.size`.
pub const DB_CASSANDRA_PAGE_SIZE: []const u8 = "db.cassandra.page_size";

/// Deprecated, use `cassandra.speculative_execution.count` instead.
/// 
/// Examples:
///     0
///     2
/// 
/// Note: This attribute is deprecated. Replaced by `cassandra.speculative_execution.count`.
pub const DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT: []const u8 = "db.cassandra.speculative_execution_count";

/// Deprecated, use `db.collection.name` instead.
/// 
/// Examples:
///     mytable
/// 
/// Note: This attribute is deprecated. Replaced by `db.collection.name`.
pub const DB_CASSANDRA_TABLE: []const u8 = "db.cassandra.table";

/// The name of the connection pool; unique within the instrumented application. In case the connection pool implementation doesn't provide a name, instrumentation SHOULD use a combination of parameters that would make the name unique, for example, combining attributes `server.address`, `server.port`, and `db.namespace`, formatted as `server.address:server.port/db.namespace`. Instrumentations that generate connection pool name following different patterns SHOULD document it.

/// 
/// Examples:
///     myDataSource
pub const DB_CLIENT_CONNECTION_POOL_NAME: []const u8 = "db.client.connection.pool.name";

/// The state of a connection in the pool
/// 
/// Examples:
///     idle
pub const DB_CLIENT_CONNECTION_STATE: []const u8 = "db.client.connection.state";

/// Deprecated, use `db.client.connection.pool.name` instead.
/// 
/// Examples:
///     myDataSource
/// 
/// Note: This attribute is deprecated. Replaced by `db.client.connection.pool.name`.
pub const DB_CLIENT_CONNECTIONS_POOL_NAME: []const u8 = "db.client.connections.pool.name";

/// Deprecated, use `db.client.connection.state` instead.
/// 
/// Examples:
///     idle
/// 
/// Note: This attribute is deprecated. Replaced by `db.client.connection.state`.
pub const DB_CLIENT_CONNECTIONS_STATE: []const u8 = "db.client.connections.state";

/// The name of a collection (table, container) within the database.
/// 
/// Notes: It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization. The collection name SHOULD NOT be extracted from `db.query.text`, when the database system supports query text with multiple collections in non-batch operations. For batch operations, if the individual operations are known to have the same collection name then that collection name SHOULD be used.
/// 
/// Examples:
///     public.users
///     customers
pub const DB_COLLECTION_NAME: []const u8 = "db.collection.name";

/// Deprecated, use `server.address`, `server.port` attributes instead.
/// 
/// Examples:
///     Server=(localdb)\v11.0;Integrated Security=true;
/// 
/// Note: This attribute is deprecated. Replaced by `server.address` and `server.port`.

pub const DB_CONNECTION_STRING: []const u8 = "db.connection_string";

/// Deprecated, use `azure.client.id` instead.
/// 
/// Examples:
///     3ba4827d-4422-483f-b59f-85b74211c11d
/// 
/// Note: This attribute is deprecated. Replaced by `azure.client.id`.
pub const DB_COSMOSDB_CLIENT_ID: []const u8 = "db.cosmosdb.client_id";

/// Deprecated, use `azure.cosmosdb.connection.mode` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.connection.mode`.
pub const DB_COSMOSDB_CONNECTION_MODE: []const u8 = "db.cosmosdb.connection_mode";

/// Deprecated, use `cosmosdb.consistency.level` instead.
/// 
/// Examples:
///     Eventual
///     ConsistentPrefix
///     BoundedStaleness
///     Strong
///     Session
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.consistency.level`.
pub const DB_COSMOSDB_CONSISTENCY_LEVEL: []const u8 = "db.cosmosdb.consistency_level";

/// Deprecated, use `db.collection.name` instead.
/// 
/// Examples:
///     mytable
/// 
/// Note: This attribute is deprecated. Replaced by `db.collection.name`.
pub const DB_COSMOSDB_CONTAINER: []const u8 = "db.cosmosdb.container";

/// Deprecated, no replacement at this time.
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.

pub const DB_COSMOSDB_OPERATION_TYPE: []const u8 = "db.cosmosdb.operation_type";

/// Deprecated, use `azure.cosmosdb.operation.contacted_regions` instead.
/// 
/// Examples:
///     [\"North Central US\", \"Australia East\", \"Australia Southeast\"]
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.operation.contacted_regions`.
pub const DB_COSMOSDB_REGIONS_CONTACTED: []const u8 = "db.cosmosdb.regions_contacted";

/// Deprecated, use `azure.cosmosdb.operation.request_charge` instead.
/// 
/// Examples:
///     46.18
///     1.0
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.operation.request_charge`.
pub const DB_COSMOSDB_REQUEST_CHARGE: []const u8 = "db.cosmosdb.request_charge";

/// Deprecated, use `azure.cosmosdb.request.body.size` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.request.body.size`.
pub const DB_COSMOSDB_REQUEST_CONTENT_LENGTH: []const u8 = "db.cosmosdb.request_content_length";

/// Deprecated, use `db.response.status_code` instead.
/// 
/// Examples:
///     200
///     201
/// 
/// Note: This attribute is deprecated. Replaced by `db.response.status_code`.
pub const DB_COSMOSDB_STATUS_CODE: []const u8 = "db.cosmosdb.status_code";

/// Deprecated, use `azure.cosmosdb.response.sub_status_code` instead.
/// 
/// Examples:
///     1000
///     1002
/// 
/// Note: This attribute is deprecated. Replaced by `azure.cosmosdb.response.sub_status_code`.
pub const DB_COSMOSDB_SUB_STATUS_CODE: []const u8 = "db.cosmosdb.sub_status_code";

/// Deprecated, use `db.namespace` instead.

/// 
/// Examples:
///     e9106fc68e3044f0b1475b04bf4ffd5f
/// 
/// Note: This attribute is deprecated. Replaced by `db.namespace`.
pub const DB_ELASTICSEARCH_CLUSTER_NAME: []const u8 = "db.elasticsearch.cluster.name";

/// Deprecated, use `elasticsearch.node.name` instead.

/// 
/// Examples:
///     instance-0000000001
/// 
/// Note: This attribute is deprecated. Replaced by `elasticsearch.node.name`.
pub const DB_ELASTICSEARCH_NODE_NAME: []const u8 = "db.elasticsearch.node.name";

/// Deprecated, use `db.operation.parameter` instead.

/// 
/// Examples:
///     test-index
///     123
/// 
/// Note: This attribute is deprecated. Replaced by `db.operation.parameter`.
pub const DB_ELASTICSEARCH_PATH_PARTS: []const u8 = "db.elasticsearch.path_parts";

/// Deprecated, no general replacement at this time. For Elasticsearch, use `db.elasticsearch.node.name` instead.
/// 
/// Examples:
///     mysql-e26b99z.example.com
/// 
/// Note: This attribute is deprecated. Removed, no general replacement at this time. For Elasticsearch, use `db.elasticsearch.node.name` instead.

pub const DB_INSTANCE_ID: []const u8 = "db.instance.id";

/// Removed, no replacement at this time.
/// 
/// Examples:
///     org.postgresql.Driver
///     com.microsoft.sqlserver.jdbc.SQLServerDriver
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.

pub const DB_JDBC_DRIVER_CLASSNAME: []const u8 = "db.jdbc.driver_classname";

/// Deprecated, use `db.collection.name` instead.
/// 
/// Examples:
///     mytable
/// 
/// Note: This attribute is deprecated. Replaced by `db.collection.name`.
pub const DB_MONGODB_COLLECTION: []const u8 = "db.mongodb.collection";

/// Deprecated, SQL Server instance is now populated as a part of `db.namespace` attribute.
/// 
/// Examples:
///     MSSQLSERVER
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.
pub const DB_MSSQL_INSTANCE_NAME: []const u8 = "db.mssql.instance_name";

/// Deprecated, use `db.namespace` instead.
/// 
/// Examples:
///     customers
///     main
/// 
/// Note: This attribute is deprecated. Replaced by `db.namespace`.
pub const DB_NAME: []const u8 = "db.name";

/// The name of the database, fully qualified within the server address and port.

/// 
/// Notes: If a database system has multiple namespace components, they SHOULD be concatenated from the most general to the most specific namespace component, using `|` as a separator between the components. Any missing components (and their associated separators) SHOULD be omitted. Semantic conventions for individual database systems SHOULD document what `db.namespace` means in the context of that system. It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization.
/// 
/// Examples:
///     customers
///     test.users
pub const DB_NAMESPACE: []const u8 = "db.namespace";

/// Deprecated, use `db.operation.name` instead.
/// 
/// Examples:
///     findAndModify
///     HMSET
///     SELECT
/// 
/// Note: This attribute is deprecated. Replaced by `db.operation.name`.
pub const DB_OPERATION: []const u8 = "db.operation";

/// The number of queries included in a batch operation.
/// 
/// Notes: Operations are only considered batches when they contain two or more operations, and so `db.operation.batch.size` SHOULD never be `1`.
/// 
/// Examples:
///     2
///     3
///     4
pub const DB_OPERATION_BATCH_SIZE: []const u8 = "db.operation.batch.size";

/// The name of the operation or command being executed.

/// 
/// Notes: It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization. The operation name SHOULD NOT be extracted from `db.query.text`, when the database system supports query text with multiple operations in non-batch operations. If spaces can occur in the operation name, multiple consecutive spaces SHOULD be normalized to a single space. For batch operations, if the individual operations are known to have the same operation name then that operation name SHOULD be used prepended by `BATCH `, otherwise `db.operation.name` SHOULD be `BATCH` or some other database system specific term if more applicable.
/// 
/// Examples:
///     findAndModify
///     HMSET
///     SELECT
pub const DB_OPERATION_NAME: []const u8 = "db.operation.name";

/// A database operation parameter, with ``key`` being the parameter name, and the attribute value being a string representation of the parameter value.

/// 
/// Notes: For example, a client-side maximum number of rows to read from the database MAY be recorded as the `db.operation.parameter.max_rows` attribute. `db.query.text` parameters SHOULD be captured using `db.query.parameter.[key]` instead of `db.operation.parameter.[key]`.
/// 
/// Examples:
///     someval
///     55
pub const DB_OPERATION_PARAMETER: []const u8 = "db.operation.parameter";

/// A database query parameter, with ``key`` being the parameter name, and the attribute value being a string representation of the parameter value.

/// 
/// Notes: If a query parameter has no name and instead is referenced only by index, then `[key]` SHOULD be the 0-based index. `db.query.parameter.[key]` SHOULD match up with the parameterized placeholders present in `db.query.text`. `db.query.parameter.[key]` SHOULD NOT be captured on batch operations. Examples: - For a query `SELECT * FROM users where username = %s` with the parameter `"jdoe"`,  the attribute `db.query.parameter.0` SHOULD be set to `"jdoe"`. - For a query `"SELECT * FROM users WHERE username = %(username)s;` with parameter  `username = "jdoe"`, the attribute `db.query.parameter.username` SHOULD be set to `"jdoe"`.
/// 
/// Examples:
///     someval
///     55
pub const DB_QUERY_PARAMETER: []const u8 = "db.query.parameter";

/// Low cardinality summary of a database query.

/// 
/// Notes: The query summary describes a class of database queries and is useful as a grouping key, especially when analyzing telemetry for database calls involving complex queries. Summary may be available to the instrumentation through instrumentation hooks or other means. If it is not available, instrumentations that support query parsing SHOULD generate a summary following [Generating query summary](/docs/database/database-spans.md#generating-a-summary-of-the-query) section.
/// 
/// Examples:
///     SELECT wuser_table
///     INSERT shipping_details SELECT orders
///     get user by id
pub const DB_QUERY_SUMMARY: []const u8 = "db.query.summary";

/// The database query being executed.

/// 
/// Notes: For sanitization see [Sanitization of `db.query.text`](/docs/database/database-spans.md#sanitization-of-dbquerytext). For batch operations, if the individual operations are known to have the same query text then that query text SHOULD be used, otherwise all of the individual query texts SHOULD be concatenated with separator `; ` or some other database system specific separator if more applicable. Parameterized query text SHOULD NOT be sanitized. Even though parameterized query text can potentially have sensitive data, by using a parameterized query the user is giving a strong signal that any sensitive data will be passed as parameter values, and the benefit to observability of capturing the static part of the query text by default outweighs the risk.
/// 
/// Examples:
///     SELECT * FROM wuser_table where username = ?
///     SET mykey ?
pub const DB_QUERY_TEXT: []const u8 = "db.query.text";

/// Deprecated, use `db.namespace` instead.
/// 
/// Examples:
///     0
///     1
///     15
/// 
/// Note: This attribute is deprecated. Replaced by `db.namespace`.
pub const DB_REDIS_DATABASE_INDEX: []const u8 = "db.redis.database_index";

/// Number of rows returned by the operation.
/// 
/// Examples:
///     10
///     30
///     1000
pub const DB_RESPONSE_RETURNED_ROWS: []const u8 = "db.response.returned_rows";

/// Database response status code.
/// 
/// Notes: The status code returned by the database. Usually it represents an error code, but may also represent partial success, warning, or differentiate between various types of successful outcomes. Semantic conventions for individual database systems SHOULD document what `db.response.status_code` means in the context of that system.
/// 
/// Examples:
///     102
///     ORA-17002
///     08P01
///     404
pub const DB_RESPONSE_STATUS_CODE: []const u8 = "db.response.status_code";

/// Deprecated, use `db.collection.name` instead.
/// 
/// Examples:
///     mytable
/// 
/// Note: This attribute is deprecated. Replaced by `db.collection.name`, but only if not extracting the value from `db.query.text`.
pub const DB_SQL_TABLE: []const u8 = "db.sql.table";

/// The database statement being executed.
/// 
/// Examples:
///     SELECT * FROM wuser_table
///     SET mykey \"WuValue\"
/// 
/// Note: This attribute is deprecated. Replaced by `db.query.text`.
pub const DB_STATEMENT: []const u8 = "db.statement";

/// The name of a stored procedure within the database.
/// 
/// Notes: It is RECOMMENDED to capture the value as provided by the application without attempting to do any case normalization. For batch operations, if the individual operations are known to have the same stored procedure name then that stored procedure name SHOULD be used.
/// 
/// Examples:
///     GetCustomer
pub const DB_STORED_PROCEDURE_NAME: []const u8 = "db.stored_procedure.name";

/// Deprecated, use `db.system.name` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `db.system.name`.
pub const DB_SYSTEM: []const u8 = "db.system";

/// The database management system (DBMS) product as identified by the client instrumentation.
/// 
/// Notes: The actual DBMS may differ from the one identified by the client. For example, when using PostgreSQL client libraries to connect to a CockroachDB, the `db.system.name` is set to `postgresql` based on the instrumentation's best knowledge.
pub const DB_SYSTEM_NAME: []const u8 = "db.system.name";

/// Deprecated, no replacement at this time.
/// 
/// Examples:
///     readonly_user
///     reporting_user
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.
pub const DB_USER: []const u8 = "db.user";

/// 'Deprecated, use `deployment.environment.name` instead.'

/// 
/// Examples:
///     staging
///     production
/// 
/// Note: This attribute is deprecated. Replaced by `deployment.environment.name`.
pub const DEPLOYMENT_ENVIRONMENT: []const u8 = "deployment.environment";

/// Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).

/// 
/// Notes: `deployment.environment.name` does not affect the uniqueness constraints defined through the `service.namespace`, `service.name` and `service.instance.id` resource attributes. This implies that resources carrying the following attribute combinations MUST be considered to be identifying the same service: - `service.name=frontend`, `deployment.environment.name=production` - `service.name=frontend`, `deployment.environment.name=staging`.
/// 
/// Examples:
///     staging
///     production
pub const DEPLOYMENT_ENVIRONMENT_NAME: []const u8 = "deployment.environment.name";

/// The id of the deployment.

/// 
/// Examples:
///     1208
pub const DEPLOYMENT_ID: []const u8 = "deployment.id";

/// The name of the deployment.

/// 
/// Examples:
///     deploy my app
///     deploy-frontend
pub const DEPLOYMENT_NAME: []const u8 = "deployment.name";

/// The status of the deployment.

pub const DEPLOYMENT_STATUS: []const u8 = "deployment.status";

/// Destination address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
/// 
/// Notes: When observed from the source side, and when communicating through an intermediary, `destination.address` SHOULD represent the destination address behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     destination.example.com
///     10.1.2.80
///     /tmp/my.sock
pub const DESTINATION_ADDRESS: []const u8 = "destination.address";

/// Destination port number
/// 
/// Examples:
///     3389
///     2888
pub const DESTINATION_PORT: []const u8 = "destination.port";

/// A unique identifier representing the device

/// 
/// Notes: Its value SHOULD be identical for all apps on a device and it SHOULD NOT change if an app is uninstalled and re-installed. However, it might be resettable by the user for all apps on a device. Hardware IDs (e.g. vendor-specific serial number, IMEI or MAC address) MAY be used as values. More information about Android identifier best practices can be found [here](https://developer.android.com/training/articles/user-data-ids). ] [!WARNING] ] ] This attribute may contain sensitive (PII) information. Caution should be taken when storing personal data or anything which can identify a user. GDPR and data protection laws may apply, ] ensure you do your own due diligence. ] ] Due to these reasons, this identifier is not recommended for consumer applications and will likely result in rejection from both Google Play and App Store. ] However, it may be appropriate for specific enterprise scenarios, such as kiosk devices or enterprise-managed devices, with appropriate compliance clearance. ] Any instrumentation providing this identifier MUST implement it as an opt-in feature. ] ] See [`app.installation.id`](/docs/registry/attributes/app.md#app-installation-id) for a more privacy-preserving alternative.
/// 
/// Examples:
///     123456789012345
///     01:23:45:67:89:AB
pub const DEVICE_ID: []const u8 = "device.id";

/// The name of the device manufacturer

/// 
/// Notes: The Android OS provides this field via [Build](https://developer.android.com/reference/android/os/Build#MANUFACTURER). iOS apps SHOULD hardcode the value `Apple`.
/// 
/// Examples:
///     Apple
///     Samsung
pub const DEVICE_MANUFACTURER: []const u8 = "device.manufacturer";

/// The model identifier for the device

/// 
/// Notes: It's recommended this value represents a machine-readable version of the model identifier rather than the market or consumer-friendly name of the device.
/// 
/// Examples:
///     iPhone3,4
///     SM-G920F
pub const DEVICE_MODEL_IDENTIFIER: []const u8 = "device.model.identifier";

/// The marketing name for the device model

/// 
/// Notes: It's recommended this value represents a human-readable version of the device model rather than a machine-readable alternative.
/// 
/// Examples:
///     iPhone 6s Plus
///     Samsung Galaxy S6
pub const DEVICE_MODEL_NAME: []const u8 = "device.model.name";

/// The disk IO operation direction.
/// 
/// Examples:
///     read
pub const DISK_IO_DIRECTION: []const u8 = "disk.io.direction";

/// The list of IPv4 or IPv6 addresses resolved during DNS lookup.
/// 
/// Examples:
///     [\"10.0.0.1\", \"2001:0db8:85a3:0000:0000:8a2e:0370:7334\"]
pub const DNS_ANSWERS: []const u8 = "dns.answers";

/// The name being queried.
/// 
/// Notes: If the name field contains non-printable characters (below 32 or above 126), those characters should be represented as escaped base 10 integers (\DDD). Back slashes and quotes should be escaped. Tabs, carriage returns, and line feeds should be converted to \t, \r, and \n respectively.
/// 
/// Examples:
///     www.example.com
///     opentelemetry.io
pub const DNS_QUESTION_NAME: []const u8 = "dns.question.name";

/// Name of the garbage collector managed heap generation.
/// 
/// Examples:
///     gen0
///     gen1
///     gen2
pub const DOTNET_GC_HEAP_GENERATION: []const u8 = "dotnet.gc.heap.generation";

/// Represents the human-readable identifier of the node/instance to which a request was routed.

/// 
/// Examples:
///     instance-0000000001
pub const ELASTICSEARCH_NODE_NAME: []const u8 = "elasticsearch.node.name";

/// Unique identifier of an end user in the system. It maybe a username, email address, or other identifier.
/// 
/// Notes: Unique identifier of an end user in the system. ] [!Warning] ] This field contains sensitive (PII) information.
/// 
/// Examples:
///     username
pub const ENDUSER_ID: []const u8 = "enduser.id";

/// Pseudonymous identifier of an end user. This identifier should be a random value that is not directly linked or associated with the end user's actual identity.

/// 
/// Notes: Pseudonymous identifier of an end user. ] [!Warning] ] This field contains sensitive (linkable PII) information.
/// 
/// Examples:
///     QdH5CAWJgqVT4rOr0qtumf
pub const ENDUSER_PSEUDO_ID: []const u8 = "enduser.pseudo.id";

/// Deprecated, use `user.roles` instead.
/// 
/// Examples:
///     admin
/// 
/// Note: This attribute is deprecated. Use `user.roles` attribute instead.
pub const ENDUSER_ROLE: []const u8 = "enduser.role";

/// Deprecated, no replacement at this time.
/// 
/// Examples:
///     read:message, write:files
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.
pub const ENDUSER_SCOPE: []const u8 = "enduser.scope";

/// A message providing more detail about an error in human-readable form.
/// 
/// Notes: `error.message` should provide additional context and detail about an error. It is NOT RECOMMENDED to duplicate the value of `error.type` in `error.message`. It is also NOT RECOMMENDED to duplicate the value of `exception.message` in `error.message`. `error.message` is NOT RECOMMENDED for metrics or spans due to its unbounded cardinality and overlap with span status.
/// 
/// Examples:
///     Unexpected input type: string
///     The user has exceeded their storage quota
pub const ERROR_MESSAGE: []const u8 = "error.message";

/// Describes a class of error the operation ended with.

/// 
/// Notes: The `error.type` SHOULD be predictable, and SHOULD have low cardinality. When `error.type` is set to a type (e.g., an exception type), its canonical class name identifying the type within the artifact SHOULD be used. Instrumentations SHOULD document the list of errors they report. The cardinality of `error.type` within one instrumentation library SHOULD be low. Telemetry consumers that aggregate data from multiple instrumentation libraries and applications should be prepared for `error.type` to have high cardinality at query time when no additional filters are applied. If the operation has completed successfully, instrumentations SHOULD NOT set `error.type`. If a specific domain defines its own set of error identifiers (such as HTTP or gRPC status codes), it's RECOMMENDED to: - Use a domain-specific attribute - Set `error.type` to capture all errors, regardless of whether they are defined within the domain-specific set or not.
/// 
/// Examples:
///     timeout
///     java.net.UnknownHostException
///     server_certificate_invalid
///     500
pub const ERROR_TYPE: []const u8 = "error.type";

/// Identifies the class / type of event.

/// 
/// Examples:
///     browser.mouse.click
///     device.app.lifecycle
/// 
/// Note: This attribute is deprecated. Replaced by EventName top-level field on the LogRecord.

pub const EVENT_NAME: []const u8 = "event.name";

/// Indicates that the exception is escaping the scope of the span.

/// 
/// Note: This attribute is deprecated. It's no longer recommended to record exceptions that are handled and do not escape the scope of a span.

pub const EXCEPTION_ESCAPED: []const u8 = "exception.escaped";

/// The exception message.
/// 
/// Examples:
///     Division by zero
///     Can't convert 'int' object to str implicitly
pub const EXCEPTION_MESSAGE: []const u8 = "exception.message";

/// A stacktrace as a string in the natural representation for the language runtime. The representation is to be determined and documented by each language SIG.

/// 
/// Examples:
///     Exception in thread \"main\" java.lang.RuntimeException: Test exception\n at com.example.GenerateTrace.methodB(GenerateTrace.java:13)\n at com.example.GenerateTrace.methodA(GenerateTrace.java:9)\n at com.example.GenerateTrace.main(GenerateTrace.java:5)\n
pub const EXCEPTION_STACKTRACE: []const u8 = "exception.stacktrace";

/// The type of the exception (its fully-qualified class name, if applicable). The dynamic type of the exception should be preferred over the static type in languages that support it.

/// 
/// Examples:
///     java.net.ConnectException
///     OSError
pub const EXCEPTION_TYPE: []const u8 = "exception.type";

/// A boolean that is true if the serverless function is executed for the first time (aka cold-start).

pub const FAAS_COLDSTART: []const u8 = "faas.coldstart";

/// A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).

/// 
/// Examples:
///     0/5 * * * ? *
pub const FAAS_CRON: []const u8 = "faas.cron";

/// The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.

/// 
/// Examples:
///     myBucketName
///     myDbName
pub const FAAS_DOCUMENT_COLLECTION: []const u8 = "faas.document.collection";

/// The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.

/// 
/// Examples:
///     myFile.txt
///     myTableName
pub const FAAS_DOCUMENT_NAME: []const u8 = "faas.document.name";

/// Describes the type of the operation that was performed on the data.
pub const FAAS_DOCUMENT_OPERATION: []const u8 = "faas.document.operation";

/// A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

/// 
/// Examples:
///     2020-01-23T13:47:06Z
pub const FAAS_DOCUMENT_TIME: []const u8 = "faas.document.time";

/// The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.

/// 
/// Notes: - **AWS Lambda:** Use the (full) log stream name.
/// 
/// Examples:
///     2021/06/28/[$LATEST]2f399eb14537447da05ab2a2e39309de
pub const FAAS_INSTANCE: []const u8 = "faas.instance";

/// The invocation ID of the current function invocation.

/// 
/// Examples:
///     af9d5aa4-a685-4c5f-a22b-444f80b3cc28
pub const FAAS_INVOCATION_ID: []const u8 = "faas.invocation_id";

/// The name of the invoked function.

/// 
/// Notes: SHOULD be equal to the `faas.name` resource attribute of the invoked function.
/// 
/// Examples:
///     my-function
pub const FAAS_INVOKED_NAME: []const u8 = "faas.invoked_name";

/// The cloud provider of the invoked function.

/// 
/// Notes: SHOULD be equal to the `cloud.provider` resource attribute of the invoked function.
pub const FAAS_INVOKED_PROVIDER: []const u8 = "faas.invoked_provider";

/// The cloud region of the invoked function.

/// 
/// Notes: SHOULD be equal to the `cloud.region` resource attribute of the invoked function.
/// 
/// Examples:
///     eu-central-1
pub const FAAS_INVOKED_REGION: []const u8 = "faas.invoked_region";

/// The amount of memory available to the serverless function converted to Bytes.

/// 
/// Notes: It's recommended to set this attribute since e.g. too little memory can easily stop a Java AWS Lambda function from working correctly. On AWS Lambda, the environment variable `AWS_LAMBDA_FUNCTION_MEMORY_SIZE` provides this information (which must be multiplied by 1,048,576).
/// 
/// Examples:
///     134217728
pub const FAAS_MAX_MEMORY: []const u8 = "faas.max_memory";

/// The name of the single function that this runtime instance executes.

/// 
/// Notes: This is the name of the function as configured/deployed on the FaaS platform and is usually different from the name of the callback function (which may be stored in the [`code.namespace`/`code.function.name`](/docs/general/attributes.md#source-code-attributes) span attributes). For some cloud providers, the above definition is ambiguous. The following definition of function name MUST be used for this attribute (and consequently the span name) for the listed cloud providers/products: - **Azure:** The full name `[FUNCAPP]/[FUNC]`, i.e., function app name  followed by a forward slash followed by the function name (this form  can also be seen in the resource JSON for the function).  This means that a span attribute MUST be used, as an Azure function  app can host multiple functions that would usually share  a TracerProvider (see also the `cloud.resource_id` attribute).
/// 
/// Examples:
///     my-function
///     myazurefunctionapp/some-function-name
pub const FAAS_NAME: []const u8 = "faas.name";

/// A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

/// 
/// Examples:
///     2020-01-23T13:47:06Z
pub const FAAS_TIME: []const u8 = "faas.time";

/// Type of the trigger which caused this function invocation.

pub const FAAS_TRIGGER: []const u8 = "faas.trigger";

/// The immutable version of the function being executed.
/// 
/// Notes: Depending on the cloud provider and platform, use: - **AWS Lambda:** The [function version](https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html)  (an integer represented as a decimal string). - **Google Cloud Run (Services):** The [revision](https://cloud.google.com/run/docs/managing/revisions)  (i.e., the function name plus the revision suffix). - **Google Cloud Functions:** The value of the  [`K_REVISION` environment variable](https://cloud.google.com/functions/docs/env-var#runtime_environment_variables_set_automatically). - **Azure Functions:** Not applicable. Do not set this attribute.
/// 
/// Examples:
///     26
///     pinkfroid-00002
pub const FAAS_VERSION: []const u8 = "faas.version";

/// The unique identifier for the flag evaluation context. For example, the targeting key.

/// 
/// Examples:
///     5157782b-2203-4c80-a857-dbbd5e7761db
pub const FEATURE_FLAG_CONTEXT_ID: []const u8 = "feature_flag.context.id";

/// Deprecated, use `error.message` instead.
/// 
/// Examples:
///     Flag `header-color` expected type `string` but found type `number`
/// 
/// Note: This attribute is deprecated. Replaced by `error.message`.
pub const FEATURE_FLAG_EVALUATION_ERROR_MESSAGE: []const u8 = "feature_flag.evaluation.error.message";

/// Deprecated, use `feature_flag.result.reason` instead.
/// 
/// Examples:
///     static
///     targeting_match
///     error
///     default
/// 
/// Note: This attribute is deprecated. Replaced by `feature_flag.result.reason`.
pub const FEATURE_FLAG_EVALUATION_REASON: []const u8 = "feature_flag.evaluation.reason";

/// The lookup key of the feature flag.
/// 
/// Examples:
///     logo-color
pub const FEATURE_FLAG_KEY: []const u8 = "feature_flag.key";

/// Identifies the feature flag provider.
/// 
/// Examples:
///     Flag Manager
pub const FEATURE_FLAG_PROVIDER_NAME: []const u8 = "feature_flag.provider.name";

/// The reason code which shows how a feature flag value was determined.

/// 
/// Examples:
///     static
///     targeting_match
///     error
///     default
pub const FEATURE_FLAG_RESULT_REASON: []const u8 = "feature_flag.result.reason";

/// The evaluated value of the feature flag.
/// 
/// Notes: With some feature flag providers, feature flag results can be quite large or contain private or sensitive details. Because of this, `feature_flag.result.variant` is often the preferred attribute if it is available. It may be desirable to redact or otherwise limit the size and scope of `feature_flag.result.value` if possible. Because the evaluated flag value is unstructured and may be any type, it is left to the instrumentation author to determine how best to achieve this.
/// 
/// Examples:
///     #ff0000
///     true
///     3
pub const FEATURE_FLAG_RESULT_VALUE: []const u8 = "feature_flag.result.value";

/// A semantic identifier for an evaluated flag value.

/// 
/// Notes: A semantic identifier, commonly referred to as a variant, provides a means for referring to a value without including the value itself. This can provide additional context for understanding the meaning behind a value. For example, the variant `red` maybe be used for the value `#c05543`.
/// 
/// Examples:
///     red
///     true
///     on
pub const FEATURE_FLAG_RESULT_VARIANT: []const u8 = "feature_flag.result.variant";

/// The identifier of the [flag set](https://openfeature.dev/specification/glossary/#flag-set) to which the feature flag belongs.

/// 
/// Examples:
///     proj-1
///     ab98sgs
///     service1/dev
pub const FEATURE_FLAG_SET_ID: []const u8 = "feature_flag.set.id";

/// Deprecated, use `feature_flag.result.variant` instead.
/// 
/// Examples:
///     red
///     true
///     on
/// 
/// Note: This attribute is deprecated. Replaced by `feature_flag.result.variant`.
pub const FEATURE_FLAG_VARIANT: []const u8 = "feature_flag.variant";

/// The version of the ruleset used during the evaluation. This may be any stable value which uniquely identifies the ruleset.

/// 
/// Examples:
///     1
///     01ABCDEF
pub const FEATURE_FLAG_VERSION: []const u8 = "feature_flag.version";

/// Time when the file was last accessed, in ISO 8601 format.

/// 
/// Notes: This attribute might not be supported by some file systems — NFS, FAT32, in embedded OS, etc.
/// 
/// Examples:
///     2021-01-01T12:00:00Z
pub const FILE_ACCESSED: []const u8 = "file.accessed";

/// Array of file attributes.

/// 
/// Notes: Attributes names depend on the OS or file system. Here’s a non-exhaustive list of values expected for this attribute: `archive`, `compressed`, `directory`, `encrypted`, `execute`, `hidden`, `immutable`, `journaled`, `read`, `readonly`, `symbolic link`, `system`, `temporary`, `write`.
/// 
/// Examples:
///     [\"readonly\", \"hidden\"]
pub const FILE_ATTRIBUTES: []const u8 = "file.attributes";

/// Time when the file attributes or metadata was last changed, in ISO 8601 format.

/// 
/// Notes: `file.changed` captures the time when any of the file's properties or attributes (including the content) are changed, while `file.modified` captures the timestamp when the file content is modified.
/// 
/// Examples:
///     2021-01-01T12:00:00Z
pub const FILE_CHANGED: []const u8 = "file.changed";

/// Time when the file was created, in ISO 8601 format.

/// 
/// Notes: This attribute might not be supported by some file systems — NFS, FAT32, in embedded OS, etc.
/// 
/// Examples:
///     2021-01-01T12:00:00Z
pub const FILE_CREATED: []const u8 = "file.created";

/// Directory where the file is located. It should include the drive letter, when appropriate.

/// 
/// Examples:
///     /home/user
///     C:\Program Files\MyApp
pub const FILE_DIRECTORY: []const u8 = "file.directory";

/// File extension, excluding the leading dot.

/// 
/// Notes: When the file name has multiple extensions (example.tar.gz), only the last one should be captured ("gz", not "tar.gz").
/// 
/// Examples:
///     png
///     gz
pub const FILE_EXTENSION: []const u8 = "file.extension";

/// Name of the fork. A fork is additional data associated with a filesystem object.

/// 
/// Notes: On Linux, a resource fork is used to store additional data with a filesystem object. A file always has at least one fork for the data portion, and additional forks may exist. On NTFS, this is analogous to an Alternate Data Stream (ADS), and the default data stream for a file is just called $DATA. Zone.Identifier is commonly used by Windows to track contents downloaded from the Internet. An ADS is typically of the form: C:\path\to\filename.extension:some_fork_name, and some_fork_name is the value that should populate `fork_name`. `filename.extension` should populate `file.name`, and `extension` should populate `file.extension`. The full path, `file.path`, will include the fork name.
/// 
/// Examples:
///     Zone.Identifer
pub const FILE_FORK_NAME: []const u8 = "file.fork_name";

/// Primary Group ID (GID) of the file.

/// 
/// Examples:
///     1000
pub const FILE_GROUP_ID: []const u8 = "file.group.id";

/// Primary group name of the file.

/// 
/// Examples:
///     users
pub const FILE_GROUP_NAME: []const u8 = "file.group.name";

/// Inode representing the file in the filesystem.

/// 
/// Examples:
///     256383
pub const FILE_INODE: []const u8 = "file.inode";

/// Mode of the file in octal representation.

/// 
/// Examples:
///     0640
pub const FILE_MODE: []const u8 = "file.mode";

/// Time when the file content was last modified, in ISO 8601 format.

/// 
/// Examples:
///     2021-01-01T12:00:00Z
pub const FILE_MODIFIED: []const u8 = "file.modified";

/// Name of the file including the extension, without the directory.

/// 
/// Examples:
///     example.png
pub const FILE_NAME: []const u8 = "file.name";

/// The user ID (UID) or security identifier (SID) of the file owner.

/// 
/// Examples:
///     1000
pub const FILE_OWNER_ID: []const u8 = "file.owner.id";

/// Username of the file owner.

/// 
/// Examples:
///     root
pub const FILE_OWNER_NAME: []const u8 = "file.owner.name";

/// Full path to the file, including the file name. It should include the drive letter, when appropriate.

/// 
/// Examples:
///     /home/alice/example.png
///     C:\Program Files\MyApp\myapp.exe
pub const FILE_PATH: []const u8 = "file.path";

/// File size in bytes.

pub const FILE_SIZE: []const u8 = "file.size";

/// Path to the target of a symbolic link.

/// 
/// Notes: This attribute is only applicable to symbolic links.
/// 
/// Examples:
///     /usr/bin/python3
pub const FILE_SYMBOLIC_LINK_TARGET_PATH: []const u8 = "file.symbolic_link.target_path";

/// The container within GCP where the AppHub application is defined.

/// 
/// Examples:
///     projects/my-container-project
pub const GCP_APPHUB_APPLICATION_CONTAINER: []const u8 = "gcp.apphub.application.container";

/// The name of the application as configured in AppHub.

/// 
/// Examples:
///     my-application
pub const GCP_APPHUB_APPLICATION_ID: []const u8 = "gcp.apphub.application.id";

/// The GCP zone or region where the application is defined.

/// 
/// Examples:
///     us-central1
pub const GCP_APPHUB_APPLICATION_LOCATION: []const u8 = "gcp.apphub.application.location";

/// Criticality of a service indicates its importance to the business.

/// 
/// Notes: [See AppHub type enum](https://cloud.google.com/app-hub/docs/reference/rest/v1/Attributes#type)
pub const GCP_APPHUB_SERVICE_CRITICALITY_TYPE: []const u8 = "gcp.apphub.service.criticality_type";

/// Environment of a service is the stage of a software lifecycle.

/// 
/// Notes: [See AppHub environment type](https://cloud.google.com/app-hub/docs/reference/rest/v1/Attributes#type_1)
pub const GCP_APPHUB_SERVICE_ENVIRONMENT_TYPE: []const u8 = "gcp.apphub.service.environment_type";

/// The name of the service as configured in AppHub.

/// 
/// Examples:
///     my-service
pub const GCP_APPHUB_SERVICE_ID: []const u8 = "gcp.apphub.service.id";

/// Criticality of a workload indicates its importance to the business.

/// 
/// Notes: [See AppHub type enum](https://cloud.google.com/app-hub/docs/reference/rest/v1/Attributes#type)
pub const GCP_APPHUB_WORKLOAD_CRITICALITY_TYPE: []const u8 = "gcp.apphub.workload.criticality_type";

/// Environment of a workload is the stage of a software lifecycle.

/// 
/// Notes: [See AppHub environment type](https://cloud.google.com/app-hub/docs/reference/rest/v1/Attributes#type_1)
pub const GCP_APPHUB_WORKLOAD_ENVIRONMENT_TYPE: []const u8 = "gcp.apphub.workload.environment_type";

/// The name of the workload as configured in AppHub.

/// 
/// Examples:
///     my-workload
pub const GCP_APPHUB_WORKLOAD_ID: []const u8 = "gcp.apphub.workload.id";

/// Identifies the Google Cloud service for which the official client library is intended.
/// 
/// Notes: Intended to be a stable identifier for Google Cloud client libraries that is uniform across implementation languages. The value should be derived from the canonical service domain for the service; for example, 'foo.googleapis.com' should result in a value of 'foo'.
/// 
/// Examples:
///     appengine
///     run
///     firestore
///     alloydb
///     spanner
pub const GCP_CLIENT_SERVICE: []const u8 = "gcp.client.service";

/// The name of the Cloud Run [execution](https://cloud.google.com/run/docs/managing/job-executions) being run for the Job, as set by the [`CLOUD_RUN_EXECUTION`](https://cloud.google.com/run/docs/container-contract#jobs-env-vars) environment variable.

/// 
/// Examples:
///     job-name-xxxx
///     sample-job-mdw84
pub const GCP_CLOUD_RUN_JOB_EXECUTION: []const u8 = "gcp.cloud_run.job.execution";

/// The index for a task within an execution as provided by the [`CLOUD_RUN_TASK_INDEX`](https://cloud.google.com/run/docs/container-contract#jobs-env-vars) environment variable.

/// 
/// Examples:
///     0
///     1
pub const GCP_CLOUD_RUN_JOB_TASK_INDEX: []const u8 = "gcp.cloud_run.job.task_index";

/// The hostname of a GCE instance. This is the full value of the default or [custom hostname](https://cloud.google.com/compute/docs/instances/custom-hostname-vm).

/// 
/// Examples:
///     my-host1234.example.com
///     sample-vm.us-west1-b.c.my-project.internal
pub const GCP_GCE_INSTANCE_HOSTNAME: []const u8 = "gcp.gce.instance.hostname";

/// The instance name of a GCE instance. This is the value provided by `host.name`, the visible name of the instance in the Cloud Console UI, and the prefix for the default hostname of the instance as defined by the [default internal DNS name](https://cloud.google.com/compute/docs/internal-dns#instance-fully-qualified-domain-names).

/// 
/// Examples:
///     instance-1
///     my-vm-name
pub const GCP_GCE_INSTANCE_NAME: []const u8 = "gcp.gce.instance.name";

/// Free-form description of the GenAI agent provided by the application.
/// 
/// Examples:
///     Helps with math problems
///     Generates fiction stories
pub const GEN_AI_AGENT_DESCRIPTION: []const u8 = "gen_ai.agent.description";

/// The unique identifier of the GenAI agent.
/// 
/// Examples:
///     asst_5j66UpCpwteGg4YSxUnt7lPY
pub const GEN_AI_AGENT_ID: []const u8 = "gen_ai.agent.id";

/// Human-readable name of the GenAI agent provided by the application.
/// 
/// Examples:
///     Math Tutor
///     Fiction Writer
pub const GEN_AI_AGENT_NAME: []const u8 = "gen_ai.agent.name";

/// Deprecated, use Event API to report completions contents.
/// 
/// Examples:
///     [{'role': 'assistant', 'content': 'The capital of France is Paris.'}]
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.
pub const GEN_AI_COMPLETION: []const u8 = "gen_ai.completion";

/// The unique identifier for a conversation (session, thread), used to store and correlate messages within this conversation.
/// 
/// Examples:
///     conv_5j66UpCpwteGg4YSxUnt7lPY
pub const GEN_AI_CONVERSATION_ID: []const u8 = "gen_ai.conversation.id";

/// The data source identifier.
/// 
/// Notes: Data sources are used by AI agents and RAG applications to store grounding data. A data source may be an external database, object store, document collection, website, or any other storage system used by the GenAI agent or application. The `gen_ai.data_source.id` SHOULD match the identifier used by the GenAI system rather than a name specific to the external storage, such as a database or object store. Semantic conventions referencing `gen_ai.data_source.id` MAY also leverage additional attributes, such as `db.*`, to further identify and describe the data source.
/// 
/// Examples:
///     H7STPQYOND
pub const GEN_AI_DATA_SOURCE_ID: []const u8 = "gen_ai.data_source.id";

/// Deprecated, use `gen_ai.output.type`.

/// 
/// Note: This attribute is deprecated. Replaced by `gen_ai.output.type`.
pub const GEN_AI_OPENAI_REQUEST_RESPONSE_FORMAT: []const u8 = "gen_ai.openai.request.response_format";

/// Deprecated, use `gen_ai.request.seed`.
/// 
/// Examples:
///     100
/// 
/// Note: This attribute is deprecated. Replaced by `gen_ai.request.seed`.
pub const GEN_AI_OPENAI_REQUEST_SEED: []const u8 = "gen_ai.openai.request.seed";

/// The service tier requested. May be a specific tier, default, or auto.
/// 
/// Examples:
///     auto
///     default
pub const GEN_AI_OPENAI_REQUEST_SERVICE_TIER: []const u8 = "gen_ai.openai.request.service_tier";

/// The service tier used for the response.
/// 
/// Examples:
///     scale
///     default
pub const GEN_AI_OPENAI_RESPONSE_SERVICE_TIER: []const u8 = "gen_ai.openai.response.service_tier";

/// A fingerprint to track any eventual change in the Generative AI environment.
/// 
/// Examples:
///     fp_44709d6fcb
pub const GEN_AI_OPENAI_RESPONSE_SYSTEM_FINGERPRINT: []const u8 = "gen_ai.openai.response.system_fingerprint";

/// The name of the operation being performed.
/// 
/// Notes: If one of the predefined values applies, but specific system uses a different name it's RECOMMENDED to document it in the semantic conventions for specific GenAI system and use system-specific name in the instrumentation. If a different name is not documented, instrumentation libraries SHOULD use applicable predefined value.
pub const GEN_AI_OPERATION_NAME: []const u8 = "gen_ai.operation.name";

/// Represents the content type requested by the client.
/// 
/// Notes: This attribute SHOULD be used when the client requests output of a specific type. The model may return zero or more outputs of this type. This attribute specifies the output modality and not the actual output format. For example, if an image is requested, the actual output could be a URL pointing to an image file. Additional output format details may be recorded in the future in the `gen_ai.output.{type}.*` attributes.
pub const GEN_AI_OUTPUT_TYPE: []const u8 = "gen_ai.output.type";

/// Deprecated, use Event API to report prompt contents.
/// 
/// Examples:
///     [{'role': 'user', 'content': 'What is the capital of France?'}]
/// 
/// Note: This attribute is deprecated. Removed, no replacement at this time.
pub const GEN_AI_PROMPT: []const u8 = "gen_ai.prompt";

/// The target number of candidate completions to return.
/// 
/// Examples:
///     3
pub const GEN_AI_REQUEST_CHOICE_COUNT: []const u8 = "gen_ai.request.choice.count";

/// The encoding formats requested in an embeddings operation, if specified.
/// 
/// Notes: In some GenAI systems the encoding formats are called embedding types. Also, some GenAI systems only accept a single format per request.
/// 
/// Examples:
///     [\"base64\"]
///     [\"float\", \"binary\"]
pub const GEN_AI_REQUEST_ENCODING_FORMATS: []const u8 = "gen_ai.request.encoding_formats";

/// The frequency penalty setting for the GenAI request.
/// 
/// Examples:
///     0.1
pub const GEN_AI_REQUEST_FREQUENCY_PENALTY: []const u8 = "gen_ai.request.frequency_penalty";

/// The maximum number of tokens the model generates for a request.
/// 
/// Examples:
///     100
pub const GEN_AI_REQUEST_MAX_TOKENS: []const u8 = "gen_ai.request.max_tokens";

/// The name of the GenAI model a request is being made to.
/// 
/// Examples:
///     gpt-4
pub const GEN_AI_REQUEST_MODEL: []const u8 = "gen_ai.request.model";

/// The presence penalty setting for the GenAI request.
/// 
/// Examples:
///     0.1
pub const GEN_AI_REQUEST_PRESENCE_PENALTY: []const u8 = "gen_ai.request.presence_penalty";

/// Requests with same seed value more likely to return same result.
/// 
/// Examples:
///     100
pub const GEN_AI_REQUEST_SEED: []const u8 = "gen_ai.request.seed";

/// List of sequences that the model will use to stop generating further tokens.
/// 
/// Examples:
///     [\"forest\", \"lived\"]
pub const GEN_AI_REQUEST_STOP_SEQUENCES: []const u8 = "gen_ai.request.stop_sequences";

/// The temperature setting for the GenAI request.
/// 
/// Examples:
///     0.0
pub const GEN_AI_REQUEST_TEMPERATURE: []const u8 = "gen_ai.request.temperature";

/// The top_k sampling setting for the GenAI request.
/// 
/// Examples:
///     1.0
pub const GEN_AI_REQUEST_TOP_K: []const u8 = "gen_ai.request.top_k";

/// The top_p sampling setting for the GenAI request.
/// 
/// Examples:
///     1.0
pub const GEN_AI_REQUEST_TOP_P: []const u8 = "gen_ai.request.top_p";

/// Array of reasons the model stopped generating tokens, corresponding to each generation received.
/// 
/// Examples:
///     [\"stop\"]
///     [\"stop\", \"length\"]
pub const GEN_AI_RESPONSE_FINISH_REASONS: []const u8 = "gen_ai.response.finish_reasons";

/// The unique identifier for the completion.
/// 
/// Examples:
///     chatcmpl-123
pub const GEN_AI_RESPONSE_ID: []const u8 = "gen_ai.response.id";

/// The name of the model that generated the response.
/// 
/// Examples:
///     gpt-4-0613
pub const GEN_AI_RESPONSE_MODEL: []const u8 = "gen_ai.response.model";

/// The Generative AI product as identified by the client or server instrumentation.
/// 
/// Notes: The `gen_ai.system` describes a family of GenAI models with specific model identified by `gen_ai.request.model` and `gen_ai.response.model` attributes. The actual GenAI product may differ from the one identified by the client. Multiple systems, including Azure OpenAI and Gemini, are accessible by OpenAI client libraries. In such cases, the `gen_ai.system` is set to `openai` based on the instrumentation's best knowledge, instead of the actual system. The `server.address` attribute may help identify the actual system in use for `openai`. For custom model, a custom friendly name SHOULD be used. If none of these options apply, the `gen_ai.system` SHOULD be set to `_OTHER`.
/// 
/// Examples:
///     openai
pub const GEN_AI_SYSTEM: []const u8 = "gen_ai.system";

/// The type of token being counted.
/// 
/// Examples:
///     input
///     output
pub const GEN_AI_TOKEN_TYPE: []const u8 = "gen_ai.token.type";

/// The tool call identifier.
/// 
/// Examples:
///     call_mszuSIzqtI65i1wAUOE8w5H4
pub const GEN_AI_TOOL_CALL_ID: []const u8 = "gen_ai.tool.call.id";

/// The tool description.
/// 
/// Examples:
///     Multiply two numbers
pub const GEN_AI_TOOL_DESCRIPTION: []const u8 = "gen_ai.tool.description";

/// Name of the tool utilized by the agent.
/// 
/// Examples:
///     Flights
pub const GEN_AI_TOOL_NAME: []const u8 = "gen_ai.tool.name";

/// Type of the tool utilized by the agent
/// 
/// Notes: Extension: A tool executed on the agent-side to directly call external APIs, bridging the gap between the agent and real-world systems.  Agent-side operations involve actions that are performed by the agent on the server or within the agent's controlled environment. Function: A tool executed on the client-side, where the agent generates parameters for a predefined function, and the client executes the logic.  Client-side operations are actions taken on the user's end or within the client application. Datastore: A tool used by the agent to access and query structured or unstructured external data for retrieval-augmented tasks or knowledge updates.
/// 
/// Examples:
///     function
///     extension
///     datastore
pub const GEN_AI_TOOL_TYPE: []const u8 = "gen_ai.tool.type";

/// Deprecated, use `gen_ai.usage.output_tokens` instead.
/// 
/// Examples:
///     42
/// 
/// Note: This attribute is deprecated. Replaced by `gen_ai.usage.output_tokens`.
pub const GEN_AI_USAGE_COMPLETION_TOKENS: []const u8 = "gen_ai.usage.completion_tokens";

/// The number of tokens used in the GenAI input (prompt).
/// 
/// Examples:
///     100
pub const GEN_AI_USAGE_INPUT_TOKENS: []const u8 = "gen_ai.usage.input_tokens";

/// The number of tokens used in the GenAI response (completion).
/// 
/// Examples:
///     180
pub const GEN_AI_USAGE_OUTPUT_TOKENS: []const u8 = "gen_ai.usage.output_tokens";

/// Deprecated, use `gen_ai.usage.input_tokens` instead.
/// 
/// Examples:
///     42
/// 
/// Note: This attribute is deprecated. Replaced by `gen_ai.usage.input_tokens`.
pub const GEN_AI_USAGE_PROMPT_TOKENS: []const u8 = "gen_ai.usage.prompt_tokens";

/// Two-letter code representing continent’s name.

pub const GEO_CONTINENT_CODE: []const u8 = "geo.continent.code";

/// Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1#Codes)).

/// 
/// Examples:
///     CA
pub const GEO_COUNTRY_ISO_CODE: []const u8 = "geo.country.iso_code";

/// Locality name. Represents the name of a city, town, village, or similar populated place.

/// 
/// Examples:
///     Montreal
///     Berlin
pub const GEO_LOCALITY_NAME: []const u8 = "geo.locality.name";

/// Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System#WGS84).

/// 
/// Examples:
///     45.505918
pub const GEO_LOCATION_LAT: []const u8 = "geo.location.lat";

/// Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System#WGS84).

/// 
/// Examples:
///     -73.61483
pub const GEO_LOCATION_LON: []const u8 = "geo.location.lon";

/// Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.

/// 
/// Examples:
///     94040
pub const GEO_POSTAL_CODE: []const u8 = "geo.postal_code";

/// Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).

/// 
/// Examples:
///     CA-QC
pub const GEO_REGION_ISO_CODE: []const u8 = "geo.region.iso_code";

/// The type of memory.
/// 
/// Examples:
///     other
///     stack
pub const GO_MEMORY_TYPE: []const u8 = "go.memory.type";

/// The GraphQL document being executed.
/// 
/// Notes: The value may be sanitized to exclude sensitive information.
/// 
/// Examples:
///     query findBookById { bookById(id: ?) { name } }
pub const GRAPHQL_DOCUMENT: []const u8 = "graphql.document";

/// The name of the operation being executed.
/// 
/// Examples:
///     findBookById
pub const GRAPHQL_OPERATION_NAME: []const u8 = "graphql.operation.name";

/// The type of the operation being executed.
/// 
/// Examples:
///     query
///     mutation
///     subscription
pub const GRAPHQL_OPERATION_TYPE: []const u8 = "graphql.operation.type";

/// Unique identifier for the application

/// 
/// Examples:
///     2daa2797-e42b-4624-9322-ec3f968df4da
pub const HEROKU_APP_ID: []const u8 = "heroku.app.id";

/// Commit hash for the current release

/// 
/// Examples:
///     e6134959463efd8966b20e75b913cafe3f5ec
pub const HEROKU_RELEASE_COMMIT: []const u8 = "heroku.release.commit";

/// Time and date the release was created

/// 
/// Examples:
///     2022-10-23T18:00:42Z
pub const HEROKU_RELEASE_CREATION_TIMESTAMP: []const u8 = "heroku.release.creation_timestamp";

/// The CPU architecture the host system is running on.

pub const HOST_ARCH: []const u8 = "host.arch";

/// The amount of level 2 memory cache available to the processor (in Bytes).

/// 
/// Examples:
///     12288000
pub const HOST_CPU_CACHE_L2_SIZE: []const u8 = "host.cpu.cache.l2.size";

/// Family or generation of the CPU.

/// 
/// Examples:
///     6
///     PA-RISC 1.1e
pub const HOST_CPU_FAMILY: []const u8 = "host.cpu.family";

/// Model identifier. It provides more granular information about the CPU, distinguishing it from other CPUs within the same family.

/// 
/// Examples:
///     6
///     9000/778/B180L
pub const HOST_CPU_MODEL_ID: []const u8 = "host.cpu.model.id";

/// Model designation of the processor.

/// 
/// Examples:
///     11th Gen Intel(R) Core(TM) i7-1185G7 @ 3.00GHz
pub const HOST_CPU_MODEL_NAME: []const u8 = "host.cpu.model.name";

/// Stepping or core revisions.

/// 
/// Examples:
///     1
///     r1p1
pub const HOST_CPU_STEPPING: []const u8 = "host.cpu.stepping";

/// Processor manufacturer identifier. A maximum 12-character string.

/// 
/// Notes: [CPUID](https://wiki.osdev.org/CPUID) command returns the vendor ID string in EBX, EDX and ECX registers. Writing these to memory in this order results in a 12-character string.
/// 
/// Examples:
///     GenuineIntel
pub const HOST_CPU_VENDOR_ID: []const u8 = "host.cpu.vendor.id";

/// Unique host ID. For Cloud, this must be the instance_id assigned by the cloud provider. For non-containerized systems, this should be the `machine-id`. See the table below for the sources to use to determine the `machine-id` based on operating system.

/// 
/// Examples:
///     fdbf79e8af94cb7f9e8df36789187052
pub const HOST_ID: []const u8 = "host.id";

/// VM image ID or host OS image ID. For Cloud, this value is from the provider.

/// 
/// Examples:
///     ami-07b06b442921831e5
pub const HOST_IMAGE_ID: []const u8 = "host.image.id";

/// Name of the VM image or OS install the host was instantiated from.

/// 
/// Examples:
///     infra-ami-eks-worker-node-7d4ec78312
///     CentOS-8-x86_64-1905
pub const HOST_IMAGE_NAME: []const u8 = "host.image.name";

/// The version string of the VM image or host OS as defined in [Version Attributes](/docs/resource/README.md#version-attributes).

/// 
/// Examples:
///     0.1
pub const HOST_IMAGE_VERSION: []const u8 = "host.image.version";

/// Available IP addresses of the host, excluding loopback interfaces.

/// 
/// Notes: IPv4 Addresses MUST be specified in dotted-quad notation. IPv6 addresses MUST be specified in the [RFC 5952](https://www.rfc-editor.org/rfc/rfc5952.html) format.
/// 
/// Examples:
///     [\"192.168.1.140\", \"fe80::abc2:4a28:737a:609e\"]
pub const HOST_IP: []const u8 = "host.ip";

/// Available MAC addresses of the host, excluding loopback interfaces.

/// 
/// Notes: MAC Addresses MUST be represented in [IEEE RA hexadecimal form](https://standards.ieee.org/wp-content/uploads/import/documents/tutorials/eui.pdf): as hyphen-separated octets in uppercase hexadecimal form from most to least significant.
/// 
/// Examples:
///     [\"AC-DE-48-23-45-67\", \"AC-DE-48-23-45-67-01-9F\"]
pub const HOST_MAC: []const u8 = "host.mac";

/// Name of the host. On Unix systems, it may contain what the hostname command returns, or the fully qualified hostname, or another name specified by the user.

/// 
/// Examples:
///     opentelemetry-test
pub const HOST_NAME: []const u8 = "host.name";

/// Type of host. For Cloud, this must be the machine type.

/// 
/// Examples:
///     n1-standard-1
pub const HOST_TYPE: []const u8 = "host.type";

/// Deprecated, use `client.address` instead.
/// 
/// Examples:
///     83.164.160.102
/// 
/// Note: This attribute is deprecated. Replaced by `client.address`.
pub const HTTP_CLIENT_IP: []const u8 = "http.client_ip";

/// State of the HTTP connection in the HTTP connection pool.
/// 
/// Examples:
///     active
///     idle
pub const HTTP_CONNECTION_STATE: []const u8 = "http.connection.state";

/// Deprecated, use `network.protocol.name` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `network.protocol.name`.
pub const HTTP_FLAVOR: []const u8 = "http.flavor";

/// Deprecated, use one of `server.address`, `client.address` or `http.request.header.host` instead, depending on the usage.
/// 
/// Examples:
///     www.example.org
/// 
/// Note: This attribute is deprecated. Replaced by one of `server.address`, `client.address` or `http.request.header.host`, depending on the usage.

pub const HTTP_HOST: []const u8 = "http.host";

/// Deprecated, use `http.request.method` instead.
/// 
/// Examples:
///     GET
///     POST
///     HEAD
/// 
/// Note: This attribute is deprecated. Replaced by `http.request.method`.
pub const HTTP_METHOD: []const u8 = "http.method";

/// The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.

/// 
/// Examples:
///     3495
pub const HTTP_REQUEST_BODY_SIZE: []const u8 = "http.request.body.size";

/// HTTP request headers, ``key`` being the normalized HTTP Header name (lowercase), the value being the header values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which headers are to be captured. Including all request headers can be a security risk - explicit configuration helps avoid leaking sensitive information. The `User-Agent` header is already captured in the `user_agent.original` attribute. Users MAY explicitly configure instrumentations to capture them even though it is not recommended. The attribute value MUST consist of either multiple header values as an array of strings or a single-item array containing a possibly comma-concatenated string, depending on the way the HTTP library provides access to headers. Examples: - A header `Content-Type: application/json` SHOULD be recorded as the `http.request.header.content-type`  attribute with value `["application/json"]`. - A header `X-Forwarded-For: 1.2.3.4, 1.2.3.5` SHOULD be recorded as the `http.request.header.x-forwarded-for`  attribute with value `["1.2.3.4", "1.2.3.5"]` or `["1.2.3.4, 1.2.3.5"]` depending on the HTTP library.
/// 
/// Examples:
///     [\"application/json\"]
///     [\"1.2.3.4\", \"1.2.3.5\"]
pub const HTTP_REQUEST_HEADER: []const u8 = "http.request.header";

/// HTTP request method.
/// 
/// Notes: HTTP request method value SHOULD be "known" to the instrumentation. By default, this convention defines "known" methods as the ones listed in [RFC9110](https://www.rfc-editor.org/rfc/rfc9110.html#name-methods) and the PATCH method defined in [RFC5789](https://www.rfc-editor.org/rfc/rfc5789.html). If the HTTP request method is not known to instrumentation, it MUST set the `http.request.method` attribute to `_OTHER`. If the HTTP instrumentation could end up converting valid HTTP request methods to `_OTHER`, then it MUST provide a way to override the list of known HTTP methods. If this override is done via environment variable, then the environment variable MUST be named OTEL_INSTRUMENTATION_HTTP_KNOWN_METHODS and support a comma-separated list of case-sensitive known HTTP methods (this list MUST be a full override of the default known method, it is not a list of known methods in addition to the defaults). HTTP method names are case-sensitive and `http.request.method` attribute value MUST match a known HTTP method name exactly. Instrumentations for specific web frameworks that consider HTTP methods to be case insensitive, SHOULD populate a canonical equivalent. Tracing instrumentations that do so, MUST also set `http.request.method_original` to the original value.
/// 
/// Examples:
///     GET
///     POST
///     HEAD
pub const HTTP_REQUEST_METHOD: []const u8 = "http.request.method";

/// Original HTTP method sent by the client in the request line.
/// 
/// Examples:
///     GeT
///     ACL
///     foo
pub const HTTP_REQUEST_METHOD_ORIGINAL: []const u8 = "http.request.method_original";

/// The ordinal number of request resending attempt (for any reason, including redirects).

/// 
/// Notes: The resend count SHOULD be updated each time an HTTP request gets resent by the client, regardless of what was the cause of the resending (e.g. redirection, authorization failure, 503 Server Unavailable, network issues, or any other).
/// 
/// Examples:
///     3
pub const HTTP_REQUEST_RESEND_COUNT: []const u8 = "http.request.resend_count";

/// The total size of the request in bytes. This should be the total number of bytes sent over the wire, including the request line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and request body if any.

/// 
/// Examples:
///     1437
pub const HTTP_REQUEST_SIZE: []const u8 = "http.request.size";

/// Deprecated, use `http.request.header.content-length` instead.
/// 
/// Examples:
///     3495
/// 
/// Note: This attribute is deprecated. Replaced by `http.request.header.content-length`.
pub const HTTP_REQUEST_CONTENT_LENGTH: []const u8 = "http.request_content_length";

/// Deprecated, use `http.request.body.size` instead.
/// 
/// Examples:
///     5493
/// 
/// Note: This attribute is deprecated. Replaced by `http.request.body.size`.
pub const HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED: []const u8 = "http.request_content_length_uncompressed";

/// The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.

/// 
/// Examples:
///     3495
pub const HTTP_RESPONSE_BODY_SIZE: []const u8 = "http.response.body.size";

/// HTTP response headers, ``key`` being the normalized HTTP Header name (lowercase), the value being the header values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which headers are to be captured. Including all response headers can be a security risk - explicit configuration helps avoid leaking sensitive information. Users MAY explicitly configure instrumentations to capture them even though it is not recommended. The attribute value MUST consist of either multiple header values as an array of strings or a single-item array containing a possibly comma-concatenated string, depending on the way the HTTP library provides access to headers. Examples: - A header `Content-Type: application/json` header SHOULD be recorded as the `http.request.response.content-type`  attribute with value `["application/json"]`. - A header `My-custom-header: abc, def` header SHOULD be recorded as the `http.response.header.my-custom-header`  attribute with value `["abc", "def"]` or `["abc, def"]` depending on the HTTP library.
/// 
/// Examples:
///     [\"application/json\"]
///     [\"abc\", \"def\"]
pub const HTTP_RESPONSE_HEADER: []const u8 = "http.response.header";

/// The total size of the response in bytes. This should be the total number of bytes sent over the wire, including the status line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and response body and trailers if any.

/// 
/// Examples:
///     1437
pub const HTTP_RESPONSE_SIZE: []const u8 = "http.response.size";

/// [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).
/// 
/// Examples:
///     200
pub const HTTP_RESPONSE_STATUS_CODE: []const u8 = "http.response.status_code";

/// Deprecated, use `http.response.header.content-length` instead.
/// 
/// Examples:
///     3495
/// 
/// Note: This attribute is deprecated. Replaced by `http.response.header.content-length`.
pub const HTTP_RESPONSE_CONTENT_LENGTH: []const u8 = "http.response_content_length";

/// Deprecated, use `http.response.body.size` instead.
/// 
/// Examples:
///     5493
/// 
/// Note: This attribute is deprecated. Replaced by `http.response.body.size`.
pub const HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED: []const u8 = "http.response_content_length_uncompressed";

/// The matched route, that is, the path template in the format used by the respective server framework.

/// 
/// Notes: MUST NOT be populated when this is not supported by the HTTP server framework as the route attribute should have low-cardinality and the URI path can NOT substitute it. SHOULD include the [application root](/docs/http/http-spans.md#http-server-definitions) if there is one.
/// 
/// Examples:
///     /users/:userID?
///     {controller}/{action}/{id?}
pub const HTTP_ROUTE: []const u8 = "http.route";

/// Deprecated, use `url.scheme` instead.
/// 
/// Examples:
///     http
///     https
/// 
/// Note: This attribute is deprecated. Replaced by `url.scheme`.
pub const HTTP_SCHEME: []const u8 = "http.scheme";

/// Deprecated, use `server.address` instead.
/// 
/// Examples:
///     example.com
/// 
/// Note: This attribute is deprecated. Replaced by `server.address`.
pub const HTTP_SERVER_NAME: []const u8 = "http.server_name";

/// Deprecated, use `http.response.status_code` instead.
/// 
/// Examples:
///     200
/// 
/// Note: This attribute is deprecated. Replaced by `http.response.status_code`.
pub const HTTP_STATUS_CODE: []const u8 = "http.status_code";

/// Deprecated, use `url.path` and `url.query` instead.
/// 
/// Examples:
///     /search?q=OpenTelemetry#SemConv
/// 
/// Note: This attribute is deprecated. Split to `url.path` and `url.query`.
pub const HTTP_TARGET: []const u8 = "http.target";

/// Deprecated, use `url.full` instead.
/// 
/// Examples:
///     https://www.foo.bar/search?q=OpenTelemetry#SemConv
/// 
/// Note: This attribute is deprecated. Replaced by `url.full`.
pub const HTTP_URL: []const u8 = "http.url";

/// Deprecated, use `user_agent.original` instead.
/// 
/// Examples:
///     CERN-LineMode/2.15 libwww/2.17b3
///     Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1
/// 
/// Note: This attribute is deprecated. Replaced by `user_agent.original`.
pub const HTTP_USER_AGENT: []const u8 = "http.user_agent";

/// An identifier for the hardware component, unique within the monitored host

/// 
/// Examples:
///     win32battery_battery_testsysa33_1
pub const HW_ID: []const u8 = "hw.id";

/// An easily-recognizable name for the hardware component

/// 
/// Examples:
///     eth0
pub const HW_NAME: []const u8 = "hw.name";

/// Unique identifier of the parent component (typically the `hw.id` attribute of the enclosure, or disk controller)

/// 
/// Examples:
///     dellStorage_perc_0
pub const HW_PARENT: []const u8 = "hw.parent";

/// The current state of the component

pub const HW_STATE: []const u8 = "hw.state";

/// Type of the component

/// 
/// Notes: Describes the category of the hardware component for which `hw.state` is being reported. For example, `hw.type=temperature` along with `hw.state=degraded` would indicate that the temperature of the hardware component has been reported as `degraded`.
pub const HW_TYPE: []const u8 = "hw.type";

/// This attribute represents the state of the application.

/// 
/// Notes: The iOS lifecycle states are defined in the [UIApplicationDelegate documentation](https://developer.apple.com/documentation/uikit/uiapplicationdelegate), and from which the `OS terminology` column values are derived.
pub const IOS_APP_STATE: []const u8 = "ios.app.state";

/// 
/// 
/// Notes: The iOS lifecycle states are defined in the [UIApplicationDelegate documentation](https://developer.apple.com/documentation/uikit/uiapplicationdelegate), and from which the `OS terminology` column values are derived.
/// 
/// Note: This attribute is deprecated. Replaced by the `ios.app.state` event body field.
pub const IOS_STATE: []const u8 = "ios.state";

/// Name of the buffer pool.
/// 
/// Notes: Pool names are generally obtained via [BufferPoolMXBean#getName()](https://docs.oracle.com/en/java/javase/11/docs/api/java.management/java/lang/management/BufferPoolMXBean.html#getName()).
/// 
/// Examples:
///     mapped
///     direct
pub const JVM_BUFFER_POOL_NAME: []const u8 = "jvm.buffer.pool.name";

/// Name of the garbage collector action.
/// 
/// Notes: Garbage collector action is generally obtained via [GarbageCollectionNotificationInfo#getGcAction()](https://docs.oracle.com/en/java/javase/11/docs/api/jdk.management/com/sun/management/GarbageCollectionNotificationInfo.html#getGcAction()).
/// 
/// Examples:
///     end of minor GC
///     end of major GC
pub const JVM_GC_ACTION: []const u8 = "jvm.gc.action";

/// Name of the garbage collector cause.
/// 
/// Notes: Garbage collector cause is generally obtained via [GarbageCollectionNotificationInfo#getGcCause()](https://docs.oracle.com/en/java/javase/11/docs/api/jdk.management/com/sun/management/GarbageCollectionNotificationInfo.html#getGcCause()).
/// 
/// Examples:
///     System.gc()
///     Allocation Failure
pub const JVM_GC_CAUSE: []const u8 = "jvm.gc.cause";

/// Name of the garbage collector.
/// 
/// Notes: Garbage collector name is generally obtained via [GarbageCollectionNotificationInfo#getGcName()](https://docs.oracle.com/en/java/javase/11/docs/api/jdk.management/com/sun/management/GarbageCollectionNotificationInfo.html#getGcName()).
/// 
/// Examples:
///     G1 Young Generation
///     G1 Old Generation
pub const JVM_GC_NAME: []const u8 = "jvm.gc.name";

/// Name of the memory pool.
/// 
/// Notes: Pool names are generally obtained via [MemoryPoolMXBean#getName()](https://docs.oracle.com/en/java/javase/11/docs/api/java.management/java/lang/management/MemoryPoolMXBean.html#getName()).
/// 
/// Examples:
///     G1 Old Gen
///     G1 Eden space
///     G1 Survivor Space
pub const JVM_MEMORY_POOL_NAME: []const u8 = "jvm.memory.pool.name";

/// The type of memory.
/// 
/// Examples:
///     heap
///     non_heap
pub const JVM_MEMORY_TYPE: []const u8 = "jvm.memory.type";

/// Whether the thread is daemon or not.
pub const JVM_THREAD_DAEMON: []const u8 = "jvm.thread.daemon";

/// State of the thread.
/// 
/// Examples:
///     runnable
///     blocked
pub const JVM_THREAD_STATE: []const u8 = "jvm.thread.state";

/// The name of the cluster.

/// 
/// Examples:
///     opentelemetry-cluster
pub const K8S_CLUSTER_NAME: []const u8 = "k8s.cluster.name";

/// A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.

/// 
/// Notes: K8s doesn't have support for obtaining a cluster ID. If this is ever added, we will recommend collecting the `k8s.cluster.uid` through the official APIs. In the meantime, we are able to use the `uid` of the `kube-system` namespace as a proxy for cluster ID. Read on for the rationale. Every object created in a K8s cluster is assigned a distinct UID. The `kube-system` namespace is used by Kubernetes itself and will exist for the lifetime of the cluster. Using the `uid` of the `kube-system` namespace is a reasonable proxy for the K8s ClusterID as it will only change if the cluster is rebuilt. Furthermore, Kubernetes UIDs are UUIDs as standardized by [ISO/IEC 9834-8 and ITU-T X.667](https://www.itu.int/ITU-T/studygroups/com17/oid.html). Which states: ] If generated according to one of the mechanisms defined in Rec. ] ITU-T X.667 | ISO/IEC 9834-8, a UUID is either guaranteed to be ] different from all other UUIDs generated before 3603 A.D., or is ] extremely likely to be different (depending on the mechanism chosen). Therefore, UIDs between clusters should be extremely unlikely to conflict.
/// 
/// Examples:
///     218fc5a9-a5f1-4b54-aa05-46717d0ab26d
pub const K8S_CLUSTER_UID: []const u8 = "k8s.cluster.uid";

/// The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).

/// 
/// Examples:
///     redis
pub const K8S_CONTAINER_NAME: []const u8 = "k8s.container.name";

/// Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.

pub const K8S_CONTAINER_RESTART_COUNT: []const u8 = "k8s.container.restart_count";

/// Last terminated reason of the Container.

/// 
/// Examples:
///     Evicted
///     Error
pub const K8S_CONTAINER_STATUS_LAST_TERMINATED_REASON: []const u8 = "k8s.container.status.last_terminated_reason";

/// The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#containerstatewaiting-v1-core) or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#containerstateterminated-v1-core)

/// 
/// Examples:
///     ContainerCreating
///     CrashLoopBackOff
///     CreateContainerConfigError
///     ErrImagePull
///     ImagePullBackOff
///     OOMKilled
///     Completed
///     Error
///     ContainerCannotRun
pub const K8S_CONTAINER_STATUS_REASON: []const u8 = "k8s.container.status.reason";

/// The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#containerstate-v1-core)

/// 
/// Examples:
///     terminated
///     running
///     waiting
pub const K8S_CONTAINER_STATUS_STATE: []const u8 = "k8s.container.status.state";

/// The cronjob annotation placed on the CronJob, the ``key`` being the annotation name, the value being the annotation value.

/// 
/// Notes: Examples: - An annotation `retries` with value `4` SHOULD be recorded as the  `k8s.cronjob.annotation.retries` attribute with value `"4"`. - An annotation `data` with empty string value SHOULD be recorded as  the `k8s.cronjob.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     4
///     
pub const K8S_CRONJOB_ANNOTATION: []const u8 = "k8s.cronjob.annotation";

/// The label placed on the CronJob, the ``key`` being the label name, the value being the label value.

/// 
/// Notes: Examples: - A label `type` with value `weekly` SHOULD be recorded as the  `k8s.cronjob.label.type` attribute with value `"weekly"`. - A label `automated` with empty string value SHOULD be recorded as  the `k8s.cronjob.label.automated` attribute with value `""`.
/// 
/// Examples:
///     weekly
///     
pub const K8S_CRONJOB_LABEL: []const u8 = "k8s.cronjob.label";

/// The name of the CronJob.

/// 
/// Examples:
///     opentelemetry
pub const K8S_CRONJOB_NAME: []const u8 = "k8s.cronjob.name";

/// The UID of the CronJob.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_CRONJOB_UID: []const u8 = "k8s.cronjob.uid";

/// The annotation placed on the DaemonSet, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `1` SHOULD be recorded  as the `k8s.daemonset.annotation.replicas` attribute with value `"1"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.daemonset.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     1
///     
pub const K8S_DAEMONSET_ANNOTATION: []const u8 = "k8s.daemonset.annotation";

/// The label placed on the DaemonSet, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `app` with value `guestbook` SHOULD be recorded  as the `k8s.daemonset.label.app` attribute with value `"guestbook"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.daemonset.label.injected` attribute with value `""`.
/// 
/// Examples:
///     guestbook
///     
pub const K8S_DAEMONSET_LABEL: []const u8 = "k8s.daemonset.label";

/// The name of the DaemonSet.

/// 
/// Examples:
///     opentelemetry
pub const K8S_DAEMONSET_NAME: []const u8 = "k8s.daemonset.name";

/// The UID of the DaemonSet.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_DAEMONSET_UID: []const u8 = "k8s.daemonset.uid";

/// The annotation placed on the Deployment, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `1` SHOULD be recorded  as the `k8s.deployment.annotation.replicas` attribute with value `"1"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.deployment.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     1
///     
pub const K8S_DEPLOYMENT_ANNOTATION: []const u8 = "k8s.deployment.annotation";

/// The label placed on the Deployment, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `0` SHOULD be recorded  as the `k8s.deployment.label.app` attribute with value `"guestbook"`. - A label `injected` with empty string value SHOULD be recorded as  the `k8s.deployment.label.injected` attribute with value `""`.
/// 
/// Examples:
///     guestbook
///     
pub const K8S_DEPLOYMENT_LABEL: []const u8 = "k8s.deployment.label";

/// The name of the Deployment.

/// 
/// Examples:
///     opentelemetry
pub const K8S_DEPLOYMENT_NAME: []const u8 = "k8s.deployment.name";

/// The UID of the Deployment.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_DEPLOYMENT_UID: []const u8 = "k8s.deployment.uid";

/// The type of metric source for the horizontal pod autoscaler.

/// 
/// Notes: This attribute reflects the `type` field of spec.metrics[] in the HPA.
/// 
/// Examples:
///     Resource
///     ContainerResource
pub const K8S_HPA_METRIC_TYPE: []const u8 = "k8s.hpa.metric.type";

/// The name of the horizontal pod autoscaler.

/// 
/// Examples:
///     opentelemetry
pub const K8S_HPA_NAME: []const u8 = "k8s.hpa.name";

/// The API version of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// Notes: This maps to the `apiVersion` field in the `scaleTargetRef` of the HPA spec.
/// 
/// Examples:
///     apps/v1
///     autoscaling/v2
pub const K8S_HPA_SCALETARGETREF_API_VERSION: []const u8 = "k8s.hpa.scaletargetref.api_version";

/// The kind of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// Notes: This maps to the `kind` field in the `scaleTargetRef` of the HPA spec.
/// 
/// Examples:
///     Deployment
///     StatefulSet
pub const K8S_HPA_SCALETARGETREF_KIND: []const u8 = "k8s.hpa.scaletargetref.kind";

/// The name of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// Notes: This maps to the `name` field in the `scaleTargetRef` of the HPA spec.
/// 
/// Examples:
///     my-deployment
///     my-statefulset
pub const K8S_HPA_SCALETARGETREF_NAME: []const u8 = "k8s.hpa.scaletargetref.name";

/// The UID of the horizontal pod autoscaler.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_HPA_UID: []const u8 = "k8s.hpa.uid";

/// The size (identifier) of the K8s huge page.

/// 
/// Examples:
///     2Mi
pub const K8S_HUGEPAGE_SIZE: []const u8 = "k8s.hugepage.size";

/// The annotation placed on the Job, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `number` with value `1` SHOULD be recorded  as the `k8s.job.annotation.number` attribute with value `"1"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.job.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     1
///     
pub const K8S_JOB_ANNOTATION: []const u8 = "k8s.job.annotation";

/// The label placed on the Job, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `jobtype` with value `ci` SHOULD be recorded  as the `k8s.job.label.jobtype` attribute with value `"ci"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.job.label.automated` attribute with value `""`.
/// 
/// Examples:
///     ci
///     
pub const K8S_JOB_LABEL: []const u8 = "k8s.job.label";

/// The name of the Job.

/// 
/// Examples:
///     opentelemetry
pub const K8S_JOB_NAME: []const u8 = "k8s.job.name";

/// The UID of the Job.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_JOB_UID: []const u8 = "k8s.job.uid";

/// The annotation placed on the Namespace, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `ttl` with value `0` SHOULD be recorded  as the `k8s.namespace.annotation.ttl` attribute with value `"0"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.namespace.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     0
///     
pub const K8S_NAMESPACE_ANNOTATION: []const u8 = "k8s.namespace.annotation";

/// The label placed on the Namespace, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `kubernetes.io/metadata.name` with value `default` SHOULD be recorded  as the `k8s.namespace.label.kubernetes.io/metadata.name` attribute with value `"default"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.namespace.label.data` attribute with value `""`.
/// 
/// Examples:
///     default
///     
pub const K8S_NAMESPACE_LABEL: []const u8 = "k8s.namespace.label";

/// The name of the namespace that the pod is running in.

/// 
/// Examples:
///     default
pub const K8S_NAMESPACE_NAME: []const u8 = "k8s.namespace.name";

/// The phase of the K8s namespace.

/// 
/// Notes: This attribute aligns with the `phase` field of the [K8s NamespaceStatus](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#namespacestatus-v1-core)
/// 
/// Examples:
///     active
///     terminating
pub const K8S_NAMESPACE_PHASE: []const u8 = "k8s.namespace.phase";

/// The annotation placed on the Node, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - An annotation `node.alpha.kubernetes.io/ttl` with value `0` SHOULD be recorded as  the `k8s.node.annotation.node.alpha.kubernetes.io/ttl` attribute with value `"0"`. - An annotation `data` with empty string value SHOULD be recorded as  the `k8s.node.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     0
///     
pub const K8S_NODE_ANNOTATION: []const u8 = "k8s.node.annotation";

/// The status of the condition, one of True, False, Unknown.

/// 
/// Notes: This attribute aligns with the `status` field of the [NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#nodecondition-v1-core)
/// 
/// Examples:
///     true
///     false
///     unknown
pub const K8S_NODE_CONDITION_STATUS: []const u8 = "k8s.node.condition.status";

/// The condition type of a K8s Node.

/// 
/// Notes: K8s Node conditions as described by [K8s documentation](https://v1-32.docs.kubernetes.io/docs/reference/node/node-status/#condition). This attribute aligns with the `type` field of the [NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#nodecondition-v1-core) The set of possible values is not limited to those listed here. Managed Kubernetes environments, or custom controllers MAY introduce additional node condition types. When this occurs, the exact value as reported by the Kubernetes API SHOULD be used.
/// 
/// Examples:
///     Ready
///     DiskPressure
pub const K8S_NODE_CONDITION_TYPE: []const u8 = "k8s.node.condition.type";

/// The label placed on the Node, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `kubernetes.io/arch` with value `arm64` SHOULD be recorded  as the `k8s.node.label.kubernetes.io/arch` attribute with value `"arm64"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.node.label.data` attribute with value `""`.
/// 
/// Examples:
///     arm64
///     
pub const K8S_NODE_LABEL: []const u8 = "k8s.node.label";

/// The name of the Node.

/// 
/// Examples:
///     node-1
pub const K8S_NODE_NAME: []const u8 = "k8s.node.name";

/// The UID of the Node.

/// 
/// Examples:
///     1eb3a0c6-0477-4080-a9cb-0cb7db65c6a2
pub const K8S_NODE_UID: []const u8 = "k8s.node.uid";

/// The annotation placed on the Pod, the ``key`` being the annotation name, the value being the annotation value.

/// 
/// Notes: Examples: - An annotation `kubernetes.io/enforce-mountable-secrets` with value `true` SHOULD be recorded as  the `k8s.pod.annotation.kubernetes.io/enforce-mountable-secrets` attribute with value `"true"`. - An annotation `mycompany.io/arch` with value `x64` SHOULD be recorded as  the `k8s.pod.annotation.mycompany.io/arch` attribute with value `"x64"`. - An annotation `data` with empty string value SHOULD be recorded as  the `k8s.pod.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     true
///     x64
///     
pub const K8S_POD_ANNOTATION: []const u8 = "k8s.pod.annotation";

/// The label placed on the Pod, the ``key`` being the label name, the value being the label value.

/// 
/// Notes: Examples: - A label `app` with value `my-app` SHOULD be recorded as  the `k8s.pod.label.app` attribute with value `"my-app"`. - A label `mycompany.io/arch` with value `x64` SHOULD be recorded as  the `k8s.pod.label.mycompany.io/arch` attribute with value `"x64"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.pod.label.data` attribute with value `""`.
/// 
/// Examples:
///     my-app
///     x64
///     
pub const K8S_POD_LABEL: []const u8 = "k8s.pod.label";

/// Deprecated, use `k8s.pod.label` instead.
/// 
/// Examples:
///     my-app
/// 
/// Note: This attribute is deprecated. Replaced by `k8s.pod.label`.
pub const K8S_POD_LABELS: []const u8 = "k8s.pod.labels";

/// The name of the Pod.

/// 
/// Examples:
///     opentelemetry-pod-autoconf
pub const K8S_POD_NAME: []const u8 = "k8s.pod.name";

/// The UID of the Pod.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_POD_UID: []const u8 = "k8s.pod.uid";

/// The annotation placed on the ReplicaSet, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `0` SHOULD be recorded  as the `k8s.replicaset.annotation.replicas` attribute with value `"0"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.replicaset.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     0
///     
pub const K8S_REPLICASET_ANNOTATION: []const u8 = "k8s.replicaset.annotation";

/// The label placed on the ReplicaSet, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `app` with value `guestbook` SHOULD be recorded  as the `k8s.replicaset.label.app` attribute with value `"guestbook"`. - A label `injected` with empty string value SHOULD be recorded as  the `k8s.replicaset.label.injected` attribute with value `""`.
/// 
/// Examples:
///     guestbook
///     
pub const K8S_REPLICASET_LABEL: []const u8 = "k8s.replicaset.label";

/// The name of the ReplicaSet.

/// 
/// Examples:
///     opentelemetry
pub const K8S_REPLICASET_NAME: []const u8 = "k8s.replicaset.name";

/// The UID of the ReplicaSet.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_REPLICASET_UID: []const u8 = "k8s.replicaset.uid";

/// The name of the replication controller.

/// 
/// Examples:
///     opentelemetry
pub const K8S_REPLICATIONCONTROLLER_NAME: []const u8 = "k8s.replicationcontroller.name";

/// The UID of the replication controller.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_REPLICATIONCONTROLLER_UID: []const u8 = "k8s.replicationcontroller.uid";

/// The name of the resource quota.

/// 
/// Examples:
///     opentelemetry
pub const K8S_RESOURCEQUOTA_NAME: []const u8 = "k8s.resourcequota.name";

/// The name of the K8s resource a resource quota defines.

/// 
/// Notes: The value for this attribute can be either the full `count/[resource][.[group]]` string (e.g., count/deployments.apps, count/pods), or, for certain core Kubernetes resources, just the resource name (e.g., pods, services, configmaps). Both forms are supported by Kubernetes for object count quotas. See [Kubernetes Resource Quotas documentation](https://kubernetes.io/docs/concepts/policy/resource-quotas/#object-count-quota) for more details.
/// 
/// Examples:
///     count/replicationcontrollers
pub const K8S_RESOURCEQUOTA_RESOURCE_NAME: []const u8 = "k8s.resourcequota.resource_name";

/// The UID of the resource quota.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_RESOURCEQUOTA_UID: []const u8 = "k8s.resourcequota.uid";

/// The annotation placed on the StatefulSet, the ``key`` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `1` SHOULD be recorded  as the `k8s.statefulset.annotation.replicas` attribute with value `"1"`. - A label `data` with empty string value SHOULD be recorded as  the `k8s.statefulset.annotation.data` attribute with value `""`.
/// 
/// Examples:
///     1
///     
pub const K8S_STATEFULSET_ANNOTATION: []const u8 = "k8s.statefulset.annotation";

/// The label placed on the StatefulSet, the ``key`` being the label name, the value being the label value, even if the value is empty.

/// 
/// Notes: Examples: - A label `replicas` with value `0` SHOULD be recorded  as the `k8s.statefulset.label.app` attribute with value `"guestbook"`. - A label `injected` with empty string value SHOULD be recorded as  the `k8s.statefulset.label.injected` attribute with value `""`.
/// 
/// Examples:
///     guestbook
///     
pub const K8S_STATEFULSET_LABEL: []const u8 = "k8s.statefulset.label";

/// The name of the StatefulSet.

/// 
/// Examples:
///     opentelemetry
pub const K8S_STATEFULSET_NAME: []const u8 = "k8s.statefulset.name";

/// The UID of the StatefulSet.

/// 
/// Examples:
///     275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
pub const K8S_STATEFULSET_UID: []const u8 = "k8s.statefulset.uid";

/// The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#storageclass-v1-storage-k8s-io) object.

/// 
/// Examples:
///     gold.storageclass.storage.k8s.io
pub const K8S_STORAGECLASS_NAME: []const u8 = "k8s.storageclass.name";

/// The name of the K8s volume.

/// 
/// Examples:
///     volume0
pub const K8S_VOLUME_NAME: []const u8 = "k8s.volume.name";

/// The type of the K8s volume.

/// 
/// Examples:
///     emptyDir
///     persistentVolumeClaim
pub const K8S_VOLUME_TYPE: []const u8 = "k8s.volume.type";

/// The Linux Slab memory state
/// 
/// Examples:
///     reclaimable
///     unreclaimable
pub const LINUX_MEMORY_SLAB_STATE: []const u8 = "linux.memory.slab.state";

/// The basename of the file.

/// 
/// Examples:
///     audit.log
pub const LOG_FILE_NAME: []const u8 = "log.file.name";

/// The basename of the file, with symlinks resolved.

/// 
/// Examples:
///     uuid.log
pub const LOG_FILE_NAME_RESOLVED: []const u8 = "log.file.name_resolved";

/// The full path to the file.

/// 
/// Examples:
///     /var/log/mysql/audit.log
pub const LOG_FILE_PATH: []const u8 = "log.file.path";

/// The full path to the file, with symlinks resolved.

/// 
/// Examples:
///     /var/lib/docker/uuid.log
pub const LOG_FILE_PATH_RESOLVED: []const u8 = "log.file.path_resolved";

/// The stream associated with the log. See below for a list of well-known values.

pub const LOG_IOSTREAM: []const u8 = "log.iostream";

/// The complete original Log Record.

/// 
/// Notes: This value MAY be added when processing a Log Record which was originally transmitted as a string or equivalent data type AND the Body field of the Log Record does not contain the same value. (e.g. a syslog or a log record read from a file.)
/// 
/// Examples:
///     77 <86>1 2015-08-06T21:58:59.694Z 192.168.2.133 inactive - - - Something happened
///     [INFO] 8/3/24 12:34:56 Something happened
pub const LOG_RECORD_ORIGINAL: []const u8 = "log.record.original";

/// A unique identifier for the Log Record.

/// 
/// Notes: If an id is provided, other log records with the same id will be considered duplicates and can be removed safely. This means, that two distinguishable log records MUST have different values. The id MAY be an [Universally Unique Lexicographically Sortable Identifier (ULID)](https://github.com/ulid/spec), but other identifiers (e.g. UUID) may be used as needed.
/// 
/// Examples:
///     01ARZ3NDEKTSV4RRFFQ69G5FAV
pub const LOG_RECORD_UID: []const u8 = "log.record.uid";

/// Name of the logical partition that hosts a systems with a mainframe operating system.
/// 
/// Examples:
///     LPAR01
pub const MAINFRAME_LPAR_NAME: []const u8 = "mainframe.lpar.name";

/// Deprecated, use `rpc.message.compressed_size` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `rpc.message.compressed_size`.
pub const MESSAGE_COMPRESSED_SIZE: []const u8 = "message.compressed_size";

/// Deprecated, use `rpc.message.id` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `rpc.message.id`.
pub const MESSAGE_ID: []const u8 = "message.id";

/// Deprecated, use `rpc.message.type` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `rpc.message.type`.
pub const MESSAGE_TYPE: []const u8 = "message.type";

/// Deprecated, use `rpc.message.uncompressed_size` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `rpc.message.uncompressed_size`.
pub const MESSAGE_UNCOMPRESSED_SIZE: []const u8 = "message.uncompressed_size";

/// The number of messages sent, received, or processed in the scope of the batching operation.
/// 
/// Notes: Instrumentations SHOULD NOT set `messaging.batch.message_count` on spans that operate with a single message. When a messaging client library supports both batch and single-message API for the same operation, instrumentations SHOULD use `messaging.batch.message_count` for batching APIs and SHOULD NOT use it for single-message APIs.
/// 
/// Examples:
///     0
///     1
///     2
pub const MESSAGING_BATCH_MESSAGE_COUNT: []const u8 = "messaging.batch.message_count";

/// A unique identifier for the client that consumes or produces a message.

/// 
/// Examples:
///     client-5
///     myhost@8742@s8083jm
pub const MESSAGING_CLIENT_ID: []const u8 = "messaging.client.id";

/// The name of the consumer group with which a consumer is associated.

/// 
/// Notes: Semantic conventions for individual messaging systems SHOULD document whether `messaging.consumer.group.name` is applicable and what it means in the context of that system.
/// 
/// Examples:
///     my-group
///     indexer
pub const MESSAGING_CONSUMER_GROUP_NAME: []const u8 = "messaging.consumer.group.name";

/// A boolean that is true if the message destination is anonymous (could be unnamed or have auto-generated name).
pub const MESSAGING_DESTINATION_ANONYMOUS: []const u8 = "messaging.destination.anonymous";

/// The message destination name
/// 
/// Notes: Destination name SHOULD uniquely identify a specific queue, topic or other entity within the broker. If the broker doesn't have such notion, the destination name SHOULD uniquely identify the broker.
/// 
/// Examples:
///     MyQueue
///     MyTopic
pub const MESSAGING_DESTINATION_NAME: []const u8 = "messaging.destination.name";

/// The identifier of the partition messages are sent to or received from, unique within the `messaging.destination.name`.

/// 
/// Examples:
///     1
pub const MESSAGING_DESTINATION_PARTITION_ID: []const u8 = "messaging.destination.partition.id";

/// The name of the destination subscription from which a message is consumed.
/// 
/// Notes: Semantic conventions for individual messaging systems SHOULD document whether `messaging.destination.subscription.name` is applicable and what it means in the context of that system.
/// 
/// Examples:
///     subscription-a
pub const MESSAGING_DESTINATION_SUBSCRIPTION_NAME: []const u8 = "messaging.destination.subscription.name";

/// Low cardinality representation of the messaging destination name
/// 
/// Notes: Destination names could be constructed from templates. An example would be a destination name involving a user name or product id. Although the destination name in this case is of high cardinality, the underlying template is of low cardinality and can be effectively used for grouping and aggregation.
/// 
/// Examples:
///     /customers/{customerId}
pub const MESSAGING_DESTINATION_TEMPLATE: []const u8 = "messaging.destination.template";

/// A boolean that is true if the message destination is temporary and might not exist anymore after messages are processed.
pub const MESSAGING_DESTINATION_TEMPORARY: []const u8 = "messaging.destination.temporary";

/// Deprecated, no replacement at this time.
/// 
/// Note: This attribute is deprecated. Removed. No replacement at this time.
pub const MESSAGING_DESTINATION_PUBLISH_ANONYMOUS: []const u8 = "messaging.destination_publish.anonymous";

/// Deprecated, no replacement at this time.
/// 
/// Examples:
///     MyQueue
///     MyTopic
/// 
/// Note: This attribute is deprecated. Removed. No replacement at this time.
pub const MESSAGING_DESTINATION_PUBLISH_NAME: []const u8 = "messaging.destination_publish.name";

/// Deprecated, use `messaging.consumer.group.name` instead.

/// 
/// Examples:
///     $Default
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.consumer.group.name`.
pub const MESSAGING_EVENTHUBS_CONSUMER_GROUP: []const u8 = "messaging.eventhubs.consumer.group";

/// The UTC epoch seconds at which the message has been accepted and stored in the entity.

/// 
/// Examples:
///     1701393730
pub const MESSAGING_EVENTHUBS_MESSAGE_ENQUEUED_TIME: []const u8 = "messaging.eventhubs.message.enqueued_time";

/// The ack deadline in seconds set for the modify ack deadline request.

/// 
/// Examples:
///     10
pub const MESSAGING_GCP_PUBSUB_MESSAGE_ACK_DEADLINE: []const u8 = "messaging.gcp_pubsub.message.ack_deadline";

/// The ack id for a given message.

/// 
/// Examples:
///     ack_id
pub const MESSAGING_GCP_PUBSUB_MESSAGE_ACK_ID: []const u8 = "messaging.gcp_pubsub.message.ack_id";

/// The delivery attempt for a given message.

/// 
/// Examples:
///     2
pub const MESSAGING_GCP_PUBSUB_MESSAGE_DELIVERY_ATTEMPT: []const u8 = "messaging.gcp_pubsub.message.delivery_attempt";

/// The ordering key for a given message. If the attribute is not present, the message does not have an ordering key.

/// 
/// Examples:
///     ordering_key
pub const MESSAGING_GCP_PUBSUB_MESSAGE_ORDERING_KEY: []const u8 = "messaging.gcp_pubsub.message.ordering_key";

/// Deprecated, use `messaging.consumer.group.name` instead.

/// 
/// Examples:
///     my-group
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.consumer.group.name`.
pub const MESSAGING_KAFKA_CONSUMER_GROUP: []const u8 = "messaging.kafka.consumer.group";

/// Deprecated, use `messaging.destination.partition.id` instead.

/// 
/// Examples:
///     2
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.destination.partition.id`.
pub const MESSAGING_KAFKA_DESTINATION_PARTITION: []const u8 = "messaging.kafka.destination.partition";

/// Message keys in Kafka are used for grouping alike messages to ensure they're processed on the same partition. They differ from `messaging.message.id` in that they're not unique. If the key is `null`, the attribute MUST NOT be set.

/// 
/// Notes: If the key type is not string, it's string representation has to be supplied for the attribute. If the key has no unambiguous, canonical string form, don't include its value.
/// 
/// Examples:
///     myKey
pub const MESSAGING_KAFKA_MESSAGE_KEY: []const u8 = "messaging.kafka.message.key";

/// Deprecated, use `messaging.kafka.offset` instead.

/// 
/// Examples:
///     42
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.kafka.offset`.
pub const MESSAGING_KAFKA_MESSAGE_OFFSET: []const u8 = "messaging.kafka.message.offset";

/// A boolean that is true if the message is a tombstone.
pub const MESSAGING_KAFKA_MESSAGE_TOMBSTONE: []const u8 = "messaging.kafka.message.tombstone";

/// The offset of a record in the corresponding Kafka partition.

/// 
/// Examples:
///     42
pub const MESSAGING_KAFKA_OFFSET: []const u8 = "messaging.kafka.offset";

/// The size of the message body in bytes.

/// 
/// Notes: This can refer to both the compressed or uncompressed body size. If both sizes are known, the uncompressed body size should be used.
/// 
/// Examples:
///     1439
pub const MESSAGING_MESSAGE_BODY_SIZE: []const u8 = "messaging.message.body.size";

/// The conversation ID identifying the conversation to which the message belongs, represented as a string. Sometimes called "Correlation ID".

/// 
/// Examples:
///     MyConversationId
pub const MESSAGING_MESSAGE_CONVERSATION_ID: []const u8 = "messaging.message.conversation_id";

/// The size of the message body and metadata in bytes.

/// 
/// Notes: This can refer to both the compressed or uncompressed size. If both sizes are known, the uncompressed size should be used.
/// 
/// Examples:
///     2738
pub const MESSAGING_MESSAGE_ENVELOPE_SIZE: []const u8 = "messaging.message.envelope.size";

/// A value used by the messaging system as an identifier for the message, represented as a string.
/// 
/// Examples:
///     452a7c7c7c7048c2f887f61572b18fc2
pub const MESSAGING_MESSAGE_ID: []const u8 = "messaging.message.id";

/// Deprecated, use `messaging.operation.type` instead.

/// 
/// Examples:
///     publish
///     create
///     process
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.operation.type`.
pub const MESSAGING_OPERATION: []const u8 = "messaging.operation";

/// The system-specific name of the messaging operation.

/// 
/// Examples:
///     ack
///     nack
///     send
pub const MESSAGING_OPERATION_NAME: []const u8 = "messaging.operation.name";

/// A string identifying the type of the messaging operation.

/// 
/// Notes: If a custom value is used, it MUST be of low cardinality.
pub const MESSAGING_OPERATION_TYPE: []const u8 = "messaging.operation.type";

/// RabbitMQ message routing key.

/// 
/// Examples:
///     myKey
pub const MESSAGING_RABBITMQ_DESTINATION_ROUTING_KEY: []const u8 = "messaging.rabbitmq.destination.routing_key";

/// RabbitMQ message delivery tag

/// 
/// Examples:
///     123
pub const MESSAGING_RABBITMQ_MESSAGE_DELIVERY_TAG: []const u8 = "messaging.rabbitmq.message.delivery_tag";

/// Deprecated, use `messaging.consumer.group.name` instead.

/// 
/// Examples:
///     myConsumerGroup
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.consumer.group.name` on the consumer spans. No replacement for producer spans.

pub const MESSAGING_ROCKETMQ_CLIENT_GROUP: []const u8 = "messaging.rocketmq.client_group";

/// Model of message consumption. This only applies to consumer spans.

pub const MESSAGING_ROCKETMQ_CONSUMPTION_MODEL: []const u8 = "messaging.rocketmq.consumption_model";

/// The delay time level for delay message, which determines the message delay time.

/// 
/// Examples:
///     3
pub const MESSAGING_ROCKETMQ_MESSAGE_DELAY_TIME_LEVEL: []const u8 = "messaging.rocketmq.message.delay_time_level";

/// The timestamp in milliseconds that the delay message is expected to be delivered to consumer.

/// 
/// Examples:
///     1665987217045
pub const MESSAGING_ROCKETMQ_MESSAGE_DELIVERY_TIMESTAMP: []const u8 = "messaging.rocketmq.message.delivery_timestamp";

/// It is essential for FIFO message. Messages that belong to the same message group are always processed one by one within the same consumer group.

/// 
/// Examples:
///     myMessageGroup
pub const MESSAGING_ROCKETMQ_MESSAGE_GROUP: []const u8 = "messaging.rocketmq.message.group";

/// Key(s) of message, another way to mark message besides message id.

/// 
/// Examples:
///     [\"keyA\", \"keyB\"]
pub const MESSAGING_ROCKETMQ_MESSAGE_KEYS: []const u8 = "messaging.rocketmq.message.keys";

/// The secondary classifier of message besides topic.

/// 
/// Examples:
///     tagA
pub const MESSAGING_ROCKETMQ_MESSAGE_TAG: []const u8 = "messaging.rocketmq.message.tag";

/// Type of message.

pub const MESSAGING_ROCKETMQ_MESSAGE_TYPE: []const u8 = "messaging.rocketmq.message.type";

/// Namespace of RocketMQ resources, resources in different namespaces are individual.

/// 
/// Examples:
///     myNamespace
pub const MESSAGING_ROCKETMQ_NAMESPACE: []const u8 = "messaging.rocketmq.namespace";

/// Deprecated, use `messaging.destination.subscription.name` instead.

/// 
/// Examples:
///     subscription-a
/// 
/// Note: This attribute is deprecated. Replaced by `messaging.destination.subscription.name`.
pub const MESSAGING_SERVICEBUS_DESTINATION_SUBSCRIPTION_NAME: []const u8 = "messaging.servicebus.destination.subscription_name";

/// Describes the [settlement type](https://learn.microsoft.com/azure/service-bus-messaging/message-transfers-locks-settlement#peeklock).

pub const MESSAGING_SERVICEBUS_DISPOSITION_STATUS: []const u8 = "messaging.servicebus.disposition_status";

/// Number of deliveries that have been attempted for this message.

/// 
/// Examples:
///     2
pub const MESSAGING_SERVICEBUS_MESSAGE_DELIVERY_COUNT: []const u8 = "messaging.servicebus.message.delivery_count";

/// The UTC epoch seconds at which the message has been accepted and stored in the entity.

/// 
/// Examples:
///     1701393730
pub const MESSAGING_SERVICEBUS_MESSAGE_ENQUEUED_TIME: []const u8 = "messaging.servicebus.message.enqueued_time";

/// The messaging system as identified by the client instrumentation.
/// 
/// Notes: The actual messaging system may differ from the one known by the client. For example, when using Kafka client libraries to communicate with Azure Event Hubs, the `messaging.system` is set to `kafka` based on the instrumentation's best knowledge.
pub const MESSAGING_SYSTEM: []const u8 = "messaging.system";

/// Deprecated, use `network.local.address`.
/// 
/// Examples:
///     192.168.0.1
/// 
/// Note: This attribute is deprecated. Replaced by `network.local.address`.
pub const NET_HOST_IP: []const u8 = "net.host.ip";

/// Deprecated, use `server.address`.
/// 
/// Examples:
///     example.com
/// 
/// Note: This attribute is deprecated. Replaced by `server.address`.
pub const NET_HOST_NAME: []const u8 = "net.host.name";

/// Deprecated, use `server.port`.
/// 
/// Examples:
///     8080
/// 
/// Note: This attribute is deprecated. Replaced by `server.port`.
pub const NET_HOST_PORT: []const u8 = "net.host.port";

/// Deprecated, use `network.peer.address`.
/// 
/// Examples:
///     127.0.0.1
/// 
/// Note: This attribute is deprecated. Replaced by `network.peer.address`.
pub const NET_PEER_IP: []const u8 = "net.peer.ip";

/// Deprecated, use `server.address` on client spans and `client.address` on server spans.
/// 
/// Examples:
///     example.com
/// 
/// Note: This attribute is deprecated. Replaced by `server.address` on client spans and `client.address` on server spans.
pub const NET_PEER_NAME: []const u8 = "net.peer.name";

/// Deprecated, use `server.port` on client spans and `client.port` on server spans.
/// 
/// Examples:
///     8080
/// 
/// Note: This attribute is deprecated. Replaced by `server.port` on client spans and `client.port` on server spans.
pub const NET_PEER_PORT: []const u8 = "net.peer.port";

/// Deprecated, use `network.protocol.name`.
/// 
/// Examples:
///     amqp
///     http
///     mqtt
/// 
/// Note: This attribute is deprecated. Replaced by `network.protocol.name`.
pub const NET_PROTOCOL_NAME: []const u8 = "net.protocol.name";

/// Deprecated, use `network.protocol.version`.
/// 
/// Examples:
///     3.1.1
/// 
/// Note: This attribute is deprecated. Replaced by `network.protocol.version`.
pub const NET_PROTOCOL_VERSION: []const u8 = "net.protocol.version";

/// Deprecated, use `network.transport` and `network.type`.
/// 
/// Note: This attribute is deprecated. Split to `network.transport` and `network.type`.
pub const NET_SOCK_FAMILY: []const u8 = "net.sock.family";

/// Deprecated, use `network.local.address`.
/// 
/// Examples:
///     /var/my.sock
/// 
/// Note: This attribute is deprecated. Replaced by `network.local.address`.
pub const NET_SOCK_HOST_ADDR: []const u8 = "net.sock.host.addr";

/// Deprecated, use `network.local.port`.
/// 
/// Examples:
///     8080
/// 
/// Note: This attribute is deprecated. Replaced by `network.local.port`.
pub const NET_SOCK_HOST_PORT: []const u8 = "net.sock.host.port";

/// Deprecated, use `network.peer.address`.
/// 
/// Examples:
///     192.168.0.1
/// 
/// Note: This attribute is deprecated. Replaced by `network.peer.address`.
pub const NET_SOCK_PEER_ADDR: []const u8 = "net.sock.peer.addr";

/// Deprecated, no replacement at this time.
/// 
/// Examples:
///     /var/my.sock
/// 
/// Note: This attribute is deprecated. Removed. No replacement at this time.
pub const NET_SOCK_PEER_NAME: []const u8 = "net.sock.peer.name";

/// Deprecated, use `network.peer.port`.
/// 
/// Examples:
///     65531
/// 
/// Note: This attribute is deprecated. Replaced by `network.peer.port`.
pub const NET_SOCK_PEER_PORT: []const u8 = "net.sock.peer.port";

/// Deprecated, use `network.transport`.
/// 
/// Note: This attribute is deprecated. Replaced by `network.transport`.
pub const NET_TRANSPORT: []const u8 = "net.transport";

/// The ISO 3166-1 alpha-2 2-character country code associated with the mobile carrier network.
/// 
/// Examples:
///     DE
pub const NETWORK_CARRIER_ICC: []const u8 = "network.carrier.icc";

/// The mobile carrier country code.
/// 
/// Examples:
///     310
pub const NETWORK_CARRIER_MCC: []const u8 = "network.carrier.mcc";

/// The mobile carrier network code.
/// 
/// Examples:
///     001
pub const NETWORK_CARRIER_MNC: []const u8 = "network.carrier.mnc";

/// The name of the mobile carrier.
/// 
/// Examples:
///     sprint
pub const NETWORK_CARRIER_NAME: []const u8 = "network.carrier.name";

/// The state of network connection
/// 
/// Notes: Connection states are defined as part of the [rfc9293](https://datatracker.ietf.org/doc/html/rfc9293#section-3.3.2)
/// 
/// Examples:
///     close_wait
pub const NETWORK_CONNECTION_STATE: []const u8 = "network.connection.state";

/// This describes more details regarding the connection.type. It may be the type of cell technology connection, but it could be used for describing details about a wifi connection.
/// 
/// Examples:
///     LTE
pub const NETWORK_CONNECTION_SUBTYPE: []const u8 = "network.connection.subtype";

/// The internet connection type.
/// 
/// Examples:
///     wifi
pub const NETWORK_CONNECTION_TYPE: []const u8 = "network.connection.type";

/// The network interface name.
/// 
/// Examples:
///     lo
///     eth0
pub const NETWORK_INTERFACE_NAME: []const u8 = "network.interface.name";

/// The network IO operation direction.
/// 
/// Examples:
///     transmit
pub const NETWORK_IO_DIRECTION: []const u8 = "network.io.direction";

/// Local address of the network connection - IP address or Unix domain socket name.
/// 
/// Examples:
///     10.1.2.80
///     /tmp/my.sock
pub const NETWORK_LOCAL_ADDRESS: []const u8 = "network.local.address";

/// Local port number of the network connection.
/// 
/// Examples:
///     65123
pub const NETWORK_LOCAL_PORT: []const u8 = "network.local.port";

/// Peer address of the network connection - IP address or Unix domain socket name.
/// 
/// Examples:
///     10.1.2.80
///     /tmp/my.sock
pub const NETWORK_PEER_ADDRESS: []const u8 = "network.peer.address";

/// Peer port number of the network connection.
/// 
/// Examples:
///     65123
pub const NETWORK_PEER_PORT: []const u8 = "network.peer.port";

/// [OSI application layer](https://wikipedia.org/wiki/Application_layer) or non-OSI equivalent.
/// 
/// Notes: The value SHOULD be normalized to lowercase.
/// 
/// Examples:
///     amqp
///     http
///     mqtt
pub const NETWORK_PROTOCOL_NAME: []const u8 = "network.protocol.name";

/// The actual version of the protocol used for network communication.
/// 
/// Notes: If protocol version is subject to negotiation (for example using [ALPN](https://www.rfc-editor.org/rfc/rfc7301.html)), this attribute SHOULD be set to the negotiated version. If the actual protocol version is not known, this attribute SHOULD NOT be set.
/// 
/// Examples:
///     1.1
///     2
pub const NETWORK_PROTOCOL_VERSION: []const u8 = "network.protocol.version";

/// [OSI transport layer](https://wikipedia.org/wiki/Transport_layer) or [inter-process communication method](https://wikipedia.org/wiki/Inter-process_communication).

/// 
/// Notes: The value SHOULD be normalized to lowercase. Consider always setting the transport when setting a port number, since a port number is ambiguous without knowing the transport. For example different processes could be listening on TCP port 12345 and UDP port 12345.
/// 
/// Examples:
///     tcp
///     udp
pub const NETWORK_TRANSPORT: []const u8 = "network.transport";

/// [OSI network layer](https://wikipedia.org/wiki/Network_layer) or non-OSI equivalent.
/// 
/// Notes: The value SHOULD be normalized to lowercase.
/// 
/// Examples:
///     ipv4
///     ipv6
pub const NETWORK_TYPE: []const u8 = "network.type";

/// The state of event loop time.
pub const NODEJS_EVENTLOOP_STATE: []const u8 = "nodejs.eventloop.state";

/// The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.

/// 
/// Notes: Follows [OCI Image Manifest Specification](https://github.com/opencontainers/image-spec/blob/main/manifest.md), and specifically the [Digest property](https://github.com/opencontainers/image-spec/blob/main/descriptor.md#digests). An example can be found in [Example Image Manifest](https://github.com/opencontainers/image-spec/blob/main/manifest.md#example-image-manifest).
/// 
/// Examples:
///     sha256:e4ca62c0d62f3e886e684806dfe9d4e0cda60d54986898173c1083856cfda0f4
pub const OCI_MANIFEST_DIGEST: []const u8 = "oci.manifest.digest";

/// Parent-child Reference type
/// 
/// Notes: The causal relationship between a child Span and a parent Span.
pub const OPENTRACING_REF_TYPE: []const u8 = "opentracing.ref_type";

/// Unique identifier for a particular build or compilation of the operating system.
/// 
/// Examples:
///     TQ3C.230805.001.B2
///     20E247
///     22621
pub const OS_BUILD_ID: []const u8 = "os.build_id";

/// Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.

/// 
/// Examples:
///     Microsoft Windows [Version 10.0.18363.778]
///     Ubuntu 18.04.1 LTS
pub const OS_DESCRIPTION: []const u8 = "os.description";

/// Human readable operating system name.
/// 
/// Examples:
///     iOS
///     Android
///     Ubuntu
pub const OS_NAME: []const u8 = "os.name";

/// The operating system type.

pub const OS_TYPE: []const u8 = "os.type";

/// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md#version-attributes).

/// 
/// Examples:
///     14.2.1
///     18.04.1
pub const OS_VERSION: []const u8 = "os.version";

/// A name uniquely identifying the instance of the OpenTelemetry component within its containing SDK instance.

/// 
/// Notes: Implementations SHOULD ensure a low cardinality for this attribute, even across application or SDK restarts. E.g. implementations MUST NOT use UUIDs as values for this attribute. Implementations MAY achieve these goals by following a `[otel.component.type]/[instance-counter]` pattern, e.g. `batching_span_processor/0`. Hereby `otel.component.type` refers to the corresponding attribute value of the component. The value of `instance-counter` MAY be automatically assigned by the component and uniqueness within the enclosing SDK instance MUST be guaranteed. For example, `[instance-counter]` MAY be implemented by using a monotonically increasing counter (starting with `0`), which is incremented every time an instance of the given component type is started. With this implementation, for example the first Batching Span Processor would have `batching_span_processor/0` as `otel.component.name`, the second one `batching_span_processor/1` and so on. These values will therefore be reused in the case of an application restart.
/// 
/// Examples:
///     otlp_grpc_span_exporter/0
///     custom-name
pub const OTEL_COMPONENT_NAME: []const u8 = "otel.component.name";

/// A name identifying the type of the OpenTelemetry component.

/// 
/// Notes: If none of the standardized values apply, implementations SHOULD use the language-defined name of the type. E.g. for Java the fully qualified classname SHOULD be used in this case.
/// 
/// Examples:
///     batching_span_processor
///     com.example.MySpanExporter
pub const OTEL_COMPONENT_TYPE: []const u8 = "otel.component.type";

/// Deprecated. Use the `otel.scope.name` attribute
/// 
/// Examples:
///     io.opentelemetry.contrib.mongodb
/// 
/// Note: This attribute is deprecated. Replaced by `otel.scope.name`.
pub const OTEL_LIBRARY_NAME: []const u8 = "otel.library.name";

/// Deprecated. Use the `otel.scope.version` attribute.
/// 
/// Examples:
///     1.0.0
/// 
/// Note: This attribute is deprecated. Replaced by `otel.scope.version`.
pub const OTEL_LIBRARY_VERSION: []const u8 = "otel.library.version";

/// The name of the instrumentation scope - (`InstrumentationScope.Name` in OTLP).
/// 
/// Examples:
///     io.opentelemetry.contrib.mongodb
pub const OTEL_SCOPE_NAME: []const u8 = "otel.scope.name";

/// The version of the instrumentation scope - (`InstrumentationScope.Version` in OTLP).
/// 
/// Examples:
///     1.0.0
pub const OTEL_SCOPE_VERSION: []const u8 = "otel.scope.version";

/// Determines whether the span has a parent span, and if so, [whether it is a remote parent](https://opentelemetry.io/docs/specs/otel/trace/api/#isremote)
pub const OTEL_SPAN_PARENT_ORIGIN: []const u8 = "otel.span.parent.origin";

/// The result value of the sampler for this span
pub const OTEL_SPAN_SAMPLING_RESULT: []const u8 = "otel.span.sampling_result";

/// Name of the code, either "OK" or "ERROR". MUST NOT be set if the status code is UNSET.
pub const OTEL_STATUS_CODE: []const u8 = "otel.status_code";

/// Description of the Status if it has a value, otherwise not set.
/// 
/// Examples:
///     resource not found
pub const OTEL_STATUS_DESCRIPTION: []const u8 = "otel.status_description";

/// Deprecated, use `db.client.connection.state` instead.
/// 
/// Examples:
///     idle
/// 
/// Note: This attribute is deprecated. Replaced by `db.client.connection.state`.
pub const STATE: []const u8 = "state";

/// The [`service.name`](/docs/resource/README.md#service) of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.

/// 
/// Examples:
///     AuthTokenCache
pub const PEER_SERVICE: []const u8 = "peer.service";

/// Deprecated, use `db.client.connection.pool.name` instead.
/// 
/// Examples:
///     myDataSource
/// 
/// Note: This attribute is deprecated. Replaced by `db.client.connection.pool.name`.
pub const POOL_NAME: []const u8 = "pool.name";

/// Length of the process.command_args array

/// 
/// Notes: This field can be useful for querying or performing bucket analysis on how many arguments were provided to start a process. More arguments may be an indication of suspicious activity.
/// 
/// Examples:
///     4
pub const PROCESS_ARGS_COUNT: []const u8 = "process.args_count";

/// The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.

/// 
/// Examples:
///     cmd/otelcol
pub const PROCESS_COMMAND: []const u8 = "process.command";

/// All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.

/// 
/// Examples:
///     [\"cmd/otecol\", \"--config=config.yaml\"]
pub const PROCESS_COMMAND_ARGS: []const u8 = "process.command_args";

/// The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.

/// 
/// Examples:
///     C:\cmd\otecol --config=\"my directory\config.yaml\"
pub const PROCESS_COMMAND_LINE: []const u8 = "process.command_line";

/// Specifies whether the context switches for this data point were voluntary or involuntary.
pub const PROCESS_CONTEXT_SWITCH_TYPE: []const u8 = "process.context_switch_type";

/// Deprecated, use `cpu.mode` instead.
/// 
/// Note: This attribute is deprecated. Replaced by `cpu.mode`.
pub const PROCESS_CPU_STATE: []const u8 = "process.cpu.state";

/// The date and time the process was created, in ISO 8601 format.

/// 
/// Examples:
///     2023-11-21T09:25:34.853Z
pub const PROCESS_CREATION_TIME: []const u8 = "process.creation.time";

/// Process environment variables, ``key`` being the environment variable name, the value being the environment variable value.

/// 
/// Notes: Examples: - an environment variable `USER` with value `"ubuntu"` SHOULD be recorded as the `process.environment_variable.USER` attribute with value `"ubuntu"`. - an environment variable `PATH` with value `"/usr/local/bin:/usr/bin"` SHOULD be recorded as the `process.environment_variable.PATH` attribute with value `"/usr/local/bin:/usr/bin"`.
/// 
/// Examples:
///     ubuntu
///     /usr/local/bin:/usr/bin
pub const PROCESS_ENVIRONMENT_VARIABLE: []const u8 = "process.environment_variable";

/// The GNU build ID as found in the `.note.gnu.build-id` ELF section (hex string).

/// 
/// Examples:
///     c89b11207f6479603b0d49bf291c092c2b719293
pub const PROCESS_EXECUTABLE_BUILD_ID_GNU: []const u8 = "process.executable.build_id.gnu";

/// The Go build ID as retrieved by `go tool buildid <go executable>`.

/// 
/// Examples:
///     foh3mEXu7BLZjsN9pOwG/kATcXlYVCDEFouRMQed_/WwRFB1hPo9LBkekthSPG/x8hMC8emW2cCjXD0_1aY
pub const PROCESS_EXECUTABLE_BUILD_ID_GO: []const u8 = "process.executable.build_id.go";

/// Profiling specific build ID for executables. See the OTel specification for Profiles for more information.

/// 
/// Examples:
///     600DCAFE4A110000F2BF38C493F5FB92
pub const PROCESS_EXECUTABLE_BUILD_ID_HTLHASH: []const u8 = "process.executable.build_id.htlhash";

/// "Deprecated, use `process.executable.build_id.htlhash` instead."

/// 
/// Examples:
///     600DCAFE4A110000F2BF38C493F5FB92
/// 
/// Note: This attribute is deprecated. Replaced by `process.executable.build_id.htlhash`.
pub const PROCESS_EXECUTABLE_BUILD_ID_PROFILING: []const u8 = "process.executable.build_id.profiling";

/// The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.

/// 
/// Examples:
///     otelcol
pub const PROCESS_EXECUTABLE_NAME: []const u8 = "process.executable.name";

/// The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.

/// 
/// Examples:
///     /usr/bin/cmd/otelcol
pub const PROCESS_EXECUTABLE_PATH: []const u8 = "process.executable.path";

/// The exit code of the process.

/// 
/// Examples:
///     127
pub const PROCESS_EXIT_CODE: []const u8 = "process.exit.code";

/// The date and time the process exited, in ISO 8601 format.

/// 
/// Examples:
///     2023-11-21T09:26:12.315Z
pub const PROCESS_EXIT_TIME: []const u8 = "process.exit.time";

/// The PID of the process's group leader. This is also the process group ID (PGID) of the process.

/// 
/// Examples:
///     23
pub const PROCESS_GROUP_LEADER_PID: []const u8 = "process.group_leader.pid";

/// Whether the process is connected to an interactive shell.

pub const PROCESS_INTERACTIVE: []const u8 = "process.interactive";

/// The control group associated with the process.
/// 
/// Notes: Control groups (cgroups) are a kernel feature used to organize and manage process resources. This attribute provides the path(s) to the cgroup(s) associated with the process, which should match the contents of the [/proc/\[PID\]/cgroup](https://man7.org/linux/man-pages/man7/cgroups.7.html) file.
/// 
/// Examples:
///     1:name=systemd:/user.slice/user-1000.slice/session-3.scope
///     0::/user.slice/user-1000.slice/user@1000.service/tmux-spawn-0267755b-4639-4a27-90ed-f19f88e53748.scope
pub const PROCESS_LINUX_CGROUP: []const u8 = "process.linux.cgroup";

/// The username of the user that owns the process.

/// 
/// Examples:
///     root
pub const PROCESS_OWNER: []const u8 = "process.owner";

/// The type of page fault for this data point. Type `major` is for major/hard page faults, and `minor` is for minor/soft page faults.

pub const PROCESS_PAGING_FAULT_TYPE: []const u8 = "process.paging.fault_type";

/// Parent Process identifier (PPID).

/// 
/// Examples:
///     111
pub const PROCESS_PARENT_PID: []const u8 = "process.parent_pid";

/// Process identifier (PID).

/// 
/// Examples:
///     1234
pub const PROCESS_PID: []const u8 = "process.pid";

/// The real user ID (RUID) of the process.

/// 
/// Examples:
///     1000
pub const PROCESS_REAL_USER_ID: []const u8 = "process.real_user.id";

/// The username of the real user of the process.

/// 
/// Examples:
///     operator
pub const PROCESS_REAL_USER_NAME: []const u8 = "process.real_user.name";

/// An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.

/// 
/// Examples:
///     Eclipse OpenJ9 Eclipse OpenJ9 VM openj9-0.21.0
pub const PROCESS_RUNTIME_DESCRIPTION: []const u8 = "process.runtime.description";

/// The name of the runtime of this process.

/// 
/// Examples:
///     OpenJDK Runtime Environment
pub const PROCESS_RUNTIME_NAME: []const u8 = "process.runtime.name";

/// The version of the runtime of this process, as returned by the runtime without modification.

/// 
/// Examples:
///     14.0.2
pub const PROCESS_RUNTIME_VERSION: []const u8 = "process.runtime.version";

/// The saved user ID (SUID) of the process.

/// 
/// Examples:
///     1002
pub const PROCESS_SAVED_USER_ID: []const u8 = "process.saved_user.id";

/// The username of the saved user.

/// 
/// Examples:
///     operator
pub const PROCESS_SAVED_USER_NAME: []const u8 = "process.saved_user.name";

/// The PID of the process's session leader. This is also the session ID (SID) of the process.

/// 
/// Examples:
///     14
pub const PROCESS_SESSION_LEADER_PID: []const u8 = "process.session_leader.pid";

/// Process title (proctitle)

/// 
/// Notes: In many Unix-like systems, process title (proctitle), is the string that represents the name or command line of a running process, displayed by system monitoring tools like ps, top, and htop.
/// 
/// Examples:
///     cat /etc/hostname
///     xfce4-session
///     bash
pub const PROCESS_TITLE: []const u8 = "process.title";

/// The effective user ID (EUID) of the process.

/// 
/// Examples:
///     1001
pub const PROCESS_USER_ID: []const u8 = "process.user.id";

/// The username of the effective user of the process.

/// 
/// Examples:
///     root
pub const PROCESS_USER_NAME: []const u8 = "process.user.name";

/// Virtual process identifier.

/// 
/// Notes: The process ID within a PID namespace. This is not necessarily unique across all processes on the host but it is unique within the process namespace that the process exists within.
/// 
/// Examples:
///     12
pub const PROCESS_VPID: []const u8 = "process.vpid";

/// The working directory of the process.

/// 
/// Examples:
///     /root
pub const PROCESS_WORKING_DIRECTORY: []const u8 = "process.working_directory";

/// Describes the interpreter or compiler of a single frame.

/// 
/// Examples:
///     cpython
pub const PROFILE_FRAME_TYPE: []const u8 = "profile.frame.type";

/// The [error codes](https://connectrpc.com//docs/protocol/#error-codes) of the Connect request. Error codes are always string values.
pub const RPC_CONNECT_RPC_ERROR_CODE: []const u8 = "rpc.connect_rpc.error_code";

/// Connect request metadata, ``key`` being the normalized Connect Metadata key (lowercase), the value being the metadata values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured. Including all request metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information. For example, a property `my-custom-key` with value `["1.2.3.4", "1.2.3.5"]` SHOULD be recorded as the `rpc.connect_rpc.request.metadata.my-custom-key` attribute with value `["1.2.3.4", "1.2.3.5"]`
/// 
/// Examples:
///     [\"1.2.3.4\", \"1.2.3.5\"]
pub const RPC_CONNECT_RPC_REQUEST_METADATA: []const u8 = "rpc.connect_rpc.request.metadata";

/// Connect response metadata, ``key`` being the normalized Connect Metadata key (lowercase), the value being the metadata values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured. Including all response metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information. For example, a property `my-custom-key` with value `"attribute_value"` SHOULD be recorded as the `rpc.connect_rpc.response.metadata.my-custom-key` attribute with value `["attribute_value"]`
/// 
/// Examples:
///     [\"attribute_value\"]
pub const RPC_CONNECT_RPC_RESPONSE_METADATA: []const u8 = "rpc.connect_rpc.response.metadata";

/// gRPC request metadata, ``key`` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured. Including all request metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information. For example, a property `my-custom-key` with value `["1.2.3.4", "1.2.3.5"]` SHOULD be recorded as `rpc.grpc.request.metadata.my-custom-key` attribute with value `["1.2.3.4", "1.2.3.5"]`
/// 
/// Examples:
///     [\"1.2.3.4\", \"1.2.3.5\"]
pub const RPC_GRPC_REQUEST_METADATA: []const u8 = "rpc.grpc.request.metadata";

/// gRPC response metadata, ``key`` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.

/// 
/// Notes: Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured. Including all response metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information. For example, a property `my-custom-key` with value `["attribute_value"]` SHOULD be recorded as the `rpc.grpc.response.metadata.my-custom-key` attribute with value `["attribute_value"]`
/// 
/// Examples:
///     [\"attribute_value\"]
pub const RPC_GRPC_RESPONSE_METADATA: []const u8 = "rpc.grpc.response.metadata";

/// The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request.
pub const RPC_GRPC_STATUS_CODE: []const u8 = "rpc.grpc.status_code";

/// `error.code` property of response if it is an error response.
/// 
/// Examples:
///     -32700
///     100
pub const RPC_JSONRPC_ERROR_CODE: []const u8 = "rpc.jsonrpc.error_code";

/// `error.message` property of response if it is an error response.
/// 
/// Examples:
///     Parse error
///     User already exists
pub const RPC_JSONRPC_ERROR_MESSAGE: []const u8 = "rpc.jsonrpc.error_message";

/// `id` property of request or response. Since protocol allows id to be int, string, `null` or missing (for notifications), value is expected to be cast to string for simplicity. Use empty string in case of `null` value. Omit entirely if this is a notification.

/// 
/// Examples:
///     10
///     request-7
///     
pub const RPC_JSONRPC_REQUEST_ID: []const u8 = "rpc.jsonrpc.request_id";

/// Protocol version as in `jsonrpc` property of request/response. Since JSON-RPC 1.0 doesn't specify this, the value can be omitted.
/// 
/// Examples:
///     2.0
///     1.0
pub const RPC_JSONRPC_VERSION: []const u8 = "rpc.jsonrpc.version";

/// Compressed size of the message in bytes.
pub const RPC_MESSAGE_COMPRESSED_SIZE: []const u8 = "rpc.message.compressed_size";

/// MUST be calculated as two different counters starting from `1` one for sent messages and one for received message.
/// 
/// Notes: This way we guarantee that the values will be consistent between different implementations.
pub const RPC_MESSAGE_ID: []const u8 = "rpc.message.id";

/// Whether this is a received or sent message.
pub const RPC_MESSAGE_TYPE: []const u8 = "rpc.message.type";

/// Uncompressed size of the message in bytes.
pub const RPC_MESSAGE_UNCOMPRESSED_SIZE: []const u8 = "rpc.message.uncompressed_size";

/// The name of the (logical) method being called, must be equal to the $method part in the span name.
/// 
/// Notes: This is the logical name of the method from the RPC interface perspective, which can be different from the name of any implementing method/function. The `code.function.name` attribute may be used to store the latter (e.g., method actually executing the call on the server side, RPC client stub method on the client side).
/// 
/// Examples:
///     exampleMethod
pub const RPC_METHOD: []const u8 = "rpc.method";

/// The full (logical) name of the service being called, including its package name, if applicable.
/// 
/// Notes: This is the logical name of the service from the RPC interface perspective, which can be different from the name of any implementing class. The `code.namespace` attribute may be used to store the latter (despite the attribute name, it may include a class name; e.g., class with method actually executing the call on the server side, RPC client stub class on the client side).
/// 
/// Examples:
///     myservice.EchoService
pub const RPC_SERVICE: []const u8 = "rpc.service";

/// A string identifying the remoting system. See below for a list of well-known identifiers.
pub const RPC_SYSTEM: []const u8 = "rpc.system";

/// A categorization value keyword used by the entity using the rule for detection of this event

/// 
/// Examples:
///     Attempted Information Leak
pub const SECURITY_RULE_CATEGORY: []const u8 = "security_rule.category";

/// The description of the rule generating the event.

/// 
/// Examples:
///     Block requests to public DNS over HTTPS / TLS protocols
pub const SECURITY_RULE_DESCRIPTION: []const u8 = "security_rule.description";

/// Name of the license under which the rule used to generate this event is made available.

/// 
/// Examples:
///     Apache 2.0
pub const SECURITY_RULE_LICENSE: []const u8 = "security_rule.license";

/// The name of the rule or signature generating the event.

/// 
/// Examples:
///     BLOCK_DNS_over_TLS
pub const SECURITY_RULE_NAME: []const u8 = "security_rule.name";

/// Reference URL to additional information about the rule used to generate this event.

/// 
/// Notes: The URL can point to the vendor’s documentation about the rule. If that’s not available, it can also be a link to a more general page describing this type of alert.
/// 
/// Examples:
///     https://en.wikipedia.org/wiki/DNS_over_TLS
pub const SECURITY_RULE_REFERENCE: []const u8 = "security_rule.reference";

/// Name of the ruleset, policy, group, or parent category in which the rule used to generate this event is a member.

/// 
/// Examples:
///     Standard_Protocol_Filters
pub const SECURITY_RULE_RULESET_NAME: []const u8 = "security_rule.ruleset.name";

/// A rule ID that is unique within the scope of a set or group of agents, observers, or other entities using the rule for detection of this event.

/// 
/// Examples:
///     550e8400-e29b-41d4-a716-446655440000
///     1100110011
pub const SECURITY_RULE_UUID: []const u8 = "security_rule.uuid";

/// The version / revision of the rule being used for analysis.

/// 
/// Examples:
///     1.0.0
pub const SECURITY_RULE_VERSION: []const u8 = "security_rule.version";

/// Server domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
/// 
/// Notes: When observed from the client side, and when communicating through an intermediary, `server.address` SHOULD represent the server address behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     example.com
///     10.1.2.80
///     /tmp/my.sock
pub const SERVER_ADDRESS: []const u8 = "server.address";

/// Server port number.
/// 
/// Notes: When observed from the client side, and when communicating through an intermediary, `server.port` SHOULD represent the server port behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     80
///     8080
///     443
pub const SERVER_PORT: []const u8 = "server.port";

/// The string ID of the service instance.

/// 
/// Notes: MUST be unique for each instance of the same `service.namespace,service.name` pair (in other words `service.namespace,service.name,service.instance.id` triplet MUST be globally unique). The ID helps to distinguish instances of the same service that exist at the same time (e.g. instances of a horizontally scaled service). Implementations, such as SDKs, are recommended to generate a random Version 1 or Version 4 [RFC 4122](https://www.ietf.org/rfc/rfc4122.txt) UUID, but are free to use an inherent unique ID as the source of this value if stability is desirable. In that case, the ID SHOULD be used as source of a UUID Version 5 and SHOULD use the following UUID as the namespace: `4d63009a-8d0f-11ee-aad7-4c796ed8e320`. UUIDs are typically recommended, as only an opaque value for the purposes of identifying a service instance is needed. Similar to what can be seen in the man page for the [`/etc/machine-id`](https://www.freedesktop.org/software/systemd/man/latest/machine-id.html) file, the underlying data, such as pod name and namespace should be treated as confidential, being the user's choice to expose it or not via another resource attribute. For applications running behind an application server (like unicorn), we do not recommend using one identifier for all processes participating in the application. Instead, it's recommended each division (e.g. a worker thread in unicorn) to have its own instance.id. It's not recommended for a Collector to set `service.instance.id` if it can't unambiguously determine the service instance that is generating that telemetry. For instance, creating an UUID based on `pod.name` will likely be wrong, as the Collector might not know from which container within that pod the telemetry originated. However, Collectors can set the `service.instance.id` if they can unambiguously determine the service instance for that telemetry. This is typically the case for scraping receivers, as they know the target address and port.
/// 
/// Examples:
///     627cc493-f310-47de-96bd-71410b7dec09
pub const SERVICE_INSTANCE_ID: []const u8 = "service.instance.id";

/// Logical name of the service.

/// 
/// Notes: MUST be the same for all instances of horizontally scaled services. If the value was not specified, SDKs MUST fallback to `unknown_service:` concatenated with [`process.executable.name`](process.md), e.g. `unknown_service:bash`. If `process.executable.name` is not available, the value MUST be set to `unknown_service`.
/// 
/// Examples:
///     shoppingcart
pub const SERVICE_NAME: []const u8 = "service.name";

/// A namespace for `service.name`.

/// 
/// Notes: A string value having a meaning that helps to distinguish a group of services, for example the team name that owns a group of services. `service.name` is expected to be unique within the same namespace. If `service.namespace` is not specified in the Resource then `service.name` is expected to be unique for all services that have no explicit namespace defined (so the empty/unspecified namespace is simply one more valid namespace). Zero-length namespace string is assumed equal to unspecified namespace.
/// 
/// Examples:
///     Shop
pub const SERVICE_NAMESPACE: []const u8 = "service.namespace";

/// The version string of the service API or implementation. The format is not defined by these conventions.

/// 
/// Examples:
///     2.0.0
///     a01dbef8a
pub const SERVICE_VERSION: []const u8 = "service.version";

/// A unique id to identify a session.
/// 
/// Examples:
///     00112233-4455-6677-8899-aabbccddeeff
pub const SESSION_ID: []const u8 = "session.id";

/// The previous `session.id` for this user, when known.
/// 
/// Examples:
///     00112233-4455-6677-8899-aabbccddeeff
pub const SESSION_PREVIOUS_ID: []const u8 = "session.previous_id";

/// SignalR HTTP connection closure status.
/// 
/// Examples:
///     app_shutdown
///     timeout
pub const SIGNALR_CONNECTION_STATUS: []const u8 = "signalr.connection.status";

/// [SignalR transport type](https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/TransportProtocols.md)
/// 
/// Examples:
///     web_sockets
///     long_polling
pub const SIGNALR_TRANSPORT: []const u8 = "signalr.transport";

/// Source address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
/// 
/// Notes: When observed from the destination side, and when communicating through an intermediary, `source.address` SHOULD represent the source address behind any intermediaries, for example proxies, if it's available.
/// 
/// Examples:
///     source.example.com
///     10.1.2.80
///     /tmp/my.sock
pub const SOURCE_ADDRESS: []const u8 = "source.address";

/// Source port number
/// 
/// Examples:
///     3389
///     2888
pub const SOURCE_PORT: []const u8 = "source.port";

/// Deprecated, use `cpu.logical_number` instead.
/// 
/// Examples:
///     1
pub const SYSTEM_CPU_LOGICAL_NUMBER: []const u8 = "system.cpu.logical_number";

/// Deprecated, use `cpu.mode` instead.
/// 
/// Examples:
///     idle
///     interrupt
/// 
/// Note: This attribute is deprecated. Replaced by `cpu.mode`.
pub const SYSTEM_CPU_STATE: []const u8 = "system.cpu.state";

/// The device identifier
/// 
/// Examples:
///     (identifier)
pub const SYSTEM_DEVICE: []const u8 = "system.device";

/// The filesystem mode
/// 
/// Examples:
///     rw, ro
pub const SYSTEM_FILESYSTEM_MODE: []const u8 = "system.filesystem.mode";

/// The filesystem mount path
/// 
/// Examples:
///     /mnt/data
pub const SYSTEM_FILESYSTEM_MOUNTPOINT: []const u8 = "system.filesystem.mountpoint";

/// The filesystem state
/// 
/// Examples:
///     used
pub const SYSTEM_FILESYSTEM_STATE: []const u8 = "system.filesystem.state";

/// The filesystem type
/// 
/// Examples:
///     ext4
pub const SYSTEM_FILESYSTEM_TYPE: []const u8 = "system.filesystem.type";

/// The memory state
/// 
/// Examples:
///     free
///     cached
pub const SYSTEM_MEMORY_STATE: []const u8 = "system.memory.state";

/// Deprecated, use `network.connection.state` instead.
/// 
/// Examples:
///     close_wait
/// 
/// Note: This attribute is deprecated. Replaced by `network.connection.state`.
pub const SYSTEM_NETWORK_STATE: []const u8 = "system.network.state";

/// The paging access direction
/// 
/// Examples:
///     in
pub const SYSTEM_PAGING_DIRECTION: []const u8 = "system.paging.direction";

/// The memory paging state
/// 
/// Examples:
///     free
pub const SYSTEM_PAGING_STATE: []const u8 = "system.paging.state";

/// The memory paging type
/// 
/// Examples:
///     minor
pub const SYSTEM_PAGING_TYPE: []const u8 = "system.paging.type";

/// The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html#PROCESS_STATE_CODES)

/// 
/// Examples:
///     running
pub const SYSTEM_PROCESS_STATUS: []const u8 = "system.process.status";

/// Deprecated, use `system.process.status` instead.
/// 
/// Examples:
///     running
/// 
/// Note: This attribute is deprecated. Replaced by `system.process.status`.
pub const SYSTEM_PROCESSES_STATUS: []const u8 = "system.processes.status";

/// The name of the auto instrumentation agent or distribution, if used.

/// 
/// Notes: Official auto instrumentation agents and distributions SHOULD set the `telemetry.distro.name` attribute to a string starting with `opentelemetry-`, e.g. `opentelemetry-java-instrumentation`.
/// 
/// Examples:
///     parts-unlimited-java
pub const TELEMETRY_DISTRO_NAME: []const u8 = "telemetry.distro.name";

/// The version string of the auto instrumentation agent or distribution, if used.

/// 
/// Examples:
///     1.2.3
pub const TELEMETRY_DISTRO_VERSION: []const u8 = "telemetry.distro.version";

/// The language of the telemetry SDK.

pub const TELEMETRY_SDK_LANGUAGE: []const u8 = "telemetry.sdk.language";

/// The name of the telemetry SDK as defined above.

/// 
/// Notes: The OpenTelemetry SDK MUST set the `telemetry.sdk.name` attribute to `opentelemetry`. If another SDK, like a fork or a vendor-provided implementation, is used, this SDK MUST set the `telemetry.sdk.name` attribute to the fully-qualified class or module name of this SDK's main entry point or another suitable identifier depending on the language. The identifier `opentelemetry` is reserved and MUST NOT be used in this case. All custom identifiers SHOULD be stable across different versions of an implementation.
/// 
/// Examples:
///     opentelemetry
pub const TELEMETRY_SDK_NAME: []const u8 = "telemetry.sdk.name";

/// The version string of the telemetry SDK.

/// 
/// Examples:
///     1.2.3
pub const TELEMETRY_SDK_VERSION: []const u8 = "telemetry.sdk.version";

/// The fully qualified human readable name of the [test case](https://wikipedia.org/wiki/Test_case).

/// 
/// Examples:
///     org.example.TestCase1.test1
///     example/tests/TestCase1.test1
///     ExampleTestCase1_test1
pub const TEST_CASE_NAME: []const u8 = "test.case.name";

/// The status of the actual test case result from test execution.

/// 
/// Examples:
///     pass
///     fail
pub const TEST_CASE_RESULT_STATUS: []const u8 = "test.case.result.status";

/// The human readable name of a [test suite](https://wikipedia.org/wiki/Test_suite).

/// 
/// Examples:
///     TestSuite1
pub const TEST_SUITE_NAME: []const u8 = "test.suite.name";

/// The status of the test suite run.

/// 
/// Examples:
///     success
///     failure
///     skipped
///     aborted
///     timed_out
///     in_progress
pub const TEST_SUITE_RUN_STATUS: []const u8 = "test.suite.run.status";

/// Current "managed" thread ID (as opposed to OS thread ID).

/// 
/// Examples:
///     42
pub const THREAD_ID: []const u8 = "thread.id";

/// Current thread name.

/// 
/// Examples:
///     main
pub const THREAD_NAME: []const u8 = "thread.name";

/// String indicating the [cipher](https://datatracker.ietf.org/doc/html/rfc5246#appendix-A.5) used during the current connection.

/// 
/// Notes: The values allowed for `tls.cipher` MUST be one of the `Descriptions` of the [registered TLS Cipher Suits](https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#table-tls-parameters-4).
/// 
/// Examples:
///     TLS_RSA_WITH_3DES_EDE_CBC_SHA
///     TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
pub const TLS_CIPHER: []const u8 = "tls.cipher";

/// PEM-encoded stand-alone certificate offered by the client. This is usually mutually-exclusive of `client.certificate_chain` since this value also exists in that list.

/// 
/// Examples:
///     MII...
pub const TLS_CLIENT_CERTIFICATE: []const u8 = "tls.client.certificate";

/// Array of PEM-encoded certificates that make up the certificate chain offered by the client. This is usually mutually-exclusive of `client.certificate` since that value should be the first certificate in the chain.

/// 
/// Examples:
///     [\"MII...\", \"MI...\"]
pub const TLS_CLIENT_CERTIFICATE_CHAIN: []const u8 = "tls.client.certificate_chain";

/// Certificate fingerprint using the MD5 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     0F76C7F2C55BFD7D8E8B8F4BFBF0C9EC
pub const TLS_CLIENT_HASH_MD5: []const u8 = "tls.client.hash.md5";

/// Certificate fingerprint using the SHA1 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     9E393D93138888D288266C2D915214D1D1CCEB2A
pub const TLS_CLIENT_HASH_SHA1: []const u8 = "tls.client.hash.sha1";

/// Certificate fingerprint using the SHA256 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     0687F666A054EF17A08E2F2162EAB4CBC0D265E1D7875BE74BF3C712CA92DAF0
pub const TLS_CLIENT_HASH_SHA256: []const u8 = "tls.client.hash.sha256";

/// Distinguished name of [subject](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6) of the issuer of the x.509 certificate presented by the client.
/// 
/// Examples:
///     CN=Example Root CA, OU=Infrastructure Team, DC=example, DC=com
pub const TLS_CLIENT_ISSUER: []const u8 = "tls.client.issuer";

/// A hash that identifies clients based on how they perform an SSL/TLS handshake.
/// 
/// Examples:
///     d4e5b18d6b55c71272893221c96ba240
pub const TLS_CLIENT_JA3: []const u8 = "tls.client.ja3";

/// Date/Time indicating when client certificate is no longer considered valid.
/// 
/// Examples:
///     2021-01-01T00:00:00.000Z
pub const TLS_CLIENT_NOT_AFTER: []const u8 = "tls.client.not_after";

/// Date/Time indicating when client certificate is first considered valid.
/// 
/// Examples:
///     1970-01-01T00:00:00.000Z
pub const TLS_CLIENT_NOT_BEFORE: []const u8 = "tls.client.not_before";

/// Deprecated, use `server.address` instead.
/// 
/// Examples:
///     opentelemetry.io
/// 
/// Note: This attribute is deprecated. Replaced by `server.address`.
pub const TLS_CLIENT_SERVER_NAME: []const u8 = "tls.client.server_name";

/// Distinguished name of subject of the x.509 certificate presented by the client.
/// 
/// Examples:
///     CN=myclient, OU=Documentation Team, DC=example, DC=com
pub const TLS_CLIENT_SUBJECT: []const u8 = "tls.client.subject";

/// Array of ciphers offered by the client during the client hello.
/// 
/// Examples:
///     [\"TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384\", \"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384\"]
pub const TLS_CLIENT_SUPPORTED_CIPHERS: []const u8 = "tls.client.supported_ciphers";

/// String indicating the curve used for the given cipher, when applicable
/// 
/// Examples:
///     secp256r1
pub const TLS_CURVE: []const u8 = "tls.curve";

/// Boolean flag indicating if the TLS negotiation was successful and transitioned to an encrypted tunnel.
/// 
/// Examples:
///     true
pub const TLS_ESTABLISHED: []const u8 = "tls.established";

/// String indicating the protocol being tunneled. Per the values in the [IANA registry](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids), this string should be lower case.

/// 
/// Examples:
///     http/1.1
pub const TLS_NEXT_PROTOCOL: []const u8 = "tls.next_protocol";

/// Normalized lowercase protocol name parsed from original string of the negotiated [SSL/TLS protocol version](https://docs.openssl.org/1.1.1/man3/SSL_get_version/#return-values)

pub const TLS_PROTOCOL_NAME: []const u8 = "tls.protocol.name";

/// Numeric part of the version parsed from the original string of the negotiated [SSL/TLS protocol version](https://docs.openssl.org/1.1.1/man3/SSL_get_version/#return-values)

/// 
/// Examples:
///     1.2
///     3
pub const TLS_PROTOCOL_VERSION: []const u8 = "tls.protocol.version";

/// Boolean flag indicating if this TLS connection was resumed from an existing TLS negotiation.
/// 
/// Examples:
///     true
pub const TLS_RESUMED: []const u8 = "tls.resumed";

/// PEM-encoded stand-alone certificate offered by the server. This is usually mutually-exclusive of `server.certificate_chain` since this value also exists in that list.

/// 
/// Examples:
///     MII...
pub const TLS_SERVER_CERTIFICATE: []const u8 = "tls.server.certificate";

/// Array of PEM-encoded certificates that make up the certificate chain offered by the server. This is usually mutually-exclusive of `server.certificate` since that value should be the first certificate in the chain.

/// 
/// Examples:
///     [\"MII...\", \"MI...\"]
pub const TLS_SERVER_CERTIFICATE_CHAIN: []const u8 = "tls.server.certificate_chain";

/// Certificate fingerprint using the MD5 digest of DER-encoded version of certificate offered by the server. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     0F76C7F2C55BFD7D8E8B8F4BFBF0C9EC
pub const TLS_SERVER_HASH_MD5: []const u8 = "tls.server.hash.md5";

/// Certificate fingerprint using the SHA1 digest of DER-encoded version of certificate offered by the server. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     9E393D93138888D288266C2D915214D1D1CCEB2A
pub const TLS_SERVER_HASH_SHA1: []const u8 = "tls.server.hash.sha1";

/// Certificate fingerprint using the SHA256 digest of DER-encoded version of certificate offered by the server. For consistency with other hash values, this value should be formatted as an uppercase hash.

/// 
/// Examples:
///     0687F666A054EF17A08E2F2162EAB4CBC0D265E1D7875BE74BF3C712CA92DAF0
pub const TLS_SERVER_HASH_SHA256: []const u8 = "tls.server.hash.sha256";

/// Distinguished name of [subject](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6) of the issuer of the x.509 certificate presented by the client.
/// 
/// Examples:
///     CN=Example Root CA, OU=Infrastructure Team, DC=example, DC=com
pub const TLS_SERVER_ISSUER: []const u8 = "tls.server.issuer";

/// A hash that identifies servers based on how they perform an SSL/TLS handshake.
/// 
/// Examples:
///     d4e5b18d6b55c71272893221c96ba240
pub const TLS_SERVER_JA3S: []const u8 = "tls.server.ja3s";

/// Date/Time indicating when server certificate is no longer considered valid.
/// 
/// Examples:
///     2021-01-01T00:00:00.000Z
pub const TLS_SERVER_NOT_AFTER: []const u8 = "tls.server.not_after";

/// Date/Time indicating when server certificate is first considered valid.
/// 
/// Examples:
///     1970-01-01T00:00:00.000Z
pub const TLS_SERVER_NOT_BEFORE: []const u8 = "tls.server.not_before";

/// Distinguished name of subject of the x.509 certificate presented by the server.
/// 
/// Examples:
///     CN=myserver, OU=Documentation Team, DC=example, DC=com
pub const TLS_SERVER_SUBJECT: []const u8 = "tls.server.subject";

/// Domain extracted from the `url.full`, such as "opentelemetry.io".

/// 
/// Notes: In some cases a URL may refer to an IP and/or port directly, without a domain name. In this case, the IP address would go to the domain field. If the URL contains a [literal IPv6 address](https://www.rfc-editor.org/rfc/rfc2732#section-2) enclosed by `[` and `]`, the `[` and `]` characters should also be captured in the domain field.
/// 
/// Examples:
///     www.foo.bar
///     opentelemetry.io
///     3.12.167.2
///     [1080:0:0:0:8:800:200C:417A]
pub const URL_DOMAIN: []const u8 = "url.domain";

/// The file extension extracted from the `url.full`, excluding the leading dot.

/// 
/// Notes: The file extension is only set if it exists, as not every url has a file extension. When the file name has multiple extensions `example.tar.gz`, only the last one should be captured `gz`, not `tar.gz`.
/// 
/// Examples:
///     png
///     gz
pub const URL_EXTENSION: []const u8 = "url.extension";

/// The [URI fragment](https://www.rfc-editor.org/rfc/rfc3986#section-3.5) component

/// 
/// Examples:
///     SemConv
pub const URL_FRAGMENT: []const u8 = "url.fragment";

/// Absolute URL describing a network resource according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986)
/// 
/// Notes: For network calls, URL usually has `scheme://host[:port][path][?query][#fragment]` format, where the fragment is not transmitted over HTTP, but if it is known, it SHOULD be included nevertheless. `url.full` MUST NOT contain credentials passed via URL in form of `https://username:password@www.example.com/`. In such case username and password SHOULD be redacted and attribute's value SHOULD be `https://REDACTED:REDACTED@www.example.com/`. `url.full` SHOULD capture the absolute URL when it is available (or can be reconstructed). Sensitive content provided in `url.full` SHOULD be scrubbed when instrumentations can identify it. ![Development](https://img.shields.io/badge/-development-blue) Query string values for the following keys SHOULD be redacted by default and replaced by the value `REDACTED`: * [`AWSAccessKeyId`](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html#RESTAuthenticationQueryStringAuth) * [`Signature`](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html#RESTAuthenticationQueryStringAuth) * [`sig`](https://learn.microsoft.com/azure/storage/common/storage-sas-overview#sas-token) * [`X-Goog-Signature`](https://cloud.google.com/storage/docs/access-control/signed-urls) This list is subject to change over time. When a query string value is redacted, the query string key SHOULD still be preserved, e.g. `https://www.example.com/path?color=blue&sig=REDACTED`.
/// 
/// Examples:
///     https://www.foo.bar/search?q=OpenTelemetry#SemConv
///     //localhost
pub const URL_FULL: []const u8 = "url.full";

/// Unmodified original URL as seen in the event source.

/// 
/// Notes: In network monitoring, the observed URL may be a full URL, whereas in access logs, the URL is often just represented as a path. This field is meant to represent the URL as it was observed, complete or not. `url.original` might contain credentials passed via URL in form of `https://username:password@www.example.com/`. In such case password and username SHOULD NOT be redacted and attribute's value SHOULD remain the same.
/// 
/// Examples:
///     https://www.foo.bar/search?q=OpenTelemetry#SemConv
///     search?q=OpenTelemetry
pub const URL_ORIGINAL: []const u8 = "url.original";

/// The [URI path](https://www.rfc-editor.org/rfc/rfc3986#section-3.3) component

/// 
/// Notes: Sensitive content provided in `url.path` SHOULD be scrubbed when instrumentations can identify it.
/// 
/// Examples:
///     /search
pub const URL_PATH: []const u8 = "url.path";

/// Port extracted from the `url.full`

/// 
/// Examples:
///     443
pub const URL_PORT: []const u8 = "url.port";

/// The [URI query](https://www.rfc-editor.org/rfc/rfc3986#section-3.4) component

/// 
/// Notes: Sensitive content provided in `url.query` SHOULD be scrubbed when instrumentations can identify it. ![Development](https://img.shields.io/badge/-development-blue) Query string values for the following keys SHOULD be redacted by default and replaced by the value `REDACTED`: * [`AWSAccessKeyId`](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html#RESTAuthenticationQueryStringAuth) * [`Signature`](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html#RESTAuthenticationQueryStringAuth) * [`sig`](https://learn.microsoft.com/azure/storage/common/storage-sas-overview#sas-token) * [`X-Goog-Signature`](https://cloud.google.com/storage/docs/access-control/signed-urls) This list is subject to change over time. When a query string value is redacted, the query string key SHOULD still be preserved, e.g. `q=OpenTelemetry&sig=REDACTED`.
/// 
/// Examples:
///     q=OpenTelemetry
pub const URL_QUERY: []const u8 = "url.query";

/// The highest registered url domain, stripped of the subdomain.

/// 
/// Notes: This value can be determined precisely with the [public suffix list](https://publicsuffix.org/). For example, the registered domain for `foo.example.com` is `example.com`. Trying to approximate this by simply taking the last two labels will not work well for TLDs such as `co.uk`.
/// 
/// Examples:
///     example.com
///     foo.co.uk
pub const URL_REGISTERED_DOMAIN: []const u8 = "url.registered_domain";

/// The [URI scheme](https://www.rfc-editor.org/rfc/rfc3986#section-3.1) component identifying the used protocol.

/// 
/// Examples:
///     https
///     ftp
///     telnet
pub const URL_SCHEME: []const u8 = "url.scheme";

/// The subdomain portion of a fully qualified domain name includes all of the names except the host name under the registered_domain. In a partially qualified domain, or if the qualification level of the full name cannot be determined, subdomain contains all of the names below the registered domain.

/// 
/// Notes: The subdomain portion of `www.east.mydomain.co.uk` is `east`. If the domain has multiple levels of subdomain, such as `sub2.sub1.example.com`, the subdomain field should contain `sub2.sub1`, with no trailing period.
/// 
/// Examples:
///     east
///     sub2.sub1
pub const URL_SUBDOMAIN: []const u8 = "url.subdomain";

/// The low-cardinality template of an [absolute path reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.2).

/// 
/// Examples:
///     /users/{id}
///     /users/:id
///     /users?id={id}
pub const URL_TEMPLATE: []const u8 = "url.template";

/// The effective top level domain (eTLD), also known as the domain suffix, is the last part of the domain name. For example, the top level domain for example.com is `com`.

/// 
/// Notes: This value can be determined precisely with the [public suffix list](https://publicsuffix.org/).
/// 
/// Examples:
///     com
///     co.uk
pub const URL_TOP_LEVEL_DOMAIN: []const u8 = "url.top_level_domain";

/// User email address.

/// 
/// Examples:
///     a.einstein@example.com
pub const USER_EMAIL: []const u8 = "user.email";

/// User's full name

/// 
/// Examples:
///     Albert Einstein
pub const USER_FULL_NAME: []const u8 = "user.full_name";

/// Unique user hash to correlate information for a user in anonymized form.

/// 
/// Notes: Useful if `user.id` or `user.name` contain confidential information and cannot be used.
/// 
/// Examples:
///     364fc68eaf4c8acec74a4e52d7d1feaa
pub const USER_HASH: []const u8 = "user.hash";

/// Unique identifier of the user.

/// 
/// Examples:
///     S-1-5-21-202424912787-2692429404-2351956786-1000
pub const USER_ID: []const u8 = "user.id";

/// Short name or login/username of the user.

/// 
/// Examples:
///     a.einstein
pub const USER_NAME: []const u8 = "user.name";

/// Array of user roles at the time of the event.

/// 
/// Examples:
///     [\"admin\", \"reporting_user\"]
pub const USER_ROLES: []const u8 = "user.roles";

/// Name of the user-agent extracted from original. Usually refers to the browser's name.

/// 
/// Notes: [Example](https://www.whatsmyua.info) of extracting browser's name from original string. In the case of using a user-agent for non-browser products, such as microservices with multiple names/versions inside the `user_agent.original`, the most significant name SHOULD be selected. In such a scenario it should align with `user_agent.version`
/// 
/// Examples:
///     Safari
///     YourApp
pub const USER_AGENT_NAME: []const u8 = "user_agent.name";

/// Value of the [HTTP User-Agent](https://www.rfc-editor.org/rfc/rfc9110.html#field.user-agent) header sent by the client.

/// 
/// Examples:
///     CERN-LineMode/2.15 libwww/2.17b3
///     Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1
///     YourApp/1.0.0 grpc-java-okhttp/1.27.2
pub const USER_AGENT_ORIGINAL: []const u8 = "user_agent.original";

/// Human readable operating system name.
/// 
/// Notes: For mapping user agent strings to OS names, libraries such as [ua-parser](https://github.com/ua-parser) can be utilized.
/// 
/// Examples:
///     iOS
///     Android
///     Ubuntu
pub const USER_AGENT_OS_NAME: []const u8 = "user_agent.os.name";

/// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md#version-attributes).

/// 
/// Notes: For mapping user agent strings to OS versions, libraries such as [ua-parser](https://github.com/ua-parser) can be utilized.
/// 
/// Examples:
///     14.2.1
///     18.04.1
pub const USER_AGENT_OS_VERSION: []const u8 = "user_agent.os.version";

/// Specifies the category of synthetic traffic, such as tests or bots.

/// 
/// Notes: This attribute MAY be derived from the contents of the `user_agent.original` attribute. Components that populate the attribute are responsible for determining what they consider to be synthetic bot or test traffic. This attribute can either be set for self-identification purposes, or on telemetry detected to be generated as a result of a synthetic request. This attribute is useful for distinguishing between genuine client traffic and synthetic traffic generated by bots or tests.
pub const USER_AGENT_SYNTHETIC_TYPE: []const u8 = "user_agent.synthetic.type";

/// Version of the user-agent extracted from original. Usually refers to the browser's version

/// 
/// Notes: [Example](https://www.whatsmyua.info) of extracting browser's version from original string. In the case of using a user-agent for non-browser products, such as microservices with multiple names/versions inside the `user_agent.original`, the most significant version SHOULD be selected. In such a scenario it should align with `user_agent.name`
/// 
/// Examples:
///     14.1.2
///     1.0.0
pub const USER_AGENT_VERSION: []const u8 = "user_agent.version";

/// The type of garbage collection.
pub const V8JS_GC_TYPE: []const u8 = "v8js.gc.type";

/// The name of the space type of heap memory.
/// 
/// Notes: Value can be retrieved from value `space_name` of [`v8.getHeapSpaceStatistics()`](https://nodejs.org/api/v8.html#v8getheapspacestatistics)
pub const V8JS_HEAP_SPACE_NAME: []const u8 = "v8js.heap.space.name";

/// The ID of the change (pull request/merge request/changelist) if applicable. This is usually a unique (within repository) identifier generated by the VCS system.

/// 
/// Examples:
///     123
pub const VCS_CHANGE_ID: []const u8 = "vcs.change.id";

/// The state of the change (pull request/merge request/changelist).

/// 
/// Examples:
///     open
///     closed
///     merged
pub const VCS_CHANGE_STATE: []const u8 = "vcs.change.state";

/// The human readable title of the change (pull request/merge request/changelist). This title is often a brief summary of the change and may get merged in to a ref as the commit summary.

/// 
/// Examples:
///     Fixes broken thing
///     feat: add my new feature
///     [chore] update dependency
pub const VCS_CHANGE_TITLE: []const u8 = "vcs.change.title";

/// The type of line change being measured on a branch or change.

/// 
/// Examples:
///     added
///     removed
pub const VCS_LINE_CHANGE_TYPE: []const u8 = "vcs.line_change.type";

/// The group owner within the version control system.

/// 
/// Examples:
///     my-org
///     myteam
///     business-unit
pub const VCS_OWNER_NAME: []const u8 = "vcs.owner.name";

/// The name of the version control system provider.

/// 
/// Examples:
///     github
///     gitlab
///     gitea
///     bitbucket
pub const VCS_PROVIDER_NAME: []const u8 = "vcs.provider.name";

/// The name of the [reference](https://git-scm.com/docs/gitglossary#def_ref) such as **branch** or **tag** in the repository.

/// 
/// Notes: `base` refers to the starting point of a change. For example, `main` would be the base reference of type branch if you've created a new reference of type branch from it and created new commits.
/// 
/// Examples:
///     my-feature-branch
///     tag-1-test
pub const VCS_REF_BASE_NAME: []const u8 = "vcs.ref.base.name";

/// The revision, literally [revised version](https://www.merriam-webster.com/dictionary/revision), The revision most often refers to a commit object in Git, or a revision number in SVN.

/// 
/// Notes: `base` refers to the starting point of a change. For example, `main` would be the base reference of type branch if you've created a new reference of type branch from it and created new commits. The revision can be a full [hash value (see glossary)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-5.pdf), of the recorded change to a ref within a repository pointing to a commit [commit](https://git-scm.com/docs/git-commit) object. It does not necessarily have to be a hash; it can simply define a [revision number](https://svnbook.red-bean.com/en/1.7/svn.tour.revs.specifiers.html) which is an integer that is monotonically increasing. In cases where it is identical to the `ref.base.name`, it SHOULD still be included. It is up to the implementer to decide which value to set as the revision based on the VCS system and situational context.
/// 
/// Examples:
///     9d59409acf479dfa0df1aa568182e43e43df8bbe28d60fcf2bc52e30068802cc
///     main
///     123
///     HEAD
pub const VCS_REF_BASE_REVISION: []const u8 = "vcs.ref.base.revision";

/// The type of the [reference](https://git-scm.com/docs/gitglossary#def_ref) in the repository.

/// 
/// Notes: `base` refers to the starting point of a change. For example, `main` would be the base reference of type branch if you've created a new reference of type branch from it and created new commits.
/// 
/// Examples:
///     branch
///     tag
pub const VCS_REF_BASE_TYPE: []const u8 = "vcs.ref.base.type";

/// The name of the [reference](https://git-scm.com/docs/gitglossary#def_ref) such as **branch** or **tag** in the repository.

/// 
/// Notes: `head` refers to where you are right now; the current reference at a given time.
/// 
/// Examples:
///     my-feature-branch
///     tag-1-test
pub const VCS_REF_HEAD_NAME: []const u8 = "vcs.ref.head.name";

/// The revision, literally [revised version](https://www.merriam-webster.com/dictionary/revision), The revision most often refers to a commit object in Git, or a revision number in SVN.

/// 
/// Notes: `head` refers to where you are right now; the current reference at a given time.The revision can be a full [hash value (see glossary)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-5.pdf), of the recorded change to a ref within a repository pointing to a commit [commit](https://git-scm.com/docs/git-commit) object. It does not necessarily have to be a hash; it can simply define a [revision number](https://svnbook.red-bean.com/en/1.7/svn.tour.revs.specifiers.html) which is an integer that is monotonically increasing. In cases where it is identical to the `ref.head.name`, it SHOULD still be included. It is up to the implementer to decide which value to set as the revision based on the VCS system and situational context.
/// 
/// Examples:
///     9d59409acf479dfa0df1aa568182e43e43df8bbe28d60fcf2bc52e30068802cc
///     main
///     123
///     HEAD
pub const VCS_REF_HEAD_REVISION: []const u8 = "vcs.ref.head.revision";

/// The type of the [reference](https://git-scm.com/docs/gitglossary#def_ref) in the repository.

/// 
/// Notes: `head` refers to where you are right now; the current reference at a given time.
/// 
/// Examples:
///     branch
///     tag
pub const VCS_REF_HEAD_TYPE: []const u8 = "vcs.ref.head.type";

/// The type of the [reference](https://git-scm.com/docs/gitglossary#def_ref) in the repository.

/// 
/// Examples:
///     branch
///     tag
pub const VCS_REF_TYPE: []const u8 = "vcs.ref.type";

/// Deprecated, use `vcs.change.id` instead.

/// 
/// Examples:
///     123
/// 
/// Note: This attribute is deprecated. Replaced by `vcs.change.id`.
pub const VCS_REPOSITORY_CHANGE_ID: []const u8 = "vcs.repository.change.id";

/// Deprecated, use `vcs.change.title` instead.

/// 
/// Examples:
///     Fixes broken thing
///     feat: add my new feature
///     [chore] update dependency
/// 
/// Note: This attribute is deprecated. Replaced by `vcs.change.title`.
pub const VCS_REPOSITORY_CHANGE_TITLE: []const u8 = "vcs.repository.change.title";

/// The human readable name of the repository. It SHOULD NOT include any additional identifier like Group/SubGroup in GitLab or organization in GitHub.

/// 
/// Notes: Due to it only being the name, it can clash with forks of the same repository if collecting telemetry across multiple orgs or groups in the same backends.
/// 
/// Examples:
///     semantic-conventions
///     my-cool-repo
pub const VCS_REPOSITORY_NAME: []const u8 = "vcs.repository.name";

/// Deprecated, use `vcs.ref.head.name` instead.

/// 
/// Examples:
///     my-feature-branch
///     tag-1-test
/// 
/// Note: This attribute is deprecated. Replaced by `vcs.ref.head.name`.
pub const VCS_REPOSITORY_REF_NAME: []const u8 = "vcs.repository.ref.name";

/// Deprecated, use `vcs.ref.head.revision` instead.

/// 
/// Examples:
///     9d59409acf479dfa0df1aa568182e43e43df8bbe28d60fcf2bc52e30068802cc
///     main
///     123
///     HEAD
/// 
/// Note: This attribute is deprecated. Replaced by `vcs.ref.head.revision`.
pub const VCS_REPOSITORY_REF_REVISION: []const u8 = "vcs.repository.ref.revision";

/// Deprecated, use `vcs.ref.head.type` instead.

/// 
/// Examples:
///     branch
///     tag
/// 
/// Note: This attribute is deprecated. Replaced by `vcs.ref.head.type`.
pub const VCS_REPOSITORY_REF_TYPE: []const u8 = "vcs.repository.ref.type";

/// The [canonical URL](https://support.google.com/webmasters/answer/10347851?hl=en#:~:text=A%20canonical%20URL%20is%20the,Google%20chooses%20one%20as%20canonical.) of the repository providing the complete HTTP(S) address in order to locate and identify the repository through a browser.

/// 
/// Notes: In Git Version Control Systems, the canonical URL SHOULD NOT include the `.git` extension.
/// 
/// Examples:
///     https://github.com/opentelemetry/open-telemetry-collector-contrib
///     https://gitlab.com/my-org/my-project/my-projects-project/repo
pub const VCS_REPOSITORY_URL_FULL: []const u8 = "vcs.repository.url.full";

/// The type of revision comparison.

/// 
/// Examples:
///     ahead
///     behind
pub const VCS_REVISION_DELTA_DIRECTION: []const u8 = "vcs.revision_delta.direction";

/// Additional description of the web engine (e.g. detailed version and edition information).

/// 
/// Examples:
///     WildFly Full 21.0.0.Final (WildFly Core 13.0.1.Final) - 2.2.2.Final
pub const WEBENGINE_DESCRIPTION: []const u8 = "webengine.description";

/// The name of the web engine.

/// 
/// Examples:
///     WildFly
pub const WEBENGINE_NAME: []const u8 = "webengine.name";

/// The version of the web engine.

/// 
/// Examples:
///     21.0.0
pub const WEBENGINE_VERSION: []const u8 = "webengine.version";

/// The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.
/// 
/// Examples:
///     SYS1
pub const ZOS_SMF_ID: []const u8 = "zos.smf.id";

/// The name of the SYSPLEX to which the z/OS system belongs too.
/// 
/// Examples:
///     SYSPLEX1
pub const ZOS_SYSPLEX_NAME: []const u8 = "zos.sysplex.name";


test "semantic attributes" {
    @import("std").testing.refAllDecls(@This());
}