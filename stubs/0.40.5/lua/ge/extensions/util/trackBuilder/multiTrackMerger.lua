---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the junction (intersection) mesh between several Track Builder track segments that meet at the same point. It takes the end of each segment, links consecutive ends with Bézier curves (edges), generates a pseudo-segment for each (center 'halfRegular' + border) using basicCenters and basicBorders, adds a central fill if there are more than two segments, then creates a ProceduralMesh object in MissionGroup.
--- Access: extension `util_trackBuilder_multiTrackMerger`: `extensions.load("util_trackBuilder_multiTrackMerger")`, then the global `util_trackBuilder_multiTrackMerger`
---@class util_trackBuilder_multiTrackMerger
util_trackBuilder_multiTrackMerger = {}

--- Creates the ProceduralMesh object that joins the given segments. Default materials: 'track_editor_A_center', 'track_editor_A_border', border 'regular'.
---Source: lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:352
---@param segments table[] List of entries {segment, reverse, index, sub} describing the ends to join.
---@param centerMat string|nil Center material.
---@param borderMat string|nil Border material.
---@param borderMesh string|nil Name of the border profile (see basicBorders).
---@return userdata  The created ProceduralMesh object.
function util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh) end

--- Changes the materials of an already created junction: one center material per segment, one border material per segment, and the fill material if there are more than two segments.
---Source: lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:338
---@param intersection table Table containing .segments (list) and .obj (the ProceduralMesh returned by mergeMultiTrack).
---@param centerMat string|nil Center material; ignored if nil.
---@param borderMat string|nil Border material; ignored if nil.
function util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat) end

--- Registers the modules this file depends on.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua:360
---@param list table Table {basicCenters = module, basicBorders = module}.
function util_trackBuilder_multiTrackMerger.setReferences(list) end

