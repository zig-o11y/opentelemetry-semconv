//! Tls semantic conventions for OpenTelemetry
//! Generated from registry.yaml

const std = @import("std");
const types = @import("../types.zig");

// This document defines semantic convention attributes in the TLS namespace.

/// PEM-encoded stand-alone certificate offered by the client. This is usually mutually-exclusive of `client.certificate_chain` since this value also exists in that list.
/// The values allowed for `tls.cipher` MUST be one of the `Descriptions` of the [registered TLS Cipher Suits](https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#table-tls-parameters-4).
pub const TLS_CIPHER = types.Attribute([]const u8)
    .init(.{
        .name = "tls.cipher",
        .type = []const u8,
        .brief = "PEM-encoded stand-alone certificate offered by the client. This is usually mutually-exclusive of `client.certificate_chain` since this value also exists in that list.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .note = "The values allowed for `tls.cipher` MUST be one of the `Descriptions` of the [registered TLS Cipher Suits](https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#table-tls-parameters-4).",
    });

/// Array of PEM-encoded certificates that make up the certificate chain offered by the client. This is usually mutually-exclusive of `client.certificate` since that value should be the first certificate in the chain.
pub const TLS_CLIENT_CERTIFICATE_CHAIN = types.Attribute(types.ArrayAttribute)
    .init(.{
        .name = "tls.client.certificate_chain",
        .type = types.ArrayAttribute,
        .brief = "Array of PEM-encoded certificates that make up the certificate chain offered by the client. This is usually mutually-exclusive of `client.certificate` since that value should be the first certificate in the chain.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });

/// Certificate fingerprint using the MD5 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.
pub const TLS_CLIENT_HASH_MD5 = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.hash.md5",
        .type = []const u8,
        .brief = "Certificate fingerprint using the MD5 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });

/// Certificate fingerprint using the SHA1 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.
pub const TLS_CLIENT_HASH_SHA1 = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.hash.sha1",
        .type = []const u8,
        .brief = "Certificate fingerprint using the SHA1 digest of DER-encoded version of certificate offered by the client. For consistency with other hash values, this value should be formatted as an uppercase hash.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });

/// Distinguished name of [subject](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6) of the issuer of the x.509 certificate presented by the client.
/// Examples: "CN=Example Root CA, OU=Infrastructure Team, DC=example, DC=com"
pub const TLS_CLIENT_HASH_SHA256 = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.hash.sha256",
        .type = []const u8,
        .brief = "Distinguished name of [subject](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6) of the issuer of the x.509 certificate presented by the client.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"CN=Example Root CA, OU=Infrastructure Team, DC=example, DC=com"},
    });

/// A hash that identifies clients based on how they perform an SSL/TLS handshake.
/// Examples: "d4e5b18d6b55c71272893221c96ba240"
pub const TLS_CLIENT_JA3 = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.ja3",
        .type = []const u8,
        .brief = "A hash that identifies clients based on how they perform an SSL/TLS handshake.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"d4e5b18d6b55c71272893221c96ba240"},
    });

/// Date/Time indicating when client certificate is no longer considered valid.
/// Examples: "2021-01-01T00:00:00.000Z"
pub const TLS_CLIENT_NOT_AFTER = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.not_after",
        .type = []const u8,
        .brief = "Date/Time indicating when client certificate is no longer considered valid.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"2021-01-01T00:00:00.000Z"},
    });

/// Date/Time indicating when client certificate is first considered valid.
/// Examples: "1970-01-01T00:00:00.000Z"
pub const TLS_CLIENT_NOT_BEFORE = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.not_before",
        .type = []const u8,
        .brief = "Date/Time indicating when client certificate is first considered valid.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"1970-01-01T00:00:00.000Z"},
    });

/// Distinguished name of subject of the x.509 certificate presented by the client.
/// Examples: "CN=myclient, OU=Documentation Team, DC=example, DC=com"
pub const TLS_CLIENT_SUBJECT = types.Attribute([]const u8)
    .init(.{
        .name = "tls.client.subject",
        .type = []const u8,
        .brief = "Distinguished name of subject of the x.509 certificate presented by the client.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
        .examples = &[_][]const u8{"CN=myclient, OU=Documentation Team, DC=example, DC=com"},
    });

/// Array of ciphers offered by the client during the client hello.
pub const TLS_CLIENT_SUPPORTED_CIPHERS = types.Attribute(types.ArrayAttribute)
    .init(.{
        .name = "tls.client.supported_ciphers",
        .type = types.ArrayAttribute,
        .brief = "Array of ciphers offered by the client during the client hello.",
        .stability = types.StabilityLevel.experimental,
        .requirement_level = types.RequirementLevel.recommended,
    });


/// Tls semantic convention registry
pub const TLSRegistry = struct {
    // This document defines semantic convention attributes in the TLS namespace.
    pub const tls_cipher = TLS_CIPHER;
    pub const tls_client_certificate_chain = TLS_CLIENT_CERTIFICATE_CHAIN;
    pub const tls_client_hash_md5 = TLS_CLIENT_HASH_MD5;
    pub const tls_client_hash_sha1 = TLS_CLIENT_HASH_SHA1;
    pub const tls_client_hash_sha256 = TLS_CLIENT_HASH_SHA256;
    pub const tls_client_ja3 = TLS_CLIENT_JA3;
    pub const tls_client_not_after = TLS_CLIENT_NOT_AFTER;
    pub const tls_client_not_before = TLS_CLIENT_NOT_BEFORE;
    pub const tls_client_subject = TLS_CLIENT_SUBJECT;
    pub const tls_client_supported_ciphers = TLS_CLIENT_SUPPORTED_CIPHERS;

};
