---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/free.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Free camera mode. Fields: pos (vec3), rot (vec3 radians), velocity, angularVelocity, planarVelocity, manualzoom, smoothed, newtonTranslation, newtonRotation, planarTranslation (and planarTranslationScale/Drag/Response/SpeedMultiplier for the planar mode), group = 'world', groupOrder.
---@class core_cameraModes_free
local core_cameraModes_free = {}

--- Cancels the angular velocity.
---Source: lua/ge/extensions/core/cameraModes/free.lua:122
function core_cameraModes_free:clearAngularMotion() end

--- Cancels the translation, planar and angular velocities.
---Source: lua/ge/extensions/core/cameraModes/free.lua:116
function core_cameraModes_free:clearMotion() end

--- Cancels the external planar input.
---Source: lua/ge/extensions/core/cameraModes/free.lua:135
function core_cameraModes_free:clearPlanarTranslationInput() end

--- Cancels the planar velocity and the external planar input.
---Source: lua/ge/extensions/core/cameraModes/free.lua:140
function core_cameraModes_free:clearPlanarTranslationMotion() end

--- Sets the default values (isGlobal, group, hidden, canUseVehicleTriggerCrosshair, non-smoothed physics) then reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/free.lua:50
function core_cameraModes_free:init() end

--- Settings exposed to the camera control UI / video stream: speed (2-100 m/s, read via core_camera.getSpeed), smooth, newtonRot, newtonTrans, fov (10-140).
---Source: lua/ge/extensions/core/cameraModes/free.lua:92
---@param ctxId any view context identifier (inferred from code)
---@return table[]  parameter descriptors
function core_cameraModes_free:listParams(ctxId) end

--- Hook: on focus gain, calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/free.lua:145
---@param focused boolean true if the mode takes focus
function core_cameraModes_free:onCameraChanged(focused) end

--- Cancels velocities and roll, recreates the manual zoom at 65 degrees.
---Source: lua/ge/extensions/core/cameraModes/free.lua:21
function core_cameraModes_free:reset() end

--- Resets the manual zoom with this FOV.
---Source: lua/ge/extensions/core/cameraModes/free.lua:77
---@param fovDeg number degrees
function core_cameraModes_free:setFOV(fovDeg) end

--- Enables rotation with inertia.
---Source: lua/ge/extensions/core/cameraModes/free.lua:81
---@param enabled boolean enable
function core_cameraModes_free:setNewtonRotation(enabled) end

--- Enables translation with inertia.
---Source: lua/ge/extensions/core/cameraModes/free.lua:85
---@param enabled boolean enable
function core_cameraModes_free:setNewtonTranslation(enabled) end

--- Changes a listParams setting (speed goes through core_camera.setSpeed).
---Source: lua/ge/extensions/core/cameraModes/free.lua:102
---@param key string speed, smooth, fov, newtonRot, newtonTrans
---@param value any new value
---@param ctxId any view context
function core_cameraModes_free:setParam(key, value, ctxId) end

--- Provides an external planar velocity (for example from a gamepad) for the frame; cleared after each update.
---Source: lua/ge/extensions/core/cameraModes/free.lua:126
---@param velocity vec3|nil world velocity
---@param active boolean true to apply it (otherwise reset to zero)
function core_cameraModes_free:setPlanarTranslationInput(velocity, active) end

--- Sets the camera position (the table is kept by reference).
---Source: lua/ge/extensions/core/cameraModes/free.lua:73
---@param position vec3 world position
function core_cameraModes_free:setPosition(position) end

--- Sets the orientation from a quaternion.
---Source: lua/ge/extensions/core/cameraModes/free.lua:110
---@param rotation quat world orientation
function core_cameraModes_free:setRotation(rotation) end

--- Chooses the physics parameter set (smoothed or non-smoothed).
---Source: lua/ge/extensions/core/cameraModes/free.lua:32
---@param smoothed boolean true for the smoothed cinematic mode
function core_cameraModes_free:setSmoothedCam(smoothed) end

--- Integrates rotation and translation from MoveManager and writes data.res.pos / rot, then applies the zoom.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/free.lua:237
---@param data table camData (data.speed, data.fastSpeedModifier read)
---@return boolean  true
function core_cameraModes_free:update(data) end

