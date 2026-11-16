# `util_trackBuilder_multiTrackMerger`

*File: `lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua` · VM: Game Engine (GE) · 367 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_multiTrackMerger`: `extensions.load("util_trackBuilder_multiTrackMerger")`, then the global `util_trackBuilder_multiTrackMerger`

Builds the junction (intersection) mesh between several Track Builder track segments that meet at the same point. It takes the end of each segment, links consecutive ends with Bézier curves (edges), generates a pseudo-segment for each (center 'halfRegular' + border) using basicCenters and basicBorders, adds a central fill if there are more than two segments, then creates a ProceduralMesh object in MissionGroup.

## Notes

- setReferences must be called before mergeMultiTrack: it injects the basicCenters and basicBorders modules (list.basicCenters, list.basicBorders); otherwise the call fails on nil references.
- mergeMultiTrack draws debug spheres (debugDrawer:drawSphere red for each end, green for the center) at call time.
- The object name is 'procMerger-' followed by [r]index x sub of each segment; an identical name for the same intersection can conflict.
- The created object has canSave = false.
- Each entry of segments is a table {segment, reverse, index, sub}; if reverse is true, the first point is used with orientation, bank and pitch reversed.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)` | Creates the ProceduralMesh object that joins the given segments. Default materials: 'track_editor_A_center', 'track_editor_A_border', border 'regular'. | 352 |
| `util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat)` | Changes the materials of an already created junction: one center material per segment, one border material per segment, and the fill material if there are more than two segments. | 338 |
| `util_trackBuilder_multiTrackMerger.setReferences(list)` | Registers the modules this file depends on. *(internal)* | 360 |

### Parameter details

#### `util_trackBuilder_multiTrackMerger.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)`

Creates the ProceduralMesh object that joins the given segments. Default materials: 'track_editor_A_center', 'track_editor_A_border', border 'regular'.

- `segments` (*table[]*) : List of entries {segment, reverse, index, sub} describing the ends to join.
- `centerMat` (*string|nil*) : Center material.
- `borderMat` (*string|nil*) : Border material.
- `borderMesh` (*string|nil*) : Name of the border profile (see basicBorders).
- **returns**: userdata The created ProceduralMesh object.

#### `util_trackBuilder_multiTrackMerger.setMaterials(intersection, centerMat, borderMat)`

Changes the materials of an already created junction: one center material per segment, one border material per segment, and the fill material if there are more than two segments.

- `intersection` (*table*) : Table containing .segments (list) and .obj (the ProceduralMesh returned by mergeMultiTrack).
- `centerMat` (*string|nil*) : Center material; ignored if nil.
- `borderMat` (*string|nil*) : Border material; ignored if nil.

#### `util_trackBuilder_multiTrackMerger.setReferences(list)`

Registers the modules this file depends on.

- `list` (*table*) : Table {basicCenters = module, basicBorders = module}.

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/multiTrackMerger.lua`.*
