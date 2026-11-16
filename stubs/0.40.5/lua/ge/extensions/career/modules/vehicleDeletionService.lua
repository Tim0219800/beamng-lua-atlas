---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleDeletionService.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Deferred vehicle deletion service in career: a "marked" vehicle is deleted (with a callback call) when it is more than 100 m from the camera and behind it, so that it disappears without the player seeing it. Inventory vehicles are removed via career_modules_inventory.removeVehicleObject, others via obj:delete(). The onUpdate hook is wired only while at least one vehicle is marked.
--- Access: extension `career_modules_vehicleDeletionService`: `extensions.load("career_modules_vehicleDeletionService")`, then the global `career_modules_vehicleDeletionService`
---@class career_modules_vehicleDeletionService
---@field dependencies string[] {'career_career'}.
career_modules_vehicleDeletionService = {}

--- Removes a vehicle's marking (and unwires onUpdate if nothing remains).
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:78
---@param vehId integer Vehicle id.
function career_modules_vehicleDeletionService.clearFlags(vehId) end

--- Immediately deletes all marked vehicles.
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:65
function career_modules_vehicleDeletionService.deleteFlaggedVehicles() end

--- Marks a vehicle for deferred deletion and activates the onUpdate loop.
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:71
---@param vehId integer Vehicle id.
---@param callback function|nil Called just before deletion (default nop).
function career_modules_vehicleDeletionService.flagForDeletion(vehId, callback) end

--- Hook emitted on each mission state change: on "started" in career, deletes the marked vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:88
---@param state string Mission state.
---@param mission table|nil Mission concerned.
function career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission) end

--- Level start hook: clears the list of marked vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:83
function career_modules_vehicleDeletionService.onClientStartMission() end

--- Load hook: returns false if the career is not active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:12
---@return boolean|nil  false to refuse loading.
function career_modules_vehicleDeletionService.onExtensionLoaded() end

--- Hook emitted when a vehicle is destroyed: removes its marking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/vehicleDeletionService.lua:97
---@param vehId integer Vehicle id.
function career_modules_vehicleDeletionService.onVehicleDestroyed(vehId) end

