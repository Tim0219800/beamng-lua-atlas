---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_performance` : `extensions.load("telemetry_trackers_performance")`, puis la globale `telemetry_trackers_performance`
---@class telemetry_trackers_performance
---@field dependencies table
telemetry_trackers_performance = {}

---Source : lua/ge/extensions/telemetry/trackers/performance.lua:64
function telemetry_trackers_performance.onExtensionLoaded() end

--- Runs every frame, so it does one clock call and one comparison and nothing else. Readings
---  are taken wherever the game is, menus included; where it was is on the event.
---Source : lua/ge/extensions/telemetry/trackers/performance.lua:56
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw) end

