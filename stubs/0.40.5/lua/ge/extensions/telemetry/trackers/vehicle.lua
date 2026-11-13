---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_vehicle` : `extensions.load("telemetry_trackers_vehicle")`, puis la globale `telemetry_trackers_vehicle`
---@class telemetry_trackers_vehicle
---@field dependencies table
telemetry_trackers_vehicle = {}

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:78
function telemetry_trackers_vehicle.onClientEndMission() end

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:91
function telemetry_trackers_vehicle.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:82
function telemetry_trackers_vehicle.onExtensionLoaded() end

--- a lua reload tears the trackers down without an onExit, so close the activity here too
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:21
function telemetry_trackers_vehicle.onExtensionUnloaded() end

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:37
---@param vid any
function telemetry_trackers_vehicle.onVehicleSpawned(vid) end

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:49
---@param oldId any
---@param newId any
---@param player any
function telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:61
function telemetry_trackers_vehicle.trackVehReset() end

