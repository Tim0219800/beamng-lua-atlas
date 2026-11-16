---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Creates and records a mission attempt for a rally loop through the mission progress system (gameplay_missions_progress). A normal-finish attempt receives the total time, the penalty, the time of each stage (timeSS1, timeSS2...), the vehicle data and the stars earned; a DNF attempt (abandon or restart) receives only the DNF type and the vehicle. Called by the loop manager (rallyLoopManager) via the mgr object.
--- Access: extension `gameplay_rally_loop_rallyAttempts`: `extensions.load("gameplay_rally_loop_rallyAttempts")`, then the global `gameplay_rally_loop_rallyAttempts`
---@class gameplay_rally_loop_rallyAttempts
gameplay_rally_loop_rallyAttempts = {}

--- Creates an abandoned (DNF) attempt: sets attempt.dnf = true, records the dnfType and the current mission id, adds the vehicle, aggregates and saves. No stars or times are recorded.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:85
---@param mgr table Loop manager (rallyLoopManager): must provide getRallyLoopMissionId and getCurrentMissionId.
---@param dnfType string DNF type: "restart" or "abandon".
---@return table|nil  The attempt object created (nil if the mission id is not found).
---@return table|nil  Aggregation result (totalChange).
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType) end

--- Creates a normal-finish attempt: time and penalties from mgr, time of each stage, player vehicle, star rating (RallyLoopStars.gradeAttempt), aggregation into the mission progress, then save.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:66
---@param mgr table Loop manager (rallyLoopManager): must provide getRallyLoopMissionId, getTotalPenalty, getTotalTime, getEventLog and optionally getRallyLoopMission.
---@return table|nil  The attempt object created (nil if the mission id is not found).
---@return table|nil  Aggregation result (totalChange) returned by gameplay_missions_progress.aggregateAttempt.
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr) end

