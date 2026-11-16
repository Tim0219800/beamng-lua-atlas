# `scenario_raceMarkers_crawlMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua` · VM: Game Engine (GE) · 541 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/crawlMarker")` (file under extensions/ but not a regular extension)

Checkpoint marker for crawl courses: a floating arrow that looks at the camera, two orange flags planted on either side of the passage (placed on the terrain), and a tall column visible from afar. It has its own modes (inactive, current, recovery, bonus, skipped, final, finished). The arrow rises to a height from which it stays visible to the camera (static raycasts). Compatible with split screen (setRenderViewPlayer). The module returns a constructor: require('scenario/raceMarkers/crawlMarker')(id) gives an object of class C.

## Notes

- Colors per mode: default white, inactive gray (0.5), current orange (1, 0.5, 0), recovery yellow (1, 0.85, 0), bonus purple (0.8, 0.2, 1), skipped red (1, 0.07, 0), final blue (0.1, 0.3, 1), finished green (0.4, 1, 0.2), hidden black. The 'finished' mode hides the base.
- The active modes (current, recovery, bonus, final) have a column visible from 40 m instead of 200 m, and the arrow looks for a clear spot up to 100 m high.
- setToCheckpoint(wp) reads wp.pos (the point is snapped back to the ground: core_terrain.getTerrainHeight or be:getSurfaceHeightBelow), wp.radius, wp.fadeNear (5 by default), wp.fadeFar (25), wp.delay (seconds before the arrow rises), wp.dir (passage direction) or wp.nextPos (the direction is then inferred from the next checkpoint).
- The flags are offset by 2.5 m on each side of the passage direction and aligned to the terrain normal.
- drawOnMinimap(td) draws a colored circle with ui_apps_minimap_utils.simpleCircle (if the mode is not 'hidden'); it is called by scenario_race_marker.drawOnMinimap.
- The first parameter of update is dt (real duration), the second dtSim (simulated duration, used for the delay and the height and scale springs).
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Crawl marker with arrow, flags and column.

The module returns a constructor: `local obj = require("scenario_raceMarkers_crawlMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyRenderViewMask()` | Hides the marker's objects in the split-screen views of players other than renderViewPlayer. | 454 |
| `C:clearMarkers()` | Removes the created objects (clearing their view mask). | 518 |
| `C:createMarkers()` | Removes the old objects then creates the arrow, two flags and column. | 488 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName. | 466 |
| `C:drawOnMinimap(td)` | Draws a circle on the minimap at the marker's position, with the mode's color. | 394 |
| `C:hide()` | Calls setVisibility(false). | 436 |
| `C:init(id)` | Constructor: initializes the state, the smoothers and the colors. | 91 |
| `C:placeFlags()` | Places the two flags on either side of the position according to pathDirection, on the ground. | 163 |
| `C:setMode(mode)` | Changes mode: shows (except 'hidden'), remembers the old mode and restarts the fade; does nothing more if the mode is unchanged. | 401 |
| `C:setRenderViewPlayer(player)` | Reserves this marker for one player's view (nil for all) and applies the mask. | 461 |
| `C:setToCheckpoint(wp)` | Places the marker on a checkpoint and resets the height caches. | 346 |
| `C:setVisibility(v)` | Shows or hides arrow, flags and column. | 419 |
| `C:show()` | Calls setVisibility(true). | 437 |
| `C:update(dt, dtSim)` | Per-frame call: color, alpha depending on distance, arrow orientation and height, scale, column. | 185 |

## Calls into the engine (C++)

- `be:` `getSurfaceHeightBelow`
- `obj:` `delete`, `renderViewMaskClear`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua`.*
