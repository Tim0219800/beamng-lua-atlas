# `statistics_statistics`

*File: `lua/ge/extensions/statistics/statistics.lua` · VM: Game Engine (GE) · 949 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `statistics_statistics`: `extensions.load("statistics_statistics")`, then the global `statistics_statistics`

GE extension that tracks a scenario's statistics (distance traveled, altitude, max speed, damage, time, goals) for each vehicle, computes the points earned and awards the final medal (wood/bronze/silver/gold). The parameters come from scenario.statistics (maxValue, maxPoints, best/worst, target, source, required, alias, overall with goldCutoff/silverCutoff/bronzeCutoff). A modder uses it to read a scenario's results (getVehicleStat, getScenarioOverallStat) or to add their own statistics (initialiseArbitraryStat, setStatProgress).

## Example

```lua
local stats = statistics_statistics.getVehicleStat(be:getPlayerVehicleID(0))
for _, s in ipairs(stats or {}) do print(s.label, s.value, s.points, s.maxPoints) end
```

## Notes

- The internal tables are keyed by vehicle id then by key 'stat_<name>' or 'goal_<name>'; each entry contains 'instances' (one per source/tracked vehicle).
- Units: distance and altitude in meters; if the total is < 1609.34 m (1 mile) the displayed unit is 'm', otherwise the user's 'distance' unit. Speed (max) is the norm of map.objects[id].vel in m/s.
- Points of a stat: (value / maxValue) * maxPoints, or, for time, linear interpolation between best (max points) and worst (0). Points are clamped to ±maxPoints then rounded with math.floor.
- Medal: wood if the scenario is failed; gold if score >= goldCutoff (default 90%) or maxPoints == 0; silver >= silverCutoff (70); bronze >= bronzeCutoff (0).
- Probable BUG: in initialiseTimeStat, when scenario.statistics.time is an array, maxPoints/best/worst are read from the array (timeProperties) and not from the current entry (entry), so they are nil.
- Probable BUG: getSummaryStats adds data.points / data.maxPoints without a nil check (error if the name does not exist in scenarioStats).
- DEBUG_generateScoreForMedal does clamp(percent, 0, 100) while percent is already a fraction 0..1; the game logs errors in shipping builds because the function should be removed.
- enableStatisticTracking calls vehicle:getPosition() without testing vehicle for nil and writes initialZPos/initialPos on statEntry (and not on the instance) while onUpdate reads instance.initialPos/initialZPos.

## Functions

