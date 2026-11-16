---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/basicCenters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generator of the central surface (the roadway) of a Track Builder track segment. Three section profiles are defined: regular (curved surface and underside), halfRegular and low (simplified version used in low quality). getMeshes computes the normals and returns the mesh extruded along the segment's points.
--- Access: extension `util_trackBuilder_basicCenters`: `extensions.load("util_trackBuilder_basicCenters")`, then the global `util_trackBuilder_basicCenters`
---@class util_trackBuilder_basicCenters
util_trackBuilder_basicCenters = {}

--- Intended to clear the vertex cache (vertexLUT) of each profile and reset LUTMax/LUTMin. Does nothing in practice (see notes).
---Source: lua/ge/extensions/util/trackBuilder/basicCenters.lua:383
function util_trackBuilder_basicCenters.clearShapes() end

--- Returns {mesh} for the segment's central surface, or {} if the requested profile does not exist.
---Source: lua/ge/extensions/util/trackBuilder/basicCenters.lua:371
---@param segment table Track Builder segment (points, centerMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
---@return table[]  List of at most one mesh table {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_basicCenters.getMeshes(segment) end

