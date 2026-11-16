# `ui_photomode_camera`

*File: `lua/ge/extensions/ui/photomode/camera.lua` · VM: Game Engine (GE) · 1380 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_camera`: `extensions.load("ui_photomode_camera")`, then the global `ui_photomode_camera`

Photo mode camera: FOV, free camera speed, roll, exposure (auto or manual EV), smoothed movement, visibility of the NodeGrabber's fixed nodes, camera bookmarks (absolute in the world or relative to the player vehicle) and camera presets. The module goes through core_camera (via ui_photomode_shared.getCoreCameraFunction) and commands.setFreeCamera to switch to the free camera, and stores the entry state to restore it when leaving photo mode. It serves as the backend of the photo mode UI camera panel.

## Example

```lua
ui_photomode_camera.setCameraFov(45)
local r = ui_photomode_camera.saveCurrentCameraBookmark()
-- later
ui_photomode_camera.restoreSavedFreeCameraBookmark()
```

## Notes

- The functions return a table. On failure: {ok = false, reason, ...}. On success, the ok field is ABSENT (no ok = true): test res.ok ~= false rather than res.ok.
- Bounds applied by clamping: FOV 10 to 120 degrees (default 60), speed 2 to 300 (default 15), roll -90 to 90 degrees (default 0), manual EV -20 to 20 (default 10).
- Common failure reasons: camera_api_unavailable, camera_mode_unsupported ("path" camera active, or roll outside the free camera), camera_set_failed, camera_mode_switch_failed, bookmark_unavailable, bookmark_invalid, vehicle_unavailable, exposure_settings_unavailable, camera_exposure_patch_empty, nodegrabber_unavailable, preset_level_mismatch.
- Roll can only be changed in the free camera; FOV cannot be changed with the "path" camera.
- A relative bookmark (relativeFreecam mode) stores the camera's position and rotation in the bounding box (OOBB) frame of the player vehicle; an absolute bookmark stores pos (x,y,z), rot (quaternion x,y,z,w) and fov in the world.
- Exposure goes through the scenetree object "PostEffectLocalExposureObject" (fields autoExposure and manualEV).
- At the start of the session, captureNodeGrabberRestoreState hides the NodeGrabber's fixed nodes; restoreNodeGrabberState restores them at the end (visible by default if no getter exists).

**Dependencies (loaded first):** `ui_photomode_shared`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_camera.activateSessionFreeCamera()` | Switches to the free camera at the start of the session (unless the entry camera is "path" or the free camera is already active) and notes that the entry camera must be restored on exit. *(internal)* | 485 |
| `ui_photomode_camera.applyPresetState(state)` | Applies a camera preset: refuses a scene preset from another level (preset_level_mismatch), restores the bookmark or applies FOV and roll, then speed, smoothing and exposure. | 1225 |
| `ui_photomode_camera.buildMetadataState()` | Subset of the state to write into a photo's metadata: pos, rot, fov, speed, yawDeg, pitchDown, rollDeg. | 784 |
| `ui_photomode_camera.buildState()` | Builds the camera state: sessionActive, bookmark availability, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement. | 751 |
| `ui_photomode_camera.captureDefaultPresetState()` | "Default" preset built from the state captured at session entry (fov, roll, speed, smoothing, exposure, levelId), or nil if no session was captured. | 1207 |
| `ui_photomode_camera.captureNodeGrabberRestoreState()` | Stores the visibility of the NodeGrabber's fixed nodes then hides them for the session. *(internal)* | 436 |
| `ui_photomode_camera.capturePresetState(options)` | Camera state to save in a preset. "vehicle" type: bookmark relative to the vehicle (nil if unavailable); "scene" type (default): absolute position and levelId. Also includes speed, smoothMovement, autoExposure, manualEV. | 1170 |
| `ui_photomode_camera.captureRestoreState()` | Captures the camera state at session entry (pos, rot, fov, speed, roll, smoothing, exposure, name of the active camera). Called at the start of a photo mode session. *(internal)* | 467 |
| `ui_photomode_camera.getCameraState()` | Returns the current camera state (same as buildState). | 1166 |
| `ui_photomode_camera.getTemporaryPresetList()` | Converts the scene's CameraBookmark objects (scenetree.findClassObjects) into temporary presets of type camera (id __cameraBookmark_<id>, source cameraBookmark, absolute position). Empty list if the API is unavailable. | 1314 |
| `ui_photomode_camera.resetCameraDefaults()` | Resets to default values: smoothed movement off, speed 15, roll 0, automatic exposure with manual EV 10. Switches to the free camera if necessary. | 1129 |
| `ui_photomode_camera.restoreCameraBookmark(bookmark)` | Moves the free camera to a bookmark (absolute: pos, rot, fov; or relative: offset, rotOffset, fov computed relative to the player vehicle). Switches to the free camera if needed. Accepts a {camera = {...}} bookmark or the content directly. | 985 |
| `ui_photomode_camera.restoreNodeGrabberState()` | Restores the fixed nodes visibility stored at the start of the session. *(internal)* | 452 |
| `ui_photomode_camera.restoreSavedFreeCameraBookmark()` | Restores the saved absolute bookmark. | 1106 |
| `ui_photomode_camera.restoreSavedRelativeCameraBookmark()` | Restores the saved vehicle-relative bookmark; clears it if invalid. | 1117 |
| `ui_photomode_camera.restoreSessionCameraTransformState()` | Puts the free camera back at the position/rotation (and FOV) captured at the start of the session. | 797 |
| `ui_photomode_camera.restoreState()` | Restores the captured entry camera mode, FOV, speed, roll, smoothing and exposure. Called at the end of the session. *(internal)* | 703 |
| `ui_photomode_camera.saveCurrentCameraBookmark()` | Saves the current camera position as the session bookmark: an absolute bookmark, and a bookmark relative to the player vehicle if it can be computed. | 899 |
| `ui_photomode_camera.setCameraExposureState(partialState)` | Changes the camera's exposure: autoExposure (boolean) and/or manualEV (-20 to 20). | 930 |
| `ui_photomode_camera.setCameraFov(value)` | Sets the FOV (clamped to 10-120 degrees). Uses the free camera (id 0) or the player vehicle. Refused with the "path" camera. | 914 |
| `ui_photomode_camera.setCameraRoll(value)` | Sets the free camera's roll (-90 to 90 degrees) keeping the current yaw and pitch. | 969 |
| `ui_photomode_camera.setCameraSmoothMovement(value)` | Enables or disables the free camera's smoothed movement (setting cameraFreeSmoothMovement) and notifies the UI of the settings. | 1349 |
| `ui_photomode_camera.setCameraSpeed(value)` | Sets the camera's movement speed (clamped to 2-300). | 953 |
| `ui_photomode_camera.setNodeGrabberVisible(value)` | Shows or hides the NodeGrabber's fixed nodes (Engine.NodeGrabber_setFixedNodesVisible). | 1329 |

