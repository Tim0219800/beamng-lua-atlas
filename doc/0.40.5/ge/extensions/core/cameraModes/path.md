# `core_cameraModes_path`

*File: `lua/ge/extensions/core/cameraModes/path.lua` · VM: Game Engine (GE) · 582 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/path")` (file under extensions/ but not a regular extension)

Camera that follows a camera path (core_paths: markers with position, rotation, FOV, time). Interpolates position by chordal Catmull-Rom with normalized time (monotone Steffen), rotation by centripetal Catmull-Rom (nlerp) and FOV/nearClip by Steffen. Handles: cuts (marker.cut), markers attached to the vehicle (attachToVehicle, poses in vehicle frame), vehicle tracking (trackPosition, with trackOffset offset), per-marker Bezier motion curves (motion*, rotMotion*, yaw/pitch/rollMotion*), moving starts/ends (movingStart/movingEnd), manual zoom (path.manualFov), looping (path.looped) and replay-linked paths (path.replay, bullettime speed). Returns a constructor.

## Example

```lua
-- the path comes from core_paths; customData can provide getNextPath(), onNextControlPoint(n, total), finishedPath(), reset(), useJsonVersion, useDtReal, offset, path
core_camera.setByName(0, 'path', false, {getNextPath = function() return 'monChemin' end})
```

## Notes

- Two modes: useJsonVersion = true (customData.getNextPath returns the path table, absolute times per marker); otherwise the path is looked up by name (core_paths.getPath(pathName)) and marker.time is the duration to the next marker (cumulative).
- Does nothing if there are fewer than 2 markers. Uses data.dtSim (or dtReal if customData.useDtReal).
- Set of marker fields read: pos, rot, fov, nearClip, time, cut, attachToVehicle, trackPosition, trackOffset{x,y,z}, movingStart, movingEnd, positionSmooth, motion*(Out|In|OutTime|InTime), bullettime.
- The tracking offset comes from the markers, otherwise, as a fallback, from editor_camPathEditor or from a pathCameraEditor.getTrackingOffset() extension.
- A TODO in the code notes that rotation with movingEnd does not have the right timing.
- The signatures of the extracted page are inaccurate: getTimeToNext(path, index) and getGlobalTime(path, index, looped).
- update modifies the markers' quaternions (sign inversion) to avoid interpolation jumps.

## Class `C`

Path mode. Fields: ctrlPoint, camT (current time in s), customData, path, pathName, fovOffset.

The module returns a constructor: `local obj = require("core_cameraModes_path")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:getGlobalTime(path, index, looped)` | Absolute time of marker index since the start of the path. | 174 |
| `C:getTimeToNext(path, index)` | Duration between marker index and the next (last marker: loop duration or 2 s in JSON mode). | 165 |
| `C:init()` | isGlobal = true, hidden = true, initial state. | 16 |
| `C:reset()` | Resets time, control point, FOV offset and path names to zero (calls customData:reset if it exists). | 560 |
| `C:setCustomData(data)` | Resets the mode and sets the course data; start time = customData.offset. If the path has a replay, loads it (or ignores it if it does not exist). | 545 |
| `C:update(data)` | Advances time, interpolates the camera and writes data.res (pos, rot, fov, nearClip), calls the customData callbacks and handles the end/loop of the path. | 221 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/path.lua`.*
