# `core_recoveryCamera`

*File: `lua/ge/extensions/core/recoveryCamera.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_recoveryCamera`: `extensions.load("core_recoveryCamera")`, then the global `core_recoveryCamera`

Temporary free camera during a vehicle's "recovery" (rewind/respawn). beginRecoveryCamera switches the player seated in that vehicle to free camera, setRecoveryCameraPosRot moves it, endRecoveryCamera restores the game camera. If the player was already in free camera, nothing is changed. In practice called from the vehicle's recovery code.

## Example

```lua
core_recoveryCamera.beginRecoveryCamera(vid)
core_recoveryCamera.setRecoveryCameraPosRot(vid, x, y, z, qx, qy, qz, qw)
core_recoveryCamera.endRecoveryCamera(vid)
```

## Notes

- The player is found among core_multiseat.getPlayers() (or {0}) via be:getPlayerVehicleID; if nobody is seated in the vehicle, nothing happens.
- In multiseat mode, the recovery camera is only active if core_camera.getContextIdForPlayer(player) exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_recoveryCamera.beginRecoveryCamera(vehicleId)` | Starts the recovery camera for the player seated in the vehicle: remembers whether it was already in free camera, otherwise calls commands.setFreeCamera(player). | 27 |
| `core_recoveryCamera.endRecoveryCamera(vehicleId)` | Ends the recovery: forgets the state and puts the game camera back (commands.setGameCamera) if the free camera had been enabled by beginRecoveryCamera. | 45 |
| `core_recoveryCamera.onDespawnObject(vehicleId)` | Hook called when an object is deleted: forgets a recovery in progress for this vehicle. *(internal)* *(hook)* | 52 |
| `core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw)` | Places the player's camera (core_camera.setPosRot). No effect if no recovery is active for this vehicle or if the player was already in free camera. | 38 |

### Parameter details

#### `core_recoveryCamera.beginRecoveryCamera(vehicleId)`

Starts the recovery camera for the player seated in the vehicle: remembers whether it was already in free camera, otherwise calls commands.setFreeCamera(player).

- `vehicleId` (*integer*) : Id of the vehicle in recovery.

#### `core_recoveryCamera.endRecoveryCamera(vehicleId)`

Ends the recovery: forgets the state and puts the game camera back (commands.setGameCamera) if the free camera had been enabled by beginRecoveryCamera.

- `vehicleId` (*integer*) : Vehicle id.

#### `core_recoveryCamera.onDespawnObject(vehicleId)`

Hook called when an object is deleted: forgets a recovery in progress for this vehicle.

- `vehicleId` (*integer*) : Id of the deleted object.

#### `core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw)`

Places the player's camera (core_camera.setPosRot). No effect if no recovery is active for this vehicle or if the player was already in free camera.

- `vehicleId` (*integer*) : Vehicle id.
- `px` (*number*) : Position x (m).
- `py` (*number*) : Position y (m).
- `pz` (*number*) : Position z (m).
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/recoveryCamera.lua`.*
