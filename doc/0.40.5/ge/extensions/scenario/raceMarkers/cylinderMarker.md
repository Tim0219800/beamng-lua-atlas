# `scenario_raceMarkers_cylinderMarker`

*File: `lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua` · VM: Game Engine (GE) · 170 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/cylinderMarker")` (file under extensions/ but not a regular extension)

"Cylinder" checkpoint marker: a flat base on the ground (checkpoint_marker_base.dae) and a 50-unit-tall cylinder (checkpoint_marker.dae) colored according to the mode, with a transparency that increases with distance from the camera. The module returns a constructor: require('scenario/raceMarkers/cylinderMarker')(id) gives an object of class C.

## Notes

- Colors per mode: default red (1, 0.07, 0), next gray (0.3), start and lap green (0.4, 1, 0.2), recovery yellow (1, 0.85, 0), final blue (0.1, 0.3, 1), branch orange (1, 0.6, 0). 'hidden' hides the marker.
- setToCheckpoint(wp) reads wp.pos, wp.radius, and optionally wp.fadeNear and wp.fadeFar (appearance distances, 0 and 70 by default). The base is scaled 2*radius, the cylinder radius x radius x 50.
- Alpha is clamp((distance - radius/2 - fadeNear) / (fadeFar - fadeNear), 0, 1): the marker is transparent up close and opaque from afar. Base alpha *0.75, cylinder *0.95.
- Initial mode 'current' (not defined in modeInfos); setMode must be called with a known mode before any colored display, otherwise the color is {0,0,0,0}.
- update(dt, dtSim) is called by scenario_race_marker.render; its parameters are unused.

## Class `C`

Cylinder checkpoint marker.

The module returns a constructor: `local obj = require("scenario_raceMarkers_cylinderMarker")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Removes the created objects. | 152 |
| `C:createMarkers()` | Removes the old objects then creates the base and the cylinder. | 138 |
| `C:createObject(shapeName, objectName)` | Creates a hidden TSStatic registered under objectName and added to ScenarioObjectsGroup. | 116 |
| `C:hide()` | Calls setVisibility(false). | 112 |
| `C:init(id)` | Constructor: initializes the state (invisible, per-mode color tables copied). | 25 |
| `C:setMode(mode)` | Chooses the color according to the mode ('hidden' hides, otherwise shows). | 89 |
| `C:setToCheckpoint(wp)` | Places base and cylinder on a checkpoint. | 71 |
| `C:setVisibility(v)` | Shows or hides the base and the cylinder. | 102 |
| `C:show()` | Calls setVisibility(true). | 113 |
| `C:update()` | Per-frame call: recomputes the transparency from the distance to the camera (core_camera.getPosition) and updates the instance colors. | 46 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua`.*
