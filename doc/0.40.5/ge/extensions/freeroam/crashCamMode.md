# `freeroam_crashCamMode`

*File: `lua/ge/extensions/freeroam/crashCamMode.lua` · VM: Game Engine (GE) · 734 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_crashCamMode`: `extensions.load("freeroam_crashCamMode")`, then the global `freeroam_crashCamMode`

Crash camera (automatic slow motion) of freeroam mode. Every frame, it predicts (0.2 s ahead) whether the player's vehicle will hit a traffic/parked vehicle, a wall (static rays) or suffers a sudden speed change; if the speed difference exceeds 13 m/s, it switches to slow motion (simTimeAuthority 0.15), hides the UI and switches to the 'crash' camera or to a camera path. It then restores the previous speed, UI and camera and emits onCrashCamEnded. Loaded by freeroam_crashCamModeLoader according to the enableCrashCam setting.

## Example

```lua
-- force activation outside freeroam (e.g. for a scenario) and also track non-traffic vehicles
freeroam_crashCamMode.setForcedEnabled(true)
freeroam_crashCamMode.setTrackingMode(2)
```

## Notes

- Constants: speed threshold 13 m/s, minimum delay between two triggers 1 s, duration 4 s, lookahead 0.2 s, bounding boxes reduced to 85%, speed check every 0.1 s (threshold +3 m/s).
- Three crash modes drawn at random: 1 (45%) close camera above, fixed; 2 (45%) ground camera that rotates; 3 (10%, only if more than 5 s since the last crash cam) time frozen while the camera orbits around the impact point via core_paths.playPath. Crashes against a wall or by speed change only use modes 1 and 2.
- Tracking modes (trackingMode): 1 = player against traffic, parked vehicles, walls and speed change; 2 = player against all active vehicles and walls.
- Detection is skipped if: a replay is playing, the free camera is active, the simulation time is not 1, the player has just been teleported or there is no player vehicle.
- Outside the 'freeroam' game state (and without forcedEnabled), onUpdate sets crashCamEnabled to false permanently until the next onClientStartMission in freeroam or the end of a mission (onAnyMissionChanged 'stopped').
- onExtensionLoaded returns false if enableCrashCam is disabled (the extension does not stay loaded in that case, unless the engine ignores the value).
- In VR (render_openxr running), the automatic return to the 'external' camera when the vehicle leaves the field of view is not done.
- rolloverCheck (rollover) is defined but its call is commented out in onUpdate: never used.
- The onCrashCamEnded hook is only emitted if previousCamMode is not nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_crashCamMode.getTrackingMode()` | Returns the current tracking mode. | 707 |
| `freeroam_crashCamMode.onAnyMissionChanged(state)` | Hook called when a mission changes state: disables the crash camera on start ('started'), re-enables it on stop ('stopped'). *(internal)* *(hook)* | 691 |
| `freeroam_crashCamMode.onBeforeBigMapActivated()` | Hook called just before the big map opens: stops the crash camera. *(internal)* *(hook)* | 668 |
| `freeroam_crashCamMode.onBeforeMenuOpened()` | Hook called before a menu opens: stops the crash camera if it is active. *(internal)* *(hook)* | 678 |
| `freeroam_crashCamMode.onClientEndMission(levelPath)` | Hook called at the end of the level: disables the crash camera. *(internal)* *(hook)* | 643 |
| `freeroam_crashCamMode.onClientStartMission()` | Hook called when the level starts: enables the crash camera if the game state is 'freeroam'. *(internal)* *(hook)* | 647 |
| `freeroam_crashCamMode.onExtensionLoaded()` | Hook called on load: returns false if the enableCrashCam setting is disabled. *(internal)* *(hook)* | 653 |
| `freeroam_crashCamMode.onExtensionUnloaded()` | Hook called on unload: cleanly stops the crash camera (restores speed, UI and camera). *(internal)* *(hook)* | 657 |
| `freeroam_crashCamMode.onReplayStateChanged(state)` | Hook called when the replay state changes: stops the crash camera. *(internal)* *(hook)* | 635 |
| `freeroam_crashCamMode.onSerialize()` | Hook called before an extension reload: stops the crash camera. *(internal)* *(hook)* | 639 |
| `freeroam_crashCamMode.onTogglePause()` | Hook called when the game is paused or resumed: stops the crash camera if it is active. *(internal)* *(hook)* | 672 |
| `freeroam_crashCamMode.onUpdate(dtReal, dtSim)` | Hook called every frame: detects imminent crashes (traffic, wall, speed change) when the crash camera is inactive; when it is active, tracks its duration, checks the impact between vehicles, starts the camera path in mode 3 and stops it after 4 s or on teleportation. *(internal)* *(hook)* | 535 |
| `freeroam_crashCamMode.onVehicleResetted(vehId)` | Hook called when a vehicle is put back in place: stops the crash camera if it is the player's vehicle. *(internal)* *(hook)* | 629 |
| `freeroam_crashCamMode.onVehicleSwitched(oldVehId)` | Hook called when the player vehicle changes: if the crash camera is active, puts the previous camera back on the old vehicle, then stops the crash camera. *(internal)* *(hook)* | 684 |
| `freeroam_crashCamMode.setForcedEnabled(enabled)` | Forces the detection to run even outside freeroam or if the crash camera is disabled. | 711 |
| `freeroam_crashCamMode.setTrackingMode(mode)` | Chooses the tracking mode (1 or 2, see notes). | 703 |
| `freeroam_crashCamMode.trackCamMode()` | To be called when the user changes camera mode: stops the crash camera if it is active (no caller in this file). | 662 |
| `freeroam_crashCamMode.trackVehReset()` | Stops the crash camera (called on vehicle reset; unlike onVehicleResetted, does not check which vehicle). | 699 |

