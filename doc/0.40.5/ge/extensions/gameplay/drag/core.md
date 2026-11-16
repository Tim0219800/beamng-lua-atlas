# `gameplay_drag_core`

*File: `lua/ge/extensions/gameplay/drag/core.lua` · VM: Game Engine (GE) · 1664 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_core`: `extensions.load("gameplay_drag_core")`, then the global `gameplay_drag_core`

Core of the drag race system (solo and multiplayer). It owns the dragData table (track, lanes, drivers, timers, phases), creates the "racers" (setupRacer), handles race reset/clear, the MP network hooks (onDragRace*), career rewards, the lazy loading of the drag extensions (phaseHandlers, dragTypes_*, times, display) and the detection of leaving the zone. A modder uses it to load a track (loadDragDataForMission), arm a race (startDragRaceActivity) or read the state (getData, getRacerData, getTimers).

## Example

```lua
local data = gameplay_drag_core.loadDragDataForMission('/levels/west_coast_usa/dragstrips/strip.dragSettings.json')
if data then gameplay_drag_core.startDragRaceActivity(1, be:getPlayerVehicleID(0)) end
```

## Notes

- The extensions gameplay_drag_phaseHandlers, gameplay_drag_dragTypes_headsUpRace / bracketRace, gameplay_drag_times and gameplay_drag_display are loaded on demand by ensureAllExtensionsLoaded (called by setDragRaceData and startDragRaceActivity) and unloaded by clear({extensions=true}).
- dragType must be 'headsUpRace' or 'bracketRace', otherwise setDragRaceData/startDragRaceActivity fail (E log).
- The disqualification fields exist twice: isDisqualified/disqualifiedReason and the old aliases (misspelled) isDesqualified/desqualifiedReason, kept for compatibility.
- Reset states: 'idle', 'resetting', 'ready' (getResetState).
- DQ reasons are translation keys (missions.dragRace.gameplay.disqualified.vehicleReset, vehicleSwitched, vehicleRemoved, playerLeft).
- onDragRaceCancelled and onExtensionLoaded are empty functions (the reset/clear is done by dragBridge or the vehicle hooks).
- The hooks onVehicleResetted/onVehicleSwitched/onVehicleDestroyed only disqualify in the 'freeroam' context, with the race started and outside multiplayer.
- onUpdate: outside MP in freeroam, calls onPlayerLeftDragArea if no driver is in the stripZone, or if all drivers in the 'stage' phase are more than 25 m (STAGE_RUNAWAY_CLEAR_DISTANCE) from the origin.
- getResetState/validateResetState: the reset validation only emits a warning in the log (no blocking error).
- Career reward: 5 (careerRewards) in 'bmra' currency, only once per race, not in the 'activity' context.

**Dependencies (loaded first):** `gameplay_drag_saveSystem`, `gameplay_drag_dragBridge`, `gameplay_drag_rulesMenu`, `gameplay_drag_timeslip`, `gameplay_drag_poi`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_core.allRacersFinished(data)` | True if data contains at least one racer and all have isFinished. | 1330 |
| `gameplay_drag_core.calculateStateChecksum(data)` | Simple checksum of the race state (isStarted, isCompleted, phases, DQ, racers' finished), used to log the effect of a reset. | 532 |
| `gameplay_drag_core.clear(opts)` | Cleans the drag state according to the options (all false by default): hooks (onDragClear then onDragClearComplete), transitionLock, localRace (MP), extensions (unloads the lazy extensions), data (unloads the prefabs and sets dragData to nil), context (back to 'freeroam'), ui (hides the 'drag' app), treeLightStaging (turns off the staging light). | 700 |
| `gameplay_drag_core.clearPoiJoinRequest(poiKey)` | Forgets the participation request sent for a POI (MP). | 1601 |
| `gameplay_drag_core.clearRaceState(raceId)` | Removes the state stored for an MP race (raceStateStore). | 914 |
| `gameplay_drag_core.createTimeslipData()` | Delegates to gameplay_drag_timeslip.createTimeslipData. | 1572 |
| `gameplay_drag_core.createTimeslipPanelData()` | Delegates to gameplay_drag_timeslip.createTimeslipPanelData. | 1575 |
| `gameplay_drag_core.finalizeMPPostRace()` | MP race end: calls display.dragRaceEndLineReached for each racer, generates the win data (phaseHandlers.generateWinData) then sends the slip to the UI (and saves the dial times). | 1390 |
| `gameplay_drag_core.getCurrentSavePath()` | Current save path of the drag save system. | 1449 |
| `gameplay_drag_core.getData()` | Single source of drag data (track, racers, timers). Solo and MP: core owns it. | 205 |
| `gameplay_drag_core.getDragDataForLevel(levelIdentifier)` | Loads (then caches) all *.dragSettings.json tracks from a level's dragstrips folder. Adds _originFile, _fnWithoutExt and _index to each entry. | 1489 |
| `gameplay_drag_core.getDragGamemode()` | Returns the multiplayer drag gamemode extension (multiplayer/gamemodes/drag/drag) if it is loaded. | 37 |
| `gameplay_drag_core.getDragIsStarted()` | Indicates whether the race is started (dragData.isStarted). | 964 |
| `gameplay_drag_core.getExpectedStagingRacerCount()` | Number of drivers expected in staging before starting the countdown (1 by default). | 910 |
| `gameplay_drag_core.getExtension()` | Active race type extension (headsUpRace or bracketRace). | 1480 |
| `gameplay_drag_core.getGameplayContext()` | Current game context: 'freeroam' by default, or the track's data.context (e.g. 'activity'). | 969 |
| `gameplay_drag_core.getMaxLanes(data)` | Number of lanes of the track (at least 1; 2 by default if the track has no lanes). | 1512 |
| `gameplay_drag_core.getPoiKey(poiData)` | Stable "level:name" key of a track (name = _fnWithoutExt or name), used for a per-track lobby in MP. | 1518 |
| `gameplay_drag_core.getRaceState(raceId)` | Returns a snapshot of the race state. In MP: from the raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData...), or nil if not found. In solo: data, isStarted, isCompleted, treeType. | 918 |
| `gameplay_drag_core.getRacerData(vehicleId)` | Returns the racer table of a vehicle. | 806 |
| `gameplay_drag_core.getResetState()` | Reset state: 'idle', 'resetting' or 'ready'. | 589 |
| `gameplay_drag_core.getStagingCheckData()` | Called by the MP host: checks whether all drivers are in staging (read-only). | 1339 |
| `gameplay_drag_core.getTimers(vehicleId)` | Timers of a racer (dial, timer, distanceTimer, velocity...). | 797 |
| `gameplay_drag_core.isDragEnabled()` | Drag is allowed if career is active or if the enableDragRaceInFreeroam setting is true. | 1525 |
| `gameplay_drag_core.isJoinWindowOpen(data)` | Participation window open: race not finished and no racer beyond phase 1. | 818 |
| `gameplay_drag_core.isPoiJoinRequestSent(poiKey)` | Indicates whether a participation request has already been sent for this POI. | 1597 |
| `gameplay_drag_core.loadDragDataForMission(filepath)` | Helper for missions: loads the track from a file, loads the prefabs, sets the context and arms the data (setDragRaceData). | 521 |
| `gameplay_drag_core.loadDragStripData(filepath)` | Loads the track data via saveSystem.loadDragStripData and stores it in dragData. | 182 |
| `gameplay_drag_core.onAnyMissionChanged(status, mission)` | Hook: at every mission start or stop, does a full clear (all flags true). *(internal)* *(hook)* | 1443 |
| `gameplay_drag_core.onCareerActive()` | Hook: career activated, delegates to saveSystem.onCareerActive. *(internal)* *(hook)* | 1466 |
| `gameplay_drag_core.onDragRaceCancelled(raceId)` | MP hook: race cancelled. Does nothing (the reset/clear comes from dragBridge or the vehicle hooks). *(internal)* *(hook)* | 1268 |
| `gameplay_drag_core.onDragRaceClientDisconnected(client)` | MP hook: a client disconnects. Finds the matching MP player and calls onDragRacePlayerLeft. *(internal)* *(hook)* | 1315 |
| `gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue)` | Hook: countdown start. In MP on the client side, ends phase 1 of all racers and moves to the next phase; in solo, moves to the next phase if all expected drivers are in staging. Then starts phase 2 of each racer (startDragCountdown hook). *(internal)* *(hook)* | 1011 |
| `gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType)` | MP hook: participation accepted. Arms the track data (with treeType), creates the local vehicle's racer, starts the activity and opens the lobby menu if closed. *(internal)* *(hook)* | 1112 |
| `gameplay_drag_core.onDragRaceListChanged()` | MP hook: the race list changed; relayed to the drag gamemode. *(internal)* *(hook)* | 1251 |
| `gameplay_drag_core.onDragRacePlayerLeft(player)` | MP hook: marks the racer of a player who left as disqualified and finished (playerLeft reason). Looks up by vehicleId, otherwise by lane. *(internal)* *(hook)* | 1273 |
| `gameplay_drag_core.onDragRaceReset(raceId)` | MP hook: resets isStarted/isCompleted to false and allows a new onDragRaceStarted for the same race (next round). *(internal)* *(hook)* | 1258 |
| `gameplay_drag_core.onDragRaceStart(raceStartTime)` | MP hook: the host broadcasts the start; the (non-host) clients end phase 2 and put all racers in the race phase (phase 3). *(internal)* *(hook)* | 1090 |
| `gameplay_drag_core.onDragRaceStarted(raceId)` | MP hook: the round starts. Rebuilds dragData from raceState.poiData (deep copy), creates the round's racers, marks the local racer (isLocalRacer), applies the dials, emits onDragReset, runs startDragRaceActivity and opens the dial control in bracketRace if the local dial is empty. Ignores duplicate calls for the same raceId. *(internal)* *(hook)* | 1134 |
| `gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | MP hook: a network timer arrives. Applies a remote player's dial and re-associates the racer with the real vehicleId if the key changed (same lane). *(internal)* *(hook)* | 1621 |
| `gameplay_drag_core.onDragRaceTreeLights(lane, lightState)` | MP hook: tree light state received for a lane. Updates the staging of the lane's racers (if stageLight is set) then the display. *(internal)* *(hook)* | 1074 |
| `gameplay_drag_core.onDragRaceWinningLights(lane)` | MP hook: turns on the lane winner's light (display.onWinnerLightOn). *(internal)* *(hook)* | 1083 |
| `gameplay_drag_core.onExtensionLoaded()` | Load hook; does nothing. *(internal)* *(hook)* | 1324 |
| `gameplay_drag_core.onExtensionUnloaded()` | Unload hook: full clear of the drag state. *(internal)* *(hook)* | 1660 |
| `gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook: adds the drag track POIs of a level (delegates to gameplay_drag_poi). *(internal)* *(hook)* | 1586 |
| `gameplay_drag_core.onGetRawPoiListForTutorial(elements)` | Hook: POI list for the tutorial, always that of the west_coast_usa level. *(internal)* *(hook)* | 1589 |
| `gameplay_drag_core.onPlayerLeftDragArea()` | Called when the player leaves the track zone (offline): full clear with unloading of the extensions. Also called from onUpdate. *(hook)* | 1351 |
| `gameplay_drag_core.onSaveCurrentProfile(currentSavePath)` | Hook: career profile save; writes the dial times file. *(internal)* *(hook)* | 1460 |
| `gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: detects leaving the zone (stripZone) and staging runaway (> 25 m), then handles re-staging after DQ in freeroam and the remote staging timers. *(internal)* *(hook)* | 1407 |
| `gameplay_drag_core.onVehicleDestroyed(vehicleId)` | Hook: vehicle destroyed. In solo freeroam with the race started, marks the racer as removed and disqualified. *(internal)* *(hook)* | 999 |
| `gameplay_drag_core.onVehicleResetted(vehicleId)` | Hook: vehicle reset. In solo freeroam with the race started, disqualifies the racer (vehicleReset). *(internal)* *(hook)* | 973 |
| `gameplay_drag_core.onVehicleSwitched(oldId, newId)` | Hook: played vehicle switched. In solo freeroam with the race started, disqualifies the old and the new racer (vehicleSwitched). *(internal)* *(hook)* | 985 |
| `gameplay_drag_core.reset(opts)` | Resets the race state according to the options (false/nil by default): raceState (isStarted/isCompleted), racers (phase, DQ, finished, timers of each racer), clearRacers (empties the list), timeslip (clears the UI slip), transitionLock, treeLightStaging (staging light on), hooks (emits onDragReset), raceId (passed to the hook). Then validates the state and logs a warning if inconsistent. | 644 |
| `gameplay_drag_core.saveDialTimes(timeslip)` | Records the slip times in the dial book via saveSystem.saveDialTimes (if data is loaded). | 1453 |
| `gameplay_drag_core.sendTimeslipDataToUi()` | Sends the slip to the UI (guihook onDragRaceTimeslipData). In MP, emits the hook onDragMPTimeslipRequested instead and lets the gamemode finalize. Also saves the dial times; in drag multiseat gamemode, does not send the slip to the HUD. | 71 |
| `gameplay_drag_core.setCareerRewards()` | Grants the career reward (bmra currency, value 5) once per race, except in the 'activity' context or with career inactive. | 1470 |
| `gameplay_drag_core.setDragRaceData(data)` | Arms the track data: normalizes the DQ fields, computes raceEndTimerId (timer with the greatest distance), restores the zones' metatables, synchronizes the waypoints with the scene, loads the required extensions, reads the dial book then emits onDragDataSet. | 493 |
| `gameplay_drag_core.setExpectedStagingRacerCount(count)` | Sets the number of drivers that must be in staging before the start (minimum 1). | 906 |
| `gameplay_drag_core.setExtension(ext)` | Replaces the active race type extension. | 1484 |
| `gameplay_drag_core.setPlayableVehicle(vehicleId)` | Marks the vehicle's racer as playable (isPlayable = true). | 789 |
| `gameplay_drag_core.setPoiJoinRequestSent(poiKey, val)` | Stores (val true) or forgets a participation request for a POI. | 1598 |
| `gameplay_drag_core.setRaceState(raceId, updates)` | Merges fields into the stored state of an MP race. | 897 |
| `gameplay_drag_core.setRacerDial(vehicleId, dialValue)` | Sets the dial (announced time, in seconds) of a racer and marks it isSet. Creates the dial timer if missing. | 741 |
| `gameplay_drag_core.setRacerWheelGeometry(racer, vehicle)` | Computes the vehicle's wheel geometry (groups by "frontness", offsets from the center) and initializes racer.allWheelsOffsets, wheelsCenter, beamState and frontWheelId. If no wheel is found, uses the OOBB. | 356 |
| `gameplay_drag_core.setRacersDial(dials)` | Applies several dials at once. | 768 |
| `gameplay_drag_core.setupRacer(vehicleId, lane)` | Creates a vehicle's racer in a lane (phases, timers from the track config, initial dial, wheel geometry, name, plate, stock state). Refuses an already occupied lane. In MP, creates a stub if the vehicle does not exist locally. | 384 |
| `gameplay_drag_core.startDragRaceActivity(lane, vehicleId)` | Starts the drag activity: loads the extensions, creates the player's racer in solo freeroam, shows the 'drag' UI app, turns on staging, turns the ignition off/on to 3 for playable racers outside freeroam, emits onDragRacersSetup then calls the race type's startActivity. | 827 |
| `gameplay_drag_core.validateResetState(data)` | Checks that a reset is complete (race not started, racers in phase 1, neither DQ nor finished, timers stopped, phases reset). | 553 |

### Parameter details

#### `gameplay_drag_core.allRacersFinished(data)`

True if data contains at least one racer and all have isFinished.

- `data` (*table|nil*) : Track data (dragData or poiData).
- **returns**: boolean true if all drivers have finished.

#### `gameplay_drag_core.calculateStateChecksum(data)`

Simple checksum of the race state (isStarted, isCompleted, phases, DQ, racers' finished), used to log the effect of a reset.

- `data` (*table|nil*) : Track data.
- **returns**: integer Checksum, 0 if data is nil.

#### `gameplay_drag_core.clear(opts)`

Cleans the drag state according to the options (all false by default): hooks (onDragClear then onDragClearComplete), transitionLock, localRace (MP), extensions (unloads the lazy extensions), data (unloads the prefabs and sets dragData to nil), context (back to 'freeroam'), ui (hides the 'drag' app), treeLightStaging (turns off the staging light).

- `opts` (*table|nil*) : Table of boolean options named hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging.

#### `gameplay_drag_core.clearPoiJoinRequest(poiKey)`

Forgets the participation request sent for a POI (MP).

- `poiKey` (*string|nil*) : Key returned by getPoiKey.

#### `gameplay_drag_core.clearRaceState(raceId)`

Removes the state stored for an MP race (raceStateStore).

- `raceId` (*any*) : Race identifier.

#### `gameplay_drag_core.createTimeslipData()`

Delegates to gameplay_drag_timeslip.createTimeslipData.

- **returns**: table Timing slip data.

#### `gameplay_drag_core.createTimeslipPanelData()`

Delegates to gameplay_drag_timeslip.createTimeslipPanelData.

- **returns**: table Slip panel data.

#### `gameplay_drag_core.getCurrentSavePath()`

Current save path of the drag save system.

- **returns**: string|nil Path (inferred from saveSystem.getCurrentSavePath).

#### `gameplay_drag_core.getData()`

Single source of drag data (track, racers, timers). Solo and MP: core owns it.

- **returns**: table|nil dragData, nil if nothing is loaded.

#### `gameplay_drag_core.getDragDataForLevel(levelIdentifier)`

Loads (then caches) all *.dragSettings.json tracks from a level's dragstrips folder. Adds _originFile, _fnWithoutExt and _index to each entry.

- `levelIdentifier` (*string*) : Level name (core_levels.getLevelByName).
- **returns**: table[] List of track data.

#### `gameplay_drag_core.getDragGamemode()`

Returns the multiplayer drag gamemode extension (multiplayer/gamemodes/drag/drag) if it is loaded.

- **returns**: table|nil The extension or nil.

#### `gameplay_drag_core.getDragIsStarted()`

Indicates whether the race is started (dragData.isStarted).

- **returns**: boolean false if no data.

#### `gameplay_drag_core.getExpectedStagingRacerCount()`

Number of drivers expected in staging before starting the countdown (1 by default).

- **returns**: integer Expected number.

#### `gameplay_drag_core.getExtension()`

Active race type extension (headsUpRace or bracketRace).

- **returns**: table|nil The dragType extension.

#### `gameplay_drag_core.getGameplayContext()`

Current game context: 'freeroam' by default, or the track's data.context (e.g. 'activity').

- **returns**: string Context.

#### `gameplay_drag_core.getMaxLanes(data)`

Number of lanes of the track (at least 1; 2 by default if the track has no lanes).

- `data` (*table|nil*) : poiData or dragData.
- **returns**: integer Number of lanes.

#### `gameplay_drag_core.getPoiKey(poiData)`

Stable "level:name" key of a track (name = _fnWithoutExt or name), used for a per-track lobby in MP.

- `poiData` (*table|nil*) : POI data.
- **returns**: string|nil Key, nil if poiData is nil.

#### `gameplay_drag_core.getRaceState(raceId)`

Returns a snapshot of the race state. In MP: from the raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData...), or nil if not found. In solo: data, isStarted, isCompleted, treeType.

- `raceId` (*any*) : MP race identifier; nil = active local race or first stored.
- **returns**: table|nil Race state.

#### `gameplay_drag_core.getRacerData(vehicleId)`

Returns the racer table of a vehicle.

- `vehicleId` (*integer*) : Vehicle ID.
- **returns**: table|nil Racer, nil if unknown.

#### `gameplay_drag_core.getResetState()`

Reset state: 'idle', 'resetting' or 'ready'.

- **returns**: string State.

#### `gameplay_drag_core.getStagingCheckData()`

Called by the MP host: checks whether all drivers are in staging (read-only).

- **returns**: boolean allStaged; false if not host, race not started or no data.
- **returns**: table|nil Current dragData, nil if the check did not take place.

#### `gameplay_drag_core.getTimers(vehicleId)`

Timers of a racer (dial, timer, distanceTimer, velocity...).

- `vehicleId` (*integer*) : Vehicle ID.
- **returns**: table|nil Timers table ({} if racer unknown, nil if no data).

#### `gameplay_drag_core.isDragEnabled()`

Drag is allowed if career is active or if the enableDragRaceInFreeroam setting is true.

- **returns**: boolean Enabled or not.

#### `gameplay_drag_core.isJoinWindowOpen(data)`

Participation window open: race not finished and no racer beyond phase 1.

- `data` (*table|nil*) : Track data.
- **returns**: boolean Open or not.

#### `gameplay_drag_core.isPoiJoinRequestSent(poiKey)`

Indicates whether a participation request has already been sent for this POI.

- `poiKey` (*string*) : POI key.
- **returns**: boolean|nil true if sent.

#### `gameplay_drag_core.loadDragDataForMission(filepath)`

Helper for missions: loads the track from a file, loads the prefabs, sets the context and arms the data (setDragRaceData).

- `filepath` (*string*) : Path of the track file (.dragSettings.json).
- **returns**: table|nil Loaded data, nil on failure.

#### `gameplay_drag_core.loadDragStripData(filepath)`

Loads the track data via saveSystem.loadDragStripData and stores it in dragData.

- `filepath` (*string*) : File path.
- **returns**: table|nil Data or nil (E log).

#### `gameplay_drag_core.onAnyMissionChanged(status, mission)`

Hook: at every mission start or stop, does a full clear (all flags true).

- `status` (*string*) : 'started' or 'stopped' trigger the cleanup.
- `mission` (*table*) : Mission concerned.

#### `gameplay_drag_core.onDragRaceCancelled(raceId)`

MP hook: race cancelled. Does nothing (the reset/clear comes from dragBridge or the vehicle hooks).

- `raceId` (*any*) : Race identifier.

#### `gameplay_drag_core.onDragRaceClientDisconnected(client)`

MP hook: a client disconnects. Finds the matching MP player and calls onDragRacePlayerLeft.

- `client` (*table*) : Client with an id field.

#### `gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue)`

Hook: countdown start. In MP on the client side, ends phase 1 of all racers and moves to the next phase; in solo, moves to the next phase if all expected drivers are in staging. Then starts phase 2 of each racer (startDragCountdown hook).

- `mappedTime` (*number*) : Countdown time (not used directly).
- `randValue` (*number*) : Random value (not used directly).

#### `gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType)`

MP hook: participation accepted. Arms the track data (with treeType), creates the local vehicle's racer, starts the activity and opens the lobby menu if closed.

- `raceId` (*any*) : Race identifier.
- `lane` (*integer*) : Assigned lane.
- `poiData` (*table*) : Track data.
- `treeType` (*string*) : Starting tree type (e.g. '.500').

#### `gameplay_drag_core.onDragRacePlayerLeft(player)`

MP hook: marks the racer of a player who left as disqualified and finished (playerLeft reason). Looks up by vehicleId, otherwise by lane.

- `player` (*table*) : Table with mpPlayerId.

#### `gameplay_drag_core.onDragRaceReset(raceId)`

MP hook: resets isStarted/isCompleted to false and allows a new onDragRaceStarted for the same race (next round).

- `raceId` (*any*) : Race identifier.

#### `gameplay_drag_core.onDragRaceStart(raceStartTime)`

MP hook: the host broadcasts the start; the (non-host) clients end phase 2 and put all racers in the race phase (phase 3).

- `raceStartTime` (*number*) : Start time (not used directly).

#### `gameplay_drag_core.onDragRaceStarted(raceId)`

MP hook: the round starts. Rebuilds dragData from raceState.poiData (deep copy), creates the round's racers, marks the local racer (isLocalRacer), applies the dials, emits onDragReset, runs startDragRaceActivity and opens the dial control in bracketRace if the local dial is empty. Ignores duplicate calls for the same raceId.

- `raceId` (*any*) : Race identifier.

#### `gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)`

MP hook: a network timer arrives. Applies a remote player's dial and re-associates the racer with the real vehicleId if the key changed (same lane).

- `raceId` (*any*) : Race identifier.
- `mpPlayerId` (*any*) : MP player.
- `timerName` (*string*) : Timer name (e.g. 'dial').
- `timerValue` (*number*) : Value.

#### `gameplay_drag_core.onDragRaceTreeLights(lane, lightState)`

MP hook: tree light state received for a lane. Updates the staging of the lane's racers (if stageLight is set) then the display.

- `lane` (*integer*) : Lane.
- `lightState` (*table*) : Light state (stageLights.stageLight, etc.).

#### `gameplay_drag_core.onDragRaceWinningLights(lane)`

MP hook: turns on the lane winner's light (display.onWinnerLightOn).

- `lane` (*integer*) : Winning lane.

#### `gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook: adds the drag track POIs of a level (delegates to gameplay_drag_poi).

