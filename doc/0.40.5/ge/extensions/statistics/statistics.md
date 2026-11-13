# `statistics_statistics`

*Fichier : `lua/ge/extensions/statistics/statistics.lua` · VM : Game Engine (GE) · 949 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `statistics_statistics` : `extensions.load("statistics_statistics")`, puis la globale `statistics_statistics`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `statistics_statistics.DEBUG_generateScoreForMedal(medalString)` |  | 884 |
| `statistics_statistics.disableStatisticTracking(vehicleID, statisticName)` |  | 65 |
| `statistics_statistics.enableStatisticTracking(vehicleID, statisticName)` |  | 33 |
| `statistics_statistics.getMedalRanking(medalString)` |  | 590 |
| `statistics_statistics.getScenarioOverallStat(scenario)` |  | 105 |
| `statistics_statistics.getSummaryStats(statsOrder)` |  | 191 |
| `statistics_statistics.getVehicleStat(vehicleID)` |  | 114 |
| `statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue)` |  | 400 |
| `statistics_statistics.onDeserialized(data)` | *(hook)* | 862 |
| `statistics_statistics.onRaceGoalsInitilised(scenario)` | public interface *(hook)* | 692 |
| `statistics_statistics.onRaceInit()` | *(hook)* | 797 |
| `statistics_statistics.onRaceResult(status)` | *(hook)* | 848 |
| `statistics_statistics.onRaceTick(raceTickTime, timer)` | *(hook)* | 844 |
| `statistics_statistics.onResumeCampaign(campaignInProgress, data)` | *(hook)* | 878 |
| `statistics_statistics.onSaveCampaign(saveCallback)` | *(hook)* | 871 |
| `statistics_statistics.onScenarioChange(scenario)` | *(hook)* | 714 |
| `statistics_statistics.onScenarioRestarted(scenario)` | *(hook)* | 687 |
| `statistics_statistics.onSerialize()` | *(hook)* | 852 |
| `statistics_statistics.onUpdate()` | *(hook)* | 732 |
| `statistics_statistics.reset()` |  | 15 |
| `statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData)` |  | 210 |
| `statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData)` |  | 238 |
| `statistics_statistics.stopStatsGathering(scenario)` |  | 648 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/statistics/statistics.lua`.*
