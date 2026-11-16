---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/steadycam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Steadycam mode. Fields: pos (vec3 eyes), yaw, pitch (radians), vel, vz, grounded, walkSpeed, groundWalk, eyeHeight, manualzoom, bobbing.
---@class core_cameraModes_steadycam
local core_cameraModes_steadycam = {}

--- Restores the state (accepts the old key bob).
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:129
---@param s table serialize table
function core_cameraModes_steadycam:deserialize(s) end

--- Sets group, feel constants and creates zoom and bobbing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:30
function core_cameraModes_steadycam:init() end

--- UI settings: height, walkSpeed, walkBob, standingBob, groundWalk, fov.
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:104
---@return table[]  descriptors
function core_cameraModes_steadycam:listParams() end

--- Hook: pushes the "Steadycam" action map on focus gain and removes it on loss.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:94
---@param focused boolean true if the mode takes focus
function core_cameraModes_steadycam:onCameraChanged(focused) end

--- Hook: re-reads eye height, FOV and bobbing settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:55
function core_cameraModes_steadycam:onSettingsChanged() end

--- Cancels velocities, jump and grounded state, resets bobbing and zoom.
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:65
function core_cameraModes_steadycam:reset() end

--- State for video stream views.
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:124
---@return table  {fov, height, walkSpeed, walkBob, standingBob, groundWalk}
function core_cameraModes_steadycam:serialize() end

--- Sets the configured FOV (10 to 140).
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:87
---@param fov number|nil degrees
function core_cameraModes_steadycam:setFOV(fov) end

--- Changes a listParams setting.
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:115
---@param key string height, walkSpeed, walkBob, standingBob, groundWalk, fov
---@param value any new value
function core_cameraModes_steadycam:setParam(key, value) end

--- Places the camera (fed on entering the camera group so it does not jump) and cancels the velocity.
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:80
---@param p vec3 world eye position
function core_cameraModes_steadycam:setPosition(p) end

--- Orients the look from a quaternion (the camera looks toward +Y).
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:81
---@param q quat world orientation
function core_cameraModes_steadycam:setRotation(q) end

--- Integrates look, walking, gravity, jump and writes data.res (pos, rot, fov, targetPos 10 m ahead).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/steadycam.lua:139
---@param data table camData
---@return boolean  true
function core_cameraModes_steadycam:update(data) end