| Function | Description | Line |
|---|---|---|
| `statistics_statistics.DEBUG_generateScoreForMedal(medalString)` | Debug function: forces the player's score to a percentage just above the requested medal's threshold and fills the current scenario's summary. | 884 |
| `statistics_statistics.disableStatisticTracking(vehicleID, statisticName)` | Disables tracking of a statistic for a vehicle (enabled = false). Values already measured are kept. | 65 |
| `statistics_statistics.enableStatisticTracking(vehicleID, statisticName)` | Enables tracking of a statistic for a vehicle (enabled = true) and stores the starting position for 'altitude' (initialZPos) or 'distance' (initialPos). Does nothing if the statistic does not exist for this vehicle. | 33 |
| `statistics_statistics.getMedalRanking(medalString)` | Converts a medal name to a rank: wood 0, bronze 1, silver 2, gold 3; -1 if unknown. | 590 |
| `statistics_statistics.getScenarioOverallStat(scenario)` | Returns the overall summary of a scenario (label, points, maxPoints, failed, medal...), or an empty table if there is none. | 105 |
| `statistics_statistics.getSummaryStats(statsOrder)` | Returns, in the given order, the summaries of several scenarios (with relativePoints in %) as well as the total points earned and the total max points. Used for a campaign recap. | 191 |
| `statistics_statistics.getVehicleStat(vehicleID)` | Builds the list of a vehicle's statistics for the end-of-scenario interface: one entry per stat/goal with label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints and relativePoints (in %). Aggregates the instances (sum of values and points). For a '%' unit, the value is brought back to value/maxValue*100. | 114 |
| `statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue)` | Adds a custom statistic (value = 0, decimals = 2, enabled) to a vehicle; the source is vehicleName. | 400 |
| `statistics_statistics.onDeserialized(data)` | Reload hook: restores statsTable (names converted back to ids) and scenarioStats. *(internal)* *(hook)* | 862 |
| `statistics_statistics.onRaceGoalsInitilised(scenario)` | Hook: called when the race goals are initialized. Recreates the stats tables (initialiseTables). The name contains the typo 'Initilised'. *(internal)* *(hook)* | 692 |
| `statistics_statistics.onRaceInit()` | Hook: called when the race is initialized; records the starting position (initialPos, initialZPos) of the distance and altitude stats. *(internal)* *(hook)* | 797 |
| `statistics_statistics.onRaceResult(status)` | Hook: called at the end of the race; records status.finalTime in the 'time' stat. *(internal)* *(hook)* | 848 |
| `statistics_statistics.onRaceTick(raceTickTime, timer)` | Hook: called on each race tick; records the current timer in the 'time' stat. *(internal)* *(hook)* | 844 |
| `statistics_statistics.onResumeCampaign(campaignInProgress, data)` | Campaign resume hook: restores statsTable and scenarioStats from data. *(internal)* *(hook)* | 878 |
| `statistics_statistics.onSaveCampaign(saveCallback)` | Campaign save hook: passes the same data as onSerialize to saveCallback. *(internal)* *(hook)* | 871 |
| `statistics_statistics.onScenarioChange(scenario)` | Hook: called on each scenario state change. In the 'post' state, captures the final damage of each vehicle (map.objects[id].damage). *(internal)* *(hook)* | 714 |
| `statistics_statistics.onScenarioRestarted(scenario)` | Hook: called when the scenario restarts; recreates the stats tables. *(internal)* *(hook)* | 687 |
| `statistics_statistics.onSerialize()` | Extension save hook: returns statsTable (id keys converted to vehicle names) and scenarioStats. *(internal)* *(hook)* | 852 |
| `statistics_statistics.onUpdate()` | Hook called every frame. While scenario.raceState == 'racing' (and state ≠ 'post'), updates distance (norm of the displacement since initialPos), altitude (absolute Z difference) and max speed for each tracked vehicle. *(internal)* *(hook)* | 732 |
| `statistics_statistics.reset()` | Clears scenarioStats (per-scenario summaries). Does not touch statsTable. | 15 |
| `statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData)` | Creates or updates the progress of a goal (key 'goal_<name>', required = true) for a vehicle: records the instance's points and maxPoints and failed if goalData.status == 'failed'. Does nothing if the vehicle does not yet have a stats table. | 210 |
| `statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData)` | Creates or updates a statistic for a vehicle. The fields decimals, enabled, label, predefinedUnit, unit and isGoal are stored at the stat level; all other statData fields (value, maxValue, maxPoints, source...) are copied into the instance instanceId. Ignored if instanceId or statData is missing or not a table. | 238 |
| `statistics_statistics.stopStatsGathering(scenario)` | End of collection: chooses the distance/altitude unit (m if < 1609.34 m, otherwise 'distance' unit), computes the player vehicle's points and fills the scenario summary (points, maxPoints, failed, medal). | 648 |

### Parameter details

#### `statistics_statistics.DEBUG_generateScoreForMedal(medalString)`

Debug function: forces the player's score to a percentage just above the requested medal's threshold and fills the current scenario's summary.

- `medalString` (*string*) : 'bronze', 'silver' or 'gold'.

#### `statistics_statistics.disableStatisticTracking(vehicleID, statisticName)`

Disables tracking of a statistic for a vehicle (enabled = false). Values already measured are kept.

- `vehicleID` (*integer*) : Vehicle id.
- `statisticName` (*string*) : Stat name without prefix.

#### `statistics_statistics.enableStatisticTracking(vehicleID, statisticName)`

Enables tracking of a statistic for a vehicle (enabled = true) and stores the starting position for 'altitude' (initialZPos) or 'distance' (initialPos). Does nothing if the statistic does not exist for this vehicle.

- `vehicleID` (*integer*) : Vehicle id.
- `statisticName` (*string*) : Stat name without prefix: 'distance', 'altitude', 'speed', 'damage', 'time'...

#### `statistics_statistics.getMedalRanking(medalString)`

Converts a medal name to a rank: wood 0, bronze 1, silver 2, gold 3; -1 if unknown.

- `medalString` (*string*) : 'wood', 'bronze', 'silver' or 'gold'.
- **returns**: integer Rank from 0 to 3, or -1.

#### `statistics_statistics.getScenarioOverallStat(scenario)`

Returns the overall summary of a scenario (label, points, maxPoints, failed, medal...), or an empty table if there is none.

- `scenario` (*table*) : Scenario table (only scenario.name is used).
- **returns**: table Entry of scenarioStats[scenario.name] or {}.

#### `statistics_statistics.getSummaryStats(statsOrder)`

Returns, in the given order, the summaries of several scenarios (with relativePoints in %) as well as the total points earned and the total max points. Used for a campaign recap.

