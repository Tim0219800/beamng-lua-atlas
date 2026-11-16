---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/penalties.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation of time control penalties for a rally loop: early arrival, late arrival, false start. Time is compared to the minute (arrival within the same minute as the scheduled time = on time). Each minute of difference costs 10 s.
--- Access: extension `gameplay_rally_loop_penalties`: `extensions.load("gameplay_rally_loop_penalties")`, then the global `gameplay_rally_loop_penalties`
---@class gameplay_rally_loop_penalties
---@field falseStartPenaltySeconds number False start penalty in seconds (10).
---@field timeControlPenaltySecondsPerMinute number Penalty in seconds per minute early or late (10).
gameplay_rally_loop_penalties = {}

--- Penalty for an early arrival: minutesEarly multiplied by timeControlPenaltySecondsPerMinute.
---Source: lua/ge/extensions/gameplay/rally/loop/penalties.lua:14
---@param minutesEarly number Number of minutes early.
---@return number  Penalty in seconds.
function gameplay_rally_loop_penalties.calculateEarlyPenalty(minutesEarly) end

--- False start penalty; constant, independent of the number of false starts.
---Source: lua/ge/extensions/gameplay/rally/loop/penalties.lua:26
---@param falseStartCount integer Number of false starts (ignored).
---@return number  falseStartPenaltySeconds.
function gameplay_rally_loop_penalties.calculateFalseStartPenalty(falseStartCount) end

--- Penalty for a late arrival: minutesLate multiplied by timeControlPenaltySecondsPerMinute.
---Source: lua/ge/extensions/gameplay/rally/loop/penalties.lua:22
---@param minutesLate number Number of minutes late.
---@return number  Penalty in seconds.
function gameplay_rally_loop_penalties.calculateLatePenalty(minutesLate) end

--- Determines whether arrival at a checkpoint is early, on time or late, and computes the associated penalty.
---Source: lua/ge/extensions/gameplay/rally/loop/penalties.lua:38
---@param actualTime number|nil Actual arrival time, epoch in seconds.
---@param scheduledTime number|nil Scheduled time, epoch in seconds (may be nil).
---@return table  {status = 'early'|'on-time'|'late', totalPenalty, hasPenalty, penalties}. Each element of penalties: {type = 'time_control_early'|'time_control_late', amount, data = {minutesEarly|minutesLate, actualMinute, scheduledMinute}} for i18n.
function gameplay_rally_loop_penalties.getTimingStatus(actualTime, scheduledTime) end