- `levelIdentifier` (*string*) : Level name.
- `elements` (*table*) : POI list to complete.

#### `gameplay_drag_core.onGetRawPoiListForTutorial(elements)`

Hook: POI list for the tutorial, always that of the west_coast_usa level.

- `elements` (*table*) : POI list to complete.

#### `gameplay_drag_core.onSaveCurrentProfile(currentSavePath)`

Hook: career profile save; writes the dial times file.

- `currentSavePath` (*string|nil*) : Save path.

#### `gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: detects leaving the zone (stripZone) and staging runaway (> 25 m), then handles re-staging after DQ in freeroam and the remote staging timers.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `gameplay_drag_core.onVehicleDestroyed(vehicleId)`

Hook: vehicle destroyed. In solo freeroam with the race started, marks the racer as removed and disqualified.

- `vehicleId` (*integer*) : Vehicle ID.

#### `gameplay_drag_core.onVehicleResetted(vehicleId)`

Hook: vehicle reset. In solo freeroam with the race started, disqualifies the racer (vehicleReset).

- `vehicleId` (*integer*) : Vehicle ID.

#### `gameplay_drag_core.onVehicleSwitched(oldId, newId)`

Hook: played vehicle switched. In solo freeroam with the race started, disqualifies the old and the new racer (vehicleSwitched).

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.

