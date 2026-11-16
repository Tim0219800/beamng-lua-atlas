# `util_trackBuilder_basicBorders`

*File: `lua/ge/extensions/util/trackBuilder/basicBorders.lua` · VM: Game Engine (GE) · 421 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_basicBorders`: `extensions.load("util_trackBuilder_basicBorders")`, then the global `util_trackBuilder_basicBorders`

Generator of the left and right borders of a Track Builder track segment. It contains a library of border profiles (regular, bevel, smoothedRect, racetrack, smallDiagonal, bigDiagonal, wideBevel, highBevel, rail, none) defined by section points and UVs. On load it computes normals and faces of each profile; getMeshes then extrudes the chosen profile along the segment's points and returns the mesh data (vertices, UVs, normals, faces, material).

## Notes

- Each side's profile is chosen by segment.leftMesh and segment.rightMesh (profile names). If segment.quality == 4 (low quality), the 'none' profile is used on both sides.
- The material comes from segment.materialInfo.leftMesh / rightMesh, otherwise 'track_editor_A_border'.
- The start and end caps are added according to segment.meshInfo.forceStartCap / forceEndCap.
- Each call increments segment.submeshCount and records the index in segment.submeshIndexes (side effect on the segment).
- Inconsistency: the regular, bevel, smoothedRect and racetrack profiles have 'material = materialNames', an undefined global variable (so nil); no effect, the actual material coming from the segment.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_basicBorders.getMeshes(segment)` | Returns a list of two meshes (left border, right border) for the segment. Each mesh is a table {verts, uvs, normals, faces, material, tag}, with tag being 'side -1' or 'side 1'. | 410 |

### Parameter details

#### `util_trackBuilder_basicBorders.getMeshes(segment)`

Returns a list of two meshes (left border, right border) for the segment. Each mesh is a table {verts, uvs, normals, faces, material, tag}, with tag being 'side -1' or 'side 1'.

- `segment` (*table*) : Track Builder segment (points, leftMesh, rightMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
- **returns**: table[] Two procedural mesh tables.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/basicBorders.lua`.*