### Parameter details

#### `ui_photomode_camera.applyPresetState(state)`

Applies a camera preset: refuses a scene preset from another level (preset_level_mismatch), restores the bookmark or applies FOV and roll, then speed, smoothing and exposure.

- `state` (*table*) : Preset state
- **returns**: table {state} or {ok = false, reason}

#### `ui_photomode_camera.buildMetadataState()`

Subset of the state to write into a photo's metadata: pos, rot, fov, speed, yawDeg, pitchDown, rollDeg.

- **returns**: table Camera data

#### `ui_photomode_camera.buildState()`

Builds the camera state: sessionActive, bookmark availability, availability (exposure, nodeGrabber, smoothMovement), pos, rot, fov, speed, yawDeg, pitchDown, rollDeg, autoExposure, manualEV, nodeGrabberVisible, smoothMovement.

- **returns**: table Camera state

#### `ui_photomode_camera.captureDefaultPresetState()`

"Default" preset built from the state captured at session entry (fov, roll, speed, smoothing, exposure, levelId), or nil if no session was captured.

- **returns**: table|nil Default state

#### `ui_photomode_camera.capturePresetState(options)`

Camera state to save in a preset. "vehicle" type: bookmark relative to the vehicle (nil if unavailable); "scene" type (default): absolute position and levelId. Also includes speed, smoothMovement, autoExposure, manualEV.

