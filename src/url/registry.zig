//! URL semantic conventions
//!
//! This module provides semantic convention attributes for URL instrumentation.
//! Based on OpenTelemetry URL semantic conventions.

const std = @import("std");
const types = @import("../types.zig");

/// URL attribute registry
pub const Attributes = struct {
    /// Domain extracted from the url.full
    pub const domain = types.StringAttribute.init(
        "url.domain",
        "Domain extracted from the `url.full`, such as \"opentelemetry.io\".",
        .development,
        .recommended,
    ).withNote("In some cases a URL may refer to an IP and/or port directly, without a domain name. " ++
        "In this case, the IP address would go to the domain field. If the URL contains a literal IPv6 address " ++
        "enclosed by `[` and `]`, the `[` and `]` characters should also be captured in the domain field.")
        .withExamples(&[_][]const u8{ "www.foo.bar", "opentelemetry.io", "3.12.167.2", "[1080:0:0:0:8:800:200C:417A]" });

    /// File extension extracted from the url.full
    pub const extension = types.StringAttribute.init(
        "url.extension",
        "The file extension extracted from the `url.full`, excluding the leading dot.",
        .development,
        .recommended,
    ).withNote("The file extension is only set if it exists, as not every url has a file extension. " ++
        "When the file name has multiple extensions `example.tar.gz`, only the last one should be captured `gz`, not `tar.gz`.")
        .withExamples(&[_][]const u8{ "png", "gz" });

    /// Unmodified original URL
    pub const full = types.StringAttribute.init(
        "url.full",
        "Absolute URL describing a network resource according to RFC3986.",
        .stable,
        .required,
    ).withNote("For network calls, URL usually has `scheme://host[:port][path][?query][#fragment]` format, " ++
        "where the fragment is not transmitted over HTTP, but if it is known, it SHOULD be included nevertheless. " ++
        "`url.full` MUST NOT contain credentials passed via URL in form of `https://username:password@www.example.com/`. " ++
        "In such case username and password should be redacted and attribute's value should be `https://REDACTED:REDACTED@www.example.com/`. " ++
        "`url.full` SHOULD capture the absolute URL when it is available (or can be reconstructed). " ++
        "Sensitive content provided in `url.full` should be scrubbed when instrumentations can identify it.")
        .withExamples(&[_][]const u8{ "https://www.foo.bar/search?q=OpenTelemetry#SemConv", "//localhost" });

    /// URI fragment component
    pub const fragment = types.StringAttribute.init(
        "url.fragment",
        "The URI fragment component.",
        .stable,
        .opt_in,
    ).withExamples(&[_][]const u8{"SemConv"});

    /// URI path component
    pub const path = types.StringAttribute.init(
        "url.path",
        "The URI path component.",
        .stable,
        .required,
    ).withNote("Sensitive content provided in `url.path` should be scrubbed when instrumentations can identify it.")
        .withExamples(&[_][]const u8{ "/search", "/users/123" });

    /// Port extracted from the url.full
    pub const port = types.IntAttribute.init(
        "url.port",
        "Port extracted from the `url.full`.",
        .stable,
        .recommended,
    ).withExamples(&[_]i64{ 443, 8080 });

    /// URI query component
    pub const query = types.StringAttribute.init(
        "url.query",
        "The URI query component.",
        .stable,
        .conditionally_required,
    ).withCondition("If and only if one was received/sent")
        .withNote("Sensitive content provided in `url.query` should be scrubbed when instrumentations can identify it.")
        .withExamples(&[_][]const u8{"q=OpenTelemetry"});

    /// Highest registered URL domain
    pub const registered_domain = types.StringAttribute.init(
        "url.registered_domain",
        "The highest registered url domain, stripped of the subdomain.",
        .development,
        .recommended,
    ).withNote("This value can be determined precisely with the public suffix list. " ++
        "For example, the registered domain for `foo.example.com` is `example.com`. " ++
        "Trying to approximate this by simply taking the last two labels will not work well for TLDs such as `co.uk`.")
        .withExamples(&[_][]const u8{ "example.com", "foo.co.uk" });

    /// URI scheme component
    pub const scheme = types.StringAttribute.init(
        "url.scheme",
        "The URI scheme component identifying the used protocol.",
        .stable,
        .required,
    ).withExamples(&[_][]const u8{ "http", "https" });

    /// Subdomain extracted from the url.full
    pub const subdomain = types.StringAttribute.init(
        "url.subdomain",
        "The subdomain portion of a fully qualified domain name includes all of the names except the host name under the registered_domain.",
        .development,
        .recommended,
    ).withNote("If the subdomain is \"east.mydomain.example.com\", then the subdomain is \"east.mydomain\".")
        .withExamples(&[_][]const u8{ "east.mydomain", "www" });

    /// Low-cardinality template of an absolute path reference
    pub const template = types.StringAttribute.init(
        "url.template",
        "The low-cardinality template of an absolute path reference.",
        .development,
        .conditionally_required,
    ).withCondition("If available")
        .withNote("The `url.template` MUST have low cardinality. It is not usually available on HTTP clients, " ++
            "but may be known by the application or specialized HTTP instrumentation.")
        .withExamples(&[_][]const u8{ "/users/{id}", "/users/:id", "/users?id={id}" });

    /// Top level domain extracted from the url.full
    pub const top_level_domain = types.StringAttribute.init(
        "url.top_level_domain",
        "The effective top level domain (eTLD), also known as the domain suffix, is the last part of the domain name.",
        .development,
        .recommended,
    ).withNote("For example, the top level domain for example.com is `com`. " ++
        "This value can be determined precisely with the public suffix list.")
        .withExamples(&[_][]const u8{ "com", "co.uk" });
};

