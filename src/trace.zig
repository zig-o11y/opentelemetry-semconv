// DO NOT EDIT, this is an auto-generated file
//
// If you want to update the file:
// - Edit the template at scripts/templates/registry/zig/trace.zig.j2
// - Run the script at scripts/generate-consts-from-spec.sh

//! # Semantic Trace Attributes
//!
//! The entire set of semantic trace attributes (or [conventions](https://opentelemetry.io/docs/concepts/semantic-conventions/)) defined by the project.

/// This attribute represents the state of the application.

/// 
/// # Examples
/// 
/// - created
/// Note: This attribute is experimental and may change in the future.
pub const ANDROID_APP_STATE: []const u8 = "android.app.state";

/// The x (horizontal) coordinate of a screen coordinate, in screen pixels.
/// 
/// # Examples
/// 
/// - 0
/// - 131
/// Note: This attribute is experimental and may change in the future.
pub const APP_SCREEN_COORDINATE_X: []const u8 = "app.screen.coordinate.x";

/// The y (vertical) component of a screen coordinate, in screen pixels.

/// 
/// # Examples
/// 
/// - 12
/// - 99
/// Note: This attribute is experimental and may change in the future.
pub const APP_SCREEN_COORDINATE_Y: []const u8 = "app.screen.coordinate.y";

/// An identifier that uniquely differentiates this widget from other widgets in the same application.

/// 
/// # Examples
/// 
/// - f9bc787d-ff05-48ad-90e1-fca1d46130b3
/// - submit_order_1829
/// Note: This attribute is experimental and may change in the future.
pub const APP_WIDGET_ID: []const u8 = "app.widget.id";

/// The name of an application widget.
/// 
/// # Examples
/// 
/// - submit
/// - attack
/// - Clear Cart
/// Note: This attribute is experimental and may change in the future.
pub const APP_WIDGET_NAME: []const u8 = "app.widget.name";

/// The unique identifier of the AWS Bedrock Guardrail. A [guardrail](https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html) helps safeguard and prevent unwanted behavior from model responses or user messages.

/// 
/// # Examples
/// 
/// - sgi5gkybzqak
/// Note: This attribute is experimental and may change in the future.
pub const AWS_BEDROCK_GUARDRAIL_ID: []const u8 = "aws.bedrock.guardrail.id";

/// The unique identifier of the AWS Bedrock Knowledge base. A [knowledge base](https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base.html) is a bank of information that can be queried by models to generate more relevant responses and augment prompts.

/// 
/// # Examples
/// 
/// - XFWUPB9PAW
/// Note: This attribute is experimental and may change in the future.
pub const AWS_BEDROCK_KNOWLEDGE_BASE_ID: []const u8 = "aws.bedrock.knowledge_base.id";

/// The JSON-serialized value of each item in the `AttributeDefinitions` request field.
/// 
/// # Examples
/// 
/// - [\"{ \\"AttributeName\\": \\"string\\", \\"AttributeType\\": \\"string\\" }\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS: []const u8 = "aws.dynamodb.attribute_definitions";

/// The value of the `AttributesToGet` request parameter.
/// 
/// # Examples
/// 
/// - [\"lives\", \"id\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_ATTRIBUTES_TO_GET: []const u8 = "aws.dynamodb.attributes_to_get";

/// The value of the `ConsistentRead` request parameter.
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_CONSISTENT_READ: []const u8 = "aws.dynamodb.consistent_read";

/// The JSON-serialized value of each item in the `ConsumedCapacity` response field.
/// 
/// # Examples
/// 
/// - [\"{ \\"CapacityUnits\\": number, \\"GlobalSecondaryIndexes\\": { \\"string\\" : { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }, \\"LocalSecondaryIndexes\\": { \\"string\\" : { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }, \\"ReadCapacityUnits\\": number, \\"Table\\": { \\"CapacityUnits\\": number, \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number }, \\"TableName\\": \\"string\\", \\"WriteCapacityUnits\\": number }\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_CONSUMED_CAPACITY: []const u8 = "aws.dynamodb.consumed_capacity";

/// The value of the `Count` response parameter.
/// 
/// # Examples
/// 
/// - 10
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_COUNT: []const u8 = "aws.dynamodb.count";

/// The value of the `ExclusiveStartTableName` request parameter.
/// 
/// # Examples
/// 
/// - Users
/// - CatsTable
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_EXCLUSIVE_START_TABLE: []const u8 = "aws.dynamodb.exclusive_start_table";

/// The JSON-serialized value of each item in the `GlobalSecondaryIndexUpdates` request field.
/// 
/// # Examples
/// 
/// - [\"{ \\"Create\\": { \\"IndexName\\": \\"string\\", \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" }, \\"ProvisionedThroughput\\": { \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES: []const u8 = "aws.dynamodb.global_secondary_index_updates";

/// The JSON-serialized value of each item of the `GlobalSecondaryIndexes` request field
/// 
/// # Examples
/// 
/// - [\"{ \\"IndexName\\": \\"string\\", \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" }, \\"ProvisionedThroughput\\": { \\"ReadCapacityUnits\\": number, \\"WriteCapacityUnits\\": number } }\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES: []const u8 = "aws.dynamodb.global_secondary_indexes";

/// The value of the `IndexName` request parameter.
/// 
/// # Examples
/// 
/// - name_to_group
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_INDEX_NAME: []const u8 = "aws.dynamodb.index_name";

