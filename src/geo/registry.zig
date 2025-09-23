//! Generated from registry.yaml
//! Namespace: geo
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Geo fields can carry data about a specific location related to an event. This geolocation information can be derived from techniques such as Geo IP, or be user-supplied.
///
/// Note: Geo attributes are typically used under another namespace, such as client.* and describe the location of the corresponding entity (device, end-user, etc). Semantic conventions that reference geo attributes (as a root namespace) or embed them (under their own namespace) SHOULD document what geo attributes describe in the scope of that convention.
///
///
pub const continentCodeValue = enum {
    /// Africa
    af,
    /// Antarctica
    an,
    /// Asia
    as,
    /// Europe
    eu,
    /// North America
    na,
    /// Oceania
    oc,
    /// South America
    sa,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .af => "AF",
            .an => "AN",
            .as => "AS",
            .eu => "EU",
            .na => "NA",
            .oc => "OC",
            .sa => "SA",
        };
    }
};

pub const RegistryGeo = union(enum) {
    /// Locality name. Represents the name of a city, town, village, or similar populated place.
    localityName: types.StringAttribute,
    /// Two-letter code representing continent’s name.
    continentCode: types.EnumAttribute(continentCodeValue),
    /// Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1
    countryIsoCode: types.StringAttribute,
    /// Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
    locationLon: types.StringAttribute,
    /// Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
    locationLat: types.StringAttribute,
    /// Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.
    postalCode: types.StringAttribute,
    /// Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).
    regionIsoCode: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .localityName => types.AttributeInfo{
                .name = "geo.locality.name",
                .brief = "Locality name. Represents the name of a city, town, village, or similar populated place.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Montreal",
                    "Berlin"
                },
            },
            .continentCode => types.AttributeInfo{
                .name = "geo.continent.code",
                .brief = "Two-letter code representing continent’s name.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .countryIsoCode => types.AttributeInfo{
                .name = "geo.country.iso_code",
                .brief = "Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "CA"
                },
            },
            .locationLon => types.AttributeInfo{
                .name = "geo.location.lon",
                .brief = "Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .locationLat => types.AttributeInfo{
                .name = "geo.location.lat",
                .brief = "Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .postalCode => types.AttributeInfo{
                .name = "geo.postal_code",
                .brief = "Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "94040"
                },
            },
            .regionIsoCode => types.AttributeInfo{
                .name = "geo.region.iso_code",
                .brief = "Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "CA-QC"
                },
            },
        };
    }
};

