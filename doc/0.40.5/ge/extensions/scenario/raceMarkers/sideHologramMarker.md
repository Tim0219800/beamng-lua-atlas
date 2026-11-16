# `scenario_raceMarkers_sideHologramMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua` · VM: Game Engine (GE) · 546 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/sideHologramMarker")` (file under extensions/ but not a regular extension)

"Hologram gantry" checkpoint marker: two pillars (left and right portal), each with a cone on the ground, a tall column, a thin cylinder linking the ground to the cone, plus a floating arrow in the center pointing to the next checkpoint. The pillar feet are placed on the ground by raycast (Engine.castRay, forest tree collision temporarily disabled). The module returns a constructor: require('scenario/raceMarkers/sideHologramMarker')(id) gives an object of class C.

## Notes

- setToCheckpoint(wp) reads wp.pos, wp.radius (half the gap between pillars), wp.normal (default (1,1,0) normalized), wp.nextPos (position of the next checkpoint, orients the arrow), wp.fadeNear, wp.fadeFar, wp.minAlpha.
- Pillar colors per mode: default blue (0, 0.4, 1), next black (pillars thinned to 0.75), start and lap green (0.4, 1, 0.2), recovery yellow, final blue (0.1, 0.3, 1), branch orange, hidden thins to 0. 0.8 s fade between two modes.
- The last checkpoint has no oriented arrow while wp.nextPos is absent: the arrow then keeps its last orientation.
- The raycast starts 6 m above and goes down 25 m; if the ground is more than 1 m below the original position, the original position is kept (bridge case).
- The 9 created objects are TSStatic named cylinder_marker_<role><id>, added to ScenarioObjectsGroup if present.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).
- update references self.leftPillarPos: if update is called before setToCheckpoint (position nil), the call crashes; scenario_race_marker always calls setToCheckpoint before render.

## Class `C`

Gantry marker with pillars, cones, columns and arrow.

The module returns a constructor: `local obj = require("scenario_raceMarkers_sideHologramMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarker(id)` | Removes an object from its identifier. | 509 |
| `C:clearMarkers()` | Deletes all created objects. | 517 |
| `C:createMarkers()` | Removes the old objects then creates the 9 objects. | 495 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 473 |
| `C:hide()` | Calls setVisibility(false). | 469 |
| `C:init(id)` | Constructor: initializes the state and the colors. | 105 |
| `C:setMode(mode)` | Changes mode: shows (except 'hidden') and starts the fade. | 413 |
| `C:setToCheckpoint(wp)` | Computes the ground positions of the two pillars by raycasts and places all the objects. | 300 |
| `C:setVisibility(v)` | Shows or hides the 9 objects. | 425 |
| `C:show()` | Calls setVisibility(true). | 470 |
| `C:update(dt, dtSim)` | Per-frame call: vertical sway, color fade, column size according to distance, arrow orientation toward nextPos. | 145 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua`.*