/// The JSON-serialized value of the `ItemCollectionMetrics` response field.
/// 
/// # Examples
/// 
/// - { \"string\" : [ { \"ItemCollectionKey\": { \"string\" : { \"B\": blob, \"BOOL\": boolean, \"BS\": [ blob ], \"L\": [ \"AttributeValue\" ], \"M\": { \"string\" : \"AttributeValue\" }, \"N\": \"string\", \"NS\": [ \"string\" ], \"NULL\": boolean, \"S\": \"string\", \"SS\": [ \"string\" ] } }, \"SizeEstimateRangeGB\": [ number ] } ] }
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_ITEM_COLLECTION_METRICS: []const u8 = "aws.dynamodb.item_collection_metrics";

/// The value of the `Limit` request parameter.
/// 
/// # Examples
/// 
/// - 10
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_LIMIT: []const u8 = "aws.dynamodb.limit";

/// The JSON-serialized value of each item of the `LocalSecondaryIndexes` request field.
/// 
/// # Examples
/// 
/// - [\"{ \\"IndexArn\\": \\"string\\", \\"IndexName\\": \\"string\\", \\"IndexSizeBytes\\": number, \\"ItemCount\\": number, \\"KeySchema\\": [ { \\"AttributeName\\": \\"string\\", \\"KeyType\\": \\"string\\" } ], \\"Projection\\": { \\"NonKeyAttributes\\": [ \\"string\\" ], \\"ProjectionType\\": \\"string\\" } }\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES: []const u8 = "aws.dynamodb.local_secondary_indexes";

/// The value of the `ProjectionExpression` request parameter.
/// 
/// # Examples
/// 
/// - Title
/// - Title, Price, Color
/// - Title, Description, RelatedItems, ProductReviews
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_PROJECTION: []const u8 = "aws.dynamodb.projection";

/// The value of the `ProvisionedThroughput.ReadCapacityUnits` request parameter.
/// 
/// # Examples
/// 
/// - 1.0
/// - 2.0
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_PROVISIONED_READ_CAPACITY: []const u8 = "aws.dynamodb.provisioned_read_capacity";

/// The value of the `ProvisionedThroughput.WriteCapacityUnits` request parameter.
/// 
/// # Examples
/// 
/// - 1.0
/// - 2.0
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY: []const u8 = "aws.dynamodb.provisioned_write_capacity";

/// The value of the `ScanIndexForward` request parameter.
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_SCAN_FORWARD: []const u8 = "aws.dynamodb.scan_forward";

/// The value of the `ScannedCount` response parameter.
/// 
/// # Examples
/// 
/// - 50
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_SCANNED_COUNT: []const u8 = "aws.dynamodb.scanned_count";

/// The value of the `Segment` request parameter.
/// 
/// # Examples
/// 
/// - 10
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_SEGMENT: []const u8 = "aws.dynamodb.segment";

/// The value of the `Select` request parameter.
/// 
/// # Examples
/// 
/// - ALL_ATTRIBUTES
/// - COUNT
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_SELECT: []const u8 = "aws.dynamodb.select";

/// The number of items in the `TableNames` response parameter.
/// 
/// # Examples
/// 
/// - 20
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_TABLE_COUNT: []const u8 = "aws.dynamodb.table_count";

/// The keys in the `RequestItems` object field.
/// 
/// # Examples
/// 
/// - [\"Users\", \"Cats\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_TABLE_NAMES: []const u8 = "aws.dynamodb.table_names";

/// The value of the `TotalSegments` request parameter.
/// 
/// # Examples
/// 
/// - 100
/// Note: This attribute is experimental and may change in the future.
pub const AWS_DYNAMODB_TOTAL_SEGMENTS: []const u8 = "aws.dynamodb.total_segments";

/// The AWS extended request ID as returned in the response header `x-amz-id-2`.
/// 
/// # Examples
/// 
/// - wzHcyEWfmOGDIE5QOhTAqFDoDWP3y8IUvpNINCwL9N4TEHbUw0/gZJ+VZTmCNCWR7fezEN3eCiQ=
/// Note: This attribute is experimental and may change in the future.
pub const AWS_EXTENDED_REQUEST_ID: []const u8 = "aws.extended_request_id";

/// The full invoked ARN as provided on the `Context` passed to the function (`Lambda-Runtime-Invoked-Function-Arn` header on the `/runtime/invocation/next` applicable).

/// 
/// # Examples
/// 
/// - arn:aws:lambda:us-east-1:123456:function:myfunction:myalias
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LAMBDA_INVOKED_ARN: []const u8 = "aws.lambda.invoked_arn";

/// The UUID of the [AWS Lambda EvenSource Mapping](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-eventsourcemapping.html). An event source is mapped to a lambda function. It's contents are read by Lambda and used to trigger a function. This isn't available in the lambda execution context or the lambda runtime environtment. This is going to be populated by the AWS SDK for each language when that UUID is present. Some of these operations are Create/Delete/Get/List/Update EventSourceMapping.

/// 
/// # Examples
/// 
/// - 587ad24b-03b9-4413-8202-bbd56b36e5b7
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LAMBDA_RESOURCE_MAPPING_ID: []const u8 = "aws.lambda.resource_mapping.id";

/// The AWS request ID as returned in the response headers `x-amzn-requestid`, `x-amzn-request-id` or `x-amz-request-id`.
/// 
/// # Examples
/// 
/// - 79b9da39-b7ae-508a-a6bc-864b2829c622
/// - C9ER4AJX75574TDJ
/// Note: This attribute is experimental and may change in the future.
pub const AWS_REQUEST_ID: []const u8 = "aws.request_id";

/// The S3 bucket name the request refers to. Corresponds to the `--bucket` parameter of the [S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) operations.
/// 
/// # Examples
/// 
/// - some-bucket-name
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_BUCKET: []const u8 = "aws.s3.bucket";

/// The source object (in the form `bucket`/`key`) for the copy operation.
/// 
/// # Examples
/// 
/// - someFile.yml
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_COPY_SOURCE: []const u8 = "aws.s3.copy_source";

