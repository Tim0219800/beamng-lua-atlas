# `gameplay_drag_phaseHandlers`

*Fichier : `lua/ge/extensions/gameplay/drag/phaseHandlers.lua` · VM : Game Engine (GE) · 1232 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_phaseHandlers` : `extensions.load("gameplay_drag_phaseHandlers")`, puis la globale `gameplay_drag_phaseHandlers`

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_times`, `gameplay_drag_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_phaseHandlers.areAllRacersStaged(dragData)` | Checks if all racers are properly staged (ready for countdown).<br>  A racer is considered staged if:<br>  - They are in phase 1 (stage phase)<br>  - Their phase 1 is completed (they've reached the staging beam)<br><br>  @param dragData - The drag race data (optional, will fetch if not provided)<br>  @return true if all racers are staged, false otherwise<br>  @return number of staged racers<br>  @return total number of racers | 433 |
| `gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer)` |  | 58 |
| `gameplay_drag_phaseHandlers.changeAllPhases()` |  | 381 |
| `gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase)` |  | 313 |
| `gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim)` | Per-vehicle re-stage timer/notification, so multiseat racers who false-start independently don't<br>interfere with each other. Returns "leftArea" only when the lone racer (singleplayer/legacy freeroam)<br>reverses far enough to abandon the strip entirely; with several racers, that one is simply re-staged<br>instead of tearing down the whole activity for everyone else. | 637 |
| `gameplay_drag_phaseHandlers.clearDqRestageState()` |  | 629 |
| `gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId)` |  | 299 |
| `gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers()` |  | 625 |
| `gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim)` |  | 715 |
| `gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason)` |  | 236 |
| `gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim)` |  | 1052 |
| `gameplay_drag_phaseHandlers.generateWinData()` |  | 280 |
| `gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer)` |  | 50 |
| `gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data)` |  | 174 |
| `gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer)` |  | 93 |
| `gameplay_drag_phaseHandlers.onDragClear()` | *(hook)* | 1227 |
| `gameplay_drag_phaseHandlers.onExtensionLoaded()` | *(hook)* | 43 |
| `gameplay_drag_phaseHandlers.race(phase, racer, dtSim)` |  | 838 |
| `gameplay_drag_phaseHandlers.setDialsData(data)` |  | 1178 |
| `gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId)` |  | 309 |
| `gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged)` |  | 592 |
| `gameplay_drag_phaseHandlers.stage(phase, racer, dtSim)` |  | 471 |
| `gameplay_drag_phaseHandlers.startRaceFromTree(vehId)` |  | 393 |
| `gameplay_drag_phaseHandlers.stop(phase, racer, dtSim)` |  | 992 |
| `gameplay_drag_phaseHandlers.updateRacer(racer)` |  | 1099 |
| `gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers()` |  | 608 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `redLightReason` | string |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dragRaceEndLineReached`
- `dragRaceStarted`
- `dragRaceVehicleStopped`
- `onPhaseTransition`
- `onRacerPhaseTransition` — écouté par 2 module(s)
- `onWinnerLightOn` — écouté par 1 module(s)
- `setDisqualifiedLights`
- `stageStarted`
- `startDragCountdown`
- `stoppingVehicleDrag`

**Évènements UI (guihooks.trigger) :** `DragRaceTreeFlashMessage`, `ScenarioFlashMessage`, `updateStageApp`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/phaseHandlers.lua`.*