/// URL semantic convention group
pub const Group = types.AttributeGroup{
    .id = "registry.url",
    .brief = "Attributes describing URL.",
    .stability = .stable,
};

// Helper functions for working with URLs

/// Parse a URL and extract components
pub const ParsedUrl = struct {
    scheme: ?[]const u8 = null,
    domain: ?[]const u8 = null,
    port: ?u16 = null,
    path: ?[]const u8 = null,
    query: ?[]const u8 = null,
    fragment: ?[]const u8 = null,
};

/// Simple URL parser (basic implementation)
pub fn parseUrl(allocator: std.mem.Allocator, url: []const u8) !ParsedUrl {
    _ = allocator; // For future use if needed
    var parsed = ParsedUrl{};

    // Find scheme
    if (std.mem.indexOf(u8, url, "://")) |scheme_end| {
        parsed.scheme = url[0..scheme_end];
        var rest = url[scheme_end + 3 ..];

        // Find path start
        const path_start = std.mem.indexOfAny(u8, rest, "/?#") orelse rest.len;
        const authority = rest[0..path_start];

        // Parse authority (domain:port)
        if (std.mem.lastIndexOf(u8, authority, ":")) |port_start| {
            parsed.domain = authority[0..port_start];
            const port_str = authority[port_start + 1 ..];
            parsed.port = std.fmt.parseInt(u16, port_str, 10) catch null;
        } else {
            parsed.domain = authority;
        }

        if (path_start < rest.len) {
            rest = rest[path_start..];

            // Find query start
            if (std.mem.indexOf(u8, rest, "?")) |query_start| {
                parsed.path = rest[0..query_start];
                rest = rest[query_start + 1 ..];

                // Find fragment start
                if (std.mem.indexOf(u8, rest, "#")) |frag_start| {
                    parsed.query = rest[0..frag_start];
                    parsed.fragment = rest[frag_start + 1 ..];
                } else {
                    parsed.query = rest;
                }
            } else if (std.mem.indexOf(u8, rest, "#")) |frag_start| {
                parsed.path = rest[0..frag_start];
                parsed.fragment = rest[frag_start + 1 ..];
            } else {
                parsed.path = rest;
            }
        }
    }

    return parsed;
}

/// Extract file extension from a path
pub fn getFileExtension(path: []const u8) ?[]const u8 {
    if (std.mem.lastIndexOf(u8, path, ".")) |dot_pos| {
        // Find the last slash to identify the filename part
        const last_slash = std.mem.lastIndexOf(u8, path, "/") orelse 0;
        const filename_start = if (last_slash > 0) last_slash + 1 else 0;

        // If the dot is the first character of the filename, it's a hidden file, not an extension
        if (dot_pos == filename_start) {
            return null;
        }

        const ext = path[dot_pos + 1 ..];
        if (ext.len > 0 and std.mem.indexOf(u8, ext, "/") == null) {
            return ext;
        }
    }
    return null;
}