#### `gameplay_drag_core.reset(opts)`

Resets the race state according to the options (false/nil by default): raceState (isStarted/isCompleted), racers (phase, DQ, finished, timers of each racer), clearRacers (empties the list), timeslip (clears the UI slip), transitionLock, treeLightStaging (staging light on), hooks (emits onDragReset), raceId (passed to the hook). Then validates the state and logs a warning if inconsistent.

- `opts` (*table|nil*) : Named options.

#### `gameplay_drag_core.saveDialTimes(timeslip)`

Records the slip times in the dial book via saveSystem.saveDialTimes (if data is loaded).

- `timeslip` (*table*) : Slip data.

#### `gameplay_drag_core.setCareerRewards()`

Grants the career reward (bmra currency, value 5) once per race, except in the 'activity' context or with career inactive.

- **returns**: table|nil {bmra = n} if granted, nil otherwise.

#### `gameplay_drag_core.setDragRaceData(data)`

Arms the track data: normalizes the DQ fields, computes raceEndTimerId (timer with the greatest distance), restores the zones' metatables, synchronizes the waypoints with the scene, loads the required extensions, reads the dial book then emits onDragDataSet.

- `data` (*table*) : Track data (dragSettings).

#### `gameplay_drag_core.setExpectedStagingRacerCount(count)`

