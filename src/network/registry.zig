//! Network semantic conventions
//!
//! This module provides semantic convention attributes for network instrumentation.
//! Based on OpenTelemetry Network semantic conventions.

const std = @import("std");
const types = @import("../types.zig");

/// Network transport protocol
pub const NetworkTransport = enum {
    tcp,
    udp,
    pipe,
    unix,

    pub fn toString(self: NetworkTransport) []const u8 {
        return switch (self) {
            .tcp => "tcp",
            .udp => "udp",
            .pipe => "pipe",
            .unix => "unix",
        };
    }

    pub fn fromString(value: []const u8) ?NetworkTransport {
        const transports = [_]struct { str: []const u8, transport: NetworkTransport }{
            .{ .str = "tcp", .transport = .tcp },
            .{ .str = "udp", .transport = .udp },
            .{ .str = "pipe", .transport = .pipe },
            .{ .str = "unix", .transport = .unix },
        };

        for (transports) |t| {
            if (std.mem.eql(u8, value, t.str)) {
                return t.transport;
            }
        }
        return null;
    }
};

/// Network connection type
pub const NetworkConnectionType = enum {
    wifi,
    wired,
    cell,
    unavailable,
    unknown,

    pub fn toString(self: NetworkConnectionType) []const u8 {
        return switch (self) {
            .wifi => "wifi",
            .wired => "wired",
            .cell => "cell",
            .unavailable => "unavailable",
            .unknown => "unknown",
        };
    }
};

/// Network connection subtype (for cellular)
pub const NetworkConnectionSubtype = enum {
    gprs,
    edge,
    umts,
    cdma,
    evdo_0,
    evdo_a,
    cdma2000_1xrtt,
    hsdpa,
    hsupa,
    hspa,
    iden,
    evdo_b,
    lte,
    ehrpd,
    hspap,
    gsm,
    td_scdma,
    iwlan,
    nr,
    nrnsa,
    lte_ca,

    pub fn toString(self: NetworkConnectionSubtype) []const u8 {
        return switch (self) {
            .gprs => "gprs",
            .edge => "edge",
            .umts => "umts",
            .cdma => "cdma",
            .evdo_0 => "evdo_0",
            .evdo_a => "evdo_a",
            .cdma2000_1xrtt => "cdma2000_1xrtt",
            .hsdpa => "hsdpa",
            .hsupa => "hsupa",
            .hspa => "hspa",
            .iden => "iden",
            .evdo_b => "evdo_b",
            .lte => "lte",
            .ehrpd => "ehrpd",
            .hspap => "hspap",
            .gsm => "gsm",
            .td_scdma => "td_scdma",
            .iwlan => "iwlan",
            .nr => "nr",
            .nrnsa => "nrnsa",
            .lte_ca => "lte_ca",
        };
    }
};

