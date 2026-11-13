---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_trackBuilder_segmentToProceduralMesh` : `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, puis la globale `util_trackBuilder_segmentToProceduralMesh`
---@class util_trackBuilder_segmentToProceduralMesh
---@field settings any
util_trackBuilder_segmentToProceduralMesh = {}

--- This function calculates the rotated and scaled vertices, normals and uv X values for this subspline.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:55
---@param segment any
function util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment) end

---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:48
function util_trackBuilder_segmentToProceduralMesh.clearShapes() end

--- This function compiles the vertices, normals etc. so that it can be sent to the engine side and create the actual mesh.
---  Also creates caps on the front and or end of the spline if needed.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:76
---@param segment any
---@param lod any
function util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod) end

---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:95
function util_trackBuilder_segmentToProceduralMesh.getReferences() end

--- This is the main function which will create the mesh road along the control points.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:16
---@param segment any
function util_trackBuilder_segmentToProceduralMesh.materialize(segment) end

--- Rotates a vector by a given quat.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:92
---@param v any
---@param q any
function util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q) end

