# `core_vehicle_partFocusCamera`

*File: `lua/ge/extensions/core/vehicle/partFocusCamera.lua` · VM: Game Engine (GE) · 524 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_partFocusCamera`: `extensions.load("core_vehicle_partFocusCamera")`, then the global `core_vehicle_partFocusCamera`

GE extension `core_vehicle_partFocusCamera`: drives the hidden camera mode 'partFocus' from the parts menu. From the selected parts, computes a bounding box (size from the meshes, position from the jbeam nodes, which follow the vehicle live), sets the camera distance to frame it (FOV 35°, margin 1.2) and moves it smoothly. Requests wait 0.5 s for the selection to stabilize, unless the immediate option is set. Gives the camera back to the player when the selection stays empty.

## Example

```lua
core_vehicle_partFocusCamera.focusOnParts(vehId, {['pickup/pickup_hood'] = true}, nil, 0, {immediate = true})
-- later
core_vehicle_partFocusCamera.release()
```

## Notes

- cameraOptions accepts: immediate (skips the wait delay), focusOffsetUp (offset of the target toward the top of the vehicle, m), distanceMultiplier (multiplier of the framing distance) and preserveDistance (do not recompute the distance).
- Internal constants: settleDelay 0.5 s, transitionTime 1.2 s, minExtent 0.15 m (a part held by a single node does not shrink to a point).
- updateTarget is called by the partFocus camera mode itself (not by the onUpdate hook) to read node positions at the right moment of the frame; it draws the bounding box (debugDrawer:drawLine) on every call, including outside debug.
- M.onSerialize points to M.clear (which returns nothing): no data is saved and the camera is released before a Lua reload; M.onExtensionUnloaded also points to M.clear.

**Dependencies (loaded first):** `core_vehicle_configTarget`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_partFocusCamera.clear()` | Cancels the requests, leaves the partFocus mode (back to the previous camera, 'orbit' by default) and removes the PartCamera action map. | 354 |
| `core_vehicle_partFocusCamera.consumeZoomSteps()` | Returns and resets the accumulated zoom notches (called by the camera mode). | 437 |
| `core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions)` | Asks the camera to frame a set of parts. Repeated identical requests are ignored (the delay is not restarted). An empty list falls back to release(). | 312 |
| `core_vehicle_partFocusCamera.isActive()` | Indicates whether the part camera is active (a vehicle is framed). | 429 |
| `core_vehicle_partFocusCamera.onUpdate(dtReal)` | Per-frame hook: counts down the wait delay (real time, because the configuration menu often runs paused) then applies the request or releases the camera. *(internal)* *(hook)* | 477 |
| `core_vehicle_partFocusCamera.onVehicleConfigTargetChanged()` | Hook: the configuration target changes; releases the camera. *(internal)* *(hook)* | 515 |
| `core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId)` | Hook: the framed vehicle is destroyed; releases the camera. *(internal)* *(hook)* | 497 |
| `core_vehicle_partFocusCamera.onVehicleResetted(resettedId)` | Hook: the vehicle is reset; forces an immediate re-measure of the box. *(internal)* *(hook)* | 490 |
| `core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId)` | Hook: the framed vehicle is recreated; keeps the last camera pose. *(internal)* *(hook)* | 503 |
| `core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player)` | Hook: the driven player leaves the framed vehicle; releases the camera. *(internal)* *(hook)* | 509 |
| `core_vehicle_partFocusCamera.release(immediate)` | Gives the camera back to the player once the selection stays empty for settleDelay (0.5 s), or immediately. | 343 |
| `core_vehicle_partFocusCamera.updateTarget(dt, cam)` | Called by the partFocus camera mode every frame: periodically re-measures the box, rebuilds the box in world space, draws it and sets the camera's aim point. *(internal)* | 446 |
| `core_vehicle_partFocusCamera.zoomStep(value)` | Adds mouse wheel notches (zoom) to be applied by the camera mode. | 433 |

### Parameter details

#### `core_vehicle_partFocusCamera.consumeZoomSteps()`

Returns and resets the accumulated zoom notches (called by the camera mode).

- **returns**: number accumulated notches

#### `core_vehicle_partFocusCamera.focusOnParts(inVehId, partNames, selectedMeshes, playerId, cameraOptions)`

Asks the camera to frame a set of parts. Repeated identical requests are ignored (the delay is not restarted). An empty list falls back to release().

- `inVehId` (*integer*) : vehicle
- `partNames` (*table<string, boolean>*) : [part path] = true
- `selectedMeshes` (*table|nil*) : part meshes (provided by core_vehicle_partmgmt), used to measure the size
- `playerId` (*integer|nil*) : player whose camera is driven
- `cameraOptions` (*table|nil*) : see notes: immediate, focusOffsetUp, distanceMultiplier, preserveDistance

#### `core_vehicle_partFocusCamera.isActive()`

Indicates whether the part camera is active (a vehicle is framed).

- **returns**: boolean true if active

#### `core_vehicle_partFocusCamera.onUpdate(dtReal)`

Per-frame hook: counts down the wait delay (real time, because the configuration menu often runs paused) then applies the request or releases the camera.

- `dtReal` (*number*) : real elapsed time (s)

#### `core_vehicle_partFocusCamera.onVehicleDestroyed(destroyedId)`

Hook: the framed vehicle is destroyed; releases the camera.

- `destroyedId` (*integer*) : vehicle

#### `core_vehicle_partFocusCamera.onVehicleResetted(resettedId)`

Hook: the vehicle is reset; forces an immediate re-measure of the box.

- `resettedId` (*integer*) : vehicle

#### `core_vehicle_partFocusCamera.onVehicleSpawned(spawnedId)`

Hook: the framed vehicle is recreated; keeps the last camera pose.

- `spawnedId` (*integer*) : vehicle

#### `core_vehicle_partFocusCamera.onVehicleSwitched(oldId, newId, player)`

Hook: the driven player leaves the framed vehicle; releases the camera.

- `oldId` (*integer*) : old vehicle
- `newId` (*integer*) : new vehicle
- `player` (*integer*) : player

#### `core_vehicle_partFocusCamera.release(immediate)`

Gives the camera back to the player once the selection stays empty for settleDelay (0.5 s), or immediately.

- `immediate` (*boolean|nil*) : true: releases right away (clear)

#### `core_vehicle_partFocusCamera.updateTarget(dt, cam)`

Called by the partFocus camera mode every frame: periodically re-measures the box, rebuilds the box in world space, draws it and sets the camera's aim point.

- `dt` (*number*) : elapsed time (s)
- `cam` (*table|nil*) : camera mode object (setRef, setDefaultDistance, retarget)

#### `core_vehicle_partFocusCamera.zoomStep(value)`

Adds mouse wheel notches (zoom) to be applied by the camera mode.

- `value` (*number*) : number of notches (sign = direction)

## Fields

| Field | Type | Description |
|---|---|---|
| `debugDrawPivot` | boolean | false by default; true marks the center of the box with a sphere. |
| `dependencies` | string[] | {'core_vehicle_configTarget'} |
| `onExtensionUnloaded` | function | Alias of clear. |
| `onSerialize` | function | Alias of clear. |
| `updateInterval` | number | Box re-measure interval, in seconds (0.1). |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `getInitVertexPos`, `getVertexCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/partFocusCamera.lua`.*
