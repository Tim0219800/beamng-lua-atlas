---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table of the timer penalties applied at each vehicle recovery (reset) in rally. A recovery costs a fixed number of seconds, independent of the stage length. On a special stage: 5 s for a recovery, 0 s for a flip. Off a special stage (road section): 60 s and 10 s. Used by rallyManager:addRecoveryRaceTime.
--- Access: extension `gameplay_rally_recoveryClockAdvance`: `extensions.load("gameplay_rally_recoveryClockAdvance")`, then the global `gameplay_rally_recoveryClockAdvance`
---@class gameplay_rally_recoveryClockAdvance
---@field nonSpecialStageSeconds table<string, number> Penalties off a special stage: recovery = 60, flip = 10.
---@field specialStageSeconds table<string, number> Penalties on a special stage: recovery = 5, flip = 0 (the code path is kept but adds nothing).
gameplay_rally_recoveryClockAdvance = {}

--- Returns the penalty in seconds depending on whether the stage is a special stage or not; 0 if the type is unknown.
---Source: lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua:24
---@param recoveryType string "recovery" or "flip"
---@param isSpecialStage boolean true for a special stage, false for a road section / other stage
---@return number  Seconds added to the timer
function gameplay_rally_recoveryClockAdvance.getSeconds(recoveryType, isSpecialStage) end

--- Returns the penalty in seconds for a recovery type on a special stage; 0 if the type is unknown.
---Source: lua/ge/extensions/gameplay/rally/recoveryClockAdvance.lua:20
---@param recoveryType string "recovery" or "flip"
---@return number  Seconds added to the timer
function gameplay_rally_recoveryClockAdvance.getSpecialStageSeconds(recoveryType) end