/// The delete request container that specifies the objects to be deleted.
/// 
/// # Examples
/// 
/// - Objects=[{Key=string,VersionId=string},{Key=string,VersionId=string}],Quiet=boolean
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_DELETE: []const u8 = "aws.s3.delete";

/// The S3 object key the request refers to. Corresponds to the `--key` parameter of the [S3 API](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) operations.
/// 
/// # Examples
/// 
/// - someFile.yml
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_KEY: []const u8 = "aws.s3.key";

/// The part number of the part being uploaded in a multipart-upload operation. This is a positive integer between 1 and 10,000.
/// 
/// # Examples
/// 
/// - 3456
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_PART_NUMBER: []const u8 = "aws.s3.part_number";

/// Upload ID that identifies the multipart upload.
/// 
/// # Examples
/// 
/// - dfRtDYWFbkRONycy.Yxwh66Yjlx.cph0gtNBtJ
/// Note: This attribute is experimental and may change in the future.
pub const AWS_S3_UPLOAD_ID: []const u8 = "aws.s3.upload_id";

/// Deprecated, use `azure.service.request.id` instead.
/// 
/// # Examples
/// 
/// - 00000000-0000-0000-0000-000000000000
/// Note: This attribute is experimental and may change in the future.
/// Note: This attribute is deprecated. {"note": "Replaced by `azure.service.request.id`.", "reason": "renamed", "renamed_to": "azure.service.request.id"}
pub const AZ_SERVICE_REQUEST_ID: []const u8 = "az.service_request_id";

/// The unique identifier of the client instance.
/// 
/// # Examples
/// 
/// - 3ba4827d-4422-483f-b59f-85b74211c11d
/// - storage-client-1
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_CLIENT_ID: []const u8 = "azure.client.id";

/// Cosmos client connection mode.
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_CONNECTION_MODE: []const u8 = "azure.cosmosdb.connection.mode";

/// Account or request [consistency level](https://learn.microsoft.com/azure/cosmos-db/consistency-levels).
/// 
/// # Examples
/// 
/// - Eventual
/// - ConsistentPrefix
/// - BoundedStaleness
/// - Strong
/// - Session
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_CONSISTENCY_LEVEL: []const u8 = "azure.cosmosdb.consistency.level";

/// List of regions contacted during operation in the order that they were contacted. If there is more than one region listed, it indicates that the operation was performed on multiple regions i.e. cross-regional call.

/// 
/// # Examples
/// 
/// - [\"North Central US\", \"Australia East\", \"Australia Southeast\"]
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_OPERATION_CONTACTED_REGIONS: []const u8 = "azure.cosmosdb.operation.contacted_regions";

/// The number of request units consumed by the operation.

/// 
/// # Examples
/// 
/// - 46.18
/// - 1.0
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_OPERATION_REQUEST_CHARGE: []const u8 = "azure.cosmosdb.operation.request_charge";

/// Request payload size in bytes.
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_REQUEST_BODY_SIZE: []const u8 = "azure.cosmosdb.request.body.size";

/// Cosmos DB sub status code.
/// 
/// # Examples
/// 
/// - 1000
/// - 1002
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_COSMOSDB_RESPONSE_SUB_STATUS_CODE: []const u8 = "azure.cosmosdb.response.sub_status_code";

/// [Azure Resource Provider Namespace](https://learn.microsoft.com/azure/azure-resource-manager/management/azure-services-resource-providers) as recognized by the client.

/// 
/// # Examples
/// 
/// - Microsoft.DocumentDB
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_RESOURCE_PROVIDER_NAMESPACE: []const u8 = "azure.resource_provider.namespace";

/// The unique identifier of the service request. It's generated by the Azure service and returned with the response.
/// 
/// # Examples
/// 
/// - 00000000-0000-0000-0000-000000000000
/// Note: This attribute is experimental and may change in the future.
pub const AZURE_SERVICE_REQUEST_ID: []const u8 = "azure.service.request.id";

/// The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).

/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_CONSISTENCY_LEVEL: []const u8 = "cassandra.consistency.level";

/// The data center of the coordinating node for a query.

/// 
/// # Examples
/// 
/// - us-west-2
/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_COORDINATOR_DC: []const u8 = "cassandra.coordinator.dc";

/// The ID of the coordinating node for a query.

/// 
/// # Examples
/// 
/// - be13faa2-8574-4d71-926d-27f16cf8a7af
/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_COORDINATOR_ID: []const u8 = "cassandra.coordinator.id";

/// The fetch size used for paging, i.e. how many rows will be returned at once.

/// 
/// # Examples
/// 
/// - 5000
/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_PAGE_SIZE: []const u8 = "cassandra.page.size";

/// Whether or not the query is idempotent.

/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_QUERY_IDEMPOTENT: []const u8 = "cassandra.query.idempotent";

/// The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.

/// 
/// # Examples
/// 
/// - 0
/// - 2
/// Note: This attribute is experimental and may change in the future.
pub const CASSANDRA_SPECULATIVE_EXECUTION_COUNT: []const u8 = "cassandra.speculative_execution.count";

/// The kind of action a pipeline run is performing.

/// 
/// # Examples
/// 
/// - BUILD
/// - RUN
/// - SYNC
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_ACTION_NAME: []const u8 = "cicd.pipeline.action.name";

/// The result of a pipeline run.

/// 
/// # Examples
/// 
/// - success
/// - failure
/// - timeout
/// - skipped
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_RESULT: []const u8 = "cicd.pipeline.result";

/// The human readable name of a task within a pipeline. Task here most closely aligns with a [computing process](https://wikipedia.org/wiki/Pipeline_(computing)) in a pipeline. Other terms for tasks include commands, steps, and procedures.

