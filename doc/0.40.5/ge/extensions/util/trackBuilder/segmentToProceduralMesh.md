# `util_trackBuilder_segmentToProceduralMesh`

*File: `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_segmentToProceduralMesh`: `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, then the global `util_trackBuilder_segmentToProceduralMesh`

Turns a Track Builder track segment into a ProceduralMesh object in the scene. It computes the local frame (nx, ny, nz) of each control point, assembles the meshes from the basicBorders, basicCenters, borderWallMesh and ceilingMesh modules, then creates (or updates) the object 'procMesh<subTrackIndex>-<index>' in MissionGroup.

## Notes

- materialize reuses segment.mesh if it exists (createMesh again) and creates it otherwise; the object has canSave = false.
- The same mesh array is given three times (segment.meshes[1], [2], [3]): there is no distinct LOD.
- materialize resets submeshIndexes/submeshCount to zero, then submeshCount to nil after compilation; segment.meshes is cleared at the end.
- Bug: M.settings = settings, but the variable settings does not exist in this file; the field is nil.
- The lod parameter of compileMeshInfo is not used.
- clearShapes delegates to basicCenters.clearShapes, which does nothing in practice.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment)` | For each segment point available for the current quality (controlPoint.quality[segment.quality]), computes orientation = {nx, ny, nz} by rotating the X, Y, Z axes by controlPoint.finalRot. | 55 |
| `util_trackBuilder_segmentToProceduralMesh.clearShapes()` | Asks basicCenters to empty its profile caches (no real effect, see notes). | 48 |
| `util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod)` | Concatenates the segment's border, center, wall and ceiling meshes and returns them as a list. The start and end caps are handled by the called modules. | 76 |
| `util_trackBuilder_segmentToProceduralMesh.getReferences()` | Returns the basicCenters and basicBorders modules (used to inject these dependencies into multiTrackMerger.setReferences). | 95 |
| `util_trackBuilder_segmentToProceduralMesh.materialize(segment)` | Main function: computes the points' frames, compiles the segment's meshes and creates or updates its ProceduralMesh (stored in segment.mesh). | 16 |
| `util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q)` | Returns the vector v rotated by the quaternion q (q * v). | 92 |

### Parameter details

#### `util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment)`

For each segment point available for the current quality (controlPoint.quality[segment.quality]), computes orientation = {nx, ny, nz} by rotating the X, Y, Z axes by controlPoint.finalRot.

- `segment` (*table*) : Segment whose points receive the orientation field.

#### `util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod)`

Concatenates the segment's border, center, wall and ceiling meshes and returns them as a list. The start and end caps are handled by the called modules.

- `segment` (*table*) : Track Builder segment.
- `lod` (*any*) : Not used.
- **returns**: table[] List of mesh tables {verts, uvs, normals, faces, material, tag}.

#### `util_trackBuilder_segmentToProceduralMesh.getReferences()`

Returns the basicCenters and basicBorders modules (used to inject these dependencies into multiTrackMerger.setReferences).

- **returns**: table {basicCenters = module, basicBorders = module}.

#### `util_trackBuilder_segmentToProceduralMesh.materialize(segment)`

Main function: computes the points' frames, compiles the segment's meshes and creates or updates its ProceduralMesh (stored in segment.mesh).

- `segment` (*table*) : Segment with points, quality, subTrackIndex, index (and mesh if it already exists).

#### `util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q)`

Returns the vector v rotated by the quaternion q (q * v).

- `v` (*vec3*) : Vector to rotate.
- `q` (*quat*) : Rotation.
- **returns**: vec3 Rotated vector.

## Fields

| Field | Type | Description |
|---|---|---|
| `settings` | nil | Always nil: exports a local variable that is never defined (bug). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua`.*