/// Check if URL scheme is secure (https, wss, etc.)
pub fn isSecureScheme(scheme: []const u8) bool {
    const secure_schemes = [_][]const u8{ "https", "wss", "ftps", "sftp" };
    for (secure_schemes) |secure| {
        if (std.mem.eql(u8, scheme, secure)) {
            return true;
        }
    }
    return false;
}

/// Get default port for common schemes
pub fn getDefaultPort(scheme: []const u8) ?u16 {
    const scheme_ports = [_]struct { scheme: []const u8, port: u16 }{
        .{ .scheme = "http", .port = 80 },
        .{ .scheme = "https", .port = 443 },
        .{ .scheme = "ftp", .port = 21 },
        .{ .scheme = "ssh", .port = 22 },
        .{ .scheme = "telnet", .port = 23 },
        .{ .scheme = "smtp", .port = 25 },
        .{ .scheme = "dns", .port = 53 },
        .{ .scheme = "pop3", .port = 110 },
        .{ .scheme = "imap", .port = 143 },
        .{ .scheme = "ldap", .port = 389 },
        .{ .scheme = "ldaps", .port = 636 },
    };

    for (scheme_ports) |sp| {
        if (std.mem.eql(u8, scheme, sp.scheme)) {
            return sp.port;
        }
    }
    return null;
}

// Tests
test "URL parsing" {
    const allocator = std.testing.allocator;

    const parsed = try parseUrl(allocator, "https://example.com:8080/path/to/resource?param=value#section");

    try std.testing.expectEqualStrings("https", parsed.scheme.?);
    try std.testing.expectEqualStrings("example.com", parsed.domain.?);
    try std.testing.expectEqual(@as(?u16, 8080), parsed.port);
    try std.testing.expectEqualStrings("/path/to/resource", parsed.path.?);
    try std.testing.expectEqualStrings("param=value", parsed.query.?);
    try std.testing.expectEqualStrings("section", parsed.fragment.?);
}

test "URL parsing without port" {
    const allocator = std.testing.allocator;

    const parsed = try parseUrl(allocator, "http://example.com/path");

    try std.testing.expectEqualStrings("http", parsed.scheme.?);
    try std.testing.expectEqualStrings("example.com", parsed.domain.?);
    try std.testing.expectEqual(@as(?u16, null), parsed.port);
    try std.testing.expectEqualStrings("/path", parsed.path.?);
}

test "File extension extraction" {
    try std.testing.expectEqualStrings("txt", getFileExtension("/path/to/file.txt").?);
    try std.testing.expectEqualStrings("gz", getFileExtension("/path/to/file.tar.gz").?);
    try std.testing.expectEqual(@as(?[]const u8, null), getFileExtension("/path/to/file"));
    try std.testing.expectEqual(@as(?[]const u8, null), getFileExtension("/path/to/.hidden"));
}

test "Secure scheme detection" {
    try std.testing.expect(isSecureScheme("https"));
    try std.testing.expect(isSecureScheme("wss"));
    try std.testing.expect(!isSecureScheme("http"));
    try std.testing.expect(!isSecureScheme("ws"));
}

test "Default port detection" {
    try std.testing.expectEqual(@as(?u16, 80), getDefaultPort("http"));
    try std.testing.expectEqual(@as(?u16, 443), getDefaultPort("https"));
    try std.testing.expectEqual(@as(?u16, 22), getDefaultPort("ssh"));
    try std.testing.expectEqual(@as(?u16, null), getDefaultPort("unknown"));
}

test "URL attribute definitions" {
    try std.testing.expectEqualStrings("url.full", Attributes.full.name);
    try std.testing.expectEqual(types.StabilityLevel.stable, Attributes.full.stability);
    try std.testing.expectEqual(types.RequirementLevel.required, Attributes.full.requirement_level);

    try std.testing.expectEqualStrings("url.scheme", Attributes.scheme.name);
    try std.testing.expectEqual(types.StabilityLevel.stable, Attributes.scheme.stability);
}
