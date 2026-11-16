# `gameplay_drag_dragBridge`

*File: `lua/ge/extensions/gameplay/drag/dragBridge.lua` · VM: Game Engine (GE) · 888 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_dragBridge`: `extensions.load("gameplay_drag_dragBridge")`, then the global `gameplay_drag_dragBridge`

Facade of the drag system for flowgraph nodes (missions) and the Vue interface. It contains almost no logic: it forwards to gameplay_drag_core, saveSystem, rulesMenu, timeslip and phaseHandlers, provides ready-to-use data for the UI (race info, dial, tree state, live times, track rules) and pushes guihooks (dragRaceInfoChanged, dragDialDataChanged, onDragRaceLiveTimesData, onDragReset) when the drag state changes. A modder uses it to start/stop a race, set drivers and dials, or generate opponents.

## Example

```lua
gameplay_drag_dragBridge.loadDragDataForMission('/levels/west_coast_usa/dragstrips/strip.dragSettings.json')
gameplay_drag_dragBridge.setVehicles({{id = playerId, lane = 1, isPlayable = true, dial = 11.5}})
gameplay_drag_dragBridge.startDragRaceActivity(1)
```

## Notes

- startDragRace always returns a truthy value: the expression is "startDragRaceActivity(...) or true", so even a failed start returns true (only the absence of a vehicle returns false).
- startDragRace ignores the vehicleId parameter for the start (it is only used to check that the vehicle exists): core.startDragRaceActivity(lane or 1) is called without a vehicle.
- Speed times (type 'velocity') are in m/s; the UI receives value_kmh and value_mph (strings with 3 decimals).
- The phase messages of the HUD info (Staging, On Tree, Racing, Stopping, Ready) are hardcoded in English.
- onUpdate sends to the UI only the timers whose value changed by more than 0.0005 s (per-lane cache, emptied on every setup/reset/clear).
- getTimers/getRacerData return {} when nothing is found (whereas core.getRacerData returns nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId)` | Returns the saved rules of a track (delegates to rulesMenu.applyRulesRestore). | 548 |
| `gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules)` | Saves the rules of a track (rulesMenu). In MP, broadcasts them to the clients (broadcastRulesUpdate); also applies importantTimerId, dragType and treeType to the current race data. | 527 |
| `gameplay_drag_dragBridge.cleanup()` | Stops the race if it is started (stopDragRace). | 563 |
| `gameplay_drag_dragBridge.clearRacers()` | Removes all racers from the current data (core.reset with clearRacers = true). | 400 |
| `gameplay_drag_dragBridge.clearTimeslip()` | Clears the slip on the UI side (core.reset with timeslip = true). | 483 |
| `gameplay_drag_dragBridge.closeMenu()` | Closes all career menus (career_career.closeAllMenus). Also serves as the tether callback. | 558 |
| `gameplay_drag_dragBridge.configureDragStrip(dragStrip)` | Compatibility: returns true if dragStrip is not nil. The actual config is applied by core.setDragRaceData. | 118 |
| `gameplay_drag_dragBridge.createTimeslipData()` | Delegates to core.createTimeslipData. | 471 |
| `gameplay_drag_dragBridge.generateHashFromFile(vehicleId)` | Identification hash of a vehicle/config for the dial book (saveSystem.generateHashFromFile). Without argument, uses player 0's vehicle. | 421 |
| `gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset)` | Builds a list of opponents (model, config, paint) whose time_1_4 time (Performance Data or Drag Times) is in [dial - offset; dial + 0.4[ and that respect the vehicle permission rules. If none is eligible, falls back to the player's vehicle. Excludes simple_traffic configs. | 280 |
| `gameplay_drag_dragBridge.getActiveRacerId()` | Vehicle ID of the first playable racer. | 232 |
| `gameplay_drag_dragBridge.getData()` | Delegates to core.getData. | 374 |
| `gameplay_drag_dragBridge.getDialTimes()` | Book of the saved dial times (saveSystem.getDialTimes), keyed by vehicle hash. | 417 |
| `gameplay_drag_dragBridge.getDragDialData()` | Dial data of the local playable racer: vehicleId, dialValue (10 by default), isSet, importantTimerId, importantTimerLabel, isBracketRace. | 764 |
| `gameplay_drag_dragBridge.getDragInfoData()` | All the data of the drag info HUD widget: dragType, stripName, treeType and label, important timer, dial, isStarted/isCompleted, current phase, list of racers (name, lane, phase, dial, finished, DQ), and in MP the current round, the number of rounds and the waiting list. | 572 |
| `gameplay_drag_dragBridge.getDragIsStarted()` | True if the race is started. | 429 |
| `gameplay_drag_dragBridge.getDragRaceData()` | Data of the playable racer: vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases. | 151 |
| `gameplay_drag_dragBridge.getDragRaceRuntimeData()` | Runtime data of the playable racer: phase, isStarted, isCompleted, timers, phases, DQ, damage, vehiclePosition (vehPos), vehicleSpeed (vehSpeed). | 175 |
| `gameplay_drag_dragBridge.getDragStripInfo(dragStripId)` | Info of a track: stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Loads the track by id (saveSystem.loadCompleteDragRaceData) or uses the current data. | 202 |
| `gameplay_drag_dragBridge.getHistory(id)` | Race history of a facility (saveSystem.getHistory). | 487 |
| `gameplay_drag_dragBridge.getPlayerRaceResult()` | Player's result from generateWinData: playerWin, playerPos, winners, dialDiff (player's time minus their dial) and threshold (time of the best non-disqualified opponent minus the player's). | 439 |
| `gameplay_drag_dragBridge.getRacerData(vehicleId)` | Full racer table of a vehicle. | 379 |
| `gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId)` | Data of the Vue rules screen (delegates to rulesMenu.getRulesScreenData). | 521 |
| `gameplay_drag_dragBridge.getStripLaneInfo()` | Lane info of the first track of the current level: lanes list (index, longName, shortName, color), timers (or DEFAULT_TIMERS) and importantTimerId. | 807 |
| `gameplay_drag_dragBridge.getTimers(vehicleId)` | Timers of a racer. | 367 |
| `gameplay_drag_dragBridge.getTreeLightUIState()` | Tree state for the UI, on the lane side of the playable racer: isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight. | 720 |
| `gameplay_drag_dragBridge.getWinnersData()` | Ranking data (phaseHandlers.generateWinData). | 435 |
| `gameplay_drag_dragBridge.isDragRaceActive()` | True if a race is started (countdown or in progress). | 227 |
| `gameplay_drag_dragBridge.loadDragDataForMission(filepath)` | Loads the track data from a file via core.loadDragDataForMission; logs an error on failure. | 386 |
| `gameplay_drag_dragBridge.loadDragStrip(dragStripId)` | Loads a track by id: tries saveSystem.loadCompleteDragRaceData then loadDragStripData. | 101 |
| `gameplay_drag_dragBridge.onDragClear()` | Hook: when drag is cleared, sends nil to the guihooks dragRaceInfoChanged/dragDialDataChanged and hides the topLeft apps dragInfo and dragDialControl. *(internal)* *(hook)* | 854 |
| `gameplay_drag_dragBridge.onDragDataSet(data)` | Hook: track armed; pushes info and dial to the UI and shows the topLeft app dragInfo. *(internal)* *(hook)* | 840 |
| `gameplay_drag_dragBridge.onDragRaceListChanged()` | MP hook: the race list changes; pushes dragRaceInfoChanged. *(internal)* *(hook)* | 874 |
| `gameplay_drag_dragBridge.onDragRacePlayersUpdated()` | MP hook: players updated; pushes dragRaceInfoChanged. *(internal)* *(hook)* | 866 |
| `gameplay_drag_dragBridge.onDragRaceStarted()` | MP hook: round started; empties the live times cache and pushes dragRaceInfoChanged. *(internal)* *(hook)* | 878 |
| `gameplay_drag_dragBridge.onDragRaceStateChanged()` | MP hook: the race state changes; pushes dragRaceInfoChanged. *(internal)* *(hook)* | 870 |
| `gameplay_drag_dragBridge.onDragRacersSetup(data)` | Hook emitted by core.startDragRaceActivity: empties the times cache and pushes info and dial to the UI. *(internal)* *(hook)* | 834 |
| `gameplay_drag_dragBridge.onDragReset(opts)` | Reset hook: empties the times cache, pushes info and dial to the UI and triggers the guihook onDragReset. *(internal)* *(hook)* | 847 |
| `gameplay_drag_dragBridge.onMenuClosed()` | Hook: a menu is closed; removes the facility's proximity tether. *(internal)* *(hook)* | 554 |
| `gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | Hook emitted by phaseHandlers on a racer's phase change; refreshes the HUD info. *(internal)* *(hook)* | 862 |
| `gameplay_drag_dragBridge.onUpdate()` | Per-frame hook: sends to the UI (onDragRaceLiveTimesData) the new or modified timer values of each lane, local or received from the network. *(internal)* *(hook)* | 883 |
| `gameplay_drag_dragBridge.openHistoryScreen(facility)` | Opens the drag history screen (route mission.dragHistory); in career, places a 4 m spherical tether near the facility's door. | 495 |
| `gameplay_drag_dragBridge.openRulesScreen(facility)` | Opens the Vue screen of drag rules and settings (route mission.dragRules) for a facility; 4 m tether in career. | 505 |
| `gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId)` | Opens the rules screen for a given track (e.g. from the MP gamemode UI). | 515 |
| `gameplay_drag_dragBridge.reset(opts)` | Resets the race. Without argument: full reset (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks); otherwise passes opts to core.reset. | 139 |
| `gameplay_drag_dragBridge.screenshotTimeslip()` | Takes a screenshot of the slip (gameplay_drag_timeslip.screenshotTimeslip). | 479 |
| `gameplay_drag_dragBridge.sendTimeslipDataToUi()` | Delegates to core.sendTimeslipDataToUi. | 475 |
| `gameplay_drag_dragBridge.setLocalPlayerDial(value)` | Sets the dial of the local playable racer then refreshes the HUD info. | 793 |
| `gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue)` | Delegates to core.setRacerDial. | 404 |
| `gameplay_drag_dragBridge.setRacersDial(dials)` | Delegates to core.setRacersDial. | 408 |
| `gameplay_drag_dragBridge.setVehicles(vehicleIds)` | Creates several racers at once and sets isPlayable and the dial (if > 0). | 346 |
| `gameplay_drag_dragBridge.setupRacer(vehicleId, lane)` | Delegates to core.setupRacer. | 341 |
| `gameplay_drag_dragBridge.showDialControl()` | Shows the dial setting app (dragDialControl) in the topLeft container. | 802 |
| `gameplay_drag_dragBridge.startDragRace(vehicleId, lane)` | Starts a race (core.startDragRaceActivity(lane or 1)) after checking that a valid vehicle exists. | 123 |
| `gameplay_drag_dragBridge.startDragRaceActivity(lane)` | Delegates to core.startDragRaceActivity(lane). | 395 |
| `gameplay_drag_dragBridge.stopDragRace()` | Stops the race: full clear (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging). | 133 |
| `gameplay_drag_dragBridge.unloadRace()` | Same full clear as stopDragRace, with no return value. | 413 |

### Parameter details

#### `gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId)`

Returns the saved rules of a track (delegates to rulesMenu.applyRulesRestore).

- `levelId` (*string*) : Level identifier.
- `stripId` (*string*) : Track identifier.
- **returns**: table|nil Rules, nil if rulesMenu is absent.

#### `gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules)`

Saves the rules of a track (rulesMenu). In MP, broadcasts them to the clients (broadcastRulesUpdate); also applies importantTimerId, dragType and treeType to the current race data.

- `levelId` (*string*) : Level identifier.
- `stripId` (*string*) : Track identifier.
- `rules` (*table*) : Rules (importantTimerId, dragType, treeType...).

#### `gameplay_drag_dragBridge.configureDragStrip(dragStrip)`

Compatibility: returns true if dragStrip is not nil. The actual config is applied by core.setDragRaceData.

- `dragStrip` (*table|nil*) : Track data.
- **returns**: boolean dragStrip ~= nil.

#### `gameplay_drag_dragBridge.createTimeslipData()`

Delegates to core.createTimeslipData.

- **returns**: table Slip data.

#### `gameplay_drag_dragBridge.generateHashFromFile(vehicleId)`

Identification hash of a vehicle/config for the dial book (saveSystem.generateHashFromFile). Without argument, uses player 0's vehicle.

- `vehicleId` (*integer|nil*) : Vehicle ID.
- **returns**: string Hash.

#### `gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset)`

Builds a list of opponents (model, config, paint) whose time_1_4 time (Performance Data or Drag Times) is in [dial - offset; dial + 0.4[ and that respect the vehicle permission rules. If none is eligible, falls back to the player's vehicle. Excludes simple_traffic configs.

- `vehId` (*any*) : Identifier used for core_vehicles.getVehicleDetails (model/config name of the player's vehicle, inferred from code).
- `dial` (*number|nil*) : Target time (s); default time_1_4 of the vehicle, otherwise 10.
- `vehiclePermissionRules` (*table[]*) : Rules {path = {keys...}, allowedValues = {...}} or {path, value} tested on the model.
- `amount` (*integer|nil*) : Number of opponents (default 1).
- `offset` (*number|nil*) : Lower time margin (default 0.1 s).
- **returns**: table[]|nil List {model, config, paint}, nil if invalid input or no time data.

#### `gameplay_drag_dragBridge.getActiveRacerId()`

Vehicle ID of the first playable racer.

- **returns**: integer|nil ID or nil.

#### `gameplay_drag_dragBridge.getData()`

Delegates to core.getData.

- **returns**: table|nil dragData.

#### `gameplay_drag_dragBridge.getDialTimes()`

Book of the saved dial times (saveSystem.getDialTimes), keyed by vehicle hash.

- **returns**: table Times per vehicle.

#### `gameplay_drag_dragBridge.getDragDialData()`

Dial data of the local playable racer: vehicleId, dialValue (10 by default), isSet, importantTimerId, importantTimerLabel, isBracketRace.

- **returns**: table|nil Data, nil if unavailable.

#### `gameplay_drag_dragBridge.getDragInfoData()`

All the data of the drag info HUD widget: dragType, stripName, treeType and label, important timer, dial, isStarted/isCompleted, current phase, list of racers (name, lane, phase, dial, finished, DQ), and in MP the current round, the number of rounds and the waiting list.

- **returns**: table|nil Data, nil if no track is loaded.

#### `gameplay_drag_dragBridge.getDragIsStarted()`

True if the race is started.

- **returns**: boolean isStarted.

#### `gameplay_drag_dragBridge.getDragRaceData()`

Data of the playable racer: vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases.

- **returns**: table|nil Data or nil.

#### `gameplay_drag_dragBridge.getDragRaceRuntimeData()`

Runtime data of the playable racer: phase, isStarted, isCompleted, timers, phases, DQ, damage, vehiclePosition (vehPos), vehicleSpeed (vehSpeed).

- **returns**: table|nil Data or nil.

#### `gameplay_drag_dragBridge.getDragStripInfo(dragStripId)`

Info of a track: stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Loads the track by id (saveSystem.loadCompleteDragRaceData) or uses the current data.

- `dragStripId` (*string|nil*) : Track identifier; nil = current track.
- **returns**: table|nil Info or nil.

#### `gameplay_drag_dragBridge.getHistory(id)`

Race history of a facility (saveSystem.getHistory).

- `id` (*string*) : Facility/track identifier.
- **returns**: table History.

#### `gameplay_drag_dragBridge.getPlayerRaceResult()`

Player's result from generateWinData: playerWin, playerPos, winners, dialDiff (player's time minus their dial) and threshold (time of the best non-disqualified opponent minus the player's).

- **returns**: table {playerWin, playerPos, winners, dialDiff, threshold}.

#### `gameplay_drag_dragBridge.getRacerData(vehicleId)`

Full racer table of a vehicle.

- `vehicleId` (*integer*) : Vehicle ID.
- **returns**: table Racer, {} if unknown.

#### `gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId)`

Data of the Vue rules screen (delegates to rulesMenu.getRulesScreenData).

- `facilityIdOrStripId` (*string*) : Facility or track identifier.
- **returns**: table|nil Data, nil if rulesMenu is absent.

#### `gameplay_drag_dragBridge.getStripLaneInfo()`

Lane info of the first track of the current level: lanes list (index, longName, shortName, color), timers (or DEFAULT_TIMERS) and importantTimerId.

- **returns**: table|nil Info or nil.

#### `gameplay_drag_dragBridge.getTimers(vehicleId)`

Timers of a racer.

- `vehicleId` (*integer*) : Vehicle ID.
- **returns**: table Timers, {} if unknown.

#### `gameplay_drag_dragBridge.getTreeLightUIState()`

Tree state for the UI, on the lane side of the playable racer: isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight.

- **returns**: table|nil State or nil.

#### `gameplay_drag_dragBridge.getWinnersData()`

Ranking data (phaseHandlers.generateWinData).

- **returns**: table|nil Sorted list of results.

#### `gameplay_drag_dragBridge.isDragRaceActive()`

True if a race is started (countdown or in progress).

- **returns**: boolean isStarted.

#### `gameplay_drag_dragBridge.loadDragDataForMission(filepath)`

Loads the track data from a file via core.loadDragDataForMission; logs an error on failure.

- `filepath` (*string*) : File path.
- **returns**: table|nil Loaded data.

#### `gameplay_drag_dragBridge.loadDragStrip(dragStripId)`

Loads a track by id: tries saveSystem.loadCompleteDragRaceData then loadDragStripData.

- `dragStripId` (*string*) : Track identifier/path.
- **returns**: table|nil Track data or nil.

#### `gameplay_drag_dragBridge.onDragDataSet(data)`

Hook: track armed; pushes info and dial to the UI and shows the topLeft app dragInfo.

- `data` (*table*) : Track data.

#### `gameplay_drag_dragBridge.onDragRacersSetup(data)`

Hook emitted by core.startDragRaceActivity: empties the times cache and pushes info and dial to the UI.

- `data` (*table*) : dragData.

#### `gameplay_drag_dragBridge.onDragReset(opts)`

Reset hook: empties the times cache, pushes info and dial to the UI and triggers the guihook onDragReset.

- `opts` (*table*) : Reset options.

#### `gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)`

Hook emitted by phaseHandlers on a racer's phase change; refreshes the HUD info.

- `vehId` (*integer*) : Vehicle.
- `oldPhase` (*integer*) : Old phase.
- `newPhase` (*integer*) : New phase.
- `newPhaseName` (*string*) : Name of the new phase.

#### `gameplay_drag_dragBridge.openHistoryScreen(facility)`

Opens the drag history screen (route mission.dragHistory); in career, places a 4 m spherical tether near the facility's door.

- `facility` (*table*) : Facility (id, name, level).

#### `gameplay_drag_dragBridge.openRulesScreen(facility)`

Opens the Vue screen of drag rules and settings (route mission.dragRules) for a facility; 4 m tether in career.

- `facility` (*table*) : Facility (id, level).

#### `gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId)`

Opens the rules screen for a given track (e.g. from the MP gamemode UI).

- `levelId` (*string*) : Level.
- `stripId` (*string*) : Track.

#### `gameplay_drag_dragBridge.reset(opts)`

Resets the race. Without argument: full reset (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks); otherwise passes opts to core.reset.

- `opts` (*table|nil*) : Options of core.reset.
- **returns**: boolean false if no drag data, otherwise true.

#### `gameplay_drag_dragBridge.screenshotTimeslip()`

Takes a screenshot of the slip (gameplay_drag_timeslip.screenshotTimeslip).

- **returns**: any Value returned by timeslip.

#### `gameplay_drag_dragBridge.setLocalPlayerDial(value)`

Sets the dial of the local playable racer then refreshes the HUD info.

- `value` (*number*) : Dial in seconds (>= 0).
- **returns**: boolean true if applied.

#### `gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue)`

Delegates to core.setRacerDial.

- `vehicleId` (*integer*) : Vehicle ID.
- `dialValue` (*number*) : Dial (s).
- **returns**: boolean true if applied.

#### `gameplay_drag_dragBridge.setRacersDial(dials)`

Delegates to core.setRacersDial.

- `dials` (*table[]*) : List {racerId, value}.
- **returns**: boolean true if at least one applied.

#### `gameplay_drag_dragBridge.setVehicles(vehicleIds)`

Creates several racers at once and sets isPlayable and the dial (if > 0).

- `vehicleIds` (*table[]*) : List of {id, lane, isPlayable, dial}.

#### `gameplay_drag_dragBridge.setupRacer(vehicleId, lane)`

Delegates to core.setupRacer.

- `vehicleId` (*integer*) : Vehicle ID.
- `lane` (*integer*) : Lane.

#### `gameplay_drag_dragBridge.startDragRace(vehicleId, lane)`

Starts a race (core.startDragRaceActivity(lane or 1)) after checking that a valid vehicle exists.

- `vehicleId` (*integer|nil*) : Vehicle to check (default: player 0's vehicle).
- `lane` (*integer|nil*) : Lane (default 1).
- **returns**: boolean false if no vehicle, otherwise always true (see notes).

#### `gameplay_drag_dragBridge.startDragRaceActivity(lane)`

Delegates to core.startDragRaceActivity(lane).

- `lane` (*integer|nil*) : Lane.
- **returns**: boolean true if started.

#### `gameplay_drag_dragBridge.stopDragRace()`

Stops the race: full clear (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging).

- **returns**: boolean Always true.

**UI events (guihooks.trigger):** `dragDialDataChanged`, `dragRaceInfoChanged`, `onDragRaceLiveTimesData`, `onDragReset`

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/dragBridge.lua`.*
