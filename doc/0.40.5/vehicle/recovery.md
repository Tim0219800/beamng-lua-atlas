# `recovery`

*File: `lua/vehicle/recovery.lua` · VM: Vehicle · 589 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `recovery`

Vehicle recovery system ("recover" key). While driving, records a history of positions/orientations every 0.2 s (up to 700 points, a point at least 2 m after the previous one). When recovery is held, the vehicle "rewinds" this path at increasing speed (3 -> 20 -> 50 m/s) with a recovery camera and a beam wireframe, then is teleported to the point reached on release. Also handles the "home" point (saveHome/loadHome) and multiplayer mode (server validation).

## Example

```lua
recovery.saveHome()        -- stores the current position as home
recovery.loadHome(false)    -- returns to it
recovery.recoverInPlace()   -- puts the vehicle upright in place
```

## Notes

- Three modes of M.updateGFX: updateGFXRecord (recording, normal mode), updateGFXRecovery (rewind in progress), and nop (before init). init() installs updateGFXRecord.
- Internal settings: recording interval 0.2 s, minimum separation 2 m, rewind speeds 3/20/50 m/s (ramps 2.5 s then 10 s), delay before visual teleport 0.5 s, history 700 points. A segment longer than 20 m (400 m²) cuts the rewind cleanly.
- Without smart spawn: the orientation is straightened if pitch > 80° or roll > 45° (the heading direction is kept). With smart spawn (settings 'enableSmartRecovery', inverted by useAltMode) the teleport goes through spawn.safeTeleport on the GE side.
- M.recoveryHooksOnly = true: start/stopRecovering only emit the GE hooks onStartRecovering / onStopRecovering(0) without touching the vehicle (used in the First Drive tutorial).
- GE hooks emitted: onStartRecovering (start) and onStopRecovering(timer) (end, timer = real duration of the recovery in s). Also calls core_recoveryCamera.beginRecoveryCamera / endRecoveryCamera / setRecoveryCameraPosRot.
- In multiplayer, startRecovering goes through multiplayer_vehicleSync.requestRecoveringBegin; the rest depends on onRecoveringBeginAllowed / onRecoveringBeginDenied, and the final point is validated by requestRecoveringCommit then applied by mpApplyRecoveryPoint.
- Anomaly: M.recoveryPoints is a dequeue (not a simple array); onDeserialized rebuilds it via dequeue.new(v.recoveryPoints). M.homePoint is not declared at initialization (nil until the first saveHome or the first recording point).
- Minor anomaly: in finishStopRecovering the non-MP path calls applyRecoveryPoint(lastRecoveryPoint, useSmartSpawn, nil, player): the player argument is passed in place of moveTraffic (4th parameter), the 3rd parameter player is nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `recovery.afterStopRecovering(timer)` | Finalizes a recovery: resets broken flexmesh beams, releases the nodes fixed by the grabber, displays the appropriate message, closes the camera and emits the GE hook onStopRecovering. *(internal)* | 283 |
| `recovery.beginRecoveringPreview(useAltMode)` | Actually enters rewind mode: creates a starting point, switches updateGFX to updateGFXRecovery, emits the GE hook onStartRecovering. Called by startRecovering or after MP authorization. | 491 |
| `recovery.cancelRecoveringPreview()` | Cancels the current recovery without teleporting: resumes recording, resets the materials and closes the recovery camera. | 260 |
| `recovery.clear()` | Empties the point history, removes homePoint and invalidates the last recovery point. | 50 |
| `recovery.init(path)` | Switches to recording mode, stores the number of beams and precomputes the relative positions of the nodes with respect to the reference node (to draw the wireframe). *(internal)* | 559 |
| `recovery.loadHome(moveTraffic)` | Requests the return to the home point (does nothing if there is none). Goes through multiplayer_vehicleSync.requestLoadHome if present, otherwise calls loadHomeLocal on the vehicle side. | 507 |
| `recovery.loadHomeLocal(moveTraffic)` | Immediately teleports the vehicle to the home point and displays 'vehicle.recovery.loadHome'. Called by loadHome (or the MP server). | 521 |
| `recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic)` | Applies a recovery point validated by the multiplayer server: teleports the vehicle (smart spawn or vehicleSetPositionRotation) then notifies multiplayer_vehicleSync.onVehicleRecoveryApplied. *(internal)* | 180 |
| `recovery.onDeserialized(v)` | Deserialization hook (vehicle Lua reload): merges the saved state into M and rebuilds the recoveryPoints queue. *(internal)* *(hook)* | 56 |
| `recovery.onRecoveringBeginAllowed(requestId, useAltMode)` | Hook called in multiplayer when the server allows the recovery: stores requestId and launches beginRecoveringPreview. *(internal)* *(hook)* | 546 |
| `recovery.onRecoveringBeginDenied()` | Hook called in multiplayer when the server denies the recovery: cancels the waiting state. *(internal)* *(hook)* | 551 |
| `recovery.recoverInPlace()` | Puts the vehicle upright at its current position (recovery point = current state, applied immediately). | 555 |
| `recovery.saveHome(point)` | Stores a home point. Without argument, uses the current position/orientation and displays the message 'vehicle.recovery.saveHome'. | 223 |
| `recovery.startRecovering(useAltMode)` | Starts the recovery (key press). In solo mode directly launches beginRecoveringPreview; in multiplayer first requests authorization from the server. Ignored if already in progress. | 527 |
| `recovery.stopRecovering(player)` | Requests the end of the recovery (key release); the actual stop and the teleport occur at the next updateGFX. | 274 |

