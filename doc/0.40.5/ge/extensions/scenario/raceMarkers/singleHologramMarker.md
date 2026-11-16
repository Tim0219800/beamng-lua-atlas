# `scenario_raceMarkers_singleHologramMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua` · VM: Game Engine (GE) · 228 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/singleHologramMarker")` (file under extensions/ but not a regular extension)

"Hologram column" checkpoint marker: a single central column (s_single_faded_column_rect.dae) placed on the ground by raycast, colored according to the mode, that lengthens with distance and oscillates slightly. The module returns a constructor: require('scenario/raceMarkers/singleHologramMarker')(id) gives an object of class C.

## Notes

- setToCheckpoint(wp) reads wp.pos, wp.radius, wp.normal (default (1,1,0) normalized), wp.fadeNear, wp.fadeFar, wp.minAlpha.
- Colors per mode: default blue (0, 0.4, 1), next black (column thinned to 0.75), start and lap green (0.4, 1, 0.2), recovery yellow (1, 0.85, 0), final blue (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden thins to 0. 0.8 s fade between two modes.
- The ground is found with Engine.castRay (6 m above, 25 m below) by temporarily disabling forest collision; if the ground is more than 1 m below the original position, the original position is kept.
- The column's alpha is clamp((distance - 60) / 60, 0.15, 1): more visible from afar.
- update crashes if called before setToCheckpoint (centerPos nil); scenario_race_marker always calls setToCheckpoint first.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Single column marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_singleHologramMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarker(id)` | Removes an object from its identifier. | 210 |
| `C:clearMarkers()` | Removes the column. | 217 |
| `C:createMarkers()` | Removes the old object then creates the column. | 205 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 184 |
| `C:hide()` | Calls setVisibility(false). | 181 |
| `C:init(id)` | Constructor: initializes the state. | 74 |
| `C:setMode(mode)` | Changes mode: shows (except 'hidden') and starts the fade. | 163 |
| `C:setToCheckpoint(wp)` | Places the column on the ground below the checkpoint. | 131 |
| `C:setVisibility(v)` | Shows or hides the column. | 173 |
| `C:show()` | Calls setVisibility(true). | 182 |
| `C:update(dt, dtSim)` | Per-frame call: fade, color, alpha and column height according to distance, oscillation. | 94 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua`.*
