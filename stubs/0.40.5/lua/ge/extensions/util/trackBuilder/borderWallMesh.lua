---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/borderWallMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generator for the side walls (left and right) of a Track Builder track segment. It defines a box-shaped wall profile (24 faces) and, depending on the segment's wall height and quality, extrudes this profile along the segment's points, with optional start and end caps.
--- Access: extension `util_trackBuilder_borderWallMesh`: `extensions.load("util_trackBuilder_borderWallMesh")`, then the global `util_trackBuilder_borderWallMesh`
---@class util_trackBuilder_borderWallMesh
util_trackBuilder_borderWallMesh = {}

--- Returns the meshes of the segment's active left and right walls.
---Source: lua/ge/extensions/util/trackBuilder/borderWallMesh.lua:239
---@param segment table Track Builder segment (points, quality, meshInfo.leftWall/rightWall, materialInfo, submeshCount, submeshIndexes).
---@return table[]  List of mesh tables {verts, uvs, normals, faces, material, tag} (may contain nil).
function util_trackBuilder_borderWallMesh.getMeshes(segment) end

