---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Countdown displayed during the crash test scenario. Each whole second crossed, it sends a message to the UI (ScenarioFlashMessage event) with the remaining digit and a countdown sound, then "Go!" with a start sound when the time is up, and then calls the given callback.
--- Access: extension `gameplay_crashTest_crashTestCountdown`: `extensions.load("gameplay_crashTest_crashTestCountdown")`, then the global `gameplay_crashTest_crashTestCountdown`
---@class gameplay_crashTest_crashTestCountdown
gameplay_crashTest_crashTestCountdown = {}

--- Hook called every frame: advances the countdown if one is in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua:40
---@param dtReal number Real delta time (s), unused.
---@param dtSim number Simulation time delta (s).
function gameplay_crashTest_crashTestCountdown.onUpdate(dtReal, dtSim) end

--- Starts a countdown of duration seconds. The callback is called when the count reaches 0 (at the time of "Go!").
---Source: lua/ge/extensions/gameplay/crashTest/crashTestCountdown.lua:11
---@param duration number Duration in seconds.
---@param callback_ function|nil Function called at the end of the countdown.
function gameplay_crashTest_crashTestCountdown.startNewCountdown(duration, callback_) end