Sets the number of drivers that must be in staging before the start (minimum 1).

- `count` (*integer*) : Number of drivers.

#### `gameplay_drag_core.setExtension(ext)`

Replaces the active race type extension.

- `ext` (*table|nil*) : dragType extension.

#### `gameplay_drag_core.setPlayableVehicle(vehicleId)`

Marks the vehicle's racer as playable (isPlayable = true).

- `vehicleId` (*integer*) : Vehicle ID.

#### `gameplay_drag_core.setPoiJoinRequestSent(poiKey, val)`

Stores (val true) or forgets a participation request for a POI.

- `poiKey` (*string*) : POI key.
- `val` (*boolean*) : true to store, otherwise clears.

#### `gameplay_drag_core.setRaceState(raceId, updates)`

Merges fields into the stored state of an MP race.

- `raceId` (*any*) : Race identifier.
- `updates` (*table*) : Fields to write.

#### `gameplay_drag_core.setRacerDial(vehicleId, dialValue)`

Sets the dial (announced time, in seconds) of a racer and marks it isSet. Creates the dial timer if missing.

- `vehicleId` (*integer*) : Vehicle ID.
- `dialValue` (*number*) : Value >= 0.
- **returns**: boolean true if applied.

#### `gameplay_drag_core.setRacerWheelGeometry(racer, vehicle)`

