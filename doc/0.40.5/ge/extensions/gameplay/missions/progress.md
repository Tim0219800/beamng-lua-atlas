# `gameplay_missions_progress`

*Fichier : `lua/ge/extensions/gameplay/missions/progress.lua` · VM : Game Engine (GE) · 1879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_progress` : `extensions.load("gameplay_missions_progress")`, puis la globale `gameplay_missions_progress`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt)` |  | 619 |
| `gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey)` |  | 380 |
| `gameplay_missions_progress.endBatchMode()` |  | 1867 |
| `gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey)` |  | 1038 |
| `gameplay_missions_progress.exportAllProgressToCSV()` |  | 1874 |
| `gameplay_missions_progress.formatAttemptSimple(attempt, mission)` |  | 1318 |
| `gameplay_missions_progress.formatSaveDataForBigmap(id)` |  | 1677 |
| `gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts)` |  | 1641 |
| `gameplay_missions_progress.formatStars(mission)` |  | 1578 |
| `gameplay_missions_progress.generateAttempt(id, addAttemptData)` |  | 1802 |
| `gameplay_missions_progress.generateAttempts(id, amount, dumpChange)` |  | 1833 |
| `gameplay_missions_progress.getBatchMode()` |  | 1870 |
| `gameplay_missions_progress.getLeaderboardChangeKeys(missionId)` |  | 1090 |
| `gameplay_missions_progress.getSaveSlot()` |  | 292 |
| `gameplay_missions_progress.getUnlockedStarCountsForMissionById(id)` |  | 1717 |
| `gameplay_missions_progress.loadMissionSaveData(mission)` |  | 924 |
| `gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId)` |  | 1058 |
| `gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId)` |  | 1071 |
| `gameplay_missions_progress.newAttempt(type, data)` |  | 227 |
| `gameplay_missions_progress.onExtensionLoaded()` | *(hook)* | 1765 |
| `gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission)` |  | 999 |
| `gameplay_missions_progress.saveMissionSaveData(id, dirtyDate)` |  | 296 |
| `gameplay_missions_progress.setDynamicStarRewards(mission, userSettings)` |  | 1025 |
| `gameplay_missions_progress.setSavePath(path)` |  | 288 |
| `gameplay_missions_progress.setSaveSlot(slotName)` |  | 282 |
| `gameplay_missions_progress.startBatchMode()` |  | 1864 |
| `gameplay_missions_progress.tryBuildContext(label, data)` |  | 1566 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `formatAggregatesForMissionTypeWithProgKey` | any |  ⚠ référence `formatAggregatesForMissionTypeWithProgKey` non définie dans le fichier (vaut probablement nil) |
| `getProgressAggregateCache` | any |  ⚠ référence `getProgressAggregateCache` non définie dans le fichier (vaut probablement nil) |
| `getSaveSlotVersion` | any |  ⚠ référence `getSaveSlotVersion` non définie dans le fichier (vaut probablement nil) |
| `setSaveSlotVersion` | any |  ⚠ référence `setSaveSlotVersion` non définie dans le fichier (vaut probablement nil) |
| `startConditionMet` | any |  ⚠ référence `startConditionMet` non définie dans le fichier (vaut probablement nil) |
| `testHelper` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionAttemptAggregated` — écouté par 2 module(s)
- `onMissionUnlocked`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/progress.lua`.*
