---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/freeroam/cruising.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Detects in free roaming the switch to drift "cruising" mode: when the player chains enough drifts (or does a very long drift), the drift context goes from "inFreeroam" to "inFreeroamCruising" (which shows the drift interface) then goes back to "inFreeroam" after a few seconds without drifting. Reads gameplay_drift_drift and drives gameplay_drift_general.setContext.
--- Access: extension `gameplay_drift_freeroam_cruising`: `extensions.load("gameplay_drift_freeroam_cruising")`, then the global `gameplay_drift_freeroam_cruising`
---@class gameplay_drift_freeroam_cruising
---@field dependencies string[] gameplay_drift_general and gameplay_drift_drift, loaded beforehand.
gameplay_drift_freeroam_cruising = {}

--- Called every frame: tests the start of cruising (detectStart) then its end (detectEnd). If general debug is active, measures the cost with a LuaProfiler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/cruising.lua:46
---@param dtReal number Real time delta in seconds (unused).
---@param dtSim number Simulated time delta in seconds, used for the end countdown.
---@param dtRaw number Raw time delta in seconds (unused).
function gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw) end

