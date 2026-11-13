---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleDeletionService.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_vehicleDeletionService` : `extensions.load("career_modules_vehicleDeletionService")`, puis la globale `career_modules_vehicleDeletionService`
---@class career_modules_vehicleDeletionService
---@field dependencies table
career_modules_vehicleDeletionService = {}

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:78
---@param vehId any
function career_modules_vehicleDeletionService.clearFlags(vehId) end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:65
function career_modules_vehicleDeletionService.deleteFlaggedVehicles() end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:71
---@param vehId any
---@param callback any
function career_modules_vehicleDeletionService.flagForDeletion(vehId, callback) end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:88
---@param state any
---@param mission any
function career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission) end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:83
function career_modules_vehicleDeletionService.onClientStartMission() end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:12
function career_modules_vehicleDeletionService.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:97
---@param vehId any
function career_modules_vehicleDeletionService.onVehicleDestroyed(vehId) end