- `statsOrder` (*string[]*) : Scenario names (keys of scenarioStats).
- **returns**: table[] Summaries per scenario.
- **returns**: number Sum of the player's points.
- **returns**: number Sum of the max points.

#### `statistics_statistics.getVehicleStat(vehicleID)`

Builds the list of a vehicle's statistics for the end-of-scenario interface: one entry per stat/goal with label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints and relativePoints (in %). Aggregates the instances (sum of values and points). For a '%' unit, the value is brought back to value/maxValue*100.

- `vehicleID` (*integer*) : Vehicle id.
- **returns**: table[]|nil List of entries, or nil if the vehicle has no stats.

#### `statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue)`

Adds a custom statistic (value = 0, decimals = 2, enabled) to a vehicle; the source is vehicleName.

- `statName` (*string*) : Stat name.
- `statLabel` (*string*) : Label (translation key or text).
- `vehicle` (*userdata*) : Vehicle object (getID() is called).
- `vehicleName` (*string*) : Vehicle name, used as source and instance id.
- `maxPoints` (*number|nil*) : Max points of the stat.
- `maxValue` (*number|nil*) : Value giving the max points.

#### `statistics_statistics.onDeserialized(data)`

Reload hook: restores statsTable (names converted back to ids) and scenarioStats.

- `data` (*table*) : Data produced by onSerialize.

#### `statistics_statistics.onRaceGoalsInitilised(scenario)`

Hook: called when the race goals are initialized. Recreates the stats tables (initialiseTables). The name contains the typo 'Initilised'.

- `scenario` (*table*) : Current scenario.

#### `statistics_statistics.onRaceResult(status)`

Hook: called at the end of the race; records status.finalTime in the 'time' stat.

- `status` (*table*) : Race result (finalTime).

#### `statistics_statistics.onRaceTick(raceTickTime, timer)`

Hook: called on each race tick; records the current timer in the 'time' stat.

- `raceTickTime` (*number*) : Not used.
- `timer` (*number*) : Race time in seconds.

#### `statistics_statistics.onResumeCampaign(campaignInProgress, data)`

Campaign resume hook: restores statsTable and scenarioStats from data.

- `campaignInProgress` (*any*) : Not used.
- `data` (*table*) : Data saved by onSaveCampaign.

#### `statistics_statistics.onSaveCampaign(saveCallback)`

Campaign save hook: passes the same data as onSerialize to saveCallback.

- `saveCallback` (*function*) : Called with (module global alias, data).

#### `statistics_statistics.onScenarioChange(scenario)`

Hook: called on each scenario state change. In the 'post' state, captures the final damage of each vehicle (map.objects[id].damage).

- `scenario` (*table|nil*) : Current scenario.

#### `statistics_statistics.onScenarioRestarted(scenario)`

Hook: called when the scenario restarts; recreates the stats tables.

- `scenario` (*table*) : Current scenario.

#### `statistics_statistics.onSerialize()`

Extension save hook: returns statsTable (id keys converted to vehicle names) and scenarioStats.

- **returns**: table {statsTable, scenarioStats}

#### `statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData)`

Creates or updates the progress of a goal (key 'goal_<name>', required = true) for a vehicle: records the instance's points and maxPoints and failed if goalData.status == 'failed'. Does nothing if the vehicle does not yet have a stats table.

- `vehicleID` (*integer*) : Vehicle id.
- `goalName` (*string*) : Goal identifier (nomove, timeLimit, speed...).
- `instanceId` (*any*) : Instance identifier (often the id of the goal's target vehicle).
- `goalData` (*table*) : Fields points, maxPoints, status ('init', 'failed'...).

#### `statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData)`

Creates or updates a statistic for a vehicle. The fields decimals, enabled, label, predefinedUnit, unit and isGoal are stored at the stat level; all other statData fields (value, maxValue, maxPoints, source...) are copied into the instance instanceId. Ignored if instanceId or statData is missing or not a table.

- `vehicleID` (*integer*) : Vehicle id.
- `statName` (*string*) : Stat name (internal key 'stat_<name>').
- `instanceId` (*any*) : Instance identifier (often the source name).
- `statData` (*table*) : Stat data.

#### `statistics_statistics.stopStatsGathering(scenario)`

End of collection: chooses the distance/altitude unit (m if < 1609.34 m, otherwise 'distance' unit), computes the player vehicle's points and fills the scenario summary (points, maxPoints, failed, medal).

- `scenario` (*table*) : Finished scenario (scenario.name, scenario.result.failed).

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/statistics/statistics.lua`.*
