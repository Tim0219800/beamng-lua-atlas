---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_career` : `extensions.load("telemetry_trackers_career")`, puis la globale `telemetry_trackers_career`
---@class telemetry_trackers_career
---@field dependencies table
telemetry_trackers_career = {}

---Source : lua/ge/extensions/telemetry/trackers/career.lua:56
---@param data any
function telemetry_trackers_career.onBeforeVehicleSell(data) end

---Source : lua/ge/extensions/telemetry/trackers/career.lua:24
---@param active any
---@param newSave any
function telemetry_trackers_career.onCareerActive(active, newSave) end

---Source : lua/ge/extensions/telemetry/trackers/career.lua:70
function telemetry_trackers_career.onExtensionLoaded() end

--- a lua reload tears the trackers down without an onExit, so close the activity here too
---Source : lua/ge/extensions/telemetry/trackers/career.lua:18
function telemetry_trackers_career.onExtensionUnloaded() end

---Source : lua/ge/extensions/telemetry/trackers/career.lua:42
---@param data any
function telemetry_trackers_career.onVehicleAddedToInventory(data) end