/// 
/// # Examples
/// 
/// - Run GoLang Linter
/// - Go Build
/// - go-test
/// - deploy_binary
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_TASK_NAME: []const u8 = "cicd.pipeline.task.name";

/// The unique identifier of a task run within a pipeline.

/// 
/// # Examples
/// 
/// - 12097
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_TASK_RUN_ID: []const u8 = "cicd.pipeline.task.run.id";

/// The result of a task run.

/// 
/// # Examples
/// 
/// - success
/// - failure
/// - timeout
/// - skipped
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_TASK_RUN_RESULT: []const u8 = "cicd.pipeline.task.run.result";

/// The [URL](https://wikipedia.org/wiki/URL) of the pipeline task run, providing the complete address in order to locate and identify the pipeline task run.

/// 
/// # Examples
/// 
/// - https://github.com/open-telemetry/semantic-conventions/actions/runs/9753949763/job/26920038674?pr=1075
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_TASK_RUN_URL_FULL: []const u8 = "cicd.pipeline.task.run.url.full";

/// Client address - domain name if available without reverse DNS lookup; otherwise, IP address or Unix domain socket name.
/// 
/// # Examples
/// 
/// - 83.164.160.102
pub const CLIENT_ADDRESS: []const u8 = "client.address";

/// The port of whichever client was captured in `client.address`.
/// 
/// # Examples
/// 
/// - 65123
pub const CLIENT_PORT: []const u8 = "client.port";

/// The AWS Region where the requested service is being accessed.

/// 
/// # Examples
/// 
/// - us-east-1
/// - us-west-2
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_REGION: []const u8 = "cloud.region";

/// The [Fully Qualified Azure Resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) the log is emitted for.
/// 
/// # Examples
/// 
/// - arn:aws:lambda:REGION:ACCOUNT_ID:function:my-function
/// - //run.googleapis.com/projects/PROJECT_ID/locations/LOCATION_ID/services/SERVICE_ID
/// - /subscriptions/<SUBSCRIPTION_GUID>/resourceGroups/<RG>/providers/Microsoft.Web/sites/<FUNCAPP>/functions/<FUNC>
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_RESOURCE_ID: []const u8 = "cloud.resource_id";

/// Cosmos DB container name.

/// 
/// # Examples
/// 
/// - public.users
/// - customers
pub const DB_COLLECTION_NAME: []const u8 = "db.collection.name";

/// The name of the database, fully qualified within the server address and port.

/// 
/// # Examples
/// 
/// - customers
/// - test.users
pub const DB_NAMESPACE: []const u8 = "db.namespace";

/// The number of queries included in a batch operation.
/// 
/// # Examples
/// 
/// - 2
/// - 3
/// - 4
pub const DB_OPERATION_BATCH_SIZE: []const u8 = "db.operation.batch.size";

/// The name of the operation or command being executed.

/// 
/// # Examples
/// 
/// - create_item
/// - query_items
/// - read_item
pub const DB_OPERATION_NAME: []const u8 = "db.operation.name";

/// A dynamic value in the url path.

/// 
/// # Examples
/// 
/// - db.operation.parameter.index=\"test-index\"
/// - db.operation.parameter=\"123\"
/// Note: This attribute is experimental and may change in the future.
pub const DB_OPERATION_PARAMETER: []const u8 = "db.operation.parameter";

/// A database query parameter, with `<key>` being the parameter name, and the attribute value being a string representation of the parameter value.

/// 
/// # Examples
/// 
/// - someval
/// - 55
/// Note: This attribute is experimental and may change in the future.
pub const DB_QUERY_PARAMETER: []const u8 = "db.query.parameter";

/// Low cardinality summary of a database query.

/// 
/// # Examples
/// 
/// - SELECT wuser_table
/// - INSERT shipping_details SELECT orders
/// - get user by id
pub const DB_QUERY_SUMMARY: []const u8 = "db.query.summary";

/// The database query being executed.

/// 
/// # Examples
/// 
/// - SELECT * FROM wuser_table where username = ?
/// - SET mykey ?
pub const DB_QUERY_TEXT: []const u8 = "db.query.text";

/// Cosmos DB row count in result set.

/// 
/// # Examples
/// 
/// - 10
/// - 20
/// Note: This attribute is experimental and may change in the future.
pub const DB_RESPONSE_RETURNED_ROWS: []const u8 = "db.response.returned_rows";

/// Cosmos DB status code.

/// 
/// # Examples
/// 
/// - 200
/// - 201
pub const DB_RESPONSE_STATUS_CODE: []const u8 = "db.response.status_code";

/// The name of a stored procedure within the database.
/// 
/// # Examples
/// 
/// - GetCustomer
pub const DB_STORED_PROCEDURE_NAME: []const u8 = "db.stored_procedure.name";

/// The database management system (DBMS) product as identified by the client instrumentation.
pub const DB_SYSTEM_NAME: []const u8 = "db.system.name";

/// List of resolved IP addresses (for DNS lookup) or a single element containing domain name (for reverse lookup).
/// 
/// # Examples
/// 
/// - [\"10.0.0.1\", \"2001:0db8:85a3:0000:0000:8a2e:0370:7334\"]
/// Note: This attribute is experimental and may change in the future.
pub const DNS_ANSWERS: []const u8 = "dns.answers";

/// The domain name or an IP address being queried.
/// 
/// # Examples
/// 
/// - www.example.com
/// - opentelemetry.io
/// Note: This attribute is experimental and may change in the future.
pub const DNS_QUESTION_NAME: []const u8 = "dns.question.name";

/// Represents the human-readable identifier of the node/instance to which a request was routed.

/// 
/// # Examples
/// 
/// - instance-0000000001
/// Note: This attribute is experimental and may change in the future.
pub const ELASTICSEARCH_NODE_NAME: []const u8 = "elasticsearch.node.name";

