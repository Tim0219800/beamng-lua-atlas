# `core_camera.test`

*File: `lua/ge/extensions/core/camera.test.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_camera.test`: `extensions.load("core_camera.test")`, then the global `core_camera.test`

Unit tests of the camera system, for the game's test framework. Run from the GE Lua console: extensions.testFramework_TestManager:runTestFiles('camera'). Each testXxx function receives a context ctx (assert, assertEqual). Among other things it checks the camera group ring, the membership of free cameras in the 'world' group, the Drone Chase camera, the 'occupant' driver camera and the presence of the free camera configuration API. Useful as a usage example of core_camera.

## Example

```lua
extensions.testFramework_TestManager:runTestFiles('camera')
```

## Notes

- Loads core_camera on demand (extensions.load) if it is not loaded.
- The tests document behaviors: nextCameraGroup({'world'}, nil) -> 'world', ('world') -> nil, (false) -> nil; free, smoothFree and steadycam are in the 'world' group; the droneChase mode is vehicle-bound, visible in the options and disabled by default; a legacy 'driver' camera becomes an 'occupant' mode with seatSide 'right' if rightHandCamera.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_camera.test.testCameraGroupRing(ctx)` | Tests core_camera.nextCameraGroup: game cameras to free cameras to game cameras. *(internal)* | 11 |
| `core_camera.test.testDroneIsRegularCamera(ctx)` | Checks the core/cameraModes/droneChase mode: not global, not hidden, disabled by default. *(internal)* | 25 |
| `core_camera.test.testFreeCameraConfigurationApi(ctx)` | Checks that core_camera exposes getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById and setCameraByNameFromOptions. *(internal)* | 43 |
| `core_camera.test.testFreeCameraModes(ctx)` | Checks that the free, smoothFree and steadycam cameras belong to the 'world' group. *(internal)* | 18 |
| `core_camera.test.testLegacyDriverIsOccupant(ctx)` | Checks the conversion of a legacy 'driver' camera into an occupant mode (node 5, 'right' side, right shoulder at 0.6 m). *(internal)* | 32 |

### Parameter details

#### `core_camera.test.testCameraGroupRing(ctx)`

Tests core_camera.nextCameraGroup: game cameras to free cameras to game cameras.

- `ctx` (*table*) : Test context (assert, assertEqual)

#### `core_camera.test.testDroneIsRegularCamera(ctx)`

Checks the core/cameraModes/droneChase mode: not global, not hidden, disabled by default.

- `ctx` (*table*) : Test context

#### `core_camera.test.testFreeCameraConfigurationApi(ctx)`

Checks that core_camera exposes getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById and setCameraByNameFromOptions.

- `ctx` (*table*) : Test context

#### `core_camera.test.testFreeCameraModes(ctx)`

Checks that the free, smoothFree and steadycam cameras belong to the 'world' group.

- `ctx` (*table*) : Test context

#### `core_camera.test.testLegacyDriverIsOccupant(ctx)`

Checks the conversion of a legacy 'driver' camera into an occupant mode (node 5, 'right' side, right shoulder at 0.6 m).

- `ctx` (*table*) : Test context

**Loads extensions:** `core_camera`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/camera.test.lua`.*
