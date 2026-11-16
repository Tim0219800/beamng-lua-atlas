---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/times.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drag timing. Every frame, onUpdate advances the main timer of each racer whose timers are started (dtSim in solo, synchronized start clock in MP), detects the crossing of each configured distance (timers of type distanceTimer and velocity, interpolated between two frames), computes the reaction time (distance timer < 0.5 m) and disqualifies a jump start (negative reaction time). It also provides timer value readers (local or received from the network in MP) used by the ranking and the slip. Unlocks the DRAG_QUARTER_MILE achievement for a non-disqualified player's time_1_4 <= 8.20 s.
--- Access: extension `gameplay_drag_times`: `extensions.load("gameplay_drag_times")`, then the global `gameplay_drag_times`
---@class gameplay_drag_times
---@field dependencies string[] gameplay_drag_core, gameplay_achievement.
gameplay_drag_times = {}

--- Marks a racer's timers as started (racer.timersStarted = true). Called via the dragRaceStarted hook when the green light goes.
---Source: lua/ge/extensions/gameplay/drag/times.lua:270
---@param vehId integer Racer's vehicle ID.
function gameplay_drag_times.dragRaceStarted(vehId) end

--- Value of a racer's important timer (data.importantTimerId, time_1_4 by default).
---Source: lua/ge/extensions/gameplay/drag/times.lua:89
---@param racer table Racer.
---@param data table|nil Track data (importantTimerId).
---@return number  Value in s (or m/s for a speed timer), 0 if absent.
function gameplay_drag_times.getImportantTimerValue(racer, data) end

--- Effective comparison time for the ranking: value of the important timer plus the reaction time if it is a distance timer (or if the timer is not in the config); the raw value for a speed timer.
---Source: lua/ge/extensions/gameplay/drag/times.lua:112
---@param racer table Racer.
---@param data table|nil Track data (importantTimerId, timers).
---@return number  Effective time.
function gameplay_drag_times.getImportantTimerValueForWin(racer, data) end

--- In MP, returns the table of timers broadcast by the network for the racer's vehicle (key = timer id). Uses a vehicle-to-MP-player cache rebuilt if the race or the players change.
---Source: lua/ge/extensions/gameplay/drag/times.lua:56
---@param racer table Racer (vehId).
---@return table|nil  Network timers, nil outside MP or if unknown.
function gameplay_drag_times.getNetworkTimersForRacer(racer) end

--- Value of a timer for a racer: the network value in MP if it exists, otherwise the local value.
---Source: lua/ge/extensions/gameplay/drag/times.lua:82
---@param racer table Racer.
---@param timerId string Timer identifier (e.g. 'time_1_4').
---@return number  Value, 0 if absent.
function gameplay_drag_times.getRacerTimerValue(racer, timerId) end

--- Reaction time of a racer: network timer whose id contains 'reaction' in MP, otherwise the value of the distanceTimer type timer at less than 0.5 m.
---Source: lua/ge/extensions/gameplay/drag/times.lua:94
---@param racer table Racer.
---@return number  Reaction time in s (-1 if invalid, 0 if absent).
function gameplay_drag_times.getReactionTimerValue(racer) end

--- Drag clear hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/times.lua:284
function gameplay_drag_times.onDragClear() end

--- Drag reset hook: calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/times.lua:283
function gameplay_drag_times.onDragReset() end

--- Per-frame timer update: elapsed time, distance/speed crossings, reaction, quarter mile achievement, emergency braking, MP synchronization (and the host's checkTimerDrift). No effect if the race is finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/times.lua:138
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw) end

--- Resets all timers except each racer's dial (value 0, isSet = false) and timersStarted = false.
---Source: lua/ge/extensions/gameplay/drag/times.lua:12
function gameplay_drag_times.reset() end

--- Alias of reset().
---Source: lua/ge/extensions/gameplay/drag/times.lua:276
function gameplay_drag_times.resetDragRaceValues() end

