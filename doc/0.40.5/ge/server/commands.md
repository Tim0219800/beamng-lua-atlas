# `commands`

*File: `lua/ge/server/commands.lua` · VM: Game Engine (GE) · 253 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `commands`

Camera and player placement commands, largely called by the C++ side and the input actions: switching between the game camera and the free camera, free camera speed, dropping the camera on the vehicle or the vehicle at the camera position, reading/writing the free camera transform as JSON. It also contains old global functions (getCameraPosition, setCameraFov…) kept for compatibility, which redirect to core_camera while logging a deprecation warning (once per function).

## Example

```lua
commands.toggleCamera(0)
local json = commands.getCameraTransformJson() -- '[x, y, z, qx, qy, qz, qw]'
```

## Notes

- setFreeCamera is called by the C++: do not rename or move it.
- Compatibility aliases: setCameraFree = setFreeCamera; setCameraPlayer = setGameCamera; getCamera returns the "gameCamera" scenetree object.
- Bug: M.getGame = getGame and M.onSettingsChanged = onSettingsChanged export variables that are never defined in this file; these fields are therefore nil unless a global of the same name exists.
- In the deprecated globals, setCameraFovDeg/Rad/setCameraFov act only if the free camera is active.
- In the dropPlayerAtCamera functions, the vehicle's rotation is multiplied by quat(0,0,1,0) because a vehicle's front is reversed.
- Emitted hooks: onCameraHandlerSet (initCamera), onCameraToggled ({cameraType = 'GameCam'|'FreeCam'}), onNodegrab (true/false).

## Functions

