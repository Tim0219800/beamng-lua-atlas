# `ui_liveries_camera`

*File: `lua/ge/extensions/ui/liveries/camera.lua` · VM: Game Engine (GE) · 467 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_camera`: `extensions.load("ui_liveries_camera")`, then the global `ui_liveries_camera`

Drives the livery editor camera: preset views around the vehicle (top, left, right, back, front), framing the camera on a decal's angle, and a "transform" mode where the camera switches to free camera or orbit while placing a decal. Movements are run in jobs (core_jobsystem) because the camera needs a frame to update. Used by the livery UI via ui_liveries_camera.

## Notes

- A running camera job is cancelled as soon as a new request arrives (activeRequestId is used to ignore stale jobs).
- setView emits the UI event "liveries_camera_viewApplied" with { view = id } after a fixed 0.35 s delay, because the orbit has no completion callback (see core/cameraModes/orbit.lua).
- Orbit rotations are vec3 in degrees (yaw, pitch, roll): top (90,-90,0), left (-90,0,0), right (90,0,0), back (0,0,0), front (180,0,0).
- A decal is considered "orthographic" if its camera direction is within 0.98 dot product of one of the six axes (top, left, right, back, front); it is then framed on the matching preset view.
- In transform mode, if mouse placement is active (editor_api_dynamicDecals.isUseMousePos), the camera stays in orbit; otherwise it switches to free camera.
- Free camera movement is multiplied by 0.1 when ui_liveries_decal.getSmallIncrements() is true.
- The code contains a TODO comment indicating that captureCameraName is probably a guard that has become useless.

**Dependencies (loaded first):** `editor_api_dynamicDecals`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_camera.activateOrbitMode()` | Switches to the game camera and enables player 0's orbit camera. | 157 |
| `ui_liveries_camera.ensureTransformOrbitMode()` | Forces the camera into orbit during a transform. If it was free, cancels the jobs, stops the movement and, for an existing decal, puts the orbit back on its angle. | 383 |
| `ui_liveries_camera.getViews()` | Returns the list of preset views for the UI. | 137 |
| `ui_liveries_camera.moveLeftRight(value, filterType, player)` | Left/right axis input during a transform. In free camera, moves sideways; in orbit, rotates the yaw (rotate_yaw). No effect outside a transform. | 456 |
| `ui_liveries_camera.orbitToLayer(layerUid)` | Frames the orbit camera on a decal: preset view if the decal is orthographic, otherwise rotates the orbit to the decal's angle without touching the distance. | 246 |
| `ui_liveries_camera.panToLayer(layerUid)` | Places the free camera at the position and orientation stored in the decal (camPosition, camDirection converted to the vehicle's world frame). | 232 |
| `ui_liveries_camera.panUpDown(value, filterType, player)` | Up/down axis input during a transform. In free camera, moves up (positive value) or down (negative value); in orbit, rotates the pitch (rotate_pitch). No effect outside a transform. | 438 |
| `ui_liveries_camera.previewLayer(layerUid)` | Previews a decal: preset view if it is orthographic, otherwise restores the exact angle (free camera: decal pose; orbit active: direct rotation; other camera: switches to orbit). | 265 |
| `ui_liveries_camera.setView(viewId)` | Applies a preset view: switches back to the game camera in orbit mode, sets the vehicle's default rotation then resets the camera, in a job. Triggers liveries_camera_viewApplied at the end. | 145 |
| `ui_liveries_camera.setup()` | Starts the module: stores the player vehicle's current default orbit rotation to restore it later. No effect if already started. | 112 |
| `ui_liveries_camera.startTransform()` | Starts transform mode for a new decal: stores the current camera, then keeps the orbit (mouse placement) or switches to free camera. No effect if a transform is already active. | 329 |
| `ui_liveries_camera.startTransformAtLayer(layerUid)` | Starts transform mode on an existing decal: stores the current camera, then frames the decal in orbit (mouse placement) or in free camera. | 300 |
| `ui_liveries_camera.stopTransform()` | Ends the transform: cancels the jobs, stops the movements and rotations, switches back to the game camera, restores the stored camera and orbit rotation, then resets the camera. | 404 |
| `ui_liveries_camera.teardown()` | Stops the module: ends the current transform (stopTransform), cancels the camera job, and restores the default orbit rotation stored by setup. No effect if the module is not started. | 121 |
| `ui_liveries_camera.toggleTransformCameraMode()` | Toggles between free camera and orbit camera during a transform. | 387 |

### Parameter details

#### `ui_liveries_camera.activateOrbitMode()`

Switches to the game camera and enables player 0's orbit camera.

- **returns**: boolean Always true.

#### `ui_liveries_camera.ensureTransformOrbitMode()`

Forces the camera into orbit during a transform. If it was free, cancels the jobs, stops the movement and, for an existing decal, puts the orbit back on its angle.

- **returns**: boolean false if no transform is active, otherwise true.

#### `ui_liveries_camera.getViews()`

Returns the list of preset views for the UI.

- **returns**: table[] Items { id, labelKey, icon } for top, left, right, back, front.

#### `ui_liveries_camera.moveLeftRight(value, filterType, player)`

Left/right axis input during a transform. In free camera, moves sideways; in orbit, rotates the yaw (rotate_yaw). No effect outside a transform.

- `value` (*number*) : Signed axis value.
- `filterType` (*any*) : Input filter type passed to core_camera.rotate_yaw.
- `player` (*any*) : Player passed to core_camera.rotate_yaw (inferred from code).

#### `ui_liveries_camera.orbitToLayer(layerUid)`

Frames the orbit camera on a decal: preset view if the decal is orthographic, otherwise rotates the orbit to the decal's angle without touching the distance.

- `layerUid` (*string*) : Uid of a decal layer with a camera pose.
- **returns**: boolean false if the layer is unusable.

#### `ui_liveries_camera.panToLayer(layerUid)`

Places the free camera at the position and orientation stored in the decal (camPosition, camDirection converted to the vehicle's world frame).

- `layerUid` (*string*) : Uid of a decal-type layer with a camera pose.
- **returns**: boolean false if the layer is not found or has no camera pose.

#### `ui_liveries_camera.panUpDown(value, filterType, player)`

Up/down axis input during a transform. In free camera, moves up (positive value) or down (negative value); in orbit, rotates the pitch (rotate_pitch). No effect outside a transform.

- `value` (*number*) : Signed axis value.
- `filterType` (*any*) : Input filter type passed to core_camera.rotate_pitch.
- `player` (*any*) : Player passed to core_camera.rotate_pitch (inferred from code).

#### `ui_liveries_camera.previewLayer(layerUid)`

Previews a decal: preset view if it is orthographic, otherwise restores the exact angle (free camera: decal pose; orbit active: direct rotation; other camera: switches to orbit).

- `layerUid` (*string*) : Uid of a decal layer with a camera pose.
- **returns**: boolean false if the layer is unusable.

#### `ui_liveries_camera.setView(viewId)`

Applies a preset view: switches back to the game camera in orbit mode, sets the vehicle's default rotation then resets the camera, in a job. Triggers liveries_camera_viewApplied at the end.

- `viewId` (*string*) : "top", "left", "right", "back" or "front".
- **returns**: boolean false (with a warning) if the view is unknown, otherwise true.

#### `ui_liveries_camera.startTransformAtLayer(layerUid)`

Starts transform mode on an existing decal: stores the current camera, then frames the decal in orbit (mouse placement) or in free camera.

- `layerUid` (*string*) : Uid of the decal to edit.
- **returns**: boolean false if a transform is already active or the layer is unusable.

#### `ui_liveries_camera.toggleTransformCameraMode()`

Toggles between free camera and orbit camera during a transform.

- **returns**: boolean false if no transform is active, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this one: editor_api_dynamicDecals. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/camera.lua`.*
