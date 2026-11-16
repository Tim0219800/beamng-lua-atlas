---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/statisticModules/watchJturn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Statistics module that detects "J-turns" (reverse-then-forward U-turn) of the player vehicle and increments the metric "vehicle/jturn" via gameplay_statistic.metricAdd. It is called by gameplay_statistic with the workload function on each watch round.
--- Access: extension `gameplay_statisticModules_watchJturn`: `extensions.load("gameplay_statisticModules_watchJturn")`, then the global `gameplay_statisticModules_watchJturn`
---@class gameplay_statisticModules_watchJturn
gameplay_statisticModules_watchJturn = {}

--- Hook called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:91
function gameplay_statisticModules_watchJturn.onExtensionLoaded() end

--- Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:87
---@param vid integer Vehicle identifier.
function gameplay_statisticModules_watchJturn.onVehicleResetted(vid) end

--- Hook called when the controlled vehicle changes: cancels the detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:94
---@param oldid integer Old vehicle.
---@param newid integer New vehicle.
---@param player integer Player index.
function gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player) end

--- Analyzes a vehicle on each call (speed, direction) and counts a J-turn when the reverse-then-forward sequence is detected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/statisticModules/watchJturn.lua:29
---@param v userdata Vehicle object.
---@param vid integer Vehicle identifier; a vehicle change cancels the detection.
---@param dtSim number Simulated time elapsed in seconds.
function gameplay_statisticModules_watchJturn.workload(v, vid, dtSim) end

