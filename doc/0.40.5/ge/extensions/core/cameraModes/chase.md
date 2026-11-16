# `core_cameraModes_chase`

*File: `lua/ge/extensions/core/cameraModes/chase.lua` · VM: Game Engine (GE) · 275 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/cameraModes/chase")` (file under extensions/ but not a regular extension)

Vehicle-bound 'chase' camera mode: the camera sits behind the vehicle at a fixed distance (default 5 m, FOV 65), looks at the target and follows its heading with smoothing; it automatically switches to the front of the vehicle when it reverses. Mode selection: camera.lua loads each cameraModes file and creates, for each vehicle, one instance per mode (here under the name 'chase'), configured by the jbeam camera section (cameraChase is converted to 'chase' by jbeam/sections/camera.lua). 'chase' is in the default configuration list {orbit, driver, onboard.hood, external, relative, chase, droneChase} but disabledByDefault = true: it is not in the key cycle until the user enables it in Options > Cameras; it can also be called explicitly via core_camera.setByName(player, 'chase'). The module returns a constructor: require('core/cameraModes/chase')(options).

## Example

```lua
core_camera.setByName(0, 'chase', true)
```

## Notes

- Controls: yaw/pitch (relative or axes) do not rotate freely: beyond the 0.05 threshold the camera jumps to fixed positions (left/right at ±90°, behind at 180°, 30° higher in pitch); the zoom toggles between the min distance (distanceMin, 3 m by default), the default distance (distance, 5 m by default) and double the distance.
- jbeam configuration options used: defaultRotation (vec3 degrees; its y is inverted, default (0,-17,0)), distance, distanceMin, mode ('ref' by default or 'center' which aims at the center of the vehicle's box), fov, offset (vec3, scaled by the lengths of the vehicle's axes).
- User settings: cameraOrbitRelaxation (default 3, read but unused in update) and cameraChaseRollSmoothing (default 1; 0 or near 0 disables roll and keeps the camera level).
- The camera flips to the front of the vehicle when the smoothed forward speed goes beyond -1.5 m/s in reverse (and returns behind beyond +1.5 m/s).
- update sets data.res.collisionCompatible = true and delegates to cameraModes/collision to prevent the camera from passing through the scenery; if the reference nodes coincide (zero length) it returns false with a default orientation.
- setRefNodes has the real signature (centerNodeID, leftNodeID, backNodeID) (the automatic index shows two).

## Class `C`

Instance of the 'chase' mode for a vehicle. Main fields: defaultRotation, camRot, distance, defaultDistance, camMinDist, camDist, mode, fov, offset, refNodes {ref,left,back}, forwardLooking, rollSmoothing, collision.

The module returns a constructor: `local obj = require("core_cameraModes_chase")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the smoothers, the follow state, the collision module and applies the configuration, the settings and a reset. Called by the constructor. | 13 |
| `C:listParams()` | Returns the list of adjustable settings for the camera control UI / video stream: only the FOV (10 to 140 degrees, step 1, default 65) since the distance is recomputed every frame. | 62 |
| `C:mouseLocked(locked)` | Hook called when the mouse is locked or released: on release, resets the accumulated relative input (relYaw, relPitch). | 261 |
| `C:onSettingsChanged()` | Re-reads the settings (cameraOrbitRelaxation, cameraChaseRollSmoothing), notifies the collision module and does a reset. Called when settings change. | 54 |
| `C:onVehicleCameraConfigChanged()` | Applies the camera's jbeam configuration: defaultRotation (y inverted, default (0,-17,0)), distances, mode ('ref' by default), FOV (65 by default), offset. Called on creation and when the vehicle's jbeam data changes. | 35 |
| `C:reset()` | Puts the camera back behind the vehicle (default rotation, x to 0, looking forward) and forces a realignment on the next frame. | 72 |
| `C:setParam(key, value)` | Applies an adjustable setting. Only the 'fov' key is handled. | 68 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Stores the vehicle's reference nodes (center, left, rear), called by camera.lua when the camera is created. | 254 |
| `C:update(data)` | Per-frame computation, called by cameraUpdate when this mode is the focused camera: reads the MoveManager inputs, computes the vehicle's direction and up from the reference nodes, positions the camera behind the target (rotation and distance smoothing) and writes data.res.pos, rot, fov, targetPos, then applies collision. | 82 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraModes/chase.lua`.*
