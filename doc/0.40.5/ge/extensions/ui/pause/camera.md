# `ui_pause_camera`

*File: `lua/ge/extensions/ui/pause/camera.lua` · VM: Game Engine (GE) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_camera`: `extensions.load("ui_pause_camera")`, then the global `ui_pause_camera`

Automatic orbit camera of the pause menu: intended to switch the player's camera to orbit mode and make it rotate slowly around the vehicle during the pause, then restore the original camera and orbit state. It stops if the player rotates the camera by hand. In 0.40.5, this feature is disabled in the code.

## Notes

- Disabled: start, stop, beginPauseSession and endPauseSession begin with `if true then return end`, so they do nothing and return nil (the code after this return is dead). The local variable beginPauseSession is never executed either.
- onUpdate does nothing while state.active is false, which is always the case here.
- If the code were active: orbit speed of -5.5 degrees/s on the x axis of camRot (yaw, normalized in [-180, 180]); stops if core_camera.timeSinceLastRotation decreases (manual rotation) or if the active camera is no longer "orbit".

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_camera.beginPauseSession()` | Intended to store the camera, vehicle and orbit state at the start of the pause. No effect in 0.40.5 (immediate return). | 155 |
| `ui_pause_camera.debugState()` | Returns a deep copy of the internal state (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) for debugging. | 214 |
| `ui_pause_camera.endPauseSession()` | Intended to stop the orbit and restore the camera and orbit state from before the pause. No effect in 0.40.5 (immediate return). | 160 |
| `ui_pause_camera.onUpdate(dtReal)` | Hook called every frame; rotates the orbit camera around the player vehicle if the session is active. No effect while start is disabled. *(internal)* *(hook)* | 181 |
| `ui_pause_camera.start()` | Intended to switch the player's camera to orbit and start the automatic rotation. No effect in 0.40.5 (immediate return). | 114 |
| `ui_pause_camera.stop()` | Intended to stop the automatic rotation and return to the previous camera. No effect in 0.40.5 (immediate return). | 136 |

### Parameter details

#### `ui_pause_camera.debugState()`

Returns a deep copy of the internal state (pauseSessionActive, active, orbiting, stoppedByManualInput, previousCameraName, etc.) for debugging.

- **returns**: table Copy of the state.

#### `ui_pause_camera.onUpdate(dtReal)`

Hook called every frame; rotates the orbit camera around the player vehicle if the session is active. No effect while start is disabled.

- `dtReal` (*number*) : Real time elapsed since the previous frame, in seconds.

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/camera.lua`.*