Computes the vehicle's wheel geometry (groups by "frontness", offsets from the center) and initializes racer.allWheelsOffsets, wheelsCenter, beamState and frontWheelId. If no wheel is found, uses the OOBB.

- `racer` (*table*) : Racer to complete.
- `vehicle` (*userdata*) : BeamNGVehicle object.

#### `gameplay_drag_core.setRacersDial(dials)`

Applies several dials at once.

- `dials` (*table[]*) : List of entries {racerId = vehId, value = dial}.
- **returns**: boolean true if at least one dial was applied.

#### `gameplay_drag_core.setupRacer(vehicleId, lane)`

Creates a vehicle's racer in a lane (phases, timers from the track config, initial dial, wheel geometry, name, plate, stock state). Refuses an already occupied lane. In MP, creates a stub if the vehicle does not exist locally.

- `vehicleId` (*integer*) : Vehicle ID.
- `lane` (*integer|nil*) : Lane.

#### `gameplay_drag_core.startDragRaceActivity(lane, vehicleId)`

Starts the drag activity: loads the extensions, creates the player's racer in solo freeroam, shows the 'drag' UI app, turns on staging, turns the ignition off/on to 3 for playable racers outside freeroam, emits onDragRacersSetup then calls the race type's startActivity.

- `lane` (*integer|nil*) : Player's lane.
- `vehicleId` (*integer|nil*) : Vehicle (default: player 0's vehicle).
- **returns**: boolean true if started.

#### `gameplay_drag_core.validateResetState(data)`

Checks that a reset is complete (race not started, racers in phase 1, neither DQ nor finished, timers stopped, phases reset).

- `data` (*table|nil*) : Track data.
- **returns**: boolean Valid or not.
- **returns**: string Explanatory message.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: saveSystem, dragBridge, rulesMenu, timeslip, poi. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeDragUnloadAllExtensions` — listened to by 1 module(s)
- `onDragClear` — listened to by 5 module(s)
- `onDragClearComplete` — listened to by 1 module(s)
- `onDragDataSet` — listened to by 3 module(s)
- `onDragMPTimeslipRequested`
- `onDragRacersSetup` — listened to by 2 module(s)
- `onDragReset` — listened to by 4 module(s)
- `startDragCountdown`

**UI events (guihooks.trigger):** `onDragRaceTimeslipData`, `updateTreeLightStaging`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`, `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/core.lua`.*
