//! Generated from registry.yaml
//! Namespace: http
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// This document defines semantic convention attributes in the HTTP namespace.
/// Display name: HTTP Attributes
pub const requestMethodValue = enum {
    /// CONNECT method.
    connect,
    /// DELETE method.
    delete,
    /// GET method.
    get,
    /// HEAD method.
    head,
    /// OPTIONS method.
    options,
    /// PATCH method.
    patch,
    /// POST method.
    post,
    /// PUT method.
    put,
    /// TRACE method.
    trace,
    /// QUERY method.
    query,
    /// Any HTTP method that the instrumentation has no prior knowledge of.
    other,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .connect => "CONNECT",
            .delete => "DELETE",
            .get => "GET",
            .head => "HEAD",
            .options => "OPTIONS",
            .patch => "PATCH",
            .post => "POST",
            .put => "PUT",
            .trace => "TRACE",
            .query => "QUERY",
            .other => "_OTHER",
        };
    }
};

pub const connectionStateValue = enum {
    /// active state.
    active,
    /// idle state.
    idle,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .active => "active",
            .idle => "idle",
        };
    }
};

pub const RegistryHttp = union(enum) {
    /// The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html header. For requests using transport encoding, this should be the compressed size.
    requestBodySize: types.StringAttribute,
    /// HTTP request headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.
    requestHeader: types.StringAttribute,
    /// HTTP request method.
    requestMethod: types.EnumAttribute(requestMethodValue),
    /// Original HTTP method sent by the client in the request line.
    requestMethodOriginal: types.StringAttribute,
    /// The ordinal number of request resending attempt (for any reason, including redirects).
    requestResendCount: types.StringAttribute,
    /// The total size of the request in bytes. This should be the total number of bytes sent over the wire, including the request line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and request body if any.
    requestSize: types.StringAttribute,
    /// The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html header. For requests using transport encoding, this should be the compressed size.
    responseBodySize: types.StringAttribute,
    /// HTTP response headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.
    responseHeader: types.StringAttribute,
    /// The total size of the response in bytes. This should be the total number of bytes sent over the wire, including the status line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and response body and trailers if any.
    responseSize: types.StringAttribute,
    /// [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).
    responseStatusCode: types.StringAttribute,
    /// The matched route template for the request. This MUST be low-cardinality and include all static path segments, with dynamic path segments represented with placeholders.
    route: types.StringAttribute,
    /// State of the HTTP connection in the HTTP connection pool.
    connectionState: types.EnumAttribute(connectionStateValue),

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .requestBodySize => types.AttributeInfo{
                .name = "http.request.body.size",
                .brief = "The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html header. For requests using transport encoding, this should be the compressed size.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "3495"
                },
            },
            .requestHeader => types.AttributeInfo{
                .name = "http.request.header",
                .brief = "HTTP request headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.",
                .note = "Instrumentations SHOULD require an explicit configuration of which headers are to be captured.\nIncluding all request headers can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nThe `User-Agent` header is already captured in the `user_agent.original` attribute.\nUsers MAY explicitly configure instrumentations to capture them even though it is not recommended.\n\nThe attribute value MUST consist of either multiple header values as an array of strings\nor a single-item array containing a possibly comma-concatenated string, depending on the way\nthe HTTP library provides access to headers.\n\nExamples:\n\n- A header `Content-Type: application/json` SHOULD be recorded as the `http.request.header.content-type`\nattribute with value `[\"application/json\"]`.\n- A header `X-Forwarded-For: 1.2.3.4, 1.2.3.5` SHOULD be recorded as the `http.request.header.x-forwarded-for`\nattribute with value `[\"1.2.3.4\", \"1.2.3.5\"]` or `[\"1.2.3.4, 1.2.3.5\"]` depending on the HTTP library.\n",
                .stability = .stable,
                .examples = null,
            },
            .requestMethod => types.AttributeInfo{
                .name = "http.request.method",
                .brief = "HTTP request method.",
                .note = "HTTP request method value SHOULD be \"known\" to the instrumentation.\nBy default, this convention defines \"known\" methods as the ones listed in [RFC9110](https://www.rfc-editor.org/rfc/rfc9110.html\nthe PATCH method defined in [RFC5789](https://www.rfc-editor.org/rfc/rfc5789.html)\nand the QUERY method defined in [httpbis-safe-method-w-body](https://datatracker.ietf.org/doc/draft-ietf-httpbis-safe-method-w-body/?include_text=1).\n\nIf the HTTP request method is not known to instrumentation, it MUST set the `http.request.method` attribute to `_OTHER`.\n\nIf the HTTP instrumentation could end up converting valid HTTP request methods to `_OTHER`, then it MUST provide a way to override\nthe list of known HTTP methods. If this override is done via environment variable, then the environment variable MUST be named\nOTEL_INSTRUMENTATION_HTTP_KNOWN_METHODS and support a comma-separated list of case-sensitive known HTTP methods\n(this list MUST be a full override of the default known method, it is not a list of known methods in addition to the defaults).\n\nHTTP method names are case-sensitive and `http.request.method` attribute value MUST match a known HTTP method name exactly.\nInstrumentations for specific web frameworks that consider HTTP methods to be case insensitive, SHOULD populate a canonical equivalent.\nTracing instrumentations that do so, MUST also set `http.request.method_original` to the original value.",
                .stability = .stable,
                .examples = &.{
                    "GET",
                    "POST",
                    "HEAD"
                },
            },
            .requestMethodOriginal => types.AttributeInfo{
                .name = "http.request.method_original",
                .brief = "Original HTTP method sent by the client in the request line.",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "GeT",
                    "ACL",
                    "foo"
                },
            },
            .requestResendCount => types.AttributeInfo{
                .name = "http.request.resend_count",
                .brief = "The ordinal number of request resending attempt (for any reason, including redirects).",
                .note = "The resend count SHOULD be updated each time an HTTP request gets resent by the client, regardless of what was the cause of the resending (e.g. redirection, authorization failure, 503 Server Unavailable, network issues, or any other).",
                .stability = .stable,
                .examples = &.{
                    "3"
                },
            },
            .requestSize => types.AttributeInfo{
                .name = "http.request.size",
                .brief = "The total size of the request in bytes. This should be the total number of bytes sent over the wire, including the request line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and request body if any.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1437"
                },
            },
            .responseBodySize => types.AttributeInfo{
                .name = "http.response.body.size",
                .brief = "The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html header. For requests using transport encoding, this should be the compressed size.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "3495"
                },
            },
            .responseHeader => types.AttributeInfo{
                .name = "http.response.header",
                .brief = "HTTP response headers, `<key>` being the normalized HTTP Header name (lowercase), the value being the header values.",
                .note = "Instrumentations SHOULD require an explicit configuration of which headers are to be captured.\nIncluding all response headers can be a security risk - explicit configuration helps avoid leaking sensitive information.\n\nUsers MAY explicitly configure instrumentations to capture them even though it is not recommended.\n\nThe attribute value MUST consist of either multiple header values as an array of strings\nor a single-item array containing a possibly comma-concatenated string, depending on the way\nthe HTTP library provides access to headers.\n\nExamples:\n\n- A header `Content-Type: application/json` header SHOULD be recorded as the `http.request.response.content-type`\nattribute with value `[\"application/json\"]`.\n- A header `My-custom-header: abc, def` header SHOULD be recorded as the `http.response.header.my-custom-header`\nattribute with value `[\"abc\", \"def\"]` or `[\"abc, def\"]` depending on the HTTP library.",
                .stability = .stable,
                .examples = null,
            },
            .responseSize => types.AttributeInfo{
                .name = "http.response.size",
                .brief = "The total size of the response in bytes. This should be the total number of bytes sent over the wire, including the status line (HTTP/1.1), framing (HTTP/2 and HTTP/3), headers, and response body and trailers if any.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1437"
                },
            },
            .responseStatusCode => types.AttributeInfo{
                .name = "http.response.status_code",
                .brief = "[HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).",
                .note = null,
                .stability = .stable,
                .examples = &.{
                    "200"
                },
            },
            .route => types.AttributeInfo{
                .name = "http.route",
                .brief = "The matched route template for the request. This MUST be low-cardinality and include all static path segments, with dynamic path segments represented with placeholders.",
                .note = "MUST NOT be populated when this is not supported by the HTTP server framework as the route attribute should have low-cardinality and the URI path can NOT substitute it.\nSHOULD include the [application root](/docs/http/http-spans.md\n\nA static path segment is a part of the route template with a fixed, low-cardinality value. This includes literal strings like `/users/` and placeholders that\nare constrained to a finite, predefined set of values, e.g. `{controller}` or `{action}`.\n\nA dynamic path segment is a placeholder for a value that can have high cardinality and is not constrained to a predefined list like static path segments.\n\nInstrumentations SHOULD use routing information provided by the corresponding web framework. They SHOULD pick the most precise source of routing information and MAY\nsupport custom route formatting. Instrumentations SHOULD document the format and the API used to obtain the route string.",
                .stability = .stable,
                .examples = &.{
                    "/users/:userID?",
                    "my-controller/my-action/{id?}"
                },
            },
            .connectionState => types.AttributeInfo{
                .name = "http.connection.state",
                .brief = "State of the HTTP connection in the HTTP connection pool.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "active",
                    "idle"
                },
            },
        };
    }
};

