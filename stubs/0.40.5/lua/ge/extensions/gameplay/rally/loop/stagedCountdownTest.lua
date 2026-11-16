---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test instance. Fields: epoch (seconds elapsed since the start), environmentStartTimeSecs (starting wall-clock time in seconds), scheduledEventTime (epoch of the scheduled event).
---@class gameplay_rally_loop_stagedCountdownTest
local gameplay_rally_loop_stagedCountdownTest = {}

--- Schedules scheduledEventTime at the next full minute of the wall clock; if less than 15 s remain before it, uses the following minute. The result is expressed as an epoch (relative to the start).
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:39
function gameplay_rally_loop_stagedCountdownTest:calculateScheduledEventTime() end

--- Simulated wall-clock time = (environmentStartTimeSecs + epoch) modulo 86400.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:106
---@return number|nil  Seconds since midnight.
function gameplay_rally_loop_stagedCountdownTest:getWallClockTime() end

--- Reads the environment time, initializes epoch = 0 and schedules the event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:17
function gameplay_rally_loop_stagedCountdownTest:init() end

--- Reschedules the event: full minute following the old time plus slotSizeMinutes minutes. Marks as already triggered the warnings whose remaining delay has already passed.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua:71
---@param slotSizeMinutes number Size of the added slot, in minutes.
---@param rescheduleCount integer Number of reschedulings already done (only used for the log).
---@param maxReschedules integer Maximum number of reschedulings (log).
---@param defaultWarningTimes number[] Warning delays in seconds before the event.
---@param warningsTriggered table<number, boolean> Table modified in place: warningsTriggered[delay] = true if the delay has passed.
---@return boolean  Always true.
---@return number  New epoch of the scheduled event.
function gameplay_rally_loop_stagedCountdownTest:reschedule(slotSizeMinutes, rescheduleCount, maxReschedules, defaultWarningTimes, warningsTriggered) end

