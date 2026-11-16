# `util_trackBuilder_ceilingMesh`

*File: `lua/ge/extensions/util/trackBuilder/ceilingMesh.lua` · VM: Game Engine (GE) · 338 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_ceilingMesh`: `extensions.load("util_trackBuilder_ceilingMesh")`, then the global `util_trackBuilder_ceilingMesh`

Generator for the ceiling of a Track Builder track segment (useful for tunnels). It defines an inverted-U section profile (width 2, height 1) then extrudes it along the segment's points, with start and end caps according to segment.meshInfo.

## Notes

- getMeshes returns an empty list if segment.quality == 4 or if segment.meshInfo.ceilingMesh.active is false.
- Material: segment.materialInfo.ceilingMesh, otherwise 'track_editor_A_center'. Tag: 'ceiling'.
- Side effect: increments segment.submeshCount and records the index in segment.submeshIndexes.ceilingMesh.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_ceilingMesh.getMeshes(segment)` | Returns {mesh} for the segment's ceiling, or {} if the ceiling is disabled or quality is low. | 324 |

### Parameter details

#### `util_trackBuilder_ceilingMesh.getMeshes(segment)`

Returns {mesh} for the segment's ceiling, or {} if the ceiling is disabled or quality is low.

- `segment` (*table*) : Track Builder segment (points, quality, meshInfo.ceilingMesh, materialInfo, submeshCount, submeshIndexes).
- **returns**: table[] List of at most one mesh table {verts, uvs, normals, faces, material, tag}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/ceilingMesh.lua`.*