### Parameter details

#### `freeroam_crashCamMode.getTrackingMode()`

Returns the current tracking mode.

- **returns**: integer 1 (traffic and walls) or 2 (all active vehicles and walls).

#### `freeroam_crashCamMode.onAnyMissionChanged(state)`

Hook called when a mission changes state: disables the crash camera on start ('started'), re-enables it on stop ('stopped').

- `state` (*string*) : Mission state: 'started' or 'stopped' (other values are ignored).

#### `freeroam_crashCamMode.onClientEndMission(levelPath)`

Hook called at the end of the level: disables the crash camera.

- `levelPath` (*string*) : Path of the level being left (unused).

#### `freeroam_crashCamMode.onExtensionLoaded()`

Hook called on load: returns false if the enableCrashCam setting is disabled.

- **returns**: boolean|nil false if disabled, nil otherwise.

#### `freeroam_crashCamMode.onReplayStateChanged(state)`

Hook called when the replay state changes: stops the crash camera.

- `state` (*string*) : New replay state (unused).

#### `freeroam_crashCamMode.onUpdate(dtReal, dtSim)`

Hook called every frame: detects imminent crashes (traffic, wall, speed change) when the crash camera is inactive; when it is active, tracks its duration, checks the impact between vehicles, starts the camera path in mode 3 and stops it after 4 s or on teleportation.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Simulation elapsed time (s).

#### `freeroam_crashCamMode.onVehicleResetted(vehId)`

Hook called when a vehicle is put back in place: stops the crash camera if it is the player's vehicle.

- `vehId` (*integer*) : Id of the reset vehicle.

#### `freeroam_crashCamMode.onVehicleSwitched(oldVehId)`

Hook called when the player vehicle changes: if the crash camera is active, puts the previous camera back on the old vehicle, then stops the crash camera.

- `oldVehId` (*integer*) : Id of the player's old vehicle.

#### `freeroam_crashCamMode.setForcedEnabled(enabled)`

Forces the detection to run even outside freeroam or if the crash camera is disabled.

- `enabled` (*boolean*) : true to force.

#### `freeroam_crashCamMode.setTrackingMode(mode)`

Chooses the tracking mode (1 or 2, see notes).

- `mode` (*integer*) : 1 or 2.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCrashCamEnded` — listened to by 1 module(s)

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`
- `be:` `getObjectActive`, `getObjectOOBBAxisNormalizedXYZ`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectPositionXYZ`, `getObjectVelocityXYZ`, `getPlayerVehicleID`
- `obj:` `getSpawnWorldOOBB`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/crashCamMode.lua`.*
