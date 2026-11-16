---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/basicBorders.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generator of the left and right borders of a Track Builder track segment. It contains a library of border profiles (regular, bevel, smoothedRect, racetrack, smallDiagonal, bigDiagonal, wideBevel, highBevel, rail, none) defined by section points and UVs. On load it computes normals and faces of each profile; getMeshes then extrudes the chosen profile along the segment's points and returns the mesh data (vertices, UVs, normals, faces, material).
--- Access: extension `util_trackBuilder_basicBorders`: `extensions.load("util_trackBuilder_basicBorders")`, then the global `util_trackBuilder_basicBorders`
---@class util_trackBuilder_basicBorders
util_trackBuilder_basicBorders = {}

--- Returns a list of two meshes (left border, right border) for the segment. Each mesh is a table {verts, uvs, normals, faces, material, tag}, with tag being 'side -1' or 'side 1'.
---Source: lua/ge/extensions/util/trackBuilder/basicBorders.lua:410
---@param segment table Track Builder segment (points, leftMesh, rightMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
---@return table[]  Two procedural mesh tables.
function util_trackBuilder_basicBorders.getMeshes(segment) end

