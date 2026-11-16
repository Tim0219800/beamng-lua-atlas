# `util_photomodeAttach`

*File: `lua/ge/extensions/util/photomodeAttach.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_photomodeAttach`: `extensions.load("util_photomodeAttach")`, then the global `util_photomodeAttach`

Attaches the free camera to the player's vehicle during photo mode: the camera keeps its offset relative to the vehicle and follows it every frame (onPreRender). Optionally, it also follows the vehicle's rotation, in yaw only, without pitch or roll. Only works if the active camera is the "free" free camera.

## Example

```lua
extensions.util_photomodeAttach.enable(true, {followRotation = true})
```

## Notes

- enable silently disables the attachment (M.enabled = false) if the active camera is not "free", if there is no player vehicle or if its position/rotation cannot be found.
- The vehicle position is that of the reference node (getRefNodeAbsPositionXYZ) when it exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_photomodeAttach.enable(en, opts)` | Enables or disables the attachment. On activation, stores the free camera's current offset relative to the player vehicle (and its relative orientation if followRotation). | 50 |
| `util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw)` | Hook called every frame before rendering: repositions the camera relative to the vehicle. *(internal)* *(hook)* | 134 |
| `util_photomodeAttach.syncCameraToVehicle()` | Immediately applies the stored transform to the camera (same processing as done every frame). No effect if the attachment is inactive. | 100 |

### Parameter details

#### `util_photomodeAttach.enable(en, opts)`

Enables or disables the attachment. On activation, stores the free camera's current offset relative to the player vehicle (and its relative orientation if followRotation).

- `en` (*boolean*) : true to enable, any other value disables
- `opts` (*table|nil*) : Options: followRotation (boolean) to follow the vehicle's yaw

#### `util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw)`

Hook called every frame before rendering: repositions the camera relative to the vehicle.

- `dtReal` (*number*) : Real-time delta in seconds (unused)
- `dtSim` (*number*) : Simulation time delta (unused)
- `dtRaw` (*number*) : Raw time delta (unused)

## Fields

| Field | Type | Description |
|---|---|---|
| `enabled` | boolean | true while the attachment is active |
| `followRotation` | boolean | true if the camera also follows the vehicle's yaw |
| `offsetLocal` | vec3|nil | Offset in the vehicle frame, yaw only (rotation mode) |
| `offsetWorld` | vec3|nil | Camera-to-vehicle offset in world frame (no-rotation mode) |
| `rotOffset` | quat|nil | Camera rotation relative to the vehicle's yaw |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/photomodeAttach.lua`.*
