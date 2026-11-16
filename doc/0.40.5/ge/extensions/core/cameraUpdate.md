# `core_cameraUpdate`

*File: `lua/ge/extensions/core/cameraUpdate.lua` · VM: Game Engine (GE) · 318 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_cameraUpdate`: `extensions.load("core_cameraUpdate")`, then the global `core_cameraUpdate`

Per-frame camera update loop, separate from core/camera.lua. It processes the player's main view then the extra render contexts (split screen, video streams): fills camData (position, velocity, dt, tracked vehicle), calls the selected camera mode (global camera or vehicle camera), then the "running" cameras (filters), and copies the result into finalCameraData. core_camera injects its state via setup() and exposes onPreRender / onClientPostStartMission as its own callbacks; a modder does not normally call anything here.

## Notes

- Emitted hooks: onCameraChanged(player, camName, vehId) when the camera name or vehicle changes for a context (player is 0 if the context has no player); onCameraPreRender(camData) only on the main view and only when a global camera's update() succeeded.
- If the camera computations give NaN/inf, the last valid pose is reused and the mode is reset via cam:init() (error log).
- Cascading fallback: missing vehicle camera -> "orbit" -> free camera (commands.setFreeCamera() on the main view; on an extra context, the context's 'free' global camera).
- camData.dt is multiplied by cameraM.speedFactor (dtSim, dtReal, dtRaw too). On the main view, the sun shadow distance is 0.5 when driving (attached camera) and 1.0 with a global camera.
- The SSAO radius goes to 0.5 when the camera is inside the vehicle (and 1.5 outside), except in bigMap mode.
- The default nearClip comes from theLevelInfo.nearClip, otherwise 0.1; the default fov is 60.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_cameraUpdate.onClientPostStartMission()` | Hook called after a level starts: forgets the level's nearClip and the camera's inside/outside state so that the SSAO radius is reapplied. *(internal)* *(hook)* | 79 |
| `core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw)` | Called every frame before rendering (via core_camera): updates the main view then each extra context. Does nothing while levelLoaded is false. *(internal)* *(hook)* | 308 |
| `core_cameraUpdate.setup(deps)` | Receives from core/camera.lua its state tables and utility functions (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Called once by core_camera. *(internal)* | 22 |

### Parameter details

#### `core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw)`

Called every frame before rendering (via core_camera): updates the main view then each extra context. Does nothing while levelLoaded is false.

- `dtReal` (*number*) : smoothed render dt, in seconds
- `dtSim` (*number*) : smoothed simulation dt (accounts for slow motion/pause), in seconds
- `dtRaw` (*number*) : raw render dt, real clock, in seconds

#### `core_cameraUpdate.setup(deps)`

Receives from core/camera.lua its state tables and utility functions (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Called once by core_camera.

- `deps` (*table*) : Table of dependencies injected by core_camera, keys listed above.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCameraChanged` — listened to by 3 module(s)
- `onCameraPreRender` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraUpdate.lua`.*
