---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Turns a Track Builder track segment into a ProceduralMesh object in the scene. It computes the local frame (nx, ny, nz) of each control point, assembles the meshes from the basicBorders, basicCenters, borderWallMesh and ceilingMesh modules, then creates (or updates) the object 'procMesh<subTrackIndex>-<index>' in MissionGroup.
--- Access: extension `util_trackBuilder_segmentToProceduralMesh`: `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, then the global `util_trackBuilder_segmentToProceduralMesh`
---@class util_trackBuilder_segmentToProceduralMesh
---@field settings nil Always nil: exports a local variable that is never defined (bug).
util_trackBuilder_segmentToProceduralMesh = {}

--- For each segment point available for the current quality (controlPoint.quality[segment.quality]), computes orientation = {nx, ny, nz} by rotating the X, Y, Z axes by controlPoint.finalRot.
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:55
---@param segment table Segment whose points receive the orientation field.
function util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment) end

--- Asks basicCenters to empty its profile caches (no real effect, see notes).
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:48
function util_trackBuilder_segmentToProceduralMesh.clearShapes() end

--- Concatenates the segment's border, center, wall and ceiling meshes and returns them as a list. The start and end caps are handled by the called modules.
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:76
---@param segment table Track Builder segment.
---@param lod any Not used.
---@return table[]  List of mesh tables {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod) end

--- Returns the basicCenters and basicBorders modules (used to inject these dependencies into multiTrackMerger.setReferences).
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:95
---@return table  {basicCenters = module, basicBorders = module}.
function util_trackBuilder_segmentToProceduralMesh.getReferences() end

--- Main function: computes the points' frames, compiles the segment's meshes and creates or updates its ProceduralMesh (stored in segment.mesh).
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:16
---@param segment table Segment with points, quality, subTrackIndex, index (and mesh if it already exists).
function util_trackBuilder_segmentToProceduralMesh.materialize(segment) end

--- Returns the vector v rotated by the quaternion q (q * v).
---Source: lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:92
---@param v vec3 Vector to rotate.
---@param q quat Rotation.
---@return vec3  Rotated vector.
function util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q) end

