# `editor_toolUtilities_terrainPainter`

*File: `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua` · VM: Game Engine (GE) · 221 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_terrainPainter`: `extensions.load("editor_toolUtilities_terrainPainter")`, then the global `editor_toolUtilities_terrainPainter`

Paints the terrain material under a spline (road) and allows undoing. Computes the road footprint (actual deck edge for mesh roads, otherwise centerline and widths per station), pushes this outline out by group.paintMargin, fills the polygon by scanlines and stores the original materials in the group so they can be restored. Goes through editor_terrainEditor (terrain block and terrain editor).

## Notes

- Constants: default material = index 1; 2 m margin added to the paint bounding box.
- paint does nothing if the group already holds painted data (paintedDataVals non-empty), has fewer than 2 nodes or fewer than 2 divPoints: you must revert before repainting.
- paintPolygon also does nothing if store.paintedDataVals is already filled.
- The group must have paintedDataX, paintedDataY and paintedDataVals (tables): revert and paint index them without testing to trim them, only paintedDataVals is tested beforehand.
- revert restores in reverse order, so a cell painted twice gets back the material from before the first paint.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_terrainPainter.paint(group, runs)` | Paints the given spline: first computes its footprint then paints it, with the material group.paintMaterialIdx. Stores coordinates, old values and box in the group. | 143 |
| `editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip)` | Paints a closed polygon in world XY with the given terrain material, recording in `store` what was there so it can be put back. Updates the terrain grid (updateGridMaterials, updateGrid). | 83 |
| `editor_toolUtilities_terrainPainter.revert(group)` | Puts back the state from before the paint: restores the material indices, updates the grid, clears the group's painted data. | 179 |
| `editor_toolUtilities_terrainPainter.revertAll(groups)` | Undoes the terrain painting for all groups. | 207 |

### Parameter details

#### `editor_toolUtilities_terrainPainter.paint(group, runs)`

Paints the given spline: first computes its footprint then paints it, with the material group.paintMaterialIdx. Stores coordinates, old values and box in the group.

- `group` (*table*) : Spline group (nodes, divPoints, binormals, divWidths, meshEdgeL/R, paintMargin, paintMaterialIdx, paintedData*).
- `runs` (*table|nil*) : Pairs of divPoints indices { i0, i1 }: only these sections, in a single record. Default is the whole road.

#### `editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip)`

Paints a closed polygon in world XY with the given terrain material, recording in `store` what was there so it can be put back. Updates the terrain grid (updateGridMaterials, updateGrid).

- `store` (*table*) : Table that receives paintedDataX, paintedDataY, paintedDataVals and the paintedDataBox* bounds.
- `poly` (*table*) : List of polygon points (x, y), at least 3.
- `materialIdx` (*integer|nil*) : Terrain material index (1 by default).
- `skip` (*function|nil*) : skip(x, y) is queried for each point; if true the ground is left as is.

#### `editor_toolUtilities_terrainPainter.revert(group)`

Puts back the state from before the paint: restores the material indices, updates the grid, clears the group's painted data.

- `group` (*table*) : Painted group.

#### `editor_toolUtilities_terrainPainter.revertAll(groups)`

Undoes the terrain painting for all groups.

- `groups` (*table*) : List of groups.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/terrainPainter.lua`.*
