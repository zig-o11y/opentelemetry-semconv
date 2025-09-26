//! Generated from registry.yaml
//! Namespace: signalr
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const connectionStatusValue = enum {
    /// The connection was closed normally.
    normal_closure,
    /// The connection was closed due to a timeout.
    timeout,
    /// The connection was closed because the app is shutting down.
    app_shutdown,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .normal_closure => "normal_closure",
            .timeout => "timeout",
            .app_shutdown => "app_shutdown",
        };
    }
};

pub const transportValue = enum {
    /// ServerSentEvents protocol
    server_sent_events,
    /// LongPolling protocol
    long_polling,
    /// WebSockets protocol
    web_sockets,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .server_sent_events => "server_sent_events",
            .long_polling => "long_polling",
            .web_sockets => "web_sockets",
        };
    }
};

/// SignalR HTTP connection closure status.
pub const signalr_connection_status = types.EnumAttribute(connectionStatusValue){
    .base = types.StringAttribute{
        .name = "signalr.connection.status",
        .brief = "SignalR HTTP connection closure status.",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = connectionStatusValue.normal_closure,
};

/// [SignalR transport type](https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/TransportProtocols.md)
pub const signalr_transport = types.EnumAttribute(transportValue){
    .base = types.StringAttribute{
        .name = "signalr.transport",
        .brief = "[SignalR transport type](https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/TransportProtocols.md)",
        .note = null,
        .stability = .stable,
        .requirement_level = .recommended,
    },
    .well_known_values = transportValue.server_sent_events,
};

