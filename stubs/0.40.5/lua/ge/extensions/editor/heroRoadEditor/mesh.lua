---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/mesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generation of a group's procedural driving mesh in the Hero Road Editor. Sweeps the profile.lua cross-sections along the 3D centerline (divPoints): roadway, shoulders, peripheral chamfers, carved potholes, and surface groups (groundmodels) distributed by material. Produces ProceduralMeshes with collision for editing (named 'HeroRoad_<id>_<n>', split into chunks) and, for the bake, the chunks with levels of detail and collision mesh. It also fills the derived fields that other modules read (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp, meshGrid, meshVArc, meshStationCount, triCount).
--- Access: extension `editor_heroRoadEditor_mesh`: `extensions.load("editor_heroRoadEditor_mesh")`, then the global `editor_heroRoadEditor_mesh`
---@class editor_heroRoadEditor_mesh
editor_heroRoadEditor_mesh = {}

--- Builds the entire bake payload: for each chunk of about chunkLenM, its set of visible LODs and a roadway-only collision mesh. The cuts are computed once from the full-resolution arc length and shared by all levels. LODs with a nearly equal triangle count are dropped.
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:883
---@param group table Hero Road group.
---@param chunkLenM number|nil Chunk length in meters (min 20, default 120).
---@return table|nil  List of chunks { lods = { {size, parts}, ... }, col = { part, ... } }, or nil if there is nothing to build.
---@return number|nil  nullSize: size in px of the far 'nulldetail' level, or nil if the last level is a visible LOD.
function editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM) end

--- Assembles the driving geometry into a list of material parts (meshPart); this is the internal assemble function exported under this name. Overwrites the group's derived fields (edges, grid, vArc, triCount...). With jLo/jHi, only builds the stations of that chunk.
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:371
---@param group table Hero Road group (divPoints, tangents, materials, profile parameters).
---@param opts table|nil Options: tol (decimation tolerance in m, nil = full resolution), maxSeg (max segment length in m), emitChamfer (false to omit the chamfers), potholes (true to carve the potholes).
---@param jLo integer|nil First station of the chunk.
---@param jHi integer|nil Last station of the chunk.
---@param isFirst boolean|nil Start-of-road chunk (inferred from code).
---@param isLast boolean|nil End-of-road chunk (inferred from code).
---@param cutArcs number[]|nil Arc positions (m) of the chunk cuts.
---@return table|nil  List of parts (material, vertices, faces), or nil if the geometry is insufficient.
function editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs) end

--- LIGHT rebuild of only the outer top edges (group.meshEdgeL/R) during a drag, when grid, collision and decals are torn down. Reuses profile.build and worldStation on the two extreme points of the cross-section, with the same end extension: the ribbon follows exactly the edge the full mesh will have. Also updates group.divBankR (banked right axis, for the heat map). Clears the edges if the geometry is insufficient.
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1033
---@param group table Hero Road group.
function editor_heroRoadEditor_mesh.buildRibbonEdges(group) end

--- Builds FLAT edge references (leveled horizontally) for a road in terrain mode: group.meshEdgeL/R offset by leftExtM/rightExtM (default 4.0 m) along the binormal, meshEdgeDirL/R, meshEdgeUp = (0,0,1), and sets meshGrid to nil (no roadway grid in terrain mode).
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1068
---@param group table Hero Road group (divPoints, binormals).
function editor_heroRoadEditor_mesh.buildTerrainEdges(group) end

--- Number of DAE chunks a bake will produce for a given total arc length and chunk length (mirrors the baker). The interface must pass the same arc length as the bake (group.meshVArc[end]).
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:810
---@param total number Total arc length in meters.
---@param chunkLenM number|nil Chunk length in meters (min 20, default 120).
---@return integer  Number of chunks (at least 1).
function editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM) end

--- Computes, for the Export panel, the triangle count of the whole road for each visible LOD. The result is cached per group (signature of the LOD, resolution, geometry and pothole parameters) and the group's derived fields overwritten by the assembly are restored afterwards. Also writes group.lodMaxEdgeM.
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:924
---@param group table Hero Road group.
---@return table  { lods = { {size, tris, kept}, ... }, nullSize = number|nil }; kept indicates whether the level is kept at bake.
function editor_heroRoadEditor_mesh.lodPreview(group) end

--- Deletes the group's ProceduralMeshes: the legacy one without suffix ('HeroRoad_<id>') and each chunk 'HeroRoad_<id>_<n>' up to the first gap.
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:68
---@param group table Hero Road group.
function editor_heroRoadEditor_mesh.removeMesh(group) end

--- Rebuilds the group's live LOD0 (near level) mesh: deletes the old one, assembles the geometry, splits it into chunks, creates a ProceduralMesh with collision per chunk in the group's scene folder and fills group.meshIds / group.meshId. Called by the rebuild pipeline on every modification; does nothing without a scene folder (sceneTreeFolderId).
---Source: lua/ge/extensions/editor/heroRoadEditor/mesh.lua:1098
---@param group table Hero Road group.
function editor_heroRoadEditor_mesh.updateMesh(group) end

