---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the time of day of a rally loop. Builds the player setting "Loop Time" (Default, Now, then each HH:MM time listed in loopTimes), translates the choice into environment parameters for missionManager, and drives the sky via core_environment (play, time, date). Only touches the time-related fields; the mission's weather is preserved.
--- Access: extension `gameplay_rally_loop_rallyLoopTime`: `extensions.load("gameplay_rally_loop_rallyLoopTime")`, then the global `gameplay_rally_loop_rallyLoopTime`
---@class gameplay_rally_loop_rallyLoopTime
---@field defaultValue string Value of the Default option: '__rallyLoopTimeDefault'.
---@field key string Setting key: 'rallyLoopTime'.
---@field nowValue string Value of the Now option: '__rallyLoopTimeNow'.
gameplay_rally_loop_rallyLoopTime = {}

--- Advances the time of day by seconds game seconds: time = (time + seconds / dayLength) % 1. Has no effect if the clock is not in play or if dayLength is invalid.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:158
---@param seconds number Seconds to add (must be > 0).
---@return boolean  true if the time was changed.
function gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds) end

--- Applies the real current date (year, month, day) to the sky (positions of the sun, moon, stars) without changing the time.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:145
---@return boolean  false if core_environment is unavailable, otherwise true.
function gameplay_rally_loop_rallyLoopTime.applyCurrentDate() end

--- Applies the choice to the mission's environment table (environment setup module). Now: enabled=false. Default: time=0, timeScale=0, _rallyForceStatic=true. CSV time: parsed time, timeScale=7/36. Fills in missing weather.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:81
---@param environment table Environment table modified in place (ignored if not a table).
---@param selectedValue string|nil Chosen value: nowValue, defaultValue, nil (= default) or 'HH:MM' string.
function gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue) end

--- Builds the 'select'-type setting "Loop Time": options Default, Now, then one option per time of missionTypeData.loopTimes (the value is the clock string to avoid float drift).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:55
---@param missionTypeData table|nil Mission type data, reads loopTimes.
---@return table  Setting table {key, label, type, values, value, defaultValue, currentOption}.
function gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData) end

--- Parses a comma-separated list of "HH:MM" times; invalid entries (format, hour > 23, minute > 59) are ignored.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:39
---@param str string List, for example "08:00, 17:30".
---@return table  List of {clock = 'HH:MM', time = raw tod.time value in [0,1)}; empty if str is not a string.
function gameplay_rally_loop_rallyLoopTime.parseTimes(str) end

--- Forces the play state of the time-of-day clock via core_environment.setTimeOfDay, optionally with a time to restore.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:130
---@param play boolean true to make time advance, false to freeze it.
---@param time number|nil Raw tod.time value to apply at the same time.
---@return boolean  false if core_environment is unavailable, otherwise true.
function gameplay_rally_loop_rallyLoopTime.setPlaying(play, time) end

