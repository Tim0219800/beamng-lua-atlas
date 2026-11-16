# `editor_cameraV2_orbit`

*File: `lua/ge/extensions/editor/cameraV2/orbit.lua` · VM: Game Engine (GE) · 590 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_cameraV2_orbit`: `extensions.load("editor_cameraV2_orbit")`, then the global `editor_cameraV2_orbit`

Camera V2 mouse look, editor style: either rotation in place from the current camera position (mode 0), or orbit around the surface at the view center (mode 1). The orbit is constrained so as not to put the camera under the terrain (binary search on the pitch) and has inertia when the button is released. Used by editor/cameraV2/controller, which passes it the relative mouse inputs and calls update() every frame.

## Notes

- Mode: 1 = orbit around the pivot (orbitAroundViewCenter preference true), any other value = rotation in place.
- Orbit pivot: point hit by Engine.castRay at the view center (source "center hit"), otherwise a virtual point at lastOrbitDistance in front of the camera (source "virtual", 50 m initially, clamped to zoomMinDistance..zoomMaxDistance). A "focus" source is set by setPivot after a double-click focus.
- Pitch limited to ±85°; angular speed limited to 900°/s; mouse deltas > 250 are ignored (cursor jump). Sensitivity: fov * value / 4500, then x10 in degrees.
- Smoothing toward the target: amount = 1 - exp(-zoomResponse * dt). Inertia: the speed decays by 95% in inertiaDuration seconds (preference, clamped to 0.05..2 s).
- An orbit is abandoned if the camera pose no longer matches the expected one (reconcileOrbitTranslation); if only the rotation changed, the pivot is recomputed.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_cameraV2_orbit.cancel()` | Stops the orbit drag and inertia and abandons the rotation in place, keeping the orbit pose. | 576 |
| `editor_cameraV2_orbit.getDebugState()` | Orbit debug state for the Camera V2 Debug window. | 563 |
| `editor_cameraV2_orbit.getPivot()` | Returns a copy of the current orbit pivot. | 528 |
| `editor_cameraV2_orbit.getZoomPivot()` | Returns the pivot if it is real (source other than "virtual"), so that zoom uses it as a fixed focal point. | 532 |
| `editor_cameraV2_orbit.hasPose()` | True if an orbit pose (pivot, distance) is stored. | 524 |
| `editor_cameraV2_orbit.isActive()` | True if an orbit is in progress (drag or inertia) or if a rotation in place is in progress. | 515 |
| `editor_cameraV2_orbit.isOrbitActive()` | True only if an orbit around a pivot is in progress (drag or inertia). | 520 |
| `editor_cameraV2_orbit.markForReacquire()` | Marks the orbit so that a new pivot is recomputed at the next drag start (after a combined WASD movement). | 572 |
| `editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton)` | Receives a relative mouse movement while an orbit button is held. On the initial click, starts the orbit (mode 1) or rotation in place; then accumulates the yaw or pitch input, applied by update(). *(hook)* | 278 |
| `editor_cameraV2_orbit.reset()` | Completely forgets the orbit pose and the rotation in place. | 584 |
| `editor_cameraV2_orbit.setPivot(pivot, source)` | Sets the orbit pivot and recomputes yaw, pitch and distance from the camera position. Cancels drag and inertia. | 536 |
| `editor_cameraV2_orbit.syncDistanceFromCamera()` | Recomputes the orbit geometry (distance, yaw, pitch) from the current camera position while keeping the pivot and the source; used after a zoom toward the pivot. | 553 |
| `editor_cameraV2_orbit.update(mode, mouseButton, deltaTime)` | Advances the rotation in place or the orbit by one frame (smoothing, inertia, terrain constraint) and applies the pose to core_camera (setRotation or setPosRot). *(internal)* | 495 |

### Parameter details

#### `editor_cameraV2_orbit.getDebugState()`

Orbit debug state for the Camera V2 Debug window.

- **returns**: table|nil {source, distance, pivot = vec3, moving = boolean}, or nil without a pose

#### `editor_cameraV2_orbit.getPivot()`

Returns a copy of the current orbit pivot.

- **returns**: vec3|nil pivot, or nil without a pose

#### `editor_cameraV2_orbit.getZoomPivot()`

Returns the pivot if it is real (source other than "virtual"), so that zoom uses it as a fixed focal point.

- **returns**: vec3|nil real pivot or nil

#### `editor_cameraV2_orbit.hasPose()`

True if an orbit pose (pivot, distance) is stored.

- **returns**: boolean true if orbit exists

#### `editor_cameraV2_orbit.isActive()`

True if an orbit is in progress (drag or inertia) or if a rotation in place is in progress.

- **returns**: boolean activity state

#### `editor_cameraV2_orbit.isOrbitActive()`

True only if an orbit around a pivot is in progress (drag or inertia).

- **returns**: boolean orbit state

#### `editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton)`

Receives a relative mouse movement while an orbit button is held. On the initial click, starts the orbit (mode 1) or rotation in place; then accumulates the yaw or pitch input, applied by update().

- `axis` (*string*) : "yaw" for the horizontal axis; any other value is treated as pitch
- `value` (*number*) : Mouse movement; not finite = rejected; |value| > 250 = ignored (but consumed)
- `mode` (*integer*) : 1 = orbit, otherwise rotation in place
- `mouseButton` (*integer*) : Held imgui button (1 right, 2 middle)
- **returns**: boolean true if the input is consumed, false if the button is not active/viewport not hovered

#### `editor_cameraV2_orbit.setPivot(pivot, source)`

Sets the orbit pivot and recomputes yaw, pitch and distance from the camera position. Cancels drag and inertia.

- `pivot` (*vec3*) : New pivot; must be a reasonable point
- `source` (*string|nil*) : Source label (default "focus")
- **returns**: boolean true if applied, false if pivot/camera invalid or distance zero

#### `editor_cameraV2_orbit.syncDistanceFromCamera()`

Recomputes the orbit geometry (distance, yaw, pitch) from the current camera position while keeping the pivot and the source; used after a zoom toward the pivot.

- **returns**: boolean false without an orbit pose or in case of an invalid position

#### `editor_cameraV2_orbit.update(mode, mouseButton, deltaTime)`

Advances the rotation in place or the orbit by one frame (smoothing, inertia, terrain constraint) and applies the pose to core_camera (setRotation or setPosRot).

- `mode` (*integer*) : 1 = orbit, otherwise rotation in place
- `mouseButton` (*integer*) : Orbit imgui button
- `deltaTime` (*number|nil*) : Seconds, clamped to [0; 0.05]

## Calls into the engine (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/cameraV2/orbit.lua`.*
