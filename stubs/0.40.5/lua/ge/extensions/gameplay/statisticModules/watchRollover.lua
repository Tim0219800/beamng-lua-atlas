---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statisticModules/watchRollover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Statistics module that detects rollovers (vehicle flipped onto its roof then back on its wheels) and increments the metric "vehicle/rollover" via gameplay_statistic.metricAdd. It is called by gameplay_statistic with the workload function.
--- Access: extension `gameplay_statisticModules_watchRollover`: `extensions.load("gameplay_statisticModules_watchRollover")`, then the global `gameplay_statisticModules_watchRollover`
---@class gameplay_statisticModules_watchRollover
gameplay_statisticModules_watchRollover = {}

--- Hook called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:66
function gameplay_statisticModules_watchRollover.onExtensionLoaded() end

--- Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:62
---@param vid integer Vehicle identifier.
function gameplay_statisticModules_watchRollover.onVehicleResetted(vid) end

--- Hook called when the controlled vehicle changes: cancels the detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:69
---@param oldid integer Old vehicle.
---@param newid integer New vehicle.
---@param player integer Player index.
function gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player) end

--- Analyzes a vehicle on each call (up/forward axes, speed) and counts a rollover when the roof-then-wheels sequence is detected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchRollover.lua:28
---@param v userdata Vehicle object.
---@param vid integer Vehicle identifier; a change cancels the detection.
---@param dtSim number Simulated time elapsed in seconds.
function gameplay_statisticModules_watchRollover.workload(v, vid, dtSim) end

