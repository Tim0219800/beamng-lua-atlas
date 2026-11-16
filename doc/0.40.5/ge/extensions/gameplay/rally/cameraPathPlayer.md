# `gameplay_rally_cameraPathPlayer`

*File: `lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/cameraPathPlayer")` (file under extensions/ but not a regular extension)

Reads a camera path that follows the rally route. From the points of a 'snaproad' (pointsForCameraPath), it builds a camera path (an adapted copy of core_paths.loadPath) and plays it with core_paths.playPath. Fixed parameters in play: 40 m before, 20 m after, 2 m height, FOV 70, playback speed 80 km/h. The module returns a constructor: require(...)(snaproad).

## Notes

- The time of each marker = cumulative distance / playback speed (m/s): the camera moves at constant speed, regardless of point spacing.
- In loadPath, 'movingStart or true' and 'movingEnd or true' are always true (a false value would be ignored).
- The local function loadPath returns a path table without registering it (addPath is commented out).

## Class `C`

Camera path player returned by the module constructor.

The module returns a constructor: `local obj = require("gameplay_rally_cameraPathPlayer")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init(snaproad)` | Stores the snaproad used to produce the path points. | 11 |
| `C:play()` | Requests the points from the snaproad (40 m before, 20 m after), builds the camera path and starts it with core_paths.playPath. Does nothing if no points are returned. | 146 |
| `C:stop()` | Stops the current camera path (core_paths.stopCurrentPath). | 162 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua`.*
