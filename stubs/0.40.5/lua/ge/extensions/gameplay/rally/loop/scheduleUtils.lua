---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small utility functions for schedule computation for rally loops: rounding up to the next minute, conversion of slot sizes from minutes to seconds, next slot computation, time comparison with tolerance. All times are in seconds.
--- Access: extension `gameplay_rally_loop_scheduleUtils`: `extensions.load("gameplay_rally_loop_scheduleUtils")`, then the global `gameplay_rally_loop_scheduleUtils`
---@class gameplay_rally_loop_scheduleUtils
gameplay_rally_loop_scheduleUtils = {}

--- Adds the slot duration to the current time then, by default, rounds up to the next minute.
---Source: lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:27
---@param currentTime number Current time in seconds.
---@param slotSizeMinutes number|nil Slot size in minutes (default 1).
---@param roundToMinute boolean|nil true by default; false to not round.
---@return number  Next slot in seconds.
function gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute) end

--- Tests whether newTime is strictly greater than currentTime + tolerance.
---Source: lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:45
---@param newTime number Time to test.
---@param currentTime number Reference time.
---@param tolerance number|nil Tolerance in seconds (default 0).
---@return boolean  true if newTime > currentTime + tolerance.
function gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance) end

--- Rounds a time up to the next minute: ceil(t / 60) * 60.
---Source: lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:11
---@param timeSecs number Time in seconds.
---@return number  Rounded time, in seconds.
function gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs) end

--- Converts a slot size from minutes to seconds (1 minute by default if nil).
---Source: lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:18
---@param slotSizeMinutes number|nil Slot size in minutes.
---@return number  Seconds.
function gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes) end

