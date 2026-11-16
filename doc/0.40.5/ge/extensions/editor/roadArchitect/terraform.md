# `editor_roadArchitect_terraform`

*File: `lua/ge/extensions/editor/roadArchitect/terraform.lua` · VM: Game Engine (GE) · 741 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_terraform`: `extensions.load("editor_roadArchitect_terraform")`, then the global `editor_roadArchitect_terraform`

Modifies the terrain (TerrainBlock) to fit the Road Architect roads: flattens the terrain under a road or road network (with a domain of influence and a margin), computes road masks, and imports/exports the heightmap as a 16-bit PNG. Used by the Road Architect UI and by road network imports. All functions return without doing anything if the scene has no TerrainBlock (e.g. smallgrid).

## Example

```lua
local tf = extensions.editor_roadArchitect_terraform
tf.terraformMultiRoads(30, 1.0, nil)  -- whole network, domain of influence 30 m, margin 1 m
```

## Notes

- The domain of influence (DOI) is bounded to a minimum of 5 m (max(5, DOI)).
- An undo callback (terraformUndo) exists internally to restore the modified heights.
- conformTerrainToRoad and terraformMultiRoads use a fallback TerrainEditor (TerrainEditor()) if the terrain editor is not open; writeHeightmapToPng, setHeightmapFromPng and getRoadMasks require extensions.editor_terrainEditor and exit otherwise.
- setHeightmapFromPng: if loading the PNG fails, the code logs an error but still continues the application loop (no return); the bitmap used is then not valid.
- writeHeightmapToPng returns {} when there is no terrain, and nothing otherwise (inconsistent return value).
- The PNG is in GFXFormatR16; the scale goes from the terrain base height (tb:getPosition().z) to tb.maxHeight.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin)` | Flattens the local terrain so that it hugs a road: computes the road's quads, a mask and fixed heights, averages with the neighbors then writes the terrain. The extent is the road's 2D box enlarged by the DOI. | 303 |
| `editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group)` | Computes two masks on the terrain grid: a mask of the roads alone (value 65535 where a road covers the point, dilated by 1 cell) and a roads + margin mask (dilation by margin). | 672 |
| `editor_roadArchitect_terraform.setHeightmapFromPng(path)` | Applies a PNG heightmap to the terrain (cell by cell) then updates the TerrainBlock grid. | 632 |
| `editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group)` | Shapes the terrain over the whole road network, or over the indicated group. First recomputes all renderData. Includes neither overlays nor bridges. | 451 |
| `editor_roadArchitect_terraform.writeHeightmapToPng(path)` | Saves the terrain heightmap to a 16-bit PNG file (negative heights clamped to 0). | 604 |

### Parameter details

#### `editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin)`

Flattens the local terrain so that it hugs a road: computes the road's quads, a mask and fixed heights, averages with the neighbors then writes the terrain. The extent is the road's 2D box enlarged by the DOI.

- `rIdx` (*integer*) : Index of the road in roads.
- `DOI` (*number*) : Domain of influence (fade distance), in meters, minimum 5.
- `margin` (*number*) : Margin around the road (inferred from code: mask dilation).

#### `editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group)`

Computes two masks on the terrain grid: a mask of the roads alone (value 65535 where a road covers the point, dilated by 1 cell) and a roads + margin mask (dilation by margin).

- `DOI` (*number*) : Domain of influence, in meters (minimum 5); used to extend the search box.
- `margin` (*integer*) : Number of dilation cells of the margin mask (inferred from code).
- `group` (*table|nil*) : Placed group, or nil for all roads.
- **returns**: table<integer, table<integer, number>>|nil Road mask indexed [x][y] (0 or 65535); nil if there is no terrain.
- **returns**: table<integer, table<integer, number>> Roads + margin mask.

#### `editor_roadArchitect_terraform.setHeightmapFromPng(path)`

Applies a PNG heightmap to the terrain (cell by cell) then updates the TerrainBlock grid.

- `path` (*string*) : Path of the PNG.

#### `editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group)`

Shapes the terrain over the whole road network, or over the indicated group. First recomputes all renderData. Includes neither overlays nor bridges.

- `DOI` (*number*) : Domain of influence, in meters (minimum 5).
- `margin` (*number*) : Margin around the roads (inferred from code).
- `group` (*table|nil*) : Placed group, or nil for the whole network.

#### `editor_roadArchitect_terraform.writeHeightmapToPng(path)`

Saves the terrain heightmap to a 16-bit PNG file (negative heights clamped to 0).

- `path` (*string*) : Path of the .png file to write.
- **returns**: table|nil {} if there is no terrain, otherwise nil.

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/terraform.lua`.*