/// A message providing more detail about an error in human-readable form.
/// 
/// # Examples
/// 
/// - Unexpected input type: string
/// - The user has exceeded their storage quota
/// Note: This attribute is experimental and may change in the future.
pub const ERROR_MESSAGE: []const u8 = "error.message";

/// Describes a class of error the operation ended with.

/// 
/// # Examples
/// 
/// - timeout
/// - java.net.UnknownHostException
/// - server_certificate_invalid
/// - 500
pub const ERROR_TYPE: []const u8 = "error.type";

/// Indicates that the exception is escaping the scope of the span.

/// Note: This attribute is deprecated. {"note": "It's no longer recommended to record exceptions that are handled and do not escape the scope of a span.\n", "reason": "obsoleted"}
pub const EXCEPTION_ESCAPED: []const u8 = "exception.escaped";

/// The exception message.
/// 
/// # Examples
/// 
/// - Division by zero
/// - Can't convert 'int' object to str implicitly
pub const EXCEPTION_MESSAGE: []const u8 = "exception.message";

/// A stacktrace as a string in the natural representation for the language runtime. The representation is to be determined and documented by each language SIG.

/// 
/// # Examples
/// 
/// - Exception in thread \"main\" java.lang.RuntimeException: Test exception\n at com.example.GenerateTrace.methodB(GenerateTrace.java:13)\n at com.example.GenerateTrace.methodA(GenerateTrace.java:9)\n at com.example.GenerateTrace.main(GenerateTrace.java:5)\n
pub const EXCEPTION_STACKTRACE: []const u8 = "exception.stacktrace";

/// The type of the exception (its fully-qualified class name, if applicable). The dynamic type of the exception should be preferred over the static type in languages that support it.

/// 
/// # Examples
/// 
/// - java.net.ConnectException
/// - OSError
pub const EXCEPTION_TYPE: []const u8 = "exception.type";

/// A boolean that is true if the serverless function is executed for the first time (aka cold-start).

/// Note: This attribute is experimental and may change in the future.
pub const FAAS_COLDSTART: []const u8 = "faas.coldstart";

/// A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).

/// 
/// # Examples
/// 
/// - 0/5 * * * ? *
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_CRON: []const u8 = "faas.cron";

/// The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.

/// 
/// # Examples
/// 
/// - myBucketName
/// - myDbName
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_DOCUMENT_COLLECTION: []const u8 = "faas.document.collection";

/// The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.

/// 
/// # Examples
/// 
/// - myFile.txt
/// - myTableName
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_DOCUMENT_NAME: []const u8 = "faas.document.name";

/// Describes the type of the operation that was performed on the data.
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_DOCUMENT_OPERATION: []const u8 = "faas.document.operation";

/// A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

/// 
/// # Examples
/// 
/// - 2020-01-23T13:47:06Z
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_DOCUMENT_TIME: []const u8 = "faas.document.time";

/// The name of the invoked function.

/// 
/// # Examples
/// 
/// - my-function
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_INVOKED_NAME: []const u8 = "faas.invoked_name";

/// The cloud provider of the invoked function.

/// Note: This attribute is experimental and may change in the future.
pub const FAAS_INVOKED_PROVIDER: []const u8 = "faas.invoked_provider";

/// The cloud region of the invoked function.

/// 
/// # Examples
/// 
/// - eu-central-1
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_INVOKED_REGION: []const u8 = "faas.invoked_region";

/// A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).

/// 
/// # Examples
/// 
/// - 2020-01-23T13:47:06Z
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_TIME: []const u8 = "faas.time";

/// Type of the trigger which caused this function invocation.

/// Note: This attribute is experimental and may change in the future.
pub const FAAS_TRIGGER: []const u8 = "faas.trigger";

/// The unique identifier for the flag evaluation context. For example, the targeting key.

/// 
/// # Examples
/// 
/// - 5157782b-2203-4c80-a857-dbbd5e7761db
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_CONTEXT_ID: []const u8 = "feature_flag.context.id";

/// The lookup key of the feature flag.
/// 
/// # Examples
/// 
/// - logo-color
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_KEY: []const u8 = "feature_flag.key";

/// Identifies the feature flag provider.
/// 
/// # Examples
/// 
/// - Flag Manager
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_PROVIDER_NAME: []const u8 = "feature_flag.provider.name";

/// The reason code which shows how a feature flag value was determined.

/// 
/// # Examples
/// 
/// - static
/// - targeting_match
/// - error
/// - default
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_RESULT_REASON: []const u8 = "feature_flag.result.reason";

/// The evaluated value of the feature flag.
/// 
/// # Examples
/// 
/// - #ff0000
/// - true
/// - 3
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_RESULT_VALUE: []const u8 = "feature_flag.result.value";

/// A semantic identifier for an evaluated flag value.

/// 
/// # Examples
/// 
/// - red
/// - true
/// - on
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_RESULT_VARIANT: []const u8 = "feature_flag.result.variant";

/// The identifier of the [flag set](https://openfeature.dev/specification/glossary/#flag-set) to which the feature flag belongs.

/// 
/// # Examples
/// 
/// - proj-1
/// - ab98sgs
/// - service1/dev
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_SET_ID: []const u8 = "feature_flag.set.id";

/// The version of the ruleset used during the evaluation. This may be any stable value which uniquely identifies the ruleset.

/// 
/// # Examples
/// 
/// - 1
/// - 01ABCDEF
/// Note: This attribute is experimental and may change in the future.
pub const FEATURE_FLAG_VERSION: []const u8 = "feature_flag.version";

/// Free-form description of the GenAI agent provided by the application.
/// 
/// # Examples
/// 
/// - Helps with math problems
/// - Generates fiction stories
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_AGENT_DESCRIPTION: []const u8 = "gen_ai.agent.description";

