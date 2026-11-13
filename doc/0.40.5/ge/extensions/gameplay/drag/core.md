# `gameplay_drag_core`

*Fichier : `lua/ge/extensions/gameplay/drag/core.lua` · VM : Game Engine (GE) · 1664 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_core` : `extensions.load("gameplay_drag_core")`, puis la globale `gameplay_drag_core`

**Dépendances (chargées avant) :** `gameplay_drag_saveSystem`, `gameplay_drag_dragBridge`, `gameplay_drag_rulesMenu`, `gameplay_drag_timeslip`, `gameplay_drag_poi`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_core.allRacersFinished(data)` |  | 1330 |
| `gameplay_drag_core.calculateStateChecksum(data)` |  | 532 |
| `gameplay_drag_core.clear(opts)` | # Clear drag state. Accepts an options table with named fields (all default to false):<br> hooks           : fire extensions.hook("onDragClear")<br> transitionLock  : clear phase transition locks<br> localRace       : clear MP local client active race<br> extensions      : unload lazy-loaded drag extensions<br> data            : unload prefabs and nil out dragData<br> context         : reset gameplayContext to "freeroam"<br> ui              : hide drag UI apps and clear messages<br> treeLightStaging: trigger staging tree light UI off | 700 |
| `gameplay_drag_core.clearPoiJoinRequest(poiKey)` |  | 1601 |
| `gameplay_drag_core.clearRaceState(raceId)` |  | 914 |
| `gameplay_drag_core.createTimeslipData()` |  | 1572 |
| `gameplay_drag_core.createTimeslipPanelData()` |  | 1575 |
| `gameplay_drag_core.finalizeMPPostRace()` |  | 1390 |
| `gameplay_drag_core.getCurrentSavePath()` |  | 1449 |
| `gameplay_drag_core.getData()` | Single source of truth for drag data (strip, racers, timers, etc.). In MP and SP, core owns it. | 205 |
| `gameplay_drag_core.getDragDataForLevel(levelIdentifier)` |  | 1489 |
| `gameplay_drag_core.getDragGamemode()` |  | 37 |
| `gameplay_drag_core.getDragIsStarted()` |  | 964 |
| `gameplay_drag_core.getExpectedStagingRacerCount()` |  | 910 |
| `gameplay_drag_core.getExtension()` |  | 1480 |
| `gameplay_drag_core.getGameplayContext()` |  | 969 |
| `gameplay_drag_core.getMaxLanes(data)` | Number of lanes for strip data (poiData or dragData). Returns at least 1. | 1512 |
| `gameplay_drag_core.getPoiKey(poiData)` | Stable key for a drag strip (level:name). Used for one lobby per strip in MP. | 1518 |
| `gameplay_drag_core.getRaceState(raceId)` |  | 918 |
| `gameplay_drag_core.getRacerData(vehicleId)` |  | 806 |
| `gameplay_drag_core.getResetState()` |  | 589 |
| `gameplay_drag_core.getStagingCheckData()` | Called by MP host to check if all racers are staged; general only reads data. Returns (allStaged, currentDragData) or (false, nil). | 1339 |
| `gameplay_drag_core.getTimers(vehicleId)` |  | 797 |
| `gameplay_drag_core.isDragEnabled()` |  | 1525 |
| `gameplay_drag_core.isJoinWindowOpen(data)` |  | 818 |
| `gameplay_drag_core.isPoiJoinRequestSent(poiKey)` |  | 1597 |
| `gameplay_drag_core.loadDragDataForMission(filepath)` | Mission-facing helper: load drag strip data, prefabs, context, and set runtime drag data.<br>Returns loaded data table on success, nil on failure. | 521 |
| `gameplay_drag_core.loadDragStripData(filepath)` |  | 182 |
| `gameplay_drag_core.onAnyMissionChanged(status, mission)` | *(hook)* | 1443 |
| `gameplay_drag_core.onCareerActive()` | *(hook)* | 1466 |
| `gameplay_drag_core.onDragRaceCancelled(raceId)` | *(hook)* | 1268 |
| `gameplay_drag_core.onDragRaceClientDisconnected(client)` | Resolves the disconnecting client to a player and delegates to onDragRacePlayerLeft. *(hook)* | 1315 |
| `gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue)` | *(hook)* | 1011 |
| `gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType)` | *(hook)* | 1112 |
| `gameplay_drag_core.onDragRaceListChanged()` | *(hook)* | 1251 |
| `gameplay_drag_core.onDragRacePlayerLeft(player)` | Marks the racer belonging to a player as DQ+finished when they disconnect mid-race. *(hook)* | 1273 |
| `gameplay_drag_core.onDragRaceReset(raceId)` | *(hook)* | 1258 |
| `gameplay_drag_core.onDragRaceStart(raceStartTime)` | When host broadcasts race start, clients advance all racers to race phase (phase 3). *(hook)* | 1090 |
| `gameplay_drag_core.onDragRaceStarted(raceId)` | *(hook)* | 1134 |
| `gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | In MP, when network timer values arrive, check if we now have values for ALL racers.<br> Once all synced: update display signs, generate win data + winning lights, create timeslip + save history. *(hook)* | 1621 |
| `gameplay_drag_core.onDragRaceTreeLights(lane, lightState)` | *(hook)* | 1074 |
| `gameplay_drag_core.onDragRaceWinningLights(lane)` | *(hook)* | 1083 |
| `gameplay_drag_core.onExtensionLoaded()` | *(hook)* | 1324 |
| `gameplay_drag_core.onExtensionUnloaded()` | *(hook)* | 1660 |
| `gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 1586 |
| `gameplay_drag_core.onGetRawPoiListForTutorial(elements)` | *(hook)* | 1589 |
| `gameplay_drag_core.onPlayerLeftDragArea()` | Called when player leaves the drag strip zone (offline). Clears and unloads drag. Also called from onUpdate when zone check detects player outside. *(hook)* | 1351 |
| `gameplay_drag_core.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 1460 |
| `gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1407 |
| `gameplay_drag_core.onVehicleDestroyed(vehicleId)` | *(hook)* | 999 |
| `gameplay_drag_core.onVehicleResetted(vehicleId)` | *(hook)* | 973 |
| `gameplay_drag_core.onVehicleSwitched(oldId, newId)` | *(hook)* | 985 |
| `gameplay_drag_core.reset(opts)` | # Reset race state. Accepts an options table with named fields (all default to false/nil):<br> raceState       : reset isStarted/isCompleted flags<br> racers          : reset each racer's phase/DQ/finished state<br> clearRacers     : remove all racers from data<br> timeslip        : clear timeslip UI<br> transitionLock  : clear phase transition locks and remote staging hold timers<br> treeLightStaging: trigger staging tree light UI<br> hooks           : fire extensions.hook("onDragReset")<br> raceId          : race identifier (passed to hook) | 644 |
| `gameplay_drag_core.saveDialTimes(timeslip)` |  | 1453 |
| `gameplay_drag_core.sendTimeslipDataToUi()` |  | 71 |
| `gameplay_drag_core.setCareerRewards()` |  | 1470 |
| `gameplay_drag_core.setDragRaceData(data)` |  | 493 |
| `gameplay_drag_core.setExpectedStagingRacerCount(count)` |  | 906 |
| `gameplay_drag_core.setExtension(ext)` |  | 1484 |
| `gameplay_drag_core.setPlayableVehicle(vehicleId)` |  | 789 |
| `gameplay_drag_core.setPoiJoinRequestSent(poiKey, val)` |  | 1598 |
| `gameplay_drag_core.setRaceState(raceId, updates)` |  | 897 |
| `gameplay_drag_core.setRacerDial(vehicleId, dialValue)` |  | 741 |
| `gameplay_drag_core.setRacerWheelGeometry(racer, vehicle)` |  | 356 |
| `gameplay_drag_core.setRacersDial(dials)` |  | 768 |
| `gameplay_drag_core.setupRacer(vehicleId, lane)` |  | 384 |
| `gameplay_drag_core.startDragRaceActivity(lane, vehicleId)` |  | 827 |
| `gameplay_drag_core.validateResetState(data)` |  | 553 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeDragUnloadAllExtensions` — écouté par 1 module(s)
- `onDragClear` — écouté par 5 module(s)
- `onDragClearComplete` — écouté par 1 module(s)
- `onDragDataSet` — écouté par 3 module(s)
- `onDragMPTimeslipRequested`
- `onDragRacersSetup` — écouté par 2 module(s)
- `onDragReset` — écouté par 4 module(s)
- `startDragCountdown`

**Évènements UI (guihooks.trigger) :** `onDragRaceTimeslipData`, `updateTreeLightStaging`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`, `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/core.lua`.*
