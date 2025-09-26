//! Generated from registry.yaml
//! Namespace: geo
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// Locality name. Represents the name of a city, town, village, or similar populated place.
pub const geo_locality_name = types.StringAttribute{
    .name = "geo.locality.name",
    .brief = "Locality name. Represents the name of a city, town, village, or similar populated place.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Two-letter code representing continent’s name.
pub const geo_continent_code = types.EnumAttribute(continentCodeValue){
    .base = types.StringAttribute{
        .name = "geo.continent.code",
        .brief = "Two-letter code representing continent’s name.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = continentCodeValue.af,
};

/// Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1
pub const geo_country_iso_code = types.StringAttribute{
    .name = "geo.country.iso_code",
    .brief = "Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
pub const geo_location_lon = types.StringAttribute{
    .name = "geo.location.lon",
    .brief = "Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
pub const geo_location_lat = types.StringAttribute{
    .name = "geo.location.lat",
    .brief = "Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.
pub const geo_postal_code = types.StringAttribute{
    .name = "geo.postal_code",
    .brief = "Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).
pub const geo_region_iso_code = types.StringAttribute{
    .name = "geo.region.iso_code",
    .brief = "Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Geo fields can carry data about a specific location related to an event. This geolocation information can be derived from techniques such as Geo IP, or be user-supplied.
///
/// Note: Geo attributes are typically used under another namespace, such as client.* and describe the location of the corresponding entity (device, end-user, etc). Semantic conventions that reference geo attributes (as a root namespace) or embed them (under their own namespace) SHOULD document what geo attributes describe in the scope of that convention.
///
///
pub const Registry = struct {
    /// Locality name. Represents the name of a city, town, village, or similar populated place.
    pub const localityName = geo_locality_name;
    /// Two-letter code representing continent’s name.
    pub const continentCode = geo_continent_code;
    /// Two-letter ISO Country Code ([ISO 3166-1 alpha2](https://wikipedia.org/wiki/ISO_3166-1
    pub const countryIsoCode = geo_country_iso_code;
    /// Longitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
    pub const locationLon = geo_location_lon;
    /// Latitude of the geo location in [WGS84](https://wikipedia.org/wiki/World_Geodetic_System
    pub const locationLat = geo_location_lat;
    /// Postal code associated with the location. Values appropriate for this field may also be known as a postcode or ZIP code and will vary widely from country to country.
    pub const postalCode = geo_postal_code;
    /// Region ISO code ([ISO 3166-2](https://wikipedia.org/wiki/ISO_3166-2)).
    pub const regionIsoCode = geo_region_iso_code;
};