### Parameter details

#### `recovery.afterStopRecovering(timer)`

Finalizes a recovery: resets broken flexmesh beams, releases the nodes fixed by the grabber, displays the appropriate message, closes the camera and emits the GE hook onStopRecovering.

- `timer` (*number|string|nil*) : Recovery duration in seconds (default: measured duration).

#### `recovery.beginRecoveringPreview(useAltMode)`

Actually enters rewind mode: creates a starting point, switches updateGFX to updateGFXRecovery, emits the GE hook onStartRecovering. Called by startRecovering or after MP authorization.

- `useAltMode` (*boolean|nil*) : See startRecovering.

#### `recovery.init(path)`

Switches to recording mode, stores the number of beams and precomputes the relative positions of the nodes with respect to the reference node (to draw the wireframe).

- `path` (*string*) : Unused (inferred from code).

#### `recovery.loadHome(moveTraffic)`

Requests the return to the home point (does nothing if there is none). Goes through multiplayer_vehicleSync.requestLoadHome if present, otherwise calls loadHomeLocal on the vehicle side.

- `moveTraffic` (*boolean|nil*) : Passed to spawn.safeTeleport: also move obstructing traffic.

#### `recovery.loadHomeLocal(moveTraffic)`

Immediately teleports the vehicle to the home point and displays 'vehicle.recovery.loadHome'. Called by loadHome (or the MP server).

- `moveTraffic` (*boolean|nil*) : See loadHome.

#### `recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic)`

Applies a recovery point validated by the multiplayer server: teleports the vehicle (smart spawn or vehicleSetPositionRotation) then notifies multiplayer_vehicleSync.onVehicleRecoveryApplied.

- `requestId` (*integer*) : MP request identifier.
- `action` (*string*) : Action name sent back to the server.
- `px` (*number*) : X position (m).
- `py` (*number*) : Y position (m).
- `pz` (*number*) : Z position (m).
- `fx` (*number*) : Front direction X.
- `fy` (*number*) : Front direction Y.
- `fz` (*number*) : Front direction Z.
- `ux` (*number*) : Up direction X.
- `uy` (*number*) : Up direction Y.
- `uz` (*number*) : Up direction Z.
- `useSmartSpawnParam` (*boolean|nil*) : Force/forbid smart spawn (otherwise internal value).
- `player` (*any*) : Player concerned, passed to safeTeleport.
- `moveTraffic` (*boolean|nil*) : Move obstructing traffic.

#### `recovery.onDeserialized(v)`

Deserialization hook (vehicle Lua reload): merges the saved state into M and rebuilds the recoveryPoints queue.

- `v` (*table*) : Saved data.

#### `recovery.onRecoveringBeginAllowed(requestId, useAltMode)`

Hook called in multiplayer when the server allows the recovery: stores requestId and launches beginRecoveringPreview.

- `requestId` (*integer*) : Request identifier.
- `useAltMode` (*boolean|string*) : Alternative mode (true or the string 'true').

#### `recovery.saveHome(point)`

Stores a home point. Without argument, uses the current position/orientation and displays the message 'vehicle.recovery.saveHome'.

- `point` (*table|nil*) : Point {pos, dirFront, dirUp}; current position if nil.

#### `recovery.startRecovering(useAltMode)`

Starts the recovery (key press). In solo mode directly launches beginRecoveringPreview; in multiplayer first requests authorization from the server. Ignored if already in progress.

- `useAltMode` (*boolean|nil*) : Alternative mode: inverts the 'enableSmartRecovery' setting (false by default).

#### `recovery.stopRecovering(player)`

Requests the end of the recovery (key release); the actual stop and the teleport occur at the next updateGFX.

- `player` (*any*) : Player that originated the request, passed to the teleport (inferred from code).

## Fields

| Field | Type | Description |
|---|---|---|
| `recoveryHooksOnly` | boolean | If true, the recovery input only emits the hooks without modifying the vehicle (First Drive tutorial). False by default. |
| `recoveryPoints` | dequeue | History of recovery points ({pos=vec3, dirFront=vec3, dirUp=vec3}), from oldest (left) to newest (right). |
| `updateGFX` | function | nop at load, then replaced by updateGFXRecord (recording) or updateGFXRecovery (rewind). ⚠ nop reference not defined in the file (game global). |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getId`, `getPositionXYZ`, `getRealdt`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/recovery.lua`.*
