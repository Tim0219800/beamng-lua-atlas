# `scenario_raceMarkers_dragStagePlane`

*File: `lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua` · VM: Game Engine (GE) · 189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/scenario/raceMarkers/dragStagePlane")` (file under extensions/ but not a regular extension)

Staging zone marker for dragster races: draws translucent planes on the ground with debugDrawer (start line and player line joined by side walls and regular marks). White when the position is not valid, blue when the vehicle is correctly placed, red when it has crossed the line. No scene object is created. The module returns a constructor: require('scenario/raceMarkers/dragStagePlane')(id) gives an object of class C.

## Notes

- Colors (alpha 102/255): white by default, blue (26, 89, 255) if isValidStage, red if distanceToCar > 0 without valid staging.
- The actual signatures are setPlane(center, across, up, halfWidth, height) and updateFromStaging(stageTransform, distanceToStage, isValidStage); the extracted page omits the first parameter of each.
- updateFromStaging expects stageTransform = {position, x, y, scale?}; the half-width is max(2.75, scale.x * 0.65) (scale.x default 4).
- The intermediate marks are spaced 1 m apart along the distance to the vehicle.
- Drawing happens on each update, which must be called every frame (scenario_race_marker.render does it).

## Class `C`

Staging plane drawn in debug.

The module returns a constructor: `local obj = require("scenario_raceMarkers_dragStagePlane")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:clearMarkers()` | Clears the identifier table. | 30 |
| `C:createMarkers()` | Prepares an empty identifier table (no object created). | 26 |
| `C:getShowDistance()` | Distance from which the plane must be displayed (25 m). | 59 |
| `C:hide()` | Calls setVisibility(false). | 87 |
| `C:init(id)` | Constructor: initializes center, axes, half-width 2 m, height 0.5 m, display distance 25 m. | 10 |
| `C:setMode(mode)` | 'hidden' (default) hides, any other mode shows. | 74 |
| `C:setPlane(center, across, up, halfWidth, height)` | Sets the plane geometry; each nil argument keeps the current value. across and up are normalized (ignored if nearly zero), halfWidth and height are clamped to a minimum of 0.05. | 41 |
| `C:setToCheckpoint(wp)` | Sets the plane center to wp.pos. | 34 |
| `C:setVisibility(v)` | Enables or disables drawing. | 83 |
| `C:show()` | Calls setVisibility(true). | 91 |
| `C:update(dt, dtSim)` | Per-frame call: draws the translucent faces with debugDrawer:drawTriSolid. | 126 |
| `C:updateFromStaging(stageTransform, distanceToStage, isValidStage)` | Updates the plane from the staging transform and the vehicle's distance to the line. | 63 |

## Calls into the engine (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua`.*
