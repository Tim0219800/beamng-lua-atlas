# `ui_apps_minimap_roads`

*File: `lua/ge/extensions/ui/apps/minimap/roads.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_roads`: `extensions.load("ui_apps_minimap_roads")`, then the global `ui_apps_minimap_roads`

Draws the roads of the navigation graph (map.getMap()) on the minimap. On the first call, it builds an array of segments (positions, color according to drivability) and a 2D kd-tree (kdtreebox2d); on later calls it queries the kd-tree around the camera and draws the visible segments with td:lineRoundEndWithBackground on the ROADS_BG/ROADS_FG layers. Utility module of the minimap, loaded by require, not an extension to call directly.

## Notes

- The first call of drawRoads draws nothing: it only builds the cache; drawing starts at the second call.
- Color according to link.drivability: >= 0.9 normal color, > 0.25 colorLow, otherwise colorLowest. hiddenInNavi links are ignored.
- If there are no roads and the grid is not already enabled (debugSettings.drawGrid), it calls ui_apps_minimap_utils.drawGrid if it exists.
- Call reset() when the navigation map changes, otherwise the cache stays stale.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi)` | Builds the roads cache on the first call, then draws the roads visible in the square of side 2*radius centered on the camera. | 15 |
| `ui_apps_minimap_roads.reset()` | Clears the cache (kd-tree and hasRoads flag); it will be rebuilt at the next drawRoads. | 95 |

### Parameter details

#### `ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi)`

Builds the roads cache on the first call, then draws the roads visible in the square of side 2*radius centered on the camera.

- `p` (*table|nil*) : Optional profiler (add method).
- `radius` (*number*) : Half-side of the queried area, in world meters.
- `td` (*table*) : Minimap drawing object (must provide lineRoundEndWithBackground).
- `debugSettings` (*table*) : Debug settings; only drawGrid is read.
- `camPos` (*vec3*) : Camera position (x, y used).
- `scale` (*number*) : Map scale; the line width is 2 / scale * dpi.
- `dpi` (*number|nil*) : Screen scale factor, 1 by default.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/roads.lua`.*
