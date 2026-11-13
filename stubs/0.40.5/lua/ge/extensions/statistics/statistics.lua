---@meta
-- tim19Atlas stub generated from lua/ge/extensions/statistics/statistics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `statistics_statistics` : `extensions.load("statistics_statistics")`, puis la globale `statistics_statistics`
---@class statistics_statistics
statistics_statistics = {}

---Source : lua/ge/extensions/statistics/statistics.lua:884
---@param medalString any
function statistics_statistics.DEBUG_generateScoreForMedal(medalString) end

---Source : lua/ge/extensions/statistics/statistics.lua:65
---@param vehicleID any
---@param statisticName any
function statistics_statistics.disableStatisticTracking(vehicleID, statisticName) end

---Source : lua/ge/extensions/statistics/statistics.lua:33
---@param vehicleID any
---@param statisticName any
function statistics_statistics.enableStatisticTracking(vehicleID, statisticName) end

---Source : lua/ge/extensions/statistics/statistics.lua:590
---@param medalString any
function statistics_statistics.getMedalRanking(medalString) end

---Source : lua/ge/extensions/statistics/statistics.lua:105
---@param scenario any
function statistics_statistics.getScenarioOverallStat(scenario) end

---Source : lua/ge/extensions/statistics/statistics.lua:191
---@param statsOrder any
function statistics_statistics.getSummaryStats(statsOrder) end

---Source : lua/ge/extensions/statistics/statistics.lua:114
---@param vehicleID any
function statistics_statistics.getVehicleStat(vehicleID) end

---Source : lua/ge/extensions/statistics/statistics.lua:400
---@param statName any
---@param statLabel any
---@param vehicle any
---@param vehicleName any
---@param maxPoints any
---@param maxValue any
function statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue) end

---Source : lua/ge/extensions/statistics/statistics.lua:862
---@param data any
function statistics_statistics.onDeserialized(data) end

--- public interface
---Source : lua/ge/extensions/statistics/statistics.lua:692
---@param scenario any
function statistics_statistics.onRaceGoalsInitilised(scenario) end

---Source : lua/ge/extensions/statistics/statistics.lua:797
function statistics_statistics.onRaceInit() end

---Source : lua/ge/extensions/statistics/statistics.lua:848
---@param status any
function statistics_statistics.onRaceResult(status) end

---Source : lua/ge/extensions/statistics/statistics.lua:844
---@param raceTickTime any
---@param timer any
function statistics_statistics.onRaceTick(raceTickTime, timer) end

---Source : lua/ge/extensions/statistics/statistics.lua:878
---@param campaignInProgress any
---@param data any
function statistics_statistics.onResumeCampaign(campaignInProgress, data) end

---Source : lua/ge/extensions/statistics/statistics.lua:871
---@param saveCallback any
function statistics_statistics.onSaveCampaign(saveCallback) end

---Source : lua/ge/extensions/statistics/statistics.lua:714
---@param scenario any
function statistics_statistics.onScenarioChange(scenario) end

---Source : lua/ge/extensions/statistics/statistics.lua:687
---@param scenario any
function statistics_statistics.onScenarioRestarted(scenario) end

---Source : lua/ge/extensions/statistics/statistics.lua:852
function statistics_statistics.onSerialize() end

---Source : lua/ge/extensions/statistics/statistics.lua:732
function statistics_statistics.onUpdate() end

---Source : lua/ge/extensions/statistics/statistics.lua:15
function statistics_statistics.reset() end

---Source : lua/ge/extensions/statistics/statistics.lua:210
---@param vehicleID any
---@param goalName any
---@param instanceId any
---@param goalData any
function statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData) end

---Source : lua/ge/extensions/statistics/statistics.lua:238
---@param vehicleID any
---@param statName any
---@param instanceId any
---@param statData any
function statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData) end

---Source : lua/ge/extensions/statistics/statistics.lua:648
---@param scenario any
function statistics_statistics.stopStatsGathering(scenario) end

