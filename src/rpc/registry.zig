//! Generated from registry.yaml
//! Namespace: rpc
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const connectRpcErrorCodeValue = enum {
    ///
    cancelled,
    ///
    unknown,
    ///
    invalid_argument,
    ///
    deadline_exceeded,
    ///
    not_found,
    ///
    already_exists,
    ///
    permission_denied,
    ///
    resource_exhausted,
    ///
    failed_precondition,
    ///
    aborted,
    ///
    out_of_range,
    ///
    unimplemented,
    ///
    internal,
    ///
    unavailable,
    ///
    data_loss,
    ///
    unauthenticated,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .cancelled => "cancelled",
            .unknown => "unknown",
            .invalid_argument => "invalid_argument",
            .deadline_exceeded => "deadline_exceeded",
            .not_found => "not_found",
            .already_exists => "already_exists",
            .permission_denied => "permission_denied",
            .resource_exhausted => "resource_exhausted",
            .failed_precondition => "failed_precondition",
            .aborted => "aborted",
            .out_of_range => "out_of_range",
            .unimplemented => "unimplemented",
            .internal => "internal",
            .unavailable => "unavailable",
            .data_loss => "data_loss",
            .unauthenticated => "unauthenticated",
        };
    }
};

pub const grpcStatusCodeValue = enum {
    /// OK
    ok,
    /// CANCELLED
    cancelled,
    /// UNKNOWN
    unknown,
    /// INVALID_ARGUMENT
    invalid_argument,
    /// DEADLINE_EXCEEDED
    deadline_exceeded,
    /// NOT_FOUND
    not_found,
    /// ALREADY_EXISTS
    already_exists,
    /// PERMISSION_DENIED
    permission_denied,
    /// RESOURCE_EXHAUSTED
    resource_exhausted,
    /// FAILED_PRECONDITION
    failed_precondition,
    /// ABORTED
    aborted,
    /// OUT_OF_RANGE
    out_of_range,
    /// UNIMPLEMENTED
    unimplemented,
    /// INTERNAL
    internal,
    /// UNAVAILABLE
    unavailable,
    /// DATA_LOSS
    data_loss,
    /// UNAUTHENTICATED
    unauthenticated,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .ok => "",
            .cancelled => "",
            .unknown => "",
            .invalid_argument => "",
            .deadline_exceeded => "",
            .not_found => "",
            .already_exists => "",
            .permission_denied => "",
            .resource_exhausted => "",
            .failed_precondition => "",
            .aborted => "",
            .out_of_range => "",
            .unimplemented => "",
            .internal => "",
            .unavailable => "",
            .data_loss => "",
            .unauthenticated => "",
        };
    }
};

pub const systemValue = enum {
    /// gRPC
    grpc,
    /// Java RMI
    java_rmi,
    /// .NET WCF
    dotnet_wcf,
    /// Apache Dubbo
    apache_dubbo,
    /// Connect RPC
    connect_rpc,
    /// [ONC RPC (Sun RPC)](https://datatracker.ietf.org/doc/html/rfc5531)
    onc_rpc,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .grpc => "grpc",
            .java_rmi => "java_rmi",
            .dotnet_wcf => "dotnet_wcf",
            .apache_dubbo => "apache_dubbo",
            .connect_rpc => "connect_rpc",
            .onc_rpc => "onc_rpc",
        };
    }
};

pub const messageTypeValue = enum {
    ///
    sent,
    ///
    received,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .sent => "SENT",
            .received => "RECEIVED",
        };
    }
};

