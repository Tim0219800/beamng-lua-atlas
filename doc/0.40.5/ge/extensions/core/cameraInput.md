# `core_cameraInput`

*File: `lua/ge/extensions/core/cameraInput.lua` · VM: Game Engine (GE) · 199 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_cameraInput`: `extensions.load("core_cameraInput")`, then the global `core_cameraInput`

Handlers for the player's camera inputs (look, move, zoom, absolute 3D mouse/SpaceMouse axes), extracted from core/camera.lua. It is not an extension: camera.lua does require('core/cameraInput'), injects moveFor and getFovDeg into it via setup(), then re-exposes these functions on core_camera (input actions call core_camera.rotate_yaw, etc.). They write to the player's MoveManager structure (fields yawLeft, yawRight, pitchUp, pitchDown, rollLeft, rollRight, forward, backward, left, right, up, down, zoomIn, zoomOut, yawRelative, pitchRelative, rollRelative, absXAxis, absYAxis, absZAxis), which the camera modes then read.

## Example

```lua
-- Normally called by the input bindings:
core_camera.rotate_yaw(0.5, FILTER_PAD, 0)  -- turn right at 50%
core_camera.moveforward(1, 0)
```

## Notes

- The player argument is the player index (0 by default); moveFor(player) returns the MoveManager structure of that player's view.
- 'Relative' rotations (mouse) are scaled by the field of view: delta = fovDeg * val / 4500.
- For 3D absolute axes: rotation factor 0.0005, translation factor 0.02; the value is the difference between the previous and the new value (so a delta).
- yAxisMoveStep moves forward at speed val for 0.05 s (tickAbsAxes then resets the axes to 0).
- yAxisMoveStep has no effect if editor.disableCameraZoom is true or if a cameraControllerRegistry controller consumes onEditorMouseWheel.
- Inconsistency: yawAbs/rollAbs/pitchAbs/xAxisAbs/yAxisAbs/zAxisAbs write to the global MoveManager (not to moveFor(player)): they therefore do not handle multiple players.
- Inconsistency: the moveleft/moveright/moveforward/... functions (lowercase) assign the value directly, whereas moveForwardBackward/moveLeftRight handle a signed axis.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_cameraInput.cameraZoom(val, player)` | Signed zoom axis: val > 0 sets zoomIn, otherwise zoomOut = -val. | 123 |
| `core_cameraInput.getLastCameraMovementType()` | Type of the last camera rotation: 'absolute' (axes/keys), 'relative' (mouse) or 'none'. | 35 |
| `core_cameraInput.getLastFilter()` | Last input source type used to rotate the camera (FILTER_KBD keyboard, FILTER_PAD gamepad, FILTER_MOUSE mouse). Read by the camera modes and the UI. | 22 |
| `core_cameraInput.moveForwardBackward(val, player)` | Signed forward/backward axis: val > 0 sets forward, otherwise backward = -val. | 101 |
| `core_cameraInput.moveLeftRight(val, player)` | Signed left/right axis: val > 0 sets right, otherwise left = -val. | 112 |
| `core_cameraInput.movebackward(val, player)` | Move-backward key: sets moveFor(player).backward. | 156 |
| `core_cameraInput.movedown(val, player)` | Move-down key: sets moveFor(player).down. | 158 |
| `core_cameraInput.moveforward(val, player)` | Move-forward key: sets moveFor(player).forward. | 155 |
| `core_cameraInput.moveleft(val, player)` | Move-left key (free camera or driver seat adjustment): sets moveFor(player).left. | 153 |
| `core_cameraInput.moveright(val, player)` | Move-right key: sets moveFor(player).right. | 154 |
| `core_cameraInput.moveup(val, player)` | Move-up key: sets moveFor(player).up. | 157 |
| `core_cameraInput.pitchAbs(val)` | Absolute pitch axis (3D mouse), same principle on pitchRelative. | 167 |
| `core_cameraInput.rollAbs(val)` | Absolute roll axis (3D mouse), same principle as yawAbs on rollRelative. | 166 |
| `core_cameraInput.rotate_pitch(val, filter, player)` | Signed pitch axis: val > 0 sets pitchUp and cancels pitchDown, otherwise the opposite. | 76 |
| `core_cameraInput.rotate_pitch_down(val, filter, player)` | Sets the pitch-down input. | 70 |
| `core_cameraInput.rotate_pitch_relative(val, player)` | Relative (mouse) pitch rotation, same principle as rotate_yaw_relative with 'pitch'. | 143 |
| `core_cameraInput.rotate_pitch_up(val, filter, player)` | Sets the pitch-up input. | 64 |
| `core_cameraInput.rotate_roll_left(val, filter, player)` | Sets the roll-left input. | 95 |
| `core_cameraInput.rotate_roll_right(val, filter, player)` | Sets the roll-right input. | 89 |
| `core_cameraInput.rotate_yaw(val, filter, player)` | Signed yaw axis: val > 0 sets yawRight and cancels yawLeft, val <= 0 the opposite. | 51 |
| `core_cameraInput.rotate_yaw_left(val, filter, player)` | Sets the left yaw input and stores the filter and the rotation time. | 39 |
| `core_cameraInput.rotate_yaw_relative(val, player)` | Relative (mouse) yaw rotation. First offers the event to the controller registry (onRelativeInput 'yaw'); if not consumed, adds fov*val/4500 to yawRelative. | 134 |
| `core_cameraInput.rotate_yaw_right(val, filter, player)` | Sets the right yaw input. | 45 |
| `core_cameraInput.setup(deps)` | Dependency injection by camera.lua: functions moveFor(player) and getFovDeg(). *(internal)* | 15 |
| `core_cameraInput.tickAbsAxes(dtReal)` | Called every frame by the main view: resets the absolute translation axes to zero once the 0.05 s window has elapsed. *(internal)* | 187 |
| `core_cameraInput.timeSinceLastRotation(player)` | Time elapsed since this player's last camera rotation. | 31 |
| `core_cameraInput.xAxisAbs(val)` | Absolute X translation axis (3D mouse): MoveManager.absXAxis = (previous - val) * 0.02. | 172 |
| `core_cameraInput.yAxisAbs(val)` | Absolute Y translation axis (3D mouse): MoveManager.absYAxis = (previous - val) * 0.02. | 173 |
| `core_cameraInput.yAxisMoveStep(val)` | Small-step movement (3D mouse wheel zoom): moves forward at speed val for 0.05 s. Ignored if camera zoom is disabled in the editor or consumed by a controller (onEditorMouseWheel, val/20). | 178 |
| `core_cameraInput.yawAbs(val)` | Absolute yaw axis (3D mouse): MoveManager.yawRelative = (previous - val) * 0.0005. | 165 |
| `core_cameraInput.zAxisAbs(val)` | Absolute Z translation axis (3D mouse): MoveManager.absZAxis = (previous - val) * 0.02. | 174 |

