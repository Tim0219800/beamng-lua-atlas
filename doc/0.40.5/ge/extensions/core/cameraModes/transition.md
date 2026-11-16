# `core_cameraModes_transition`

*File: `lua/ge/extensions/core/cameraModes/transition.lua` · VM: Game Engine (GE) · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/transition")` (file under extensions/ but not a regular extension)

Global filter (runningOrder 0.2) that softens camera changes: stores the previous frame's pose (position relative to the vehicle, rotation, FOV, nearClip) and, when start() is called, blends the new camera with the old one over the configured duration (settings cameraTransitionTime, 300 ms by default, and cameraVehicleTransitionTime, 500 ms for a vehicle change). The blend is quadratic (perc^2) with nlerp of the rotation. No blend if the two points cannot see each other or are more than 100 m apart (for simple camera changes). Returns a constructor.

## Notes

- Also used for camera path transitions: if camPathTransitionData is provided, its callback receives a copy of data.res and the camera takes back the old pose.
- A request received before the first recorded frame waits until a pose exists (camLastPosAbs different from infinity).
- The extracted page says start(camPathTransitionData, duration) but the code is start(isVehicleSwitch, camPathTransitionData, duration); canTransition(origin, target) has two parameters.

## Class `C`

Transition filter.

The module returns a constructor: `local obj = require("core_cameraModes_transition")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:canTransition(origin, target)` | Says whether the blend is allowed between two points: always for a "camera"-type request (false), otherwise only if distance <= 100 m and mutual visibility (static rays). | 29 |
| `C:init()` | isGlobal, isFilter, hidden, runningOrder 0.2, initial state and settings reading. | 8 |
| `C:onSettingsChanged()` | Hook: re-reads cameraTransitionTime and cameraVehicleTransitionTime (milliseconds). | 22 |
| `C:start(isVehicleSwitch, camPathTransitionData, duration)` | Requests a blend from the last pose; it starts on the next frame. | 102 |
| `C:update(data)` | Records the pose or applies the blend to data.res. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/transition.lua`.*
