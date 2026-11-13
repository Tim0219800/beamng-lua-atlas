# `gameplay_statistic`

*Fichier : `lua/ge/extensions/gameplay/statistic.lua` · VM : Game Engine (GE) · 837 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_statistic` : `extensions.load("gameplay_statistic")`, puis la globale `gameplay_statistic`

**Dépendances (chargées avant) :** `ui_imgui`, `core_gamestate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_statistic.addSchedule(fn)` |  | 128 |
| `gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career)` |  | 356 |
| `gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career)` |  | 382 |
| `gameplay_statistic.forceTimerUpdate()` |  | 782 |
| `gameplay_statistic.metricAdd(name, value, aggregate)` |  | 230 |
| `gameplay_statistic.metricGet(name, carreer)` |  | 293 |
| `gameplay_statistic.metricGetMatchPattern(namePattern, carreer)` |  | 307 |
| `gameplay_statistic.metricSet(name, value, aggregate)` |  | 273 |
| `gameplay_statistic.onCareerActive(active)` | *(hook)* | 757 |
| `gameplay_statistic.onClientEndMission(levelPath)` | *(hook)* | 526 |
| `gameplay_statistic.onClientPostStartMission(levelPath)` | *(hook)* | 531 |
| `gameplay_statistic.onClientStartMission(levelPath)` | *(hook)* | 522 |
| `gameplay_statistic.onDeserialized(data)` | *(hook)* | 94 |
| `gameplay_statistic.onEditorActivated()` | *(hook)* | 544 |
| `gameplay_statistic.onEditorDeactivated()` | *(hook)* | 548 |
| `gameplay_statistic.onExit()` | *(hook)* | 71 |
| `gameplay_statistic.onExtensionLoaded()` | *(hook)* | 776 |
| `gameplay_statistic.onExtensionUnloaded()` | *(hook)* | 78 |
| `gameplay_statistic.onGameStateUpdate(newState)` | *(hook)* | 582 |
| `gameplay_statistic.onPlayerVehicleCloned()` | *(hook)* | 595 |
| `gameplay_statistic.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 747 |
| `gameplay_statistic.onScenarioFinished(scenario)` | *(hook)* | 566 |
| `gameplay_statistic.onScenarioLoaded(scenario)` | M.onUiChangedState = onUiChangedState *(hook)* | 559 |
| `gameplay_statistic.onScenarioRestarted(scenario)` | *(hook)* | 574 |
| `gameplay_statistic.onSerialize()` | *(hook)* | 82 |
| `gameplay_statistic.onSpawnDefaultVehicle()` | *(hook)* | 598 |
| `gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 603 |
| `gameplay_statistic.onVehicleDestroyed(vid)` | *(hook)* | 720 |
| `gameplay_statistic.onVehicleResetted(vid)` | *(hook)* | 716 |
| `gameplay_statistic.onVehicleSelectorReplaceCurrent()` | *(hook)* | 592 |
| `gameplay_statistic.onVehicleSelectorSpawnNew()` | *(hook)* | 589 |
| `gameplay_statistic.onVehicleSpawned(vid, v)` | *(hook)* | 701 |
| `gameplay_statistic.onVehicleSwitched(oldid, newid, player)` | *(hook)* | 704 |
| `gameplay_statistic.onWorldReadyState(worldReadyState)` | *(hook)* | 540 |
| `gameplay_statistic.removeSchedule(fn)` |  | 133 |
| `gameplay_statistic.sendGUIState()` |  | 735 |
| `gameplay_statistic.setDebug(newValue)` |  | 727 |
| `gameplay_statistic.timerStart(name, increment, aggregate, useSimTime)` |  | 323 |
| `gameplay_statistic.timerStop(name)` |  | 346 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `StatisticData`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/statistic.lua`.*
