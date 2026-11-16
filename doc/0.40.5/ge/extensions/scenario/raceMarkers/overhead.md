# `scenario_raceMarkers_overhead`

*File: `lua/ge/extensions/scenario/raceMarkers/overhead.lua` · VM: Game Engine (GE) · 206 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/overhead")` (file under extensions/ but not a regular extension)

"Overhead arrow" checkpoint marker: an arrow (s_mm_arrow_ribbon_down.dae) turned toward the camera, oscillating vertically above the point, colored according to the mode and whose transparency increases up close (fade between fadeNear and fadeFar). The module returns a constructor: require('scenario/raceMarkers/overhead')(id) gives an object of class C.

## Notes

- Colors per mode: default orange (1, 0.333, 0), next black, start and lap green, final blue, branch (1, 0.6, 0.07), hidden black.
- setToCheckpoint(wp) reads wp.pos, wp.radius, wp.fadeNear and wp.fadeFar (defaults 5 and 25 m).
- In update, the color blend factor t is fixed at 1: the mode change is immediate, with no fade.
- The setToCheckpoint comment mentions modes (finish, etc.): the actual names are those of modeInfos (final, lap...).

## Class `C`

Arrow marker above the checkpoint.

The module returns a constructor: `local obj = require("scenario_raceMarkers_overhead")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the created object. | 189 |
| `C:createMarkers()` | Removes the old objects then creates the arrow. | 179 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 157 |
| `C:hide()` | Calls setVisibility(false). | 153 |
| `C:init(id)` | Constructor: initializes the state. | 49 |
| `C:setMode(mode)` | 'hidden' hides, other mode shows; remembers the old and new mode. | 129 |
| `C:setToCheckpoint(wp)` | Places the marker on a checkpoint. | 116 |
| `C:setVisibility(v)` | Shows or hides the arrow. | 144 |
| `C:show()` | Calls setVisibility(true). | 154 |
| `C:update(dt, dtSim)` | Per-frame call: turns the arrow toward the camera, animates it (0.4 + 0.4*sin) and adjusts color and alpha according to distance. | 74 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/overhead.lua`.*
