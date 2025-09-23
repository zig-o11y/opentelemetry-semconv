//! Generated from registry.yaml
//! Namespace: pprof
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Attributes specific to pprof that help convert from pprof to Profiling signal.
/// Display name: Pprof specific attributes for the Profiling signal
pub const RegistryPprof = union(enum) {
    /// Indicates that there are functions related to this mapping.
    mappingHasFunctions: types.StringAttribute,
    /// Indicates that there are filenames related to this mapping.
    mappingHasFilenames: types.StringAttribute,
    /// Indicates that there are line numbers related to this mapping.
    mappingHasLineNumbers: types.StringAttribute,
    /// Indicates that there are inline frames related to this mapping.
    mappingHasInlineFrames: types.StringAttribute,
    /// Provides an indication that multiple symbols map to this location's address, for example due to identical code folding by the linker. In that case the line information represents one of the multiple symbols. This field must be recomputed when the symbolization state of the profile changes.
    locationIsFolded: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .mappingHasFunctions => types.AttributeInfo{
                .name = "pprof.mapping.has_functions",
                .brief = "Indicates that there are functions related to this mapping.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .mappingHasFilenames => types.AttributeInfo{
                .name = "pprof.mapping.has_filenames",
                .brief = "Indicates that there are filenames related to this mapping.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .mappingHasLineNumbers => types.AttributeInfo{
                .name = "pprof.mapping.has_line_numbers",
                .brief = "Indicates that there are line numbers related to this mapping.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .mappingHasInlineFrames => types.AttributeInfo{
                .name = "pprof.mapping.has_inline_frames",
                .brief = "Indicates that there are inline frames related to this mapping.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .locationIsFolded => types.AttributeInfo{
                .name = "pprof.location.is_folded",
                .brief = "Provides an indication that multiple symbols map to this location's address, for example due to identical code folding by the linker. In that case the line information represents one of the multiple symbols. This field must be recomputed when the symbolization state of the profile changes.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
        };
    }
};