/// Network attribute registry
pub const Attributes = struct {
    /// OSI transport layer or inter-process communication method
    pub const transport = types.EnumAttribute(NetworkTransport).init(
        "network.transport",
        "OSI transport layer or inter-process communication method.",
        .stable,
        .conditionally_required,
        &[_]NetworkTransport{ .tcp, .udp, .pipe, .unix },
    ).withNote("Generally tcp for TCP, udp for UDP, pipe for named or anonymous pipe, and unix for Unix domain socket.")
        .withExamples(&[_][]const u8{ "tcp", "udp" });

    /// OSI network layer or non-OSI equivalent
    pub const network_type = types.StringAttribute.init(
        "network.type",
        "OSI network layer or non-OSI equivalent.",
        .stable,
        .recommended,
    ).withNote("The value SHOULD be normalized to lowercase.")
        .withExamples(&[_][]const u8{ "ipv4", "ipv6" });

    /// OSI application layer or non-OSI equivalent
    pub const protocol_name = types.StringAttribute.init(
        "network.protocol.name",
        "OSI application layer or non-OSI equivalent.",
        .stable,
        .conditionally_required,
    ).withCondition("If applicable and not represented by `url.scheme`")
        .withNote("The value SHOULD be normalized to lowercase.")
        .withExamples(&[_][]const u8{ "http", "spdy" });

    /// The actual version of the protocol used for network communication
    pub const protocol_version = types.StringAttribute.init(
        "network.protocol.version",
        "The actual version of the protocol used for network communication.",
        .stable,
        .recommended,
    ).withNote("If protocol version is subject to negotiation (for example using ALPN), " ++
        "this attribute SHOULD be set to the negotiated version. If the actual protocol version " ++
        "is not known, this attribute SHOULD NOT be set.")
        .withExamples(&[_][]const u8{ "1.0", "1.1", "2", "3" });

    /// Local socket peer name
    pub const local_address = types.StringAttribute.init(
        "network.local.address",
        "Local socket address. Useful in case of a multi-IP host.",
        .stable,
        .opt_in,
    ).withNote("Useful in case of a multi-IP host.")
        .withExamples(&[_][]const u8{ "10.1.2.80", "/tmp/my.sock" });

    /// Local socket peer port
    pub const local_port = types.IntAttribute.init(
        "network.local.port",
        "Local socket port. Useful in case of a multi-port host.",
        .stable,
        .opt_in,
    ).withNote("Useful in case of a multi-port host.")
        .withExamples(&[_]i64{65123});

    /// Peer address of the network connection - IP address or Unix domain socket name
    pub const peer_address = types.StringAttribute.init(
        "network.peer.address",
        "Peer address of the network connection - IP address or Unix domain socket name.",
        .stable,
        .recommended,
    ).withExamples(&[_][]const u8{ "10.1.2.80", "/tmp/my.sock" });

    /// Peer port number of the network connection
    pub const peer_port = types.IntAttribute.init(
        "network.peer.port",
        "Peer port number of the network connection.",
        .stable,
        .recommended,
    ).withCondition("If `network.peer.address` is set")
        .withExamples(&[_]i64{65123});

    /// The internet connection type
    pub const connection_type = types.EnumAttribute(NetworkConnectionType).init(
        "network.connection.type",
        "The internet connection type.",
        .stable,
        .recommended,
        &[_]NetworkConnectionType{ .wifi, .wired, .cell, .unavailable, .unknown },
    ).withExamples(&[_][]const u8{ "wifi", "wired", "cell" });

    /// This describes more details regarding the connection.type
    pub const connection_subtype = types.EnumAttribute(NetworkConnectionSubtype).init(
        "network.connection.subtype",
        "This describes more details regarding the connection.type. It may be the type of cell technology connection, " ++
            "but it could be used for describing details about a wifi connection.",
        .stable,
        .recommended,
        &[_]NetworkConnectionSubtype{ .gprs, .edge, .umts, .cdma, .lte, .nr },
    ).withExamples(&[_][]const u8{ "lte", "hspa" });

    /// The name of the mobile carrier
    pub const carrier_name = types.StringAttribute.init(
        "network.carrier.name",
        "The name of the mobile carrier.",
        .stable,
        .recommended,
    ).withExamples(&[_][]const u8{ "sprint", "verizon" });

    /// The mobile carrier country code
    pub const carrier_mcc = types.StringAttribute.init(
        "network.carrier.mcc",
        "The mobile carrier country code.",
        .stable,
        .recommended,
    ).withExamples(&[_][]const u8{"310"});

    /// The mobile carrier network code
    pub const carrier_mnc = types.StringAttribute.init(
        "network.carrier.mnc",
        "The mobile carrier network code.",
        .stable,
        .recommended,
    ).withExamples(&[_][]const u8{"001"});

    /// The ISO 3166-1 alpha-2 2-character country code associated with the mobile carrier network
    pub const carrier_icc = types.StringAttribute.init(
        "network.carrier.icc",
        "The ISO 3166-1 alpha-2 2-character country code associated with the mobile carrier network.",
        .stable,
        .recommended,
    ).withExamples(&[_][]const u8{"DE"});
};