/// The unique identifier of the GenAI agent.
/// 
/// # Examples
/// 
/// - asst_5j66UpCpwteGg4YSxUnt7lPY
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_AGENT_ID: []const u8 = "gen_ai.agent.id";

/// Human-readable name of the GenAI agent provided by the application.
/// 
/// # Examples
/// 
/// - Math Tutor
/// - Fiction Writer
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_AGENT_NAME: []const u8 = "gen_ai.agent.name";

/// The unique identifier for a conversation (session, thread), used to store and correlate messages within this conversation.
/// 
/// # Examples
/// 
/// - conv_5j66UpCpwteGg4YSxUnt7lPY
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_CONVERSATION_ID: []const u8 = "gen_ai.conversation.id";

/// The data source identifier.
/// 
/// # Examples
/// 
/// - H7STPQYOND
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_DATA_SOURCE_ID: []const u8 = "gen_ai.data_source.id";

/// The service tier requested. May be a specific tier, default, or auto.
/// 
/// # Examples
/// 
/// - auto
/// - default
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_OPENAI_REQUEST_SERVICE_TIER: []const u8 = "gen_ai.openai.request.service_tier";

/// The service tier used for the response.
/// 
/// # Examples
/// 
/// - scale
/// - default
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_OPENAI_RESPONSE_SERVICE_TIER: []const u8 = "gen_ai.openai.response.service_tier";

/// A fingerprint to track any eventual change in the Generative AI environment.
/// 
/// # Examples
/// 
/// - fp_44709d6fcb
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_OPENAI_RESPONSE_SYSTEM_FINGERPRINT: []const u8 = "gen_ai.openai.response.system_fingerprint";

/// The name of the operation being performed.
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_OPERATION_NAME: []const u8 = "gen_ai.operation.name";

/// Represents the content type requested by the client.
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_OUTPUT_TYPE: []const u8 = "gen_ai.output.type";

/// The target number of candidate completions to return.
/// 
/// # Examples
/// 
/// - 3
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_CHOICE_COUNT: []const u8 = "gen_ai.request.choice.count";

/// The encoding formats requested in an embeddings operation, if specified.
/// 
/// # Examples
/// 
/// - [\"base64\"]
/// - [\"float\", \"binary\"]
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_ENCODING_FORMATS: []const u8 = "gen_ai.request.encoding_formats";

/// The frequency penalty setting for the GenAI request.
/// 
/// # Examples
/// 
/// - 0.1
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_FREQUENCY_PENALTY: []const u8 = "gen_ai.request.frequency_penalty";

/// The maximum number of tokens the model generates for a request.
/// 
/// # Examples
/// 
/// - 100
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_MAX_TOKENS: []const u8 = "gen_ai.request.max_tokens";

/// The name of the GenAI model a request is being made to.
/// 
/// # Examples
/// 
/// - gpt-4
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_MODEL: []const u8 = "gen_ai.request.model";

/// The presence penalty setting for the GenAI request.
/// 
/// # Examples
/// 
/// - 0.1
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_PRESENCE_PENALTY: []const u8 = "gen_ai.request.presence_penalty";

/// Requests with same seed value more likely to return same result.
/// 
/// # Examples
/// 
/// - 100
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_SEED: []const u8 = "gen_ai.request.seed";

/// List of sequences that the model will use to stop generating further tokens.
/// 
/// # Examples
/// 
/// - [\"forest\", \"lived\"]
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_STOP_SEQUENCES: []const u8 = "gen_ai.request.stop_sequences";

/// The temperature setting for the GenAI request.
/// 
/// # Examples
/// 
/// - 0.0
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_TEMPERATURE: []const u8 = "gen_ai.request.temperature";

/// The top_k sampling setting for the GenAI request.
/// 
/// # Examples
/// 
/// - 1.0
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_TOP_K: []const u8 = "gen_ai.request.top_k";

/// The top_p sampling setting for the GenAI request.
/// 
/// # Examples
/// 
/// - 1.0
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_REQUEST_TOP_P: []const u8 = "gen_ai.request.top_p";

/// Array of reasons the model stopped generating tokens, corresponding to each generation received.
/// 
/// # Examples
/// 
/// - [\"stop\"]
/// - [\"stop\", \"length\"]
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_RESPONSE_FINISH_REASONS: []const u8 = "gen_ai.response.finish_reasons";

/// The unique identifier for the completion.
/// 
/// # Examples
/// 
/// - chatcmpl-123
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_RESPONSE_ID: []const u8 = "gen_ai.response.id";

/// The name of the model that generated the response.
/// 
/// # Examples
/// 
/// - gpt-4-0613
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_RESPONSE_MODEL: []const u8 = "gen_ai.response.model";

/// The Generative AI product as identified by the client or server instrumentation.
/// 
/// # Examples
/// 
/// - openai
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_SYSTEM: []const u8 = "gen_ai.system";

/// The tool call identifier.
/// 
/// # Examples
/// 
/// - call_mszuSIzqtI65i1wAUOE8w5H4
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_TOOL_CALL_ID: []const u8 = "gen_ai.tool.call.id";

/// The tool description.
/// 
/// # Examples
/// 
/// - Multiply two numbers
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_TOOL_DESCRIPTION: []const u8 = "gen_ai.tool.description";

/// Name of the tool utilized by the agent.
/// 
/// # Examples
/// 
/// - Flights
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_TOOL_NAME: []const u8 = "gen_ai.tool.name";

/// The number of tokens used in the GenAI input (prompt).
/// 
/// # Examples
/// 
/// - 100
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_USAGE_INPUT_TOKENS: []const u8 = "gen_ai.usage.input_tokens";

