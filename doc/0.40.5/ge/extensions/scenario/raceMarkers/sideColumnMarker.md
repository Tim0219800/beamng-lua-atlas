# `scenario_raceMarkers_sideColumnMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua` · VM: Game Engine (GE) · 314 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/sideColumnMarker")` (file under extensions/ but not a regular extension)

Default checkpoint marker of scenario_race_marker: two columns (model single_faded_column.dae) on either side of the passage, plus a ground base (checkpoint_curve_base.dae). The columns grow with distance to stay visible from afar. Supports split screen: each marker can be visible to only one player (setRenderViewPlayer). The module returns a constructor: require('scenario/raceMarkers/sideColumnMarker')(id) gives an object of class C.

## Notes

- Colors per mode: default red (1, 0.07, 0), next black, start and lap green (0.4, 1, 0.2), recovery yellow (1, 0.85, 0), final blue (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden black. 0.3 s color fade.
- setToCheckpoint(wp) reads wp.pos, wp.radius (half the gap between the columns), wp.normal (passage direction, optional), wp.fadeNear (1 by default), wp.fadeFar (50), wp.minAlpha (0.25).
- The columns are placed at pos +/- side*radius with a vertical offset of -10 m, and their height grows with distance (up to about 20 units between 60 and 180 m, then more at long distances).
- The reference camera for the distance is the one of the renderViewPlayer player's context (core_camera.getContextIdForPlayer), otherwise the main camera.
- The objects are stored by identifiers (baseId, leftId, rightId) and looked up every frame with scenetree.findObjectById.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Marker with two side columns.

The module returns a constructor: `local obj = require("scenario_raceMarkers_sideColumnMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyRenderViewMask()` | Clears the objects' render masks then hides them in the split-screen views of players other than renderViewPlayer (render_splitScreen.getPlayers). | 233 |
| `C:clearMarker(id)` | Removes an object from its identifier (render mask cleared before removal). | 288 |
| `C:clearMarkers()` | Removes base and columns. | 299 |
| `C:createMarkers()` | Removes the old objects then creates the base and the two columns, and applies the view mask. | 280 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 257 |
| `C:hide()` | Calls setVisibility(false). | 229 |
| `C:init(id)` | Constructor: initializes the state and calls clearMarkers. | 67 |
| `C:setMode(mode)` | Changes mode: shows (except 'hidden') and starts the color fade. | 201 |
| `C:setRenderViewPlayer(player)` | Reserves this marker for one player's view (nil for all) and applies the mask. | 252 |
| `C:setToCheckpoint(wp)` | Places base and columns on a checkpoint. | 175 |
| `C:setVisibility(v)` | Shows or hides base and columns. | 213 |
| `C:show()` | Calls setVisibility(true). | 230 |
| `C:update(dt, dtSim)` | Per-frame call: computes color, alpha, size of the base and columns from the distance to the camera. | 99 |

## Calls into the engine (C++)

- `obj:` `delete`, `renderViewMaskClear`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua`.*
