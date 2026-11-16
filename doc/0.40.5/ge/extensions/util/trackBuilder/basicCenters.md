# `util_trackBuilder_basicCenters`

*File: `lua/ge/extensions/util/trackBuilder/basicCenters.lua` · VM: Game Engine (GE) · 395 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_basicCenters`: `extensions.load("util_trackBuilder_basicCenters")`, then the global `util_trackBuilder_basicCenters`

Generator of the central surface (the roadway) of a Track Builder track segment. Three section profiles are defined: regular (curved surface and underside), halfRegular and low (simplified version used in low quality). getMeshes computes the normals and returns the mesh extruded along the segment's points.

## Notes

- The profile is chosen by segment.centerMesh; if this name does not exist, getMeshes returns an empty list. If segment.quality == 4, the 'low' profile is forced.
- Material: segment.materialInfo.centerMesh, otherwise 'track_editor_A_center'. Mesh tag: 'center'.
- Side effect: increments segment.submeshCount and fills segment.submeshIndexes.
- Bug: clearShapes uses ipairs on the shapes table, which is keyed by name (regular, halfRegular, low); the loop therefore never runs and the function clears nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_basicCenters.clearShapes()` | Intended to clear the vertex cache (vertexLUT) of each profile and reset LUTMax/LUTMin. Does nothing in practice (see notes). | 383 |
| `util_trackBuilder_basicCenters.getMeshes(segment)` | Returns {mesh} for the segment's central surface, or {} if the requested profile does not exist. | 371 |

### Parameter details

#### `util_trackBuilder_basicCenters.getMeshes(segment)`

Returns {mesh} for the segment's central surface, or {} if the requested profile does not exist.

- `segment` (*table*) : Track Builder segment (points, centerMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
- **returns**: table[] List of at most one mesh table {verts, uvs, normals, faces, material, tag}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/basicCenters.lua`.*
