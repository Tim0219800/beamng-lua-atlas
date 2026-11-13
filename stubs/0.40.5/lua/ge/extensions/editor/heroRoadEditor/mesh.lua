---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/mesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_mesh` : `extensions.load("editor_heroRoadEditor_mesh")`, puis la globale `editor_heroRoadEditor_mesh`
---@class editor_heroRoadEditor_mesh
editor_heroRoadEditor_mesh = {}

--- Build the full baked payload for a group: for each ~chunkLenM chunk, its visible LOD set + one deck-only collision mesh.
---  cutArcs is computed ONCE from the full-res total arc length and shared by every LOD and the collision build, so all levels
---  have the same chunk count and each level's neighbours meet crack-free. Consecutive LODs with near-equal triangle counts are
---  dropped (a straight/flat that can't decimate further shouldn't ship a redundant level). Returns a list of chunks, each
---  { lods = { {size, parts}, ... }, col = { part, ... } }, or nil when there's nothing to build.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:883
---@param group any
---@param chunkLenM any
function editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM) end

--- Assembles the drivable geometry into a list of material parts.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:371
---@param group any
---@param opts any
---@param jLo any
---@param jHi any
---@param isFirst any
---@param isLast any
---@param cutArcs any
function editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs) end

--- LIGHT rebuild of just the outer top edges (meshEdgeL/R) used WHILE dragging, when the full grid/collision/decals are torn
---  down for perf. It reuses the SAME machinery the drivable mesh does -- profile.build (widening + fold caps + banking) and
---  worldStation -- on ONLY the two outermost cross-section points, plus the identical co-planar end-cap extension. So the ribbon
---  traces exactly the edge the released mesh will (single source of truth, no flat-vs-banked width mismatch). The full build
---  overwrites these with the decimated/cut version on release -- same curve, just fewer points.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1033
---@param group any
function editor_heroRoadEditor_mesh.buildRibbonEdges(group) end

--- FLAT, world-up carriageway edge frames for a TERRAIN-mode road.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1068
---@param group any
function editor_heroRoadEditor_mesh.buildTerrainEdges(group) end

--- How many DAE chunks a bake WILL produce for the given total arc length + chunk length (mirrors the chunk baker). The UI uses this
---  with the SAME arc length the bake uses (group.meshVArc[end], not the node polyline) so its preview is never off by one.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:810
---@param total any
---@param chunkLenM any
function editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM) end

--- Compute, for the Export panel, the whole-road triangle count of each visible LOD.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:924
---@param group any
function editor_heroRoadEditor_mesh.lodPreview(group) end

--- Deletes the group's live ProceduralMesh(es): the legacy unsuffixed one AND every chunk 'HeroRoad_<id>_<n>' up to the first gap.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:68
---@param group any
function editor_heroRoadEditor_mesh.removeMesh(group) end

--- LOD0 (near-level) rebuild -- runs from the dirty pipeline on any edit.
---Source : lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1098
---@param group any
function editor_heroRoadEditor_mesh.updateMesh(group) end

