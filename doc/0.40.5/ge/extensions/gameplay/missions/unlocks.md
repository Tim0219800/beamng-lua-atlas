# `gameplay_missions_unlocks`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks.lua` · VM : Game Engine (GE) · 485 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks` : `extensions.load("gameplay_missions_unlocks")`, puis la globale `gameplay_missions_unlocks`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_unlocks.clearCache()` |  | 478 |
| `gameplay_missions_unlocks.clearUnlockStatusCache()` |  | 471 |
| `gameplay_missions_unlocks.conditionMet(condition)` | This function recursively processes a condition, generating label, if the condition is met etc. | 16 |
| `gameplay_missions_unlocks.constructUnlocksField(mission)` |  | 399 |
| `gameplay_missions_unlocks.depthIdSort(a, b)` |  | 450 |
| `gameplay_missions_unlocks.depthIdSortUsingIds(aId, bId)` |  | 459 |
| `gameplay_missions_unlocks.getBackwardMissionIds(mission)` |  | 363 |
| `gameplay_missions_unlocks.getBranchLevelForCondition(cond, list)` | recursively gets all branch level requirements in conditions (branchLevel) | 112 |
| `gameplay_missions_unlocks.getForwardMissionInfo(mission)` |  | 374 |
| `gameplay_missions_unlocks.getMissionBasedUnlockDiff(mission, diff)` | for a specific mission, gets all missions that are directly unlocked by it. | 82 |
| `gameplay_missions_unlocks.getMissionsForCondition(cond, list)` | recursively collects all missions referenced in conditions (missionPassed, missionCompleted) | 98 |
| `gameplay_missions_unlocks.getSimpleUnlockedStatus()` | this function generates a flat/simple list of all unlock data for all missions, used for comparisons. | 33 |
| `gameplay_missions_unlocks.getStartableDetails(mission)` |  | 277 |
| `gameplay_missions_unlocks.getUnlockDiff(before, after)` | compares two simpleUnlockedStatus lists to see what changed between them | 58 |
| `gameplay_missions_unlocks.isMissionStartable(mission)` | Unlocks API | 296 |
| `gameplay_missions_unlocks.isMissionVisible(mission)` |  | 346 |
| `gameplay_missions_unlocks.onExtensionLoaded()` | load all condition types. *(hook)* | 435 |
| `gameplay_missions_unlocks.overrideStartable(mission, value)` |  | 391 |
| `gameplay_missions_unlocks.overrideVisible(mission, value)` |  | 395 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `startConditionMet` | any |  ⚠ référence `startConditionMet` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks.lua`.*