/// The number of tokens used in the GenAI response (completion).
/// 
/// # Examples
/// 
/// - 180
/// Note: This attribute is experimental and may change in the future.
pub const GEN_AI_USAGE_OUTPUT_TOKENS: []const u8 = "gen_ai.usage.output_tokens";

/// The GraphQL document being executed.
/// 
/// # Examples
/// 
/// - query findBookById { bookById(id: ?) { name } }
/// Note: This attribute is experimental and may change in the future.
pub const GRAPHQL_DOCUMENT: []const u8 = "graphql.document";

/// The name of the operation being executed.
/// 
/// # Examples
/// 
/// - findBookById
/// Note: This attribute is experimental and may change in the future.
pub const GRAPHQL_OPERATION_NAME: []const u8 = "graphql.operation.name";

/// The type of the operation being executed.
/// 
/// # Examples
/// 
/// - query
/// - mutation
/// - subscription
/// Note: This attribute is experimental and may change in the future.
pub const GRAPHQL_OPERATION_TYPE: []const u8 = "graphql.operation.type";

/// The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.

/// 
/// # Examples
/// 
/// - 3495
/// Note: This attribute is experimental and may change in the future.
pub const HTTP_REQUEST_BODY_SIZE: []const u8 = "http.request.body.size";

/// HTTP request headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.

/// 
/// # Examples
/// 
/// - [\"application/json\"]
/// - [\"1.2.3.4\", \"1.2.3.5\"]
pub const HTTP_REQUEST_HEADER: []const u8 = "http.request.header";

/// HTTP request method.
/// 
/// # Examples
/// 
/// - GET
/// - POST
/// - HEAD
pub const HTTP_REQUEST_METHOD: []const u8 = "http.request.method";

/// Original HTTP method sent by the client in the request line.
/// 
/// # Examples
/// 
/// - GeT
/// - ACL
/// - foo
pub const HTTP_REQUEST_METHOD_ORIGINAL: []const u8 = "http.request.method_original";

/// The ordinal number of request resending attempt (for any reason, including redirects).

/// 
/// # Examples
/// 
/// - 3
pub const HTTP_REQUEST_RESEND_COUNT: []const u8 = "http.request.resend_count";

/// The total size of the request in bytes. This should be the total number of bytes sent over the wire, including the request line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and request body if any.

/// 
/// # Examples
/// 
/// - 1437
/// Note: This attribute is experimental and may change in the future.
pub const HTTP_REQUEST_SIZE: []const u8 = "http.request.size";

/// The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.

/// 
/// # Examples
/// 
/// - 3495
/// Note: This attribute is experimental and may change in the future.
pub const HTTP_RESPONSE_BODY_SIZE: []const u8 = "http.response.body.size";

/// HTTP response headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.

/// 
/// # Examples
/// 
/// - [\"application/json\"]
/// - [\"abc\", \"def\"]
pub const HTTP_RESPONSE_HEADER: []const u8 = "http.response.header";

/// The total size of the response in bytes. This should be the total number of bytes sent over the wire, including the status line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and response body and trailers if any.

/// 
/// # Examples
/// 
/// - 1437
/// Note: This attribute is experimental and may change in the future.
pub const HTTP_RESPONSE_SIZE: []const u8 = "http.response.size";

/// [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).
/// 
/// # Examples
/// 
/// - 200
pub const HTTP_RESPONSE_STATUS_CODE: []const u8 = "http.response.status_code";

/// The matched route, that is, the path template in the format used by the respective server framework.

/// 
/// # Examples
/// 
/// - /users/:userID?
/// - {controller}/{action}/{id?}
pub const HTTP_ROUTE: []const u8 = "http.route";

/// This attribute represents the state of the application.

/// Note: This attribute is experimental and may change in the future.
pub const IOS_APP_STATE: []const u8 = "ios.app.state";

/// Local socket address. Useful in case of a multi-IP host.
/// 
/// # Examples
/// 
/// - 10.1.2.80
/// - /tmp/my.sock
pub const NETWORK_LOCAL_ADDRESS: []const u8 = "network.local.address";

/// Local socket port. Useful in case of a multi-port host.
/// 
/// # Examples
/// 
/// - 65123
pub const NETWORK_LOCAL_PORT: []const u8 = "network.local.port";

/// Peer address of the database node where the operation was performed.
/// 
/// # Examples
/// 
/// - 10.1.2.80
/// - /tmp/my.sock
pub const NETWORK_PEER_ADDRESS: []const u8 = "network.peer.address";

/// Peer port number of the network connection.
/// 
/// # Examples
/// 
/// - 65123
pub const NETWORK_PEER_PORT: []const u8 = "network.peer.port";

/// [OSI application layer](https://wikipedia.org/wiki/Application_layer) or non-OSI equivalent.
/// 
/// # Examples
/// 
/// - http
/// - spdy
pub const NETWORK_PROTOCOL_NAME: []const u8 = "network.protocol.name";

/// The actual version of the protocol used for network communication.
/// 
/// # Examples
/// 
/// - 1.0
/// - 1.1
/// - 2
/// - 3
pub const NETWORK_PROTOCOL_VERSION: []const u8 = "network.protocol.version";

/// [OSI transport layer](https://wikipedia.org/wiki/Transport_layer) or [inter-process communication method](https://wikipedia.org/wiki/Inter-process_communication).

/// 
/// # Examples
/// 
/// - tcp
/// - udp
/// - unix
pub const NETWORK_TRANSPORT: []const u8 = "network.transport";

/// [OSI network layer](https://wikipedia.org/wiki/Network_layer) or non-OSI equivalent.
/// 
/// # Examples
/// 
/// - ipv4
/// - ipv6
pub const NETWORK_TYPE: []const u8 = "network.type";

/// All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.

/// 
/// # Examples
/// 
/// - [\"cmd/otecol\", \"--config=config.yaml\"]
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_COMMAND_ARGS: []const u8 = "process.command_args";

