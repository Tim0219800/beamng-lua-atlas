---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_scheduleUtils` : `extensions.load("gameplay_rally_loop_scheduleUtils")`, puis la globale `gameplay_rally_loop_scheduleUtils`
---@class gameplay_rally_loop_scheduleUtils
gameplay_rally_loop_scheduleUtils = {}

--- Calculate the next slot time by adding slot duration and rounding to minute boundary
---  @param currentTime: Current time in seconds
---  @param slotSizeMinutes: Size of time slot in minutes (default: 1)
---  @param roundToMinute: If true, rounds result to next minute boundary (default: true)
---  @return: Next slot time in seconds
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:27
---@param currentTime any
---@param slotSizeMinutes any
---@param roundToMinute any
function gameplay_rally_loop_scheduleUtils.calculateNextSlotTime(currentTime, slotSizeMinutes, roundToMinute) end

--- Check if one time is later than another (with optional tolerance)
---  @param newTime: Time to check
---  @param currentTime: Time to compare against
---  @param tolerance: Optional tolerance in seconds (default: 0)
---  @return: true if newTime > currentTime (accounting for tolerance)
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:45
---@param newTime any
---@param currentTime any
---@param tolerance any
function gameplay_rally_loop_scheduleUtils.isLaterTime(newTime, currentTime, tolerance) end

--- Round time up to the next minute boundary (60 second intervals)
---  @param timeSecs: Time in seconds
---  @return: Time rounded up to next minute
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:11
---@param timeSecs any
function gameplay_rally_loop_scheduleUtils.roundToNextMinute(timeSecs) end

--- Convert slot size from minutes to seconds
---  @param slotSizeMinutes: Slot size in minutes
---  @return: Slot size in seconds
---Source : lua/ge/extensions/gameplay/rally/loop/scheduleUtils.lua:18
---@param slotSizeMinutes any
function gameplay_rally_loop_scheduleUtils.slotMinutesToSeconds(slotSizeMinutes) end