/// The [error codes](https://connectrpc.com//docs/protocol/#error-codes) of the Connect request. Error codes are always string values.
pub const rpc_connect_rpc_error_code = types.EnumAttribute(connectRpcErrorCodeValue){
    .base = types.StringAttribute{
        .name = "rpc.connect_rpc.error_code",
        .brief = "The [error codes](https://connectrpc.com//docs/protocol/#error-codes) of the Connect request. Error codes are always string values.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = connectRpcErrorCodeValue.cancelled,
};

/// Connect request metadata, `<key>` being the normalized Connect Metadata key (lowercase), the value being the metadata values.
pub const rpc_connect_rpc_request_metadata = types.StringAttribute{
    .name = "rpc.connect_rpc.request.metadata",
    .brief = "Connect request metadata, `<key>` being the normalized Connect Metadata key (lowercase), the value being the metadata values.",
    .note = "Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured.\nIncluding all request metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nFor example, a property `my-custom-key` with value `[\"1.2.3.4\", \"1.2.3.5\"]` SHOULD be recorded as\nthe `rpc.connect_rpc.request.metadata.my-custom-key` attribute with value `[\"1.2.3.4\", \"1.2.3.5\"]`",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Connect response metadata, `<key>` being the normalized Connect Metadata key (lowercase), the value being the metadata values.
pub const rpc_connect_rpc_response_metadata = types.StringAttribute{
    .name = "rpc.connect_rpc.response.metadata",
    .brief = "Connect response metadata, `<key>` being the normalized Connect Metadata key (lowercase), the value being the metadata values.",
    .note = "Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured.\nIncluding all response metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nFor example, a property `my-custom-key` with value `\"attribute_value\"` SHOULD be recorded as\nthe `rpc.connect_rpc.response.metadata.my-custom-key` attribute with value `[\"attribute_value\"]`",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request.
pub const rpc_grpc_status_code = types.EnumAttribute(grpcStatusCodeValue){
    .base = types.StringAttribute{
        .name = "rpc.grpc.status_code",
        .brief = "The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = grpcStatusCodeValue.ok,
};

/// gRPC request metadata, `<key>` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.
pub const rpc_grpc_request_metadata = types.StringAttribute{
    .name = "rpc.grpc.request.metadata",
    .brief = "gRPC request metadata, `<key>` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.",
    .note = "Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured.\nIncluding all request metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nFor example, a property `my-custom-key` with value `[\"1.2.3.4\", \"1.2.3.5\"]` SHOULD be recorded as\n`rpc.grpc.request.metadata.my-custom-key` attribute with value `[\"1.2.3.4\", \"1.2.3.5\"]`",
    .stability = .development,
    .requirement_level = .recommended,
};

/// gRPC response metadata, `<key>` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.
pub const rpc_grpc_response_metadata = types.StringAttribute{
    .name = "rpc.grpc.response.metadata",
    .brief = "gRPC response metadata, `<key>` being the normalized gRPC Metadata key (lowercase), the value being the metadata values.",
    .note = "Instrumentations SHOULD require an explicit configuration of which metadata values are to be captured.\nIncluding all response metadata values can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nFor example, a property `my-custom-key` with value `[\"attribute_value\"]` SHOULD be recorded as\nthe `rpc.grpc.response.metadata.my-custom-key` attribute with value `[\"attribute_value\"]`",
    .stability = .development,
    .requirement_level = .recommended,
};

/// `error.code` property of response if it is an error response.
pub const rpc_jsonrpc_error_code = types.StringAttribute{
    .name = "rpc.jsonrpc.error_code",
    .brief = "`error.code` property of response if it is an error response.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// `error.message` property of response if it is an error response.
pub const rpc_jsonrpc_error_message = types.StringAttribute{
    .name = "rpc.jsonrpc.error_message",
    .brief = "`error.message` property of response if it is an error response.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// `id` property of request or response. Since protocol allows id to be int, string, `null` or missing (for notifications), value is expected to be cast to string for simplicity. Use empty string in case of `null` value. Omit entirely if this is a notification.
pub const rpc_jsonrpc_request_id = types.StringAttribute{
    .name = "rpc.jsonrpc.request_id",
    .brief = "`id` property of request or response. Since protocol allows id to be int, string, `null` or missing (for notifications), value is expected to be cast to string for simplicity. Use empty string in case of `null` value. Omit entirely if this is a notification.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Protocol version as in `jsonrpc` property of request/response. Since JSON-RPC 1.0 doesn't specify this, the value can be omitted.
pub const rpc_jsonrpc_version = types.StringAttribute{
    .name = "rpc.jsonrpc.version",
    .brief = "Protocol version as in `jsonrpc` property of request/response. Since JSON-RPC 1.0 doesn't specify this, the value can be omitted.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the (logical) method being called, must be equal to the $method part in the span name.
pub const rpc_method = types.StringAttribute{
    .name = "rpc.method",
    .brief = "The name of the (logical) method being called, must be equal to the $method part in the span name.",
    .note = "This is the logical name of the method from the RPC interface perspective, which can be different from the name of any implementing method/function. The `code.function.name` attribute may be used to store the latter (e.g., method actually executing the call on the server side, RPC client stub method on the client side).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The full (logical) name of the service being called, including its package name, if applicable.
pub const rpc_service = types.StringAttribute{
    .name = "rpc.service",
    .brief = "The full (logical) name of the service being called, including its package name, if applicable.",
    .note = "This is the logical name of the service from the RPC interface perspective, which can be different from the name of any implementing class. The `code.namespace` attribute may be used to store the latter (despite the attribute name, it may include a class name; e.g., class with method actually executing the call on the server side, RPC client stub class on the client side).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// A string identifying the remoting system. See below for a list of well-known identifiers.
pub const rpc_system = types.EnumAttribute(systemValue){
    .base = types.StringAttribute{
        .name = "rpc.system",
        .brief = "A string identifying the remoting system. See below for a list of well-known identifiers.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = systemValue.grpc,
};

/// Whether this is a received or sent message.
pub const rpc_message_type = types.EnumAttribute(messageTypeValue){
    .base = types.StringAttribute{
        .name = "rpc.message.type",
        .brief = "Whether this is a received or sent message.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = messageTypeValue.sent,
};

/// MUST be calculated as two different counters starting from `1` one for sent messages and one for received message.
pub const rpc_message_id = types.StringAttribute{
    .name = "rpc.message.id",
    .brief = "MUST be calculated as two different counters starting from `1` one for sent messages and one for received message.",
    .note = "This way we guarantee that the values will be consistent between different implementations.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Compressed size of the message in bytes.
pub const rpc_message_compressed_size = types.StringAttribute{
    .name = "rpc.message.compressed_size",
    .brief = "Compressed size of the message in bytes.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Uncompressed size of the message in bytes.
pub const rpc_message_uncompressed_size = types.StringAttribute{
    .name = "rpc.message.uncompressed_size",
    .brief = "Uncompressed size of the message in bytes.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

