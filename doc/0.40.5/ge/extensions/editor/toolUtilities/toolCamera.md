# `editor_toolUtilities_toolCamera`

*File: `lua/ge/extensions/editor/toolUtilities/toolCamera.lua` · VM: Game Engine (GE) · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_toolCamera`: `extensions.load("editor_toolUtilities_toolCamera")`, then the global `editor_toolUtilities_toolCamera`

Reusable tool camera: takes over the editor camera with BeamNG's script-driven 'scriptedFree' camera, drives it every frame with right-button drag and the wheel in the viewport (via cameraRig), and starts smoothed (smoothstep) transitions to a "pan" (top-down view) or "orbit" framing. While it drives, it blocks the editorCameraZoom and changeCameraSpeed actions in the 'toolCameraZoom' filter group.

## Example

```lua
local cam = require('editor/toolUtilities/toolCamera')
cam.takeOver()
cam.flyOrbit(x, y, z, 20)
-- every frame: cam.drive(false)
-- on exit: cam.handBack(true)
```

## Notes

- flyPan, flyOrbit and recenterOrbit do nothing until takeOver has been called (active == false).
- Flight duration: from 1 s to 2 s depending on distance (2 s from 400 m) when `time` is nil.
- recenterOrbit glides in 0.5 s by default.
- The right button drives the camera; the left button stays free for the tool.
- In pan mode the camera stays within the terrain footprint (one-cell margin) and floats at a constant height above the average terrain in view.
- drive does nothing while a camera animation is in progress.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_toolCamera.drive(blocked)` | Interactive per-frame driving: collects the right-button drag and the wheel in the viewport (ignored if the UI or a busy state declared by the host captures the mouse) and applies the cameraRig pose to scriptedFree. Forces the cursor to be shown during the drag so that MouseDelta keeps being populated. | 183 |
| `editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time)` | Flight to an ORBIT framing on (x, y, z). `radius` sizes the pull-back to frame the subject properly; yaw and pitch replace the default 3/4 angle (to approach a detail from a known outside direction). | 160 |
| `editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time)` | Flight to a top-down PAN framing. The point is held within the terrain footprint. If groundZ is absent, the ground height is sampled from the terrain. | 137 |
| `editor_toolUtilities_toolCamera.handBack(animate)` | Gives the editor camera back: unblocks the wheel and returns to the remembered global camera. No effect if not driving. | 121 |
| `editor_toolUtilities_toolCamera.isActive()` | True if the module is driving scriptedFree. | 132 |
| `editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time)` | Glides the orbit PIVOT to (x, y, z) while KEEPING yaw, pitch and distance: the gentle "recenter on what I just selected" gesture, unlike flyOrbit which reframes at 3/4. | 172 |
| `editor_toolUtilities_toolCamera.takeOver()` | Takes over the editor camera: remembers the global camera and its pose, switches to 'scriptedFree' (locked, driveRot) at the same pose and blocks the standard zoom wheel. No effect if already active or without core_camera. | 96 |

### Parameter details

#### `editor_toolUtilities_toolCamera.drive(blocked)`

Interactive per-frame driving: collects the right-button drag and the wheel in the viewport (ignored if the UI or a busy state declared by the host captures the mouse) and applies the cameraRig pose to scriptedFree. Forces the cursor to be shown during the drag so that MouseDelta keeps being populated.

- `blocked` (*boolean|nil*) : True: do not move the camera (modal interaction of the tool).

#### `editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time)`

Flight to an ORBIT framing on (x, y, z). `radius` sizes the pull-back to frame the subject properly; yaw and pitch replace the default 3/4 angle (to approach a detail from a known outside direction).

- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- `z` (*number*) : World Z.
- `radius` (*number|nil*) : Radius of the subject.
- `yaw` (*number|nil*) : Imposed yaw.
- `pitch` (*number|nil*) : Imposed pitch.
- `time` (*number|nil*) : Duration in seconds (nil = depending on distance).

#### `editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time)`

Flight to a top-down PAN framing. The point is held within the terrain footprint. If groundZ is absent, the ground height is sampled from the terrain.

- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- `groundZ` (*number|nil*) : Ground altitude under the point.
- `height` (*number|nil*) : Absolute target altitude for the camera.
- `time` (*number|nil*) : Duration in seconds (0 = immediate jump, nil = depending on distance).

#### `editor_toolUtilities_toolCamera.handBack(animate)`

Gives the editor camera back: unblocks the wheel and returns to the remembered global camera. No effect if not driving.

- `animate` (*boolean*) : True: first returns to the pose remembered by a smoothed flight before handing back.

#### `editor_toolUtilities_toolCamera.isActive()`

True if the module is driving scriptedFree.

- **returns**: boolean Active state.

#### `editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time)`

Glides the orbit PIVOT to (x, y, z) while KEEPING yaw, pitch and distance: the gentle "recenter on what I just selected" gesture, unlike flyOrbit which reframes at 3/4.

- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- `z` (*number*) : World Z.
- `time` (*number|nil*) : Duration in seconds (0.5 by default).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/toolCamera.lua`.*
