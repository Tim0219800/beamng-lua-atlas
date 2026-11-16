# `editor_cameraV2_controller`

*File: `lua/ge/extensions/editor/cameraV2/controller.lua` · VM: Game Engine (GE) · 530 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraV2_controller`: `extensions.load("editor_cameraV2_controller")`, then the global `editor_cameraV2_controller`

Camera V2 controller: processes the mouse input routed to Camera V2 and applies it to the existing free camera (core_camera, global "free" camera). It handles mouse panning (right or middle click depending on the swapPanOrbitButtons preference), delegates orbit to editor/cameraV2/orbit and zoom to editor/cameraV2/zoom, animates focus on left double click (centering on the targeted point with an overshoot easing), and sets the planar WASD translation of the free camera. It relies on core/cameraControllerRegistry (acquire/release/isOwner with the id "editor.cameraV2") so that a gesture is handled by only one input path.

## Notes

- The controller is only available if: it is activated (activate()), the editor is active, the editor camera is of type Free and the active global camera is "free", the view is hovered and imgui is not capturing the mouse (cameraAvailable).
- Buttons: by default (swapPanOrbitButtons = true) pan = right button (1), orbit = middle button (2); otherwise pan = middle, orbit = right. The cursor is hidden during a middle-button orbit.
- Mouse panning is limited to a speed of 4000 units/s, ignores mouse deltas > 250 px (cursor jump), and scales pixels according to the distance to the hit point (distance clamped to [1; 5000]) and the FOV.
- Focus (left double click without Ctrl/Shift/Alt, with no active imgui item) lasts between 0.35 and 1 s depending on the lateral distance to travel; the camera stays at its depth, translates laterally, then the orbit pivot is set on the targeted point (source "focus").
- For planar WASD translation, the controller writes to the free camera: planarTranslation, planarTranslationScale, planarTranslationDrag, planarTranslationResponse, planarTranslationSpeedMultiplier, planarTranslationFastSpeedMultiplier. Drag = -ln(0.05) / inertiaDuration.
- In the code, onEditorMouseWheel is an editor hook (wheel value); update() also reads im.GetIO().MouseWheel and the accumulated pendingWheel, and ignores the wheel if the "editorCameraZoom" action is blocked or if editor.disableCameraZoom is true (or Ctrl+Alt).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraV2_controller.activate()` | Activates the controller and cancels any movement in progress. Called by cameraV2 on registration. *(internal)* | 458 |
| `editor_cameraV2_controller.cancel()` | Cancels the current pan, zoom, orbit and focus, resets the pending wheel to zero, shows the cursor again if needed and releases ownership in the controller registry. | 463 |
| `editor_cameraV2_controller.consumeFocusDoubleClick()` | Detects (once per frame, result cached) a valid left double click and, if the raycast hits a reasonable point in front of the camera, starts the focus transition. Also called from cameraV2.consumeFocusDoubleClick so that the editor does not treat this click as a selection. | 291 |
| `editor_cameraV2_controller.deactivate()` | Deactivates the controller, cancels everything and resets the orbit. *(internal)* | 477 |
| `editor_cameraV2_controller.lastZoomUsedTerrainOnly()` | Relays zoom.lastZoomUsedTerrainOnly() (debug). | 483 |
| `editor_cameraV2_controller.onEditorMouseWheel(value)` | Editor wheel hook: if Camera V2 is active, the free camera is active and the view is hovered, cancels pan/orbit/focus, takes over the registry and accumulates the value in pendingWheel for update(). *(hook)* | 346 |
| `editor_cameraV2_controller.onRelativeInput(axis, value, player)` | Relative input hook (mouse movement): if the pan button is held, acquires the registry; if the orbit button is held, passes the axes to orbit.onMouseInput; otherwise blocks or lets the input through depending on the state. Only handles player 0. *(hook)* | 358 |
| `editor_cameraV2_controller.orbitDebugState()` | Relays orbit.getDebugState() (orbit pivot, distance, source, movement in progress) for the debug window. | 487 |
| `editor_cameraV2_controller.panDebugState()` | Pan debug state: hit point and distance to the point, either from the current gesture or from the last planar scale computation. | 491 |
| `editor_cameraV2_controller.setPlanarTranslation(planar)` | Enables or disables WASD translation in the XY plane on the free camera ("pan" WASD mode). Clears residual planar movements and inputs and resets the planarTranslation* parameters of the free camera to zero. | 504 |
| `editor_cameraV2_controller.update(deltaTime)` | Main loop called every frame by cameraV2.onUpdate: updates the planar translation scale, handles the focus double click, the wheel (zoom), controller acquisition, smoothed zoom, pan, orbit and focus, then releases the registry when nothing moves anymore. *(internal)* | 397 |

### Parameter details

#### `editor_cameraV2_controller.consumeFocusDoubleClick()`

Detects (once per frame, result cached) a valid left double click and, if the raycast hits a reasonable point in front of the camera, starts the focus transition. Also called from cameraV2.consumeFocusDoubleClick so that the editor does not treat this click as a selection.

- **returns**: boolean true if the double click was consumed and focus started

#### `editor_cameraV2_controller.lastZoomUsedTerrainOnly()`

Relays zoom.lastZoomUsedTerrainOnly() (debug).

- **returns**: boolean see zoom

#### `editor_cameraV2_controller.onEditorMouseWheel(value)`

Editor wheel hook: if Camera V2 is active, the free camera is active and the view is hovered, cancels pan/orbit/focus, takes over the registry and accumulates the value in pendingWheel for update().

- `value` (*number*) : Wheel notches
- **returns**: boolean true if the event is consumed; false if the controller is inactive or not acquired

#### `editor_cameraV2_controller.onRelativeInput(axis, value, player)`

Relative input hook (mouse movement): if the pan button is held, acquires the registry; if the orbit button is held, passes the axes to orbit.onMouseInput; otherwise blocks or lets the input through depending on the state. Only handles player 0.

- `axis` (*string|integer*) : Relative input axis (passed as is to orbit.onMouseInput)
- `value` (*number*) : Movement value
- `player` (*integer|nil*) : Player index (nil = 0)
- **returns**: boolean true if Camera V2 consumes the input

#### `editor_cameraV2_controller.orbitDebugState()`

Relays orbit.getDebugState() (orbit pivot, distance, source, movement in progress) for the debug window.

- **returns**: table|nil Orbit debug state

#### `editor_cameraV2_controller.panDebugState()`

Pan debug state: hit point and distance to the point, either from the current gesture or from the last planar scale computation.

- **returns**: table|nil {point = vec3, distance = number|nil}, or nil

#### `editor_cameraV2_controller.setPlanarTranslation(planar)`

Enables or disables WASD translation in the XY plane on the free camera ("pan" WASD mode). Clears residual planar movements and inputs and resets the planarTranslation* parameters of the free camera to zero.

- `planar` (*boolean*) : true for planar mode (anything else is false)

#### `editor_cameraV2_controller.update(deltaTime)`

Main loop called every frame by cameraV2.onUpdate: updates the planar translation scale, handles the focus double click, the wheel (zoom), controller acquisition, smoothed zoom, pan, orbit and focus, then releases the registry when nothing moves anymore.

- `deltaTime` (*number|nil*) : Seconds; clamped to [0; 0.05]

## Calls into the engine (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraV2/controller.lua`.*
