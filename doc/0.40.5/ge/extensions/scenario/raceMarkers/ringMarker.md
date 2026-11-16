# `scenario_raceMarkers_ringMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/ringMarker.lua` · VM: Game Engine (GE) · 222 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/ringMarker")` (file under extensions/ but not a regular extension)

"Ring" checkpoint marker: a 3D ring (checkpoint_ring.dae, or checkpoint_ring_finish.dae for the lap and final modes) oriented along the checkpoint normal and colored according to the mode, with a 0.3 s fade between two modes. The module returns a constructor: require('scenario/raceMarkers/ringMarker')(id) gives an object of class C.

## Notes

- Colors per mode: default red (1, 0.07, 0), next black, start and lap green (0.4, 1, 0.2), final blue (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden black (fades out then hidden).
- setToCheckpoint(wp) reads wp.pos, wp.radius, wp.normal (ring direction), wp.up (vec3, default 0,0,1) and wp.mode (chooses the model).
- In setToCheckpoint the scale is radius+1.5, but update brings it back to radius: the difference only lasts for the first frame.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Checkpoint ring marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_ringMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the created object. | 205 |
| `C:createMarkers()` | Removes the old objects then creates the ring. | 195 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 173 |
| `C:hide()` | Calls setVisibility(false). | 169 |
| `C:init(id)` | Constructor: initializes the state and copies the mode table. | 56 |
| `C:setMode(mode)` | Switches to a mode: shows (except 'hidden'), starts the color fade from the old mode and changes the model. | 146 |
| `C:setToCheckpoint(wp)` | Places the ring (position, model according to wp.mode, rotation) on a checkpoint. | 127 |
| `C:setVisibility(v)` | Shows or hides the ring. | 162 |
| `C:show()` | Calls setVisibility(true). | 170 |
| `C:update(dt, dtSim)` | Per-frame call: advances the color fade, hides the ring once in 'hidden' mode, updates scale and color. | 81 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/ringMarker.lua`.*