### Parameter details

#### `core_cameraInput.cameraZoom(val, player)`

Signed zoom axis: val > 0 sets zoomIn, otherwise zoomOut = -val.

- `val` (*number*) : Signed value
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.getLastCameraMovementType()`

Type of the last camera rotation: 'absolute' (axes/keys), 'relative' (mouse) or 'none'.

- **returns**: string 'absolute', 'relative' or 'none'

#### `core_cameraInput.getLastFilter()`

Last input source type used to rotate the camera (FILTER_KBD keyboard, FILTER_PAD gamepad, FILTER_MOUSE mouse). Read by the camera modes and the UI.

- **returns**: integer FILTER_* constant

#### `core_cameraInput.moveForwardBackward(val, player)`

Signed forward/backward axis: val > 0 sets forward, otherwise backward = -val.

- `val` (*number*) : Signed value
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.moveLeftRight(val, player)`

Signed left/right axis: val > 0 sets right, otherwise left = -val.

- `val` (*number*) : Signed value
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.movebackward(val, player)`

Move-backward key: sets moveFor(player).backward.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.movedown(val, player)`

Move-down key: sets moveFor(player).down.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.moveforward(val, player)`

Move-forward key: sets moveFor(player).forward.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.moveleft(val, player)`

Move-left key (free camera or driver seat adjustment): sets moveFor(player).left.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.moveright(val, player)`

Move-right key: sets moveFor(player).right.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.moveup(val, player)`

