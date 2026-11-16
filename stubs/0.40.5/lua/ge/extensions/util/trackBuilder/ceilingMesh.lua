---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/ceilingMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generator for the ceiling of a Track Builder track segment (useful for tunnels). It defines an inverted-U section profile (width 2, height 1) then extrudes it along the segment's points, with start and end caps according to segment.meshInfo.
--- Access: extension `util_trackBuilder_ceilingMesh`: `extensions.load("util_trackBuilder_ceilingMesh")`, then the global `util_trackBuilder_ceilingMesh`
---@class util_trackBuilder_ceilingMesh
util_trackBuilder_ceilingMesh = {}

--- Returns {mesh} for the segment's ceiling, or {} if the ceiling is disabled or quality is low.
---Source: lua/ge/extensions/util/trackBuilder/ceilingMesh.lua:324
---@param segment table Track Builder segment (points, quality, meshInfo.ceilingMesh, materialInfo, submeshCount, submeshIndexes).
---@return table[]  List of at most one mesh table {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_ceilingMesh.getMeshes(segment) end

