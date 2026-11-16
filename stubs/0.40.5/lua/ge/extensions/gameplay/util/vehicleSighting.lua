---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/vehicleSighting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Determines whether an observer (the player camera or a vehicle) can "see" a target vehicle. The range depends on the angle: maximum range (80 m) straight ahead, minimum range (5 m) outside the peripheral cone (90°), interpolated between the two. An optional ray checks for the absence of obstacles.
--- Access: extension `gameplay_util_vehicleSighting`: `extensions.load("gameplay_util_vehicleSighting")`, then the global `gameplay_util_vehicleSighting`
---@class gameplay_util_vehicleSighting
gameplay_util_vehicleSighting = {}

--- Tests whether the player camera sees the target vehicle (position and direction from core_camera).
---Source: lua/ge/extensions/gameplay/util/vehicleSighting.lua:46
---@param targetVehId integer Id of the target vehicle.
---@param params table|nil Settings, see checkSighting.
---@return boolean  false if core_camera or the vehicle does not exist.
function gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params) end

--- Tests whether a vehicle sees another vehicle (observer's position and forward direction).
---Source: lua/ge/extensions/gameplay/util/vehicleSighting.lua:59
---@param observerVehId integer Observer id.
---@param targetVehId integer Target id.
---@param params table|nil Settings, see checkSighting.
---@return boolean  false if either vehicle does not exist.
function gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params) end

--- Generic visibility test from positions: distance, angle relative to the viewing direction, then occlusion ray.
---Source: lua/ge/extensions/gameplay/util/vehicleSighting.lua:12
---@param observerPos vec3 Observer position.
---@param observerDir vec3 Normalized viewing direction.
---@param targetPos vec3 Target position.
---@param params table maxDistDirectSight, minDistPeriphSight, periphSightAngle, needDirectVisualContact (table required).
---@return boolean  true if the target is visible.
function gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params) end

