# `util_richPresence`

*Fichier : `lua/ge/extensions/util/richPresence.lua` · VM : Game Engine (GE) · 729 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_richPresence` : `extensions.load("util_richPresence")`, puis la globale `util_richPresence`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_richPresence.clientEndMission(levelpath)` |  | 526 |
| `util_richPresence.clientPreStartMission(levelpath)` |  | 526 |
| `util_richPresence.onAnyMissionChanged()` | *(hook)* | 398 |
| `util_richPresence.onAttemptCompleted(attemptData)` | *(hook)* | 616 |
| `util_richPresence.onAttemptFailed(attemptData)` | *(hook)* | 606 |
| `util_richPresence.onCareerActive()` | *(hook)* | 230 |
| `util_richPresence.onClientPostStartMission(levelPath)` | *(hook)* | 357 |
| `util_richPresence.onCrawlCleared()` | *(hook)* | 242 |
| `util_richPresence.onCrawlStarted()` | *(hook)* | 241 |
| `util_richPresence.onDeliveryModeStarted()` | *(hook)* | 231 |
| `util_richPresence.onDeliveryModeStopped()` | *(hook)* | 232 |
| `util_richPresence.onDragClear()` | *(hook)* | 239 |
| `util_richPresence.onDragClearComplete()` | *(hook)* | 240 |
| `util_richPresence.onDragDataSet()` | *(hook)* | 238 |
| `util_richPresence.onDragReset()` | *(hook)* | 237 |
| `util_richPresence.onDriftContextChanged()` | *(hook)* | 243 |
| `util_richPresence.onEditorActivated()` | *(hook)* | 379 |
| `util_richPresence.onEditorDeactivated()` | *(hook)* | 386 |
| `util_richPresence.onExtensionLoaded()` | *(hook)* | 440 |
| `util_richPresence.onExtensionUnloaded()` | *(hook)* | 460 |
| `util_richPresence.onGameStateUpdate(state)` | *(hook)* | 393 |
| `util_richPresence.onMissionAttemptAggregated(attempt, mission)` | *(hook)* | 669 |
| `util_richPresence.onNewAttempt(attemptData)` | M.onPursuitOffense = onPursuitOffense *(hook)* | 596 |
| `util_richPresence.onPartShoppingCancelled()` | *(hook)* | 236 |
| `util_richPresence.onPartShoppingStarted()` | *(hook)* | 233 |
| `util_richPresence.onPartShoppingTransactionComplete()` | *(hook)* | 234 |
| `util_richPresence.onRaceBranchChosen(data)` | *(hook)* | 647 |
| `util_richPresence.onRaceLap(data)` | *(hook)* | 636 |
| `util_richPresence.onRaceResult(data)` | *(hook)* | 658 |
| `util_richPresence.onRaceWaypointReached(data)` | *(hook)* | 626 |
| `util_richPresence.onResetGameplay()` | M.onScenarioFinished = onScenarioFinished<br> M.onScenarioChange = onScenarioChange<br> M.onScenarioRestarted = onScenarioRestarted *(hook)* | 586 |
| `util_richPresence.onScenarioChange()` | *(hook)* | 235 |
| `util_richPresence.onSettingsChanged()` | *(hook)* | 493 |
| `util_richPresence.onUiChangedState(toState, fromState)` | *(hook)* | 562 |
| `util_richPresence.onUiReady()` | *(hook)* | 533 |
| `util_richPresence.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 339 |
| `util_richPresence.onWorldReadyState(levelpath)` | *(hook)* | 244 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onDeserialized` | any |  |
| `richPresenceEnabled` | boolean |  |
| `setActivity` | any |  |
| `state` | table | How to use: print(extensions.util_richPresence.set('yolo')) |

## Appels vers le moteur (C++)

- `Steam.` `timelineAddEvent`, `timelineSetGameMode`, `timelineSetStateDescription`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/richPresence.lua`.*
