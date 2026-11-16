---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/scriptedFree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Scripted free camera mode. Fields: pos (vec3), yawDeg, pitchDeg, rollDeg, fov, locked, driveRot, allowLookWhenLocked, allowLook, allowMove, manualSpeed, lookSens, smoothPos, smoothRot, anim.
---@class core_cameraModes_scriptedFree
local core_cameraModes_scriptedFree = {}

--- Cancels the animation in progress (the camera stays at its current position, without calling onDone).
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:227
function core_cameraModes_scriptedFree:cancelTarget() end

--- Current pose.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:215
---@return vec3  position
---@return number  yaw degrees
---@return number  pitch degrees (positive downward)
---@return number  roll degrees
function core_cameraModes_scriptedFree:getPose() end

--- Current orientation as a quaternion.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:219
---@return quat  rotation
function core_cameraModes_scriptedFree:getQuat() end

--- Default values (see module).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:78
function core_cameraModes_scriptedFree:init() end

--- Indicates whether a setTarget is in progress.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:223
---@return boolean  true if animating
function core_cameraModes_scriptedFree:isAnimating() end

--- Allows mouse look while locked.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:202
---@param enabled boolean enable
function core_cameraModes_scriptedFree:setAllowLookWhenLocked(enabled) end

--- Applies settings at once (called by setByName / setGlobalCameraByName): pos, yawDeg, pitchDeg, rollDeg, locked, driveRot, allowLookWhenLocked, manualSpeed, lookSens, fov, allowLook, allowMove, smoothPos, smoothRot; missing keys are unchanged.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:104
---@param data table|nil options
function core_cameraModes_scriptedFree:setCustomData(data) end

--- Allows setPose/setTarget to drive the rotation.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:198
---@param enabled boolean enable
function core_cameraModes_scriptedFree:setDriveRot(enabled) end

--- Sets the FOV.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:210
---@param fovDeg number degrees
function core_cameraModes_scriptedFree:setFOV(fovDeg) end

--- Locks the position (the script owns it, no WASD).
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:194
---@param locked boolean lock
function core_cameraModes_scriptedFree:setLocked(locked) end

--- Manual movement speed.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:206
---@param mps number meters per second
function core_cameraModes_scriptedFree:setManualSpeed(mps) end

--- Sets the target pose (instant, or smoothed if smoothPos/smoothRot > 0) and cancels an animation in progress. Rotation is ignored if driveRot is false.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:163
---@param pos vec3|nil world position
---@param yawDeg number|nil yaw
---@param pitchDeg number|nil pitch downward
---@param rollDeg number|nil roll
function core_cameraModes_scriptedFree:setPose(pos, yawDeg, pitchDeg, rollDeg) end

--- Places the camera (and its smoothing goal) without animation; ignores nil.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:127
---@param position vec3|nil world position
function core_cameraModes_scriptedFree:setPosition(position) end

--- Orients the camera from a quaternion.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:135
---@param rotation quat|nil world orientation
function core_cameraModes_scriptedFree:setRotation(rotation) end

--- Continuous smoothing time (seconds to reach ~63%); 0 = instant setPose.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:189
---@param posSec number|nil for the position
---@param rotSec number|nil for the rotation
function core_cameraModes_scriptedFree:setSmooth(posSec, rotSec) end

--- Flies to a pose over a duration. Without a duration (<= 0), applies the pose immediately then calls onDone.
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:249
---@param opts table pos (vec3), orientation by lookAt (vec3) or dir (vec3) or rot (quat) or yawDeg/pitchDeg/rollDeg, time or duration (s), ease (linear, smoothstep, easeInOut, easeIn, easeOut; smoothstep by default), fov, onDone (function), lockDuring (default true), forceRot (applies rotation even if driveRot is false)
function core_cameraModes_scriptedFree:setTarget(opts) end

--- Sets the angles (nil arguments are unchanged).
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:148
---@param yawDeg number|nil yaw in degrees
---@param pitchDownDeg number|nil pitch in degrees, positive downward
---@param rollDeg number|nil roll in degrees
function core_cameraModes_scriptedFree:setYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg) end

--- Applies the animation, look, manual movement or smoothing and writes data.res.pos / rot / fov.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/scriptedFree.lua:380
---@param data table camData
---@return boolean  true
function core_cameraModes_scriptedFree:update(data) end