/// Network semantic convention group
pub const Group = types.AttributeGroup{
    .id = "registry.network",
    .brief = "This document defines semantic convention attributes in the Network namespace.",
    .stability = .stable,
};

// Helper functions for working with network attributes

/// Check if an address is likely an IPv4 address
pub fn isIPv4Address(address: []const u8) bool {
    var dot_count: u32 = 0;
    for (address) |c| {
        if (c == '.') {
            dot_count += 1;
        } else if (!std.ascii.isDigit(c)) {
            return false;
        }
    }
    return dot_count == 3;
}

/// Check if an address is likely an IPv6 address
pub fn isIPv6Address(address: []const u8) bool {
    return std.mem.indexOf(u8, address, ":") != null and
        (std.mem.startsWith(u8, address, "[") or std.mem.indexOf(u8, address, "::") != null);
}

/// Check if an address is a Unix socket path
pub fn isUnixSocketAddress(address: []const u8) bool {
    return std.mem.startsWith(u8, address, "/") or std.mem.startsWith(u8, address, "./");
}

/// Determine network type from address
pub fn getNetworkTypeFromAddress(address: []const u8) []const u8 {
    if (isIPv4Address(address)) {
        return "ipv4";
    } else if (isIPv6Address(address)) {
        return "ipv6";
    } else if (isUnixSocketAddress(address)) {
        return "unix";
    } else {
        return "unknown";
    }
}

// Tests
test "NetworkTransport enum" {
    try std.testing.expectEqualStrings("tcp", NetworkTransport.tcp.toString());
    try std.testing.expectEqualStrings("udp", NetworkTransport.udp.toString());
    try std.testing.expectEqualStrings("pipe", NetworkTransport.pipe.toString());
}

test "NetworkTransport parsing" {
    try std.testing.expectEqual(NetworkTransport.tcp, NetworkTransport.fromString("tcp").?);
    try std.testing.expectEqual(NetworkTransport.udp, NetworkTransport.fromString("udp").?);
    try std.testing.expectEqual(@as(?NetworkTransport, null), NetworkTransport.fromString("invalid"));
}

test "Address type detection" {
    try std.testing.expect(isIPv4Address("192.168.1.1"));
    try std.testing.expect(isIPv4Address("10.0.0.1"));
    try std.testing.expect(!isIPv4Address("192.168.1"));
    try std.testing.expect(!isIPv4Address("192.168.1.1.1"));

    try std.testing.expect(isIPv6Address("::1"));
    try std.testing.expect(isIPv6Address("[::1]"));
    try std.testing.expect(isIPv6Address("2001:db8::1"));
    try std.testing.expect(!isIPv6Address("192.168.1.1"));

    try std.testing.expect(isUnixSocketAddress("/tmp/socket"));
    try std.testing.expect(isUnixSocketAddress("./socket"));
    try std.testing.expect(!isUnixSocketAddress("socket"));
}

test "Network type from address" {
    try std.testing.expectEqualStrings("ipv4", getNetworkTypeFromAddress("192.168.1.1"));
    try std.testing.expectEqualStrings("ipv6", getNetworkTypeFromAddress("::1"));
    try std.testing.expectEqualStrings("unix", getNetworkTypeFromAddress("/tmp/socket"));
    try std.testing.expectEqualStrings("unknown", getNetworkTypeFromAddress("hostname"));
}

test "Network attribute definitions" {
    try std.testing.expectEqualStrings("network.transport", Attributes.transport.base.name);
    try std.testing.expectEqual(types.StabilityLevel.stable, Attributes.transport.base.stability);
    try std.testing.expectEqual(types.RequirementLevel.conditionally_required, Attributes.transport.base.requirement_level);

    try std.testing.expectEqualStrings("network.peer.address", Attributes.peer_address.name);
    try std.testing.expectEqual(types.StabilityLevel.stable, Attributes.peer_address.stability);
}
