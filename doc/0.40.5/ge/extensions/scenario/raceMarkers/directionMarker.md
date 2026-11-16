# `scenario_raceMarkers_directionMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/directionMarker.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/directionMarker")` (file under extensions/ but not a regular extension)

"Direction arrow" checkpoint marker: a floating arrow (s_mm_arrow_floating.dae) oriented according to the checkpoint's rotation, with a slight back-and-forth along its forward axis. Its color follows core_groundMarkers.floatingArrowColor (blue 0, 0.4, 1 by default). The module returns a constructor: require('scenario/raceMarkers/directionMarker')(id) gives an object of class C.

## Notes

- setToCheckpoint(wp) requires wp.pos; wp.rot (quaternion as a table or x,y,z,w userdata) gives the orientation, wp.radius the scale (3 by default). Without wp.pos, the call is ignored.
- Back-and-forth amplitude: 0.08 m, frequency tied to os.clock()*3.
- The mode has no visual effect: only 'hidden' hides, the other modes show.

## Class `C`

Direction arrow marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_directionMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the created object. | 146 |
| `C:createMarkers()` | Removes the old objects then creates the arrow. | 135 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic (with instanceColor and instanceColor1) registered under objectName and added to ScenarioObjectsGroup. | 112 |
| `C:hide()` | Calls setVisibility(false). | 109 |
| `C:init(id)` | Constructor: initializes the state. | 43 |
| `C:setMode(mode)` | 'hidden' hides, other mode shows; remembers the mode. | 88 |
| `C:setToCheckpoint(wp)` | Places the arrow on a checkpoint and applies the color. | 73 |
| `C:setVisibility(v)` | Shows or hides the arrow. | 100 |
| `C:show()` | Calls setVisibility(true). | 110 |
| `C:update(dt, dtSim)` | Per-frame call: applies position (with back-and-forth), rotation and scale to the arrow. | 56 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/directionMarker.lua`.*
