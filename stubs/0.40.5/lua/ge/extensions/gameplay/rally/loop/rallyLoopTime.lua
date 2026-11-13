---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_rallyLoopTime` : `extensions.load("gameplay_rally_loop_rallyLoopTime")`, puis la globale `gameplay_rally_loop_rallyLoopTime`
---@class gameplay_rally_loop_rallyLoopTime
---@field defaultValue string
---@field key string
---@field nowValue string
gameplay_rally_loop_rallyLoopTime = {}

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:158
---@param seconds any
function gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds) end

--- Apply today's real-world date to the sky (drives sun/moon/star position) while
---  leaving the current time-of-day untouched. Only send the date fields.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:145
function gameplay_rally_loop_rallyLoopTime.applyCurrentDate() end

--- Map the chosen option into the environment setup module so the battle-tested
---  missionManager code applies and restores the time-of-day. This only touches
---  time-related fields; authored weather is preserved (nil weather fields are
---  zero-filled purely for nil-safety so missionManager's setters don't error).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:81
---@param environment any
---@param selectedValue any
function gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue) end

--- Build the single player-facing "Loop Time" select. Order: Default, Now, then
---  each authored CSV start time (labeled by its clock string).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:55
---@param missionTypeData any
function gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData) end

--- Parse a comma-separated list of "HH:MM" times, skipping invalid entries.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:39
---@param str any
function gameplay_rally_loop_rallyLoopTime.parseTimes(str) end

--- Force the time-of-day play state. Used to guarantee play=false for the static
---  Default option after missionManager has applied the environment. An optional
---  time can be supplied to snap the clock back (Default may drift slightly during
---  the brief window before this runs). IMPORTANT: only send the fields we want to
---  change - passing a full getTimeOfDay() table (with startTime/date fields) fails
---  to actually stop the clock.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua:130
---@param play any
---@param time any
function gameplay_rally_loop_rallyLoopTime.setPlaying(play, time) end

