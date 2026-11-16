---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraInput.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handlers for the player's camera inputs (look, move, zoom, absolute 3D mouse/SpaceMouse axes), extracted from core/camera.lua. It is not an extension: camera.lua does require('core/cameraInput'), injects moveFor and getFovDeg into it via setup(), then re-exposes these functions on core_camera (input actions call core_camera.rotate_yaw, etc.). They write to the player's MoveManager structure (fields yawLeft, yawRight, pitchUp, pitchDown, rollLeft, rollRight, forward, backward, left, right, up, down, zoomIn, zoomOut, yawRelative, pitchRelative, rollRelative, absXAxis, absYAxis, absZAxis), which the camera modes then read.
--- Access: extension `core_cameraInput`: `extensions.load("core_cameraInput")`, then the global `core_cameraInput`
---@class core_cameraInput
core_cameraInput = {}

--- Signed zoom axis: val > 0 sets zoomIn, otherwise zoomOut = -val.
---Source: lua/ge/extensions/core/cameraInput.lua:123
---@param val number Signed value
---@param player integer|nil Player index
function core_cameraInput.cameraZoom(val, player) end

--- Type of the last camera rotation: 'absolute' (axes/keys), 'relative' (mouse) or 'none'.
---Source: lua/ge/extensions/core/cameraInput.lua:35
---@return string  'absolute', 'relative' or 'none'
function core_cameraInput.getLastCameraMovementType() end

--- Last input source type used to rotate the camera (FILTER_KBD keyboard, FILTER_PAD gamepad, FILTER_MOUSE mouse). Read by the camera modes and the UI.
---Source: lua/ge/extensions/core/cameraInput.lua:22
---@return integer  FILTER_* constant
function core_cameraInput.getLastFilter() end

--- Signed forward/backward axis: val > 0 sets forward, otherwise backward = -val.
---Source: lua/ge/extensions/core/cameraInput.lua:101
---@param val number Signed value
---@param player integer|nil Player index
function core_cameraInput.moveForwardBackward(val, player) end

--- Signed left/right axis: val > 0 sets right, otherwise left = -val.
---Source: lua/ge/extensions/core/cameraInput.lua:112
---@param val number Signed value
---@param player integer|nil Player index
function core_cameraInput.moveLeftRight(val, player) end

--- Move-backward key: sets moveFor(player).backward.
---Source: lua/ge/extensions/core/cameraInput.lua:156
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.movebackward(val, player) end

--- Move-down key: sets moveFor(player).down.
---Source: lua/ge/extensions/core/cameraInput.lua:158
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.movedown(val, player) end

--- Move-forward key: sets moveFor(player).forward.
---Source: lua/ge/extensions/core/cameraInput.lua:155
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.moveforward(val, player) end

--- Move-left key (free camera or driver seat adjustment): sets moveFor(player).left.
---Source: lua/ge/extensions/core/cameraInput.lua:153
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.moveleft(val, player) end

--- Move-right key: sets moveFor(player).right.
---Source: lua/ge/extensions/core/cameraInput.lua:154
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.moveright(val, player) end

--- Move-up key: sets moveFor(player).up.
---Source: lua/ge/extensions/core/cameraInput.lua:157
---@param val number Value [0..1]
---@param player integer|nil Player index
function core_cameraInput.moveup(val, player) end

--- Absolute pitch axis (3D mouse), same principle on pitchRelative.
---Source: lua/ge/extensions/core/cameraInput.lua:167
---@param val number Absolute axis position
function core_cameraInput.pitchAbs(val) end

--- Absolute roll axis (3D mouse), same principle as yawAbs on rollRelative.
---Source: lua/ge/extensions/core/cameraInput.lua:166
---@param val number Absolute axis position
function core_cameraInput.rollAbs(val) end

