//! Generated from registry.yaml
//! Namespace: pprof
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Indicates that there are functions related to this mapping.
pub const pprof_mapping_has_functions = types.StringAttribute{
    .name = "pprof.mapping.has_functions",
    .brief = "Indicates that there are functions related to this mapping.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Indicates that there are filenames related to this mapping.
pub const pprof_mapping_has_filenames = types.StringAttribute{
    .name = "pprof.mapping.has_filenames",
    .brief = "Indicates that there are filenames related to this mapping.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Indicates that there are line numbers related to this mapping.
pub const pprof_mapping_has_line_numbers = types.StringAttribute{
    .name = "pprof.mapping.has_line_numbers",
    .brief = "Indicates that there are line numbers related to this mapping.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Indicates that there are inline frames related to this mapping.
pub const pprof_mapping_has_inline_frames = types.StringAttribute{
    .name = "pprof.mapping.has_inline_frames",
    .brief = "Indicates that there are inline frames related to this mapping.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Provides an indication that multiple symbols map to this location's address, for example due to identical code folding by the linker. In that case the line information represents one of the multiple symbols. This field must be recomputed when the symbolization state of the profile changes.
pub const pprof_location_is_folded = types.StringAttribute{
    .name = "pprof.location.is_folded",
    .brief = "Provides an indication that multiple symbols map to this location's address, for example due to identical code folding by the linker. In that case the line information represents one of the multiple symbols. This field must be recomputed when the symbolization state of the profile changes.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Attributes specific to pprof that help convert from pprof to Profiling signal.
/// Display name: Pprof specific attributes for the Profiling signal
pub const Registry = struct {
    /// Indicates that there are functions related to this mapping.
    pub const mappingHasFunctions = pprof_mapping_has_functions;
    /// Indicates that there are filenames related to this mapping.
    pub const mappingHasFilenames = pprof_mapping_has_filenames;
    /// Indicates that there are line numbers related to this mapping.
    pub const mappingHasLineNumbers = pprof_mapping_has_line_numbers;
    /// Indicates that there are inline frames related to this mapping.
    pub const mappingHasInlineFrames = pprof_mapping_has_inline_frames;
    /// Provides an indication that multiple symbols map to this location's address, for example due to identical code folding by the linker. In that case the line information represents one of the multiple symbols. This field must be recomputed when the symbolization state of the profile changes.
    pub const locationIsFolded = pprof_location_is_folded;
};

