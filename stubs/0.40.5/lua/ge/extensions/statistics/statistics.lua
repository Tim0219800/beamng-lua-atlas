---@meta
-- tim19Atlas stub generated from lua/ge/extensions/statistics/statistics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension that tracks a scenario's statistics (distance traveled, altitude, max speed, damage, time, goals) for each vehicle, computes the points earned and awards the final medal (wood/bronze/silver/gold). The parameters come from scenario.statistics (maxValue, maxPoints, best/worst, target, source, required, alias, overall with goldCutoff/silverCutoff/bronzeCutoff). A modder uses it to read a scenario's results (getVehicleStat, getScenarioOverallStat) or to add their own statistics (initialiseArbitraryStat, setStatProgress).
--- Access: extension `statistics_statistics`: `extensions.load("statistics_statistics")`, then the global `statistics_statistics`
---@class statistics_statistics
statistics_statistics = {}

--- Debug function: forces the player's score to a percentage just above the requested medal's threshold and fills the current scenario's summary.
---Source: lua/ge/extensions/statistics/statistics.lua:884
---@param medalString string 'bronze', 'silver' or 'gold'.
function statistics_statistics.DEBUG_generateScoreForMedal(medalString) end

--- Disables tracking of a statistic for a vehicle (enabled = false). Values already measured are kept.
---Source: lua/ge/extensions/statistics/statistics.lua:65
---@param vehicleID integer Vehicle id.
---@param statisticName string Stat name without prefix.
function statistics_statistics.disableStatisticTracking(vehicleID, statisticName) end

--- Enables tracking of a statistic for a vehicle (enabled = true) and stores the starting position for 'altitude' (initialZPos) or 'distance' (initialPos). Does nothing if the statistic does not exist for this vehicle.
---Source: lua/ge/extensions/statistics/statistics.lua:33
---@param vehicleID integer Vehicle id.
---@param statisticName string Stat name without prefix: 'distance', 'altitude', 'speed', 'damage', 'time'...
function statistics_statistics.enableStatisticTracking(vehicleID, statisticName) end

--- Converts a medal name to a rank: wood 0, bronze 1, silver 2, gold 3; -1 if unknown.
---Source: lua/ge/extensions/statistics/statistics.lua:590
---@param medalString string 'wood', 'bronze', 'silver' or 'gold'.
---@return integer  Rank from 0 to 3, or -1.
function statistics_statistics.getMedalRanking(medalString) end

--- Returns the overall summary of a scenario (label, points, maxPoints, failed, medal...), or an empty table if there is none.
---Source: lua/ge/extensions/statistics/statistics.lua:105
---@param scenario table Scenario table (only scenario.name is used).
---@return table  Entry of scenarioStats[scenario.name] or {}.
function statistics_statistics.getScenarioOverallStat(scenario) end

--- Returns, in the given order, the summaries of several scenarios (with relativePoints in %) as well as the total points earned and the total max points. Used for a campaign recap.
---Source: lua/ge/extensions/statistics/statistics.lua:191
---@param statsOrder string[] Scenario names (keys of scenarioStats).
---@return table[]  Summaries per scenario.
---@return number  Sum of the player's points.
---@return number  Sum of the max points.
function statistics_statistics.getSummaryStats(statsOrder) end

--- Builds the list of a vehicle's statistics for the end-of-scenario interface: one entry per stat/goal with label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints and relativePoints (in %). Aggregates the instances (sum of values and points). For a '%' unit, the value is brought back to value/maxValue*100.
---Source: lua/ge/extensions/statistics/statistics.lua:114
---@param vehicleID integer Vehicle id.
---@return table[]|nil  List of entries, or nil if the vehicle has no stats.
function statistics_statistics.getVehicleStat(vehicleID) end

--- Adds a custom statistic (value = 0, decimals = 2, enabled) to a vehicle; the source is vehicleName.
---Source: lua/ge/extensions/statistics/statistics.lua:400
---@param statName string Stat name.
---@param statLabel string Label (translation key or text).
---@param vehicle userdata Vehicle object (getID() is called).
---@param vehicleName string Vehicle name, used as source and instance id.
---@param maxPoints number|nil Max points of the stat.
---@param maxValue number|nil Value giving the max points.
function statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue) end

