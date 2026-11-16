---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/droneChase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drone mode. Fields: camDist, height, fov, bank, floating, safeDist, positionOffset, orbitYaw, orbitPitch, pos, vel, head.
---@class core_cameraModes_droneChase
local core_cameraModes_droneChase = {}

--- Keeps the safety distance from static meshes: stays on the vehicle's side of any wall, and pushes out of any obstacle closer than safeDist (6 horizontal probes).
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:158
---@param x number world x
---@param y number world y
---@param z number world z
---@param car vec3 vehicle center
---@return number  corrected x
---@return number  corrected y
---@return number  corrected z
function core_cameraModes_droneChase:avoid(x, y, z, car) end

--- Corrects the altitude to follow the vehicle: under cover stays between ground+2 m and ceiling-0.8 m; in the open climbs to fly over hills.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:96
---@param x number world x
---@param y number world y
---@param z number desired altitude
---@param car vec3 center of the vehicle's bounding box
---@return number  corrected altitude
function core_cameraModes_droneChase:clampAltitude(x, y, z, car) end

--- Restores the saved state and forces repositioning.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:141
---@param s table table returned by serialize
function core_cameraModes_droneChase:deserialize(s) end

--- Sets the default values and calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:57
function core_cameraModes_droneChase:init() end

--- List of settings exposed to the camera control UI / video stream (dist, height, bank, float, safeDist, fov).
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:114
---@return table[]  descriptors {key, title, kind, type, value, default, min, max, step, unit}
function core_cameraModes_droneChase:listParams() end

--- Hook: on focus gain, the drone is repositioned.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:86
---@param focused boolean true if the mode takes focus
function core_cameraModes_droneChase:onCameraChanged(focused) end

--- Places the drone instantly at a position and cancels its velocity.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:88
---@param position vec3 world position
function core_cameraModes_droneChase:placeInit(position) end

--- Marks the drone to be repositioned, cancels velocity, offset and orbit.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:73
function core_cameraModes_droneChase:reset() end

--- Saves the mode state (distance, fov, height, bank, float, safeDist, positionOffset, orbit).
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:134
---@return table  state
function core_cameraModes_droneChase:serialize() end

--- Sets the follow distance clamped to [4, 80] m.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:84
---@param d number|nil distance in meters
function core_cameraModes_droneChase:setDistance(d) end

--- Sets the field of view.
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:85
---@param fov number degrees
function core_cameraModes_droneChase:setFOV(fov) end

--- Changes a listParams setting (values clamped).
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:125
---@param key string dist, fov, height, bank, float or safeDist
---@param value number|string new value (converted to a number)
function core_cameraModes_droneChase:setParam(key, value) end

--- Computes the drone pose and writes it to data.res (pos, rot, fov, targetPos).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/droneChase.lua:183
---@param data table camData
---@return boolean  true
function core_cameraModes_droneChase:update(data) end

---@type number
i = nil