| Function | Description | Line |
|---|---|---|
| `commands.applyDropPlayerAtCameraNoResetPlan(player, plan)` | Applies a plan: moves the vehicle's node cluster (setClusterPosRelRot), cancels its velocity and updates the origin transform. | 128 |
| `commands.changeCameraSpeed(val)` | Changes the camera's normal speed (typically Alt + wheel). | 53 |
| `commands.dropCameraAtPlayer(player)` | Switches to the free camera and places it at the position and orientation of the player's vehicle. | 73 |
| `commands.dropPlayerAtCamera(player)` | Teleports the player's vehicle to the camera position, oriented along the camera's horizontal direction, then switches back to the game camera (the bigMap camera becomes orbit) and resets it. | 82 |
| `commands.dropPlayerAtCameraNoReset(player)` | Drops the vehicle at the camera without reset. If multiplayer_vehicleSync exists, delegates the request to it; otherwise calls dropPlayerAtCameraNoResetImpl. | 148 |
| `commands.dropPlayerAtCameraNoResetImpl(player)` | Plans then applies the drop without reset, then puts the camera back in game mode. | 140 |
| `commands.getCamera()` | Returns the "gameCamera" scene object (backward compatibility). | 31 |
| `commands.getCameraTransformJson()` | Returns the camera's position and rotation as a JSON string. | 164 |
| `commands.initCamera()` | Initializes the main camera: empties the core_camera inputs, finds the "gameCamera" object, attaches it to the 'main' view, emits the onCameraHandlerSet hook and resets the camera configuration to default. *(internal)* | 8 |
| `commands.isFreeCamera(player)` | Indicates whether the player's active camera is "free". | 27 |
| `commands.onNodegrabStart(usingPlayerVehicle)` | Hook called at the start of a node grab: emits onNodegrab(true), remembers whether the camera was free and, if the grab does not go through the player vehicle, switches to the free camera. *(internal)* *(hook)* | 58 |
| `commands.onNodegrabStop(usingPlayerVehicle)` | Hook called at the end of the node grab: emits onNodegrab(false) and returns to the game camera if the free camera had been activated by the grab. *(internal)* *(hook)* | 66 |
| `commands.planDropPlayerAtCameraNoReset(player)` | Computes a plan for dropping the vehicle at the camera position without resetting it (the deformation is kept). | 106 |
| `commands.resetDropPlayerAtCameraNoResetCamera(player)` | Switches back to the game camera (bigMap becomes orbit) and resets the player's camera; final step of the drop without reset. | 98 |
| `commands.setCameraFree(player)` | Compatibility alias of setFreeCamera. Called by the C++. | 40 |
| `commands.setCameraPlayer(player)` | Compatibility alias of setGameCamera. | 33 |
| `commands.setFreeCamera(player)` | Activates the free camera (initialized to the view's current transform), resets it and emits onCameraToggled (FreeCam) for the main view. Called by the C++. | 40 |
| `commands.setFreeCameraTransformJson(json)` | Activates the free camera then applies to it the transform described by a JSON string of 7 numbers (x, y, z, qx, qy, qz, qw). Silently ignores invalid or incomplete JSON. | 170 |
| `commands.setGameCamera(player)` | Switches back to the game camera for the player's view; emits onCameraToggled (GameCam) for the main view. Alias: setCameraPlayer. | 33 |
| `commands.toggleCamera(player)` | Toggles the camera: in split screen, toggles the free camera of the player's view; otherwise moves to the next camera group (core_camera.cycleCameraGroup, Shift+C). | 156 |
| `commands.toggleFastSpeed(enabled)` | Enables or disables the free camera's fast speed modifier (typically the Shift key). | 48 |

### Parameter details

#### `commands.applyDropPlayerAtCameraNoResetPlan(player, plan)`

Applies a plan: moves the vehicle's node cluster (setClusterPosRelRot), cancels its velocity and updates the origin transform.

- `player` (*integer|nil*) : player index (unused)
- `plan` (*table*) : plan returned by planDropPlayerAtCameraNoReset
- **returns**: boolean false if the plan's vehicle no longer exists

#### `commands.changeCameraSpeed(val)`

Changes the camera's normal speed (typically Alt + wheel).

- `val` (*number*) : speed change (passed to core_camera.changeSpeed)

#### `commands.dropCameraAtPlayer(player)`

Switches to the free camera and places it at the position and orientation of the player's vehicle.

- `player` (*integer|nil*) : player index

#### `commands.dropPlayerAtCamera(player)`

Teleports the player's vehicle to the camera position, oriented along the camera's horizontal direction, then switches back to the game camera (the bigMap camera becomes orbit) and resets it.

- `player` (*integer|nil*) : player index

#### `commands.dropPlayerAtCameraNoReset(player)`

Drops the vehicle at the camera without reset. If multiplayer_vehicleSync exists, delegates the request to it; otherwise calls dropPlayerAtCameraNoResetImpl.

- `player` (*integer|nil*) : player index

#### `commands.dropPlayerAtCameraNoResetImpl(player)`

Plans then applies the drop without reset, then puts the camera back in game mode.

- `player` (*integer|nil*) : player index
- **returns**: table|nil the applied plan, or nil on failure

#### `commands.getCamera()`

Returns the "gameCamera" scene object (backward compatibility).

- **returns**: table|nil gameCamera object

#### `commands.getCameraTransformJson()`

Returns the camera's position and rotation as a JSON string.

- **returns**: string '[x, y, z, qx, qy, qz, qw]' (position to 2 decimals)

#### `commands.initCamera()`

Initializes the main camera: empties the core_camera inputs, finds the "gameCamera" object, attaches it to the 'main' view, emits the onCameraHandlerSet hook and resets the camera configuration to default.

- **returns**: table|nil gameCamera scene object, or nil if not found

#### `commands.isFreeCamera(player)`

Indicates whether the player's active camera is "free".

- `player` (*integer|nil*) : player index
- **returns**: boolean true if the free camera is active

#### `commands.onNodegrabStart(usingPlayerVehicle)`

Hook called at the start of a node grab: emits onNodegrab(true), remembers whether the camera was free and, if the grab does not go through the player vehicle, switches to the free camera.

- `usingPlayerVehicle` (*boolean*) : true if the grab uses the player's vehicle

#### `commands.onNodegrabStop(usingPlayerVehicle)`

Hook called at the end of the node grab: emits onNodegrab(false) and returns to the game camera if the free camera had been activated by the grab.

- `usingPlayerVehicle` (*boolean*) : true if the grab used the player's vehicle (unused)

#### `commands.planDropPlayerAtCameraNoReset(player)`

Computes a plan for dropping the vehicle at the camera position without resetting it (the deformation is kept).

- `player` (*integer|nil*) : player index
- **returns**: table|nil plan {vid, nodeId, clusterId, x, y, z, rx, ry, rz, rw, origin*}, or nil if no vehicle

#### `commands.resetDropPlayerAtCameraNoResetCamera(player)`

Switches back to the game camera (bigMap becomes orbit) and resets the player's camera; final step of the drop without reset.

- `player` (*integer|nil*) : player index

#### `commands.setCameraFree(player)`

Compatibility alias of setFreeCamera. Called by the C++.

- `player` (*integer|nil*) : player index

#### `commands.setCameraPlayer(player)`

Compatibility alias of setGameCamera.

- `player` (*integer|nil*) : player index

#### `commands.setFreeCamera(player)`

Activates the free camera (initialized to the view's current transform), resets it and emits onCameraToggled (FreeCam) for the main view. Called by the C++.

- `player` (*integer|nil*) : player index

#### `commands.setFreeCameraTransformJson(json)`

Activates the free camera then applies to it the transform described by a JSON string of 7 numbers (x, y, z, qx, qy, qz, qw). Silently ignores invalid or incomplete JSON.

- `json` (*string*) : string produced by getCameraTransformJson

#### `commands.setGameCamera(player)`

Switches back to the game camera for the player's view; emits onCameraToggled (GameCam) for the main view. Alias: setCameraPlayer.

- `player` (*integer|nil*) : player index

#### `commands.toggleCamera(player)`

Toggles the camera: in split screen, toggles the free camera of the player's view; otherwise moves to the next camera group (core_camera.cycleCameraGroup, Shift+C).

- `player` (*integer|nil*) : player index (0 by default)

#### `commands.toggleFastSpeed(enabled)`

Enables or disables the free camera's fast speed modifier (typically the Shift key).

- `enabled` (*boolean*) : true to speed up

## Fields

| Field | Type | Description |
|---|---|---|
| `getGame` | any | Backward compatibility; is nil if the global getGame does not exist. |
| `onSettingsChanged` | any | Exported from a variable not defined in this file: is nil (see notes). |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `getCameraForward()` | (Global function, not in M.) Deprecated: use core_camera.getForward. | 222 |
| `getCameraFov()` | (Global function, not in M.) Deprecated: use core_camera.getFovDeg (returns degrees). | 226 |
| `getCameraFovDeg()` | (Global function, not in M.) Deprecated: use core_camera.getFovDeg. | 224 |
| `getCameraFovRad()` | (Global function, not in M.) Deprecated: use core_camera.getFovRad. | 225 |
| `getCameraPosition()` | (Global function, not in M.) Deprecated: use core_camera.getPosition. | 219 |
| `getCameraQuat()` | (Global function, not in M.) Deprecated: use core_camera.getQuat. | 223 |
| `getCameraRight()` | (Global function, not in M.) Deprecated: use core_camera.getRight. | 221 |
| `getCameraUp()` | (Global function, not in M.) Deprecated: use core_camera.getUp. | 220 |
| `setCameraFov(fovDeg)` | (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the FOV in degrees if the free camera is active. | 213 |
| `setCameraFovDeg(fovDeg)` | (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the field of view (degrees) if the free camera is active. | 197 |
| `setCameraFovRad(fovRad)` | (Global function, not in M.) Deprecated: use core_camera.setFOV. Sets the FOV (radians, converted to degrees) if the free camera is active. | 207 |
| `setCameraPosRot(px, py, pz, rx, ry, rz, rw)` | (Global function, not in M.) Deprecated: use core_camera.setPosRot. Applies position and quaternion to player 0's camera. | 192 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCameraHandlerSet`
- `onCameraToggled` — listened to by 1 module(s)
- `onNodegrab` — listened to by 1 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/server/commands.lua`.*