--- Reload hook: restores statsTable (names converted back to ids) and scenarioStats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:862
---@param data table Data produced by onSerialize.
function statistics_statistics.onDeserialized(data) end

--- Hook: called when the race goals are initialized. Recreates the stats tables (initialiseTables). The name contains the typo 'Initilised'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:692
---@param scenario table Current scenario.
function statistics_statistics.onRaceGoalsInitilised(scenario) end

--- Hook: called when the race is initialized; records the starting position (initialPos, initialZPos) of the distance and altitude stats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:797
function statistics_statistics.onRaceInit() end

--- Hook: called at the end of the race; records status.finalTime in the 'time' stat.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:848
---@param status table Race result (finalTime).
function statistics_statistics.onRaceResult(status) end

--- Hook: called on each race tick; records the current timer in the 'time' stat.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:844
---@param raceTickTime number Not used.
---@param timer number Race time in seconds.
function statistics_statistics.onRaceTick(raceTickTime, timer) end

--- Campaign resume hook: restores statsTable and scenarioStats from data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:878
---@param campaignInProgress any Not used.
---@param data table Data saved by onSaveCampaign.
function statistics_statistics.onResumeCampaign(campaignInProgress, data) end

--- Campaign save hook: passes the same data as onSerialize to saveCallback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:871
---@param saveCallback function Called with (module global alias, data).
function statistics_statistics.onSaveCampaign(saveCallback) end

--- Hook: called on each scenario state change. In the 'post' state, captures the final damage of each vehicle (map.objects[id].damage).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:714
---@param scenario table|nil Current scenario.
function statistics_statistics.onScenarioChange(scenario) end

--- Hook: called when the scenario restarts; recreates the stats tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:687
---@param scenario table Current scenario.
function statistics_statistics.onScenarioRestarted(scenario) end

--- Extension save hook: returns statsTable (id keys converted to vehicle names) and scenarioStats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:852
---@return table  {statsTable, scenarioStats}
function statistics_statistics.onSerialize() end

--- Hook called every frame. While scenario.raceState == 'racing' (and state ≠ 'post'), updates distance (norm of the displacement since initialPos), altitude (absolute Z difference) and max speed for each tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/statistics/statistics.lua:732
function statistics_statistics.onUpdate() end

--- Clears scenarioStats (per-scenario summaries). Does not touch statsTable.
---Source: lua/ge/extensions/statistics/statistics.lua:15
function statistics_statistics.reset() end

--- Creates or updates the progress of a goal (key 'goal_<name>', required = true) for a vehicle: records the instance's points and maxPoints and failed if goalData.status == 'failed'. Does nothing if the vehicle does not yet have a stats table.
---Source: lua/ge/extensions/statistics/statistics.lua:210
---@param vehicleID integer Vehicle id.
---@param goalName string Goal identifier (nomove, timeLimit, speed...).
---@param instanceId any Instance identifier (often the id of the goal's target vehicle).
---@param goalData table Fields points, maxPoints, status ('init', 'failed'...).
function statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData) end

--- Creates or updates a statistic for a vehicle. The fields decimals, enabled, label, predefinedUnit, unit and isGoal are stored at the stat level; all other statData fields (value, maxValue, maxPoints, source...) are copied into the instance instanceId. Ignored if instanceId or statData is missing or not a table.
---Source: lua/ge/extensions/statistics/statistics.lua:238
---@param vehicleID integer Vehicle id.
---@param statName string Stat name (internal key 'stat_<name>').
---@param instanceId any Instance identifier (often the source name).
---@param statData table Stat data.
function statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData) end

--- End of collection: chooses the distance/altitude unit (m if < 1609.34 m, otherwise 'distance' unit), computes the player vehicle's points and fills the scenario summary (points, maxPoints, failed, medal).
---Source: lua/ge/extensions/statistics/statistics.lua:648
---@param scenario table Finished scenario (scenario.name, scenario.result.failed).
function statistics_statistics.stopStatsGathering(scenario) end