--- Signed pitch axis: val > 0 sets pitchUp and cancels pitchDown, otherwise the opposite.
---Source: lua/ge/extensions/core/cameraInput.lua:76
---@param val number Signed value [-1..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_pitch(val, filter, player) end

--- Sets the pitch-down input.
---Source: lua/ge/extensions/core/cameraInput.lua:70
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_pitch_down(val, filter, player) end

--- Relative (mouse) pitch rotation, same principle as rotate_yaw_relative with 'pitch'.
---Source: lua/ge/extensions/core/cameraInput.lua:143
---@param val number Mouse delta
---@param player integer|nil Player index
function core_cameraInput.rotate_pitch_relative(val, player) end

--- Sets the pitch-up input.
---Source: lua/ge/extensions/core/cameraInput.lua:64
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_pitch_up(val, filter, player) end

--- Sets the roll-left input.
---Source: lua/ge/extensions/core/cameraInput.lua:95
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_roll_left(val, filter, player) end

--- Sets the roll-right input.
---Source: lua/ge/extensions/core/cameraInput.lua:89
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_roll_right(val, filter, player) end

--- Signed yaw axis: val > 0 sets yawRight and cancels yawLeft, val <= 0 the opposite.
---Source: lua/ge/extensions/core/cameraInput.lua:51
---@param val number Signed value [-1..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_yaw(val, filter, player) end

--- Sets the left yaw input and stores the filter and the rotation time.
---Source: lua/ge/extensions/core/cameraInput.lua:39
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_yaw_left(val, filter, player) end

--- Relative (mouse) yaw rotation. First offers the event to the controller registry (onRelativeInput 'yaw'); if not consumed, adds fov*val/4500 to yawRelative.
---Source: lua/ge/extensions/core/cameraInput.lua:134
---@param val number Mouse delta
---@param player integer|nil Player index
function core_cameraInput.rotate_yaw_relative(val, player) end

--- Sets the right yaw input.
---Source: lua/ge/extensions/core/cameraInput.lua:45
---@param val number Axis value [0..1]
---@param filter integer FILTER_* input source
---@param player integer|nil Player index
function core_cameraInput.rotate_yaw_right(val, filter, player) end

--- Dependency injection by camera.lua: functions moveFor(player) and getFovDeg().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraInput.lua:15
---@param deps table {moveFor = function(player), getFovDeg = function()}
function core_cameraInput.setup(deps) end

--- Called every frame by the main view: resets the absolute translation axes to zero once the 0.05 s window has elapsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraInput.lua:187
---@param dtReal number Real time step (s)
function core_cameraInput.tickAbsAxes(dtReal) end

--- Time elapsed since this player's last camera rotation.
---Source: lua/ge/extensions/core/cameraInput.lua:31
---@param player integer|nil Player index, 0 by default
---@return number  Duration in milliseconds (system clock)
function core_cameraInput.timeSinceLastRotation(player) end

--- Absolute X translation axis (3D mouse): MoveManager.absXAxis = (previous - val) * 0.02.
---Source: lua/ge/extensions/core/cameraInput.lua:172
---@param val number Absolute axis position
function core_cameraInput.xAxisAbs(val) end

--- Absolute Y translation axis (3D mouse): MoveManager.absYAxis = (previous - val) * 0.02.
---Source: lua/ge/extensions/core/cameraInput.lua:173
---@param val number Absolute axis position
function core_cameraInput.yAxisAbs(val) end

--- Small-step movement (3D mouse wheel zoom): moves forward at speed val for 0.05 s. Ignored if camera zoom is disabled in the editor or consumed by a controller (onEditorMouseWheel, val/20).
---Source: lua/ge/extensions/core/cameraInput.lua:178
---@param val number Step speed
function core_cameraInput.yAxisMoveStep(val) end

--- Absolute yaw axis (3D mouse): MoveManager.yawRelative = (previous - val) * 0.0005.
---Source: lua/ge/extensions/core/cameraInput.lua:165
---@param val number Absolute axis position
function core_cameraInput.yawAbs(val) end

--- Absolute Z translation axis (3D mouse): MoveManager.absZAxis = (previous - val) * 0.02.
---Source: lua/ge/extensions/core/cameraInput.lua:174
---@param val number Absolute axis position
function core_cameraInput.zAxisAbs(val) end

