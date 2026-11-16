# `util_trackBuilder_borderWallMesh`

*File: `lua/ge/extensions/util/trackBuilder/borderWallMesh.lua` · VM: Game Engine (GE) · 248 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_borderWallMesh`: `extensions.load("util_trackBuilder_borderWallMesh")`, then the global `util_trackBuilder_borderWallMesh`

Generator for the side walls (left and right) of a Track Builder track segment. It defines a box-shaped wall profile (24 faces) and, depending on the segment's wall height and quality, extrudes this profile along the segment's points, with optional start and end caps.

## Notes

- Each wall is generated only if segment.meshInfo.leftWall.active (or rightWall.active) is true; otherwise the list contains nil in its place.
- Heights come from segment.leftWallHeight / rightWallHeight (via the 'leftWallHeight' and 'rightWallHeight' fields passed to compileMeshInfo).
- If segment.quality == 4, getMeshes returns an empty table.
- Material: segment.materialInfo.leftWall / rightWall, otherwise 'track_editor_A_border'. Tag: 'side -1' or 'side 1'.
- Side effect: increments segment.submeshCount and fills segment.submeshIndexes.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_borderWallMesh.getMeshes(segment)` | Returns the meshes of the segment's active left and right walls. | 239 |

### Parameter details

#### `util_trackBuilder_borderWallMesh.getMeshes(segment)`

Returns the meshes of the segment's active left and right walls.

- `segment` (*table*) : Track Builder segment (points, quality, meshInfo.leftWall/rightWall, materialInfo, submeshCount, submeshIndexes).
- **returns**: table[] List of mesh tables {verts, uvs, normals, faces, material, tag} (may contain nil).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/borderWallMesh.lua`.*
