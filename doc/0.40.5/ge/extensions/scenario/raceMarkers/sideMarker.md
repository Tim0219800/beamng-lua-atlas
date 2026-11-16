# `scenario_raceMarkers_sideMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/sideMarker.lua` · VM: Game Engine (GE) · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/sideMarker")` (file under extensions/ but not a regular extension)

"Side curves" checkpoint marker: a ground base (checkpoint_curve_base.dae), active side curves (checkpoint_curve_active.dae, or _finish for lap and final) and a "distant" version (checkpoint_curve_distant.dae) that fades in when far away (switches between 50 m and 75 m by default). Oriented along the checkpoint normal or the camera. The module returns a constructor: require('scenario/raceMarkers/sideMarker')(id) gives an object of class C.

## Notes

- Colors per mode: default red (1, 0.07, 0), next black, start and lap green (0.4, 1, 0.2), final blue (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden black. Mode change with a 0.3 s color fade.
- setToCheckpoint(wp) reads wp.pos, wp.radius, wp.normal (optional), wp.fadeNear, wp.fadeFar, wp.mode (model choice).
- The near/far switch lasts 0.8 s (blendDuration) with hysteresis between fadeNear and fadeFar.
- The self.sides field and the C:hide/C:show functions use stored colors (oldColor/newColor) that update never reads: leftover code.
- The extracted page shows update(dtSim); the actual signature is update(dt, dtSim).

## Class `C`

Side curves marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_sideMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the created objects. | 301 |
| `C:createMarkers()` | Removes the old objects then creates base, sides and distant version. | 283 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 261 |
| `C:hide()` | Hides and stores the 'hidden' color. | 248 |
| `C:init(id)` | Constructor: initializes the state and copies the mode table. | 69 |
| `C:setMode(mode)` | Changes mode: shows (except 'hidden'), starts the color fade and changes the sides' model. | 212 |
| `C:setToCheckpoint(wp)` | Places base, sides and distant marker on a checkpoint. | 187 |
| `C:setVisibility(v)` | Shows or hides the three objects. | 235 |
| `C:show()` | Shows, restoring the stored color. | 254 |
| `C:update(dt, dtSim)` | Per-frame call: handles the near/far fade, the rotation toward the normal or the camera, the colors and the alpha of the base, the sides and the distant version. | 104 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/sideMarker.lua`.*
