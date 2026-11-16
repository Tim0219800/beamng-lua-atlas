---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/skeleton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suite of utilities to skeletonize and vectorize binary masks. The main function getPathsFromPng converts a PNG into a mask, skeletonizes it (Guo-Hall algorithm), detects endpoints and junctions, extracts the paths, estimates widths, then simplifies by RDP (tolerance 6.0). Used by spline tools to turn an image of roads into polylines.
--- Access: extension `editor_toolUtilities_skeleton`: `extensions.load("editor_toolUtilities_skeleton")`, then the global `editor_toolUtilities_skeleton`
---@class editor_toolUtilities_skeleton
editor_toolUtilities_skeleton = {}

--- Estimates the width along each path from the mask derived from the original PNG (uses local tangents).
---Source: lua/ge/extensions/editor/toolUtilities/skeleton.lua:451
---@param paths table Extracted paths.
---@param mask table Original mask, not skeletonized.
---@return table  Widths, one list per path (inferred from code).
function editor_toolUtilities_skeleton.estimateWidths(paths, mask) end

--- Extracts all paths from an already skeletonized mask.
---Source: lua/ge/extensions/editor/toolUtilities/skeleton.lua:331
---@param mask table Skeletonized mask.
---@return table  List of paths (inferred from the code).
function editor_toolUtilities_skeleton.extractPaths(mask) end

--- Converts a PNG into a skeletonized mask and vectorizes it into polylines. Returns nil (with a logged error) if the file fails to load or the conversion fails.
---Source: lua/ge/extensions/editor/toolUtilities/skeleton.lua:652
---@param filepath string Path of a PNG in a supported format.
---@return table<integer, {points: vec3[], widths: number[]}>|nil  One element per path: points (2D as vec3) and matching widths.
function editor_toolUtilities_skeleton.getPathsFromPng(filepath) end

--- Skeletonizes a mask with the Guo-Hall algorithm, alternating two passes until stable. The mask is modified in place then returned.
---Source: lua/ge/extensions/editor/toolUtilities/skeleton.lua:155
---@param mask table 2D mask (rows of 0 or 1).
---@return table  The same mask, skeletonized.
function editor_toolUtilities_skeleton.skeletonise(mask) end