/// The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.

/// 
/// # Examples
/// 
/// - otelcol
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_EXECUTABLE_NAME: []const u8 = "process.executable.name";

/// The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.

/// 
/// # Examples
/// 
/// - /usr/bin/cmd/otelcol
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_EXECUTABLE_PATH: []const u8 = "process.executable.path";

/// The exit code of the process.

/// 
/// # Examples
/// 
/// - 127
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_EXIT_CODE: []const u8 = "process.exit.code";

/// Process identifier (PID).

/// 
/// # Examples
/// 
/// - 1234
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_PID: []const u8 = "process.pid";

/// Compressed size of the message in bytes.
/// Note: This attribute is experimental and may change in the future.
pub const RPC_MESSAGE_COMPRESSED_SIZE: []const u8 = "rpc.message.compressed_size";

/// MUST be calculated as two different counters starting from `1` one for sent messages and one for received message.
/// Note: This attribute is experimental and may change in the future.
pub const RPC_MESSAGE_ID: []const u8 = "rpc.message.id";

/// Whether this is a received or sent message.
/// Note: This attribute is experimental and may change in the future.
pub const RPC_MESSAGE_TYPE: []const u8 = "rpc.message.type";

/// Uncompressed size of the message in bytes.
/// Note: This attribute is experimental and may change in the future.
pub const RPC_MESSAGE_UNCOMPRESSED_SIZE: []const u8 = "rpc.message.uncompressed_size";

/// The name of the operation corresponding to the request, as returned by the AWS SDK
/// 
/// # Examples
/// 
/// - GetItem
/// - PutItem
/// Note: This attribute is experimental and may change in the future.
pub const RPC_METHOD: []const u8 = "rpc.method";

/// The name of the service to which a request is made, as returned by the AWS SDK.
/// 
/// # Examples
/// 
/// - DynamoDB
/// - S3
/// Note: This attribute is experimental and may change in the future.
pub const RPC_SERVICE: []const u8 = "rpc.service";

/// The value `aws-api`.
/// 
/// # Examples
/// 
/// - aws-api
/// Note: This attribute is experimental and may change in the future.
pub const RPC_SYSTEM: []const u8 = "rpc.system";

/// GenAI server address.
/// 
/// # Examples
/// 
/// - example.com
/// - 10.1.2.80
/// - /tmp/my.sock
pub const SERVER_ADDRESS: []const u8 = "server.address";

/// GenAI server port.
/// 
/// # Examples
/// 
/// - 80
/// - 8080
/// - 443
pub const SERVER_PORT: []const u8 = "server.port";

/// The ID of the new session being started.
/// 
/// # Examples
/// 
/// - 00112233-4455-6677-8899-aabbccddeeff
/// Note: This attribute is experimental and may change in the future.
pub const SESSION_ID: []const u8 = "session.id";

/// The previous `session.id` for this user, when known.
/// 
/// # Examples
/// 
/// - 00112233-4455-6677-8899-aabbccddeeff
/// Note: This attribute is experimental and may change in the future.
pub const SESSION_PREVIOUS_ID: []const u8 = "session.previous_id";

/// Normalized lowercase protocol name parsed from original string of the negotiated [SSL/TLS protocol version](https://docs.openssl.org/1.1.1/man3/SSL_get_version/#return-values)

/// Note: This attribute is experimental and may change in the future.
pub const TLS_PROTOCOL_NAME: []const u8 = "tls.protocol.name";

/// Numeric part of the version parsed from the original string of the negotiated [SSL/TLS protocol version](https://docs.openssl.org/1.1.1/man3/SSL_get_version/#return-values)

/// 
/// # Examples
/// 
/// - 1.2
/// - 3
/// Note: This attribute is experimental and may change in the future.
pub const TLS_PROTOCOL_VERSION: []const u8 = "tls.protocol.version";

/// Absolute URL describing a network resource according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986)
/// 
/// # Examples
/// 
/// - https://localhost:9200/index/_search?q=user.id:kimchy
pub const URL_FULL: []const u8 = "url.full";

/// The [URI path](https://www.rfc-editor.org/rfc/rfc3986#section-3.3) component

/// 
/// # Examples
/// 
/// - /search
pub const URL_PATH: []const u8 = "url.path";

/// The [URI query](https://www.rfc-editor.org/rfc/rfc3986#section-3.4) component

/// 
/// # Examples
/// 
/// - q=OpenTelemetry
pub const URL_QUERY: []const u8 = "url.query";

/// The [URI scheme](https://www.rfc-editor.org/rfc/rfc3986#section-3.1) component identifying the used protocol.

/// 
/// # Examples
/// 
/// - https
/// - ftp
/// - telnet
pub const URL_SCHEME: []const u8 = "url.scheme";

/// The low-cardinality template of an [absolute path reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.2).

/// 
/// # Examples
/// 
/// - /users/{id}
/// - /users/:id
/// - /users?id={id}
/// Note: This attribute is experimental and may change in the future.
pub const URL_TEMPLATE: []const u8 = "url.template";

/// Full user-agent string is generated by Cosmos DB SDK
/// 
/// # Examples
/// 
/// - cosmos-netstandard-sdk/3.23.0\|3.23.1\|1\|X64\|Linux 5.4.0-1098-azure 104 18\|.NET Core 3.1.32\|S\|
pub const USER_AGENT_ORIGINAL: []const u8 = "user_agent.original";

/// Specifies the category of synthetic traffic, such as tests or bots.

/// Note: This attribute is experimental and may change in the future.
pub const USER_AGENT_SYNTHETIC_TYPE: []const u8 = "user_agent.synthetic.type";


test "semantic trace attributes" {
    @import("std").testing.refAllDecls(@This());
}