---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/times.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_times` : `extensions.load("gameplay_drag_times")`, puis la globale `gameplay_drag_times`
---@class gameplay_drag_times
---@field dependencies table
gameplay_drag_times = {}

--- Marks a racer's timers as started (called when green light fires).
---  vehId: vehicle ID of the racer
---Source : lua/ge/extensions/gameplay/drag/times.lua:270
---@param vehId any
function gameplay_drag_times.dragRaceStarted(vehId) end

---Source : lua/ge/extensions/gameplay/drag/times.lua:89
---@param racer any
---@param data any
function gameplay_drag_times.getImportantTimerValue(racer, data) end

--- Effective time for win comparison: timer + reaction for time-type (distanceTimer), raw value for velocity.
---Source : lua/ge/extensions/gameplay/drag/times.lua:112
---@param racer any
---@param data any
function gameplay_drag_times.getImportantTimerValueForWin(racer, data) end

--- In MP, get network-broadcast timer values for a racer's vehicle. Returns table keyed by timerId, or nil.
---Source : lua/ge/extensions/gameplay/drag/times.lua:56
---@param racer any
function gameplay_drag_times.getNetworkTimersForRacer(racer) end

---Source : lua/ge/extensions/gameplay/drag/times.lua:82
---@param racer any
---@param timerId any
function gameplay_drag_times.getRacerTimerValue(racer, timerId) end

---Source : lua/ge/extensions/gameplay/drag/times.lua:94
---@param racer any
function gameplay_drag_times.getReactionTimerValue(racer) end

---Source : lua/ge/extensions/gameplay/drag/times.lua:284
function gameplay_drag_times.onDragClear() end

---Source : lua/ge/extensions/gameplay/drag/times.lua:283
function gameplay_drag_times.onDragReset() end

--- Per-frame timer update. Calculates elapsed time, distance/velocity splits, reaction time, and braking G.
---Source : lua/ge/extensions/gameplay/drag/times.lua:138
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw) end

--- Resets all non-dial timers for every racer.
---Source : lua/ge/extensions/gameplay/drag/times.lua:12
function gameplay_drag_times.reset() end

---Source : lua/ge/extensions/gameplay/drag/times.lua:276
function gameplay_drag_times.resetDragRaceValues() end

