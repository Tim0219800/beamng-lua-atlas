---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/aiCompetitors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_aiCompetitors` : `extensions.load("gameplay_rally_aiCompetitors")`, puis la globale `gameplay_rally_aiCompetitors`
---@class gameplay_rally_aiCompetitors
---@field referenceStarKey string
gameplay_rally_aiCompetitors = {}

--- Overwrite the player row total with the official rally event-log total (all SS times + all penalties).
--- Multi-stage: `finalTime` / `finalDnf`. Single-stage: `time` / `dnf` (deltas are not recomputed).
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:521
---@param leaderboard any
---@param totalSecs any
function gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs) end

--- Single stage: (playerTime, silverTime) as numbers. Loop stage layout: (playerTimes, silverTimes) as equal-length arrays (length >= 1).
--- Optional `playerFinalSortSecs`: official total seconds (stages + penalties) for ranking the player row; AI rows rank by sum of simulated stage times (or DNF tier).
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:548
---@param playerTimeOrTimes any
---@param silverTimeOrTimes any
---@param playerName any
---@param playerFinalSortSecs any
function gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs) end

---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:212
---@param paramTable any
---@param skill any
---@param risk any
function gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk) end

---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:14
---@param missionTypeData any
function gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData) end

--- Gaussian mixture over finish-time outcomes (editor preview). Uses the same weights and mean/std rules as sampling.
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:177
---@param paramTable any
---@param referenceSec any
---@param skill any
---@param consistency any
---@param risk any
---@param timeLo any
---@param timeHi any
---@param sampleCount any
---@param precomputedWeights any
function gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights) end

