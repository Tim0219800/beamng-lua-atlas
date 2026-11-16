---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/aiCompetitors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simulates AI competitors for the leaderboard of a rally special stage or loop. The competitors' parameters (skill, consistency, risk, name) and the model coefficients are read from gameplay/rally/aiCompetitorsConfig.json when the module loads. For each competitor, a result (safe, push, minor_incident, major_incident, dnf) is drawn at random, then a time is sampled from a normal distribution anchored on a reference time (by default the 'silverTime' medal). The module also formats the times and builds the rows of the table shown in the UI.
--- Access: extension `gameplay_rally_aiCompetitors`: `extensions.load("gameplay_rally_aiCompetitors")`, then the global `gameplay_rally_aiCompetitors`
---@class gameplay_rally_aiCompetitors
---@field referenceStarKey string Key of the medal time used as the pace reference for the simulated competitors. Is 'silverTime' by default; getReferenceTime reads it from missionTypeData.
gameplay_rally_aiCompetitors = {}

--- Overwrites the player row's total time with the official total from the rally event log (time of all special stages + penalties). In multi-stage updates finalTime/finalDnf, in single stage time/dnf; the deltas are not recomputed.
---Source: lua/ge/extensions/gameplay/rally/aiCompetitors.lua:521
---@param leaderboard table Result of computeLeaderboard (must have rows and playerRowIndex).
---@param totalSecs number Official total in seconds (> 0).
function gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs) end

--- Builds the player + AI competitors ranking. With two numbers: a single special stage. With two arrays of the same length (>= 1): several special stages (loop). Returns {rows = {}} if the inputs are invalid.
---Source: lua/ge/extensions/gameplay/rally/aiCompetitors.lua:548
---@param playerTimeOrTimes number|number[] Player time (or list of times per special stage).
---@param silverTimeOrTimes number|number[] Reference (silver) time of the special stage, or list per special stage; must be > 0.
---@param playerName string|nil Display name; nil = 'Player' with translation key missions.aiCompetitorsLeaderboard.player.
---@param playerFinalSortSecs number|nil Official total (special stages + penalties) used to rank the player.
---@return table  {rows, playerRowIndex}; in multi: also multiStage=true and stageCount, rows with stageCells/finalTime/finalDnf; in single: rows with time/delta/deltaVsLeader/deltaVsAhead/dnf.
function gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs) end

--- Computes the normalized weights of the 5 possible results (safe, push, minor_incident, major_incident, dnf) for a given skill and risk level. Uses a fixed consistency of 0.5 (with no effect on the weights).
---Source: lua/ge/extensions/gameplay/rally/aiCompetitors.lua:212
---@param paramTable table|nil Model coefficients (safe_weight_base, push_weight_floor, etc.); nil = those of the config file.
---@param skill number Competitor skill (0 to 1 expected, inferred from code).
---@param risk number Risk propensity (0 to 1 expected, inferred from code).
---@return number[]  5 weights summing to 1, in the order safe, push, minor_incident, major_incident, dnf.
function gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk) end

--- Returns the reference time (medal designated by referenceStarKey) of a mission, or nil if it is absent or not strictly positive.
---Source: lua/ge/extensions/gameplay/rally/aiCompetitors.lua:14
---@param missionTypeData table|nil Mission type data containing for example silverTime.
---@return number|nil  Reference time in seconds.
function gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData) end

--- Computes the density of the Gaussian mixture of finish times (preview for the editor). Uses the same weights and means/standard deviations as the sampling; the DNF has no density.
---Source: lua/ge/extensions/gameplay/rally/aiCompetitors.lua:177
---@param paramTable table|nil Model coefficients; nil = file config.
---@param referenceSec number Reference time in seconds.
---@param skill number Skill.
---@param consistency number Consistency (1 = very consistent: reduced standard deviation).
---@param risk number Risk propensity.
---@param timeLo number Lower bound of the time axis.
---@param timeHi number Upper bound of the time axis.
---@param sampleCount integer|nil Number of points (minimum 2, 500 by default).
---@param precomputedWeights number[]|nil Weights already computed, to avoid recomputing them.
---@return table  {times, mixture, weights, components (5 density arrays per result), sampleCount}.
function gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights) end

