# `scenario_raceMarkers_attention`

*File: `lua/ge/extensions/scenario/raceMarkers/attention.lua` · VM: Game Engine (GE) · 194 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/attention")` (file under extensions/ but not a regular extension)

"Attention arrow" checkpoint marker: a blue arrow (model s_mm_arrow_ribbon_down.dae) floating above the point, turned toward the camera, with a vertical sway. The module returns a constructor: require('scenario/raceMarkers/attention')(id) gives an object of class C. Used via scenario_race_marker (setupMarkers with the name 'attention') or directly.

## Notes

- setToCheckpoint(wp) reads wp.pos (vec3) and wp.radius (arrow scale, 1.5 by default).
- The color is fixed (0, 0.4, 1) regardless of the mode; the mode is only used to hide (mode 'hidden') or show.
- When on foot (gameplay_walk.isWalking), the arrow rises by 1 m when the camera is within 4 m of the marker.
- The arrow is a TSStatic named cylinder_marker_left<id> added to ScenarioObjectsGroup, with useInstanceRenderData.
- The update method actually has the signature (dt, dtSim); the extracted page shows (dtSim) because of the ':' declaration.
- The setToCheckpoint comment describes modes (default, branch, next, lap, finish, start) that this marker does not use.

## Class `C`

Attention arrow marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_attention")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the objects created by this marker. | 177 |
| `C:createMarkers()` | Removes the old objects then creates the arrow. | 166 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic object (shapeName, instance color, not saveable) registered under objectName and added to ScenarioObjectsGroup if it exists. | 144 |
| `C:hide()` | Calls setVisibility(false). | 140 |
| `C:init(id)` | Constructor: initializes the state (invisible, mode 'hidden', height smoother). | 29 |
| `C:setMode(mode)` | Changes the mode: 'hidden' hides, any other mode shows. Resets the color timer to zero. | 116 |
| `C:setToCheckpoint(wp)` | Places the marker on a checkpoint. | 106 |
| `C:setVisibility(v)` | Shows or hides the arrow. | 131 |
| `C:show()` | Calls setVisibility(true). | 141 |
| `C:update(dt, dtSim)` | Per-frame call. Hides the marker once the fade is finished in 'hidden' mode, turns the arrow toward the camera (core_camera.getPosition), makes it oscillate and applies the color. | 53 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/attention.lua`.*
