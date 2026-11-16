# `ui_apps_minimap_topomap`

*File: `lua/ge/extensions/ui/apps/minimap/topomap.lua` · VM: Game Engine (GE) · 434 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_topomap`: `extensions.load("ui_apps_minimap_topomap")`, then the global `ui_apps_minimap_topomap`

Topographic map of the minimap. Computes the level bounds from the navgraph nodes (`map.getMap()`), samples the terrain height on a grid (one measurement every 5 m, via `core_terrain.getTerrainHeight`), generates contour lines with the marching squares algorithm, stores them in a spatial tree (`kdtreebox2d`) and can draw them onto the minimap texture. The data is cleared at the start and end of a mission.

## Notes

- BUG: drawContours calls `ui_apps_sdfTopomap.getContourSegments()` and `getContourQuadtree()` instead of `M`; minimap.lua also tests `ui_apps_sdfTopomap`. No 0.40.5 file defines this extension (old name), so the test `if ui_apps_sdfTopomap and ...` fails and the contour lines are never drawn through this path.
- The `worldToMapXYZ` parameter of drawContours is not used: the function gets the transform via `ui_apps_minimap_utils.getWorldToMapTransform()`.
- drawContours limits drawing to 5000 segments per call and only considers segments within a radius of 200 * scale around the camera. Levels range from 0 to 100; multiples of 10 are drawn thicker.
- loadTopoMap chains three steps (bounds, terrain scan, contours) and returns false as soon as one fails; it returns true without redoing anything if the map is already loaded.
- Many `log("I", ...)` logs are emitted during generation.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ)` | Draws the contour lines near the camera onto the minimap texture, in the BACKGROUND layer. Gray, lighter the higher the level. *(internal)* | 385 |
| `ui_apps_minimap_topomap.getContourQuadtree()` | Returns the `kdtreebox2d` spatial tree indexing the contour segments, or nil if not generated. | 415 |
| `ui_apps_minimap_topomap.getContourSegments()` | Returns the list of contour line segments. Each segment is `{level, x1, y1, x2, y2}` (inferred from drawContours). | 414 |
| `ui_apps_minimap_topomap.getHeightmapBounds()` | Returns the heightmap's world bounds. | 413 |
| `ui_apps_minimap_topomap.getHeightmapData()` | Returns the height grid table (fields `data`, `gridWidth`, `gridHeight` used by the code; empty before loading). | 412 |
| `ui_apps_minimap_topomap.isLoaded()` | Indicates whether the topographic map is loaded. | 411 |
| `ui_apps_minimap_topomap.loadTopoMap()` | Loads the topographic map: navgraph bounds, terrain height grid, then contour lines and spatial tree. No effect (returns true) if already loaded. | 357 |
| `ui_apps_minimap_topomap.onClientEndMission()` | Hook called at the end of a mission/level. Resets the heightmap, the bounds and the contours and marks the map as not loaded. *(internal)* *(hook)* | 418 |
| `ui_apps_minimap_topomap.onClientStartMission()` | Hook called at the start of a mission/level. Same reset as onClientEndMission. *(internal)* *(hook)* | 426 |

### Parameter details

#### `ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ)`

Draws the contour lines near the camera onto the minimap texture, in the BACKGROUND layer. Gray, lighter the higher the level.

- `td` (*table*) : Texture drawing object (TextureDrawPrimitive) of the minimap.
- `width` (*number*) : Minimap width (unused here).
- `height` (*number*) : Minimap height (unused here).
- `scale` (*number*) : Minimap scale in px/m; the query radius is 200 * scale.
- `camPos` (*vec3*) : Camera position in the world.
- `worldToMapXYZ` (*function*) : Unused (the transform is reread from ui_apps_minimap_utils).

#### `ui_apps_minimap_topomap.getContourQuadtree()`

Returns the `kdtreebox2d` spatial tree indexing the contour segments, or nil if not generated.

- **returns**: table|nil Spatial tree of the segments.

#### `ui_apps_minimap_topomap.getContourSegments()`

Returns the list of contour line segments. Each segment is `{level, x1, y1, x2, y2}` (inferred from drawContours).

- **returns**: table<integer, table> Contour segments.

#### `ui_apps_minimap_topomap.getHeightmapBounds()`

Returns the heightmap's world bounds.

- **returns**: table `{minX, maxX, minY, maxY}` in meters (all 0 before loading).

#### `ui_apps_minimap_topomap.getHeightmapData()`

Returns the height grid table (fields `data`, `gridWidth`, `gridHeight` used by the code; empty before loading).

- **returns**: table Heightmap data.

#### `ui_apps_minimap_topomap.isLoaded()`

Indicates whether the topographic map is loaded.

- **returns**: boolean true once loadTopoMap has succeeded, reset to false at each mission start/end.

#### `ui_apps_minimap_topomap.loadTopoMap()`

Loads the topographic map: navgraph bounds, terrain height grid, then contour lines and spatial tree. No effect (returns true) if already loaded.

- **returns**: boolean true if the map is loaded, false if a step failed.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/topomap.lua`.*