- `options` (*table|nil*) : {cameraPresetType = "vehicle"|"scene"}
- **returns**: table|nil Preset state

#### `ui_photomode_camera.getCameraState()`

Returns the current camera state (same as buildState).

- **returns**: table Camera state

#### `ui_photomode_camera.getTemporaryPresetList()`

Converts the scene's CameraBookmark objects (scenetree.findClassObjects) into temporary presets of type camera (id __cameraBookmark_<id>, source cameraBookmark, absolute position). Empty list if the API is unavailable.

- **returns**: table[] Temporary presets

#### `ui_photomode_camera.resetCameraDefaults()`

Resets to default values: smoothed movement off, speed 15, roll 0, automatic exposure with manual EV 10. Switches to the free camera if necessary.

- **returns**: table {state} or {ok = false, reason}

#### `ui_photomode_camera.restoreCameraBookmark(bookmark)`

Moves the free camera to a bookmark (absolute: pos, rot, fov; or relative: offset, rotOffset, fov computed relative to the player vehicle). Switches to the free camera if needed. Accepts a {camera = {...}} bookmark or the content directly.

- `bookmark` (*table*) : Absolute or relative bookmark
- **returns**: table {state} or {ok = false, reason}

#### `ui_photomode_camera.restoreSavedFreeCameraBookmark()`

Restores the saved absolute bookmark.

- **returns**: table Result of restoreCameraBookmark, or {ok = false, reason = "bookmark_unavailable"}

#### `ui_photomode_camera.restoreSavedRelativeCameraBookmark()`

Restores the saved vehicle-relative bookmark; clears it if invalid.

- **returns**: table Result of restoreCameraBookmark, or {ok = false, reason = "bookmark_unavailable"}

#### `ui_photomode_camera.restoreSessionCameraTransformState()`

Puts the free camera back at the position/rotation (and FOV) captured at the start of the session.

- **returns**: table {state} or {ok = false, reason}

#### `ui_photomode_camera.saveCurrentCameraBookmark()`

Saves the current camera position as the session bookmark: an absolute bookmark, and a bookmark relative to the player vehicle if it can be computed.

- **returns**: table {state} or {ok = false, reason = "camera_state_unavailable", state}

#### `ui_photomode_camera.setCameraExposureState(partialState)`

Changes the camera's exposure: autoExposure (boolean) and/or manualEV (-20 to 20).

- `partialState` (*table*) : {autoExposure?, manualEV?}
- **returns**: table {state} or {ok = false, reason, state}

#### `ui_photomode_camera.setCameraFov(value)`

Sets the FOV (clamped to 10-120 degrees). Uses the free camera (id 0) or the player vehicle. Refused with the "path" camera.

- `value` (*number*) : FOV in degrees
- **returns**: table {value} on success, otherwise {ok = false, reason, value}

#### `ui_photomode_camera.setCameraRoll(value)`

Sets the free camera's roll (-90 to 90 degrees) keeping the current yaw and pitch.

- `value` (*number*) : Roll in degrees
- **returns**: table {value} or {ok = false, reason, value}

#### `ui_photomode_camera.setCameraSmoothMovement(value)`

Enables or disables the free camera's smoothed movement (setting cameraFreeSmoothMovement) and notifies the UI of the settings.

- `value` (*boolean|table*) : Boolean, or table whose smoothMovement field is read
- **returns**: table {value, state} or {ok = false, reason, state}

#### `ui_photomode_camera.setCameraSpeed(value)`

Sets the camera's movement speed (clamped to 2-300).

- `value` (*number*) : Camera speed
- **returns**: table {value} or {ok = false, reason, value}

#### `ui_photomode_camera.setNodeGrabberVisible(value)`

Shows or hides the NodeGrabber's fixed nodes (Engine.NodeGrabber_setFixedNodesVisible).

- `value` (*boolean|table*) : Boolean, or table whose nodeGrabberVisible field is read
- **returns**: table {value, state} or {ok = false, reason, state}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_photomode_shared"} |

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/camera.lua`.*