Move-up key: sets moveFor(player).up.

- `val` (*number*) : Value [0..1]
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.pitchAbs(val)`

Absolute pitch axis (3D mouse), same principle on pitchRelative.

- `val` (*number*) : Absolute axis position

#### `core_cameraInput.rollAbs(val)`

Absolute roll axis (3D mouse), same principle as yawAbs on rollRelative.

- `val` (*number*) : Absolute axis position

#### `core_cameraInput.rotate_pitch(val, filter, player)`

Signed pitch axis: val > 0 sets pitchUp and cancels pitchDown, otherwise the opposite.

- `val` (*number*) : Signed value [-1..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_pitch_down(val, filter, player)`

Sets the pitch-down input.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_pitch_relative(val, player)`

Relative (mouse) pitch rotation, same principle as rotate_yaw_relative with 'pitch'.

- `val` (*number*) : Mouse delta
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_pitch_up(val, filter, player)`

Sets the pitch-up input.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_roll_left(val, filter, player)`

Sets the roll-left input.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_roll_right(val, filter, player)`

Sets the roll-right input.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_yaw(val, filter, player)`

Signed yaw axis: val > 0 sets yawRight and cancels yawLeft, val <= 0 the opposite.

- `val` (*number*) : Signed value [-1..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_yaw_left(val, filter, player)`

Sets the left yaw input and stores the filter and the rotation time.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_yaw_relative(val, player)`

Relative (mouse) yaw rotation. First offers the event to the controller registry (onRelativeInput 'yaw'); if not consumed, adds fov*val/4500 to yawRelative.

- `val` (*number*) : Mouse delta
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.rotate_yaw_right(val, filter, player)`

Sets the right yaw input.

- `val` (*number*) : Axis value [0..1]
- `filter` (*integer*) : FILTER_* input source
- `player` (*integer|nil*) : Player index

#### `core_cameraInput.setup(deps)`

Dependency injection by camera.lua: functions moveFor(player) and getFovDeg().

- `deps` (*table*) : {moveFor = function(player), getFovDeg = function()}

#### `core_cameraInput.tickAbsAxes(dtReal)`

Called every frame by the main view: resets the absolute translation axes to zero once the 0.05 s window has elapsed.

- `dtReal` (*number*) : Real time step (s)

#### `core_cameraInput.timeSinceLastRotation(player)`

Time elapsed since this player's last camera rotation.

- `player` (*integer|nil*) : Player index, 0 by default
- **returns**: number Duration in milliseconds (system clock)

#### `core_cameraInput.xAxisAbs(val)`

Absolute X translation axis (3D mouse): MoveManager.absXAxis = (previous - val) * 0.02.

- `val` (*number*) : Absolute axis position

#### `core_cameraInput.yAxisAbs(val)`

Absolute Y translation axis (3D mouse): MoveManager.absYAxis = (previous - val) * 0.02.

- `val` (*number*) : Absolute axis position

#### `core_cameraInput.yAxisMoveStep(val)`

Small-step movement (3D mouse wheel zoom): moves forward at speed val for 0.05 s. Ignored if camera zoom is disabled in the editor or consumed by a controller (onEditorMouseWheel, val/20).

- `val` (*number*) : Step speed

#### `core_cameraInput.yawAbs(val)`

Absolute yaw axis (3D mouse): MoveManager.yawRelative = (previous - val) * 0.0005.

- `val` (*number*) : Absolute axis position

#### `core_cameraInput.zAxisAbs(val)`

Absolute Z translation axis (3D mouse): MoveManager.absZAxis = (previous - val) * 0.02.

- `val` (*number*) : Absolute axis position

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraInput.lua`.*
