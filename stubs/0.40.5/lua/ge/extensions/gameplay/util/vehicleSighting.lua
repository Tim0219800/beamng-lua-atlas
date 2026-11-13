---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/vehicleSighting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_util_vehicleSighting` : `extensions.load("gameplay_util_vehicleSighting")`, puis la globale `gameplay_util_vehicleSighting`
---@class gameplay_util_vehicleSighting
gameplay_util_vehicleSighting = {}

---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:46
---@param targetVehId any
---@param params any
function gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params) end

---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:59
---@param observerVehId any
---@param targetVehId any
---@param params any
function gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params) end

---Source : lua/ge/extensions/gameplay/util/vehicleSighting.lua:12
---@param observerPos any
---@param observerDir any
---@param targetPos any
---@param params any
function gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params) end

