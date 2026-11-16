---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the drag race system (solo and multiplayer). It owns the dragData table (track, lanes, drivers, timers, phases), creates the "racers" (setupRacer), handles race reset/clear, the MP network hooks (onDragRace*), career rewards, the lazy loading of the drag extensions (phaseHandlers, dragTypes_*, times, display) and the detection of leaving the zone. A modder uses it to load a track (loadDragDataForMission), arm a race (startDragRaceActivity) or read the state (getData, getRacerData, getTimers).
--- Access: extension `gameplay_drag_core`: `extensions.load("gameplay_drag_core")`, then the global `gameplay_drag_core`
---@class gameplay_drag_core
---@field dependencies string[] Extensions loaded beforehand: saveSystem, dragBridge, rulesMenu, timeslip, poi.
gameplay_drag_core = {}

--- True if data contains at least one racer and all have isFinished.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1330
---@param data table|nil Track data (dragData or poiData).
---@return boolean  true if all drivers have finished.
function gameplay_drag_core.allRacersFinished(data) end

--- Simple checksum of the race state (isStarted, isCompleted, phases, DQ, racers' finished), used to log the effect of a reset.
---Source: lua/ge/extensions/gameplay/drag/core.lua:532
---@param data table|nil Track data.
---@return integer  Checksum, 0 if data is nil.
function gameplay_drag_core.calculateStateChecksum(data) end

--- Cleans the drag state according to the options (all false by default): hooks (onDragClear then onDragClearComplete), transitionLock, localRace (MP), extensions (unloads the lazy extensions), data (unloads the prefabs and sets dragData to nil), context (back to 'freeroam'), ui (hides the 'drag' app), treeLightStaging (turns off the staging light).
---Source: lua/ge/extensions/gameplay/drag/core.lua:700
---@param opts table|nil Table of boolean options named hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging.
function gameplay_drag_core.clear(opts) end

--- Forgets the participation request sent for a POI (MP).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1601
---@param poiKey string|nil Key returned by getPoiKey.
function gameplay_drag_core.clearPoiJoinRequest(poiKey) end

--- Removes the state stored for an MP race (raceStateStore).
---Source: lua/ge/extensions/gameplay/drag/core.lua:914
---@param raceId any Race identifier.
function gameplay_drag_core.clearRaceState(raceId) end

--- Delegates to gameplay_drag_timeslip.createTimeslipData.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1572
---@return table  Timing slip data.
function gameplay_drag_core.createTimeslipData() end

--- Delegates to gameplay_drag_timeslip.createTimeslipPanelData.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1575
---@return table  Slip panel data.
function gameplay_drag_core.createTimeslipPanelData() end

--- MP race end: calls display.dragRaceEndLineReached for each racer, generates the win data (phaseHandlers.generateWinData) then sends the slip to the UI (and saves the dial times).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1390
function gameplay_drag_core.finalizeMPPostRace() end

--- Current save path of the drag save system.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1449
---@return string|nil  Path (inferred from saveSystem.getCurrentSavePath).
function gameplay_drag_core.getCurrentSavePath() end

--- Single source of drag data (track, racers, timers). Solo and MP: core owns it.
---Source: lua/ge/extensions/gameplay/drag/core.lua:205
---@return table|nil  dragData, nil if nothing is loaded.
function gameplay_drag_core.getData() end

--- Loads (then caches) all *.dragSettings.json tracks from a level's dragstrips folder. Adds _originFile, _fnWithoutExt and _index to each entry.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1489
---@param levelIdentifier string Level name (core_levels.getLevelByName).
---@return table[]  List of track data.
function gameplay_drag_core.getDragDataForLevel(levelIdentifier) end

--- Returns the multiplayer drag gamemode extension (multiplayer/gamemodes/drag/drag) if it is loaded.
---Source: lua/ge/extensions/gameplay/drag/core.lua:37
---@return table|nil  The extension or nil.
function gameplay_drag_core.getDragGamemode() end

--- Indicates whether the race is started (dragData.isStarted).
---Source: lua/ge/extensions/gameplay/drag/core.lua:964
---@return boolean  false if no data.
function gameplay_drag_core.getDragIsStarted() end

--- Number of drivers expected in staging before starting the countdown (1 by default).
---Source: lua/ge/extensions/gameplay/drag/core.lua:910
---@return integer  Expected number.
function gameplay_drag_core.getExpectedStagingRacerCount() end

--- Active race type extension (headsUpRace or bracketRace).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1480
---@return table|nil  The dragType extension.
function gameplay_drag_core.getExtension() end

--- Current game context: 'freeroam' by default, or the track's data.context (e.g. 'activity').
---Source: lua/ge/extensions/gameplay/drag/core.lua:969
---@return string  Context.
function gameplay_drag_core.getGameplayContext() end

--- Number of lanes of the track (at least 1; 2 by default if the track has no lanes).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1512
---@param data table|nil poiData or dragData.
---@return integer  Number of lanes.
function gameplay_drag_core.getMaxLanes(data) end

--- Stable "level:name" key of a track (name = _fnWithoutExt or name), used for a per-track lobby in MP.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1518
---@param poiData table|nil POI data.
---@return string|nil  Key, nil if poiData is nil.
function gameplay_drag_core.getPoiKey(poiData) end

--- Returns a snapshot of the race state. In MP: from the raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData...), or nil if not found. In solo: data, isStarted, isCompleted, treeType.
---Source: lua/ge/extensions/gameplay/drag/core.lua:918
---@param raceId any MP race identifier; nil = active local race or first stored.
---@return table|nil  Race state.
function gameplay_drag_core.getRaceState(raceId) end

--- Returns the racer table of a vehicle.
---Source: lua/ge/extensions/gameplay/drag/core.lua:806
---@param vehicleId integer Vehicle ID.
---@return table|nil  Racer, nil if unknown.
function gameplay_drag_core.getRacerData(vehicleId) end

--- Reset state: 'idle', 'resetting' or 'ready'.
---Source: lua/ge/extensions/gameplay/drag/core.lua:589
---@return string  State.
function gameplay_drag_core.getResetState() end

--- Called by the MP host: checks whether all drivers are in staging (read-only).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1339
---@return boolean  allStaged; false if not host, race not started or no data.
---@return table|nil  Current dragData, nil if the check did not take place.
function gameplay_drag_core.getStagingCheckData() end

--- Timers of a racer (dial, timer, distanceTimer, velocity...).
---Source: lua/ge/extensions/gameplay/drag/core.lua:797
---@param vehicleId integer Vehicle ID.
---@return table|nil  Timers table ({} if racer unknown, nil if no data).
function gameplay_drag_core.getTimers(vehicleId) end

--- Drag is allowed if career is active or if the enableDragRaceInFreeroam setting is true.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1525
---@return boolean  Enabled or not.
function gameplay_drag_core.isDragEnabled() end

--- Participation window open: race not finished and no racer beyond phase 1.
---Source: lua/ge/extensions/gameplay/drag/core.lua:818
---@param data table|nil Track data.
---@return boolean  Open or not.
function gameplay_drag_core.isJoinWindowOpen(data) end

--- Indicates whether a participation request has already been sent for this POI.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1597
---@param poiKey string POI key.
---@return boolean|nil  true if sent.
function gameplay_drag_core.isPoiJoinRequestSent(poiKey) end

--- Helper for missions: loads the track from a file, loads the prefabs, sets the context and arms the data (setDragRaceData).
---Source: lua/ge/extensions/gameplay/drag/core.lua:521
---@param filepath string Path of the track file (.dragSettings.json).
---@return table|nil  Loaded data, nil on failure.
function gameplay_drag_core.loadDragDataForMission(filepath) end

--- Loads the track data via saveSystem.loadDragStripData and stores it in dragData.
---Source: lua/ge/extensions/gameplay/drag/core.lua:182
---@param filepath string File path.
---@return table|nil  Data or nil (E log).
function gameplay_drag_core.loadDragStripData(filepath) end

--- Hook: at every mission start or stop, does a full clear (all flags true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1443
---@param status string 'started' or 'stopped' trigger the cleanup.
---@param mission table Mission concerned.
function gameplay_drag_core.onAnyMissionChanged(status, mission) end

--- Hook: career activated, delegates to saveSystem.onCareerActive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1466
function gameplay_drag_core.onCareerActive() end

--- MP hook: race cancelled. Does nothing (the reset/clear comes from dragBridge or the vehicle hooks).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1268
---@param raceId any Race identifier.
function gameplay_drag_core.onDragRaceCancelled(raceId) end

--- MP hook: a client disconnects. Finds the matching MP player and calls onDragRacePlayerLeft.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1315
---@param client table Client with an id field.
function gameplay_drag_core.onDragRaceClientDisconnected(client) end

--- Hook: countdown start. In MP on the client side, ends phase 1 of all racers and moves to the next phase; in solo, moves to the next phase if all expected drivers are in staging. Then starts phase 2 of each racer (startDragCountdown hook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1011
---@param mappedTime number Countdown time (not used directly).
---@param randValue number Random value (not used directly).
function gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue) end

--- MP hook: participation accepted. Arms the track data (with treeType), creates the local vehicle's racer, starts the activity and opens the lobby menu if closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1112
---@param raceId any Race identifier.
---@param lane integer Assigned lane.
---@param poiData table Track data.
---@param treeType string Starting tree type (e.g. '.500').
function gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType) end

--- MP hook: the race list changed; relayed to the drag gamemode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1251
function gameplay_drag_core.onDragRaceListChanged() end

--- MP hook: marks the racer of a player who left as disqualified and finished (playerLeft reason). Looks up by vehicleId, otherwise by lane.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1273
---@param player table Table with mpPlayerId.
function gameplay_drag_core.onDragRacePlayerLeft(player) end

--- MP hook: resets isStarted/isCompleted to false and allows a new onDragRaceStarted for the same race (next round).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1258
---@param raceId any Race identifier.
function gameplay_drag_core.onDragRaceReset(raceId) end

--- MP hook: the host broadcasts the start; the (non-host) clients end phase 2 and put all racers in the race phase (phase 3).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1090
---@param raceStartTime number Start time (not used directly).
function gameplay_drag_core.onDragRaceStart(raceStartTime) end

--- MP hook: the round starts. Rebuilds dragData from raceState.poiData (deep copy), creates the round's racers, marks the local racer (isLocalRacer), applies the dials, emits onDragReset, runs startDragRaceActivity and opens the dial control in bracketRace if the local dial is empty. Ignores duplicate calls for the same raceId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1134
---@param raceId any Race identifier.
function gameplay_drag_core.onDragRaceStarted(raceId) end

--- MP hook: a network timer arrives. Applies a remote player's dial and re-associates the racer with the real vehicleId if the key changed (same lane).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1621
---@param raceId any Race identifier.
---@param mpPlayerId any MP player.
---@param timerName string Timer name (e.g. 'dial').
---@param timerValue number Value.
function gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

--- MP hook: tree light state received for a lane. Updates the staging of the lane's racers (if stageLight is set) then the display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1074
---@param lane integer Lane.
---@param lightState table Light state (stageLights.stageLight, etc.).
function gameplay_drag_core.onDragRaceTreeLights(lane, lightState) end

--- MP hook: turns on the lane winner's light (display.onWinnerLightOn).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1083
---@param lane integer Winning lane.
function gameplay_drag_core.onDragRaceWinningLights(lane) end

--- Load hook; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1324
function gameplay_drag_core.onExtensionLoaded() end

--- Unload hook: full clear of the drag state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1660
function gameplay_drag_core.onExtensionUnloaded() end

--- Hook: adds the drag track POIs of a level (delegates to gameplay_drag_poi).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1586
---@param levelIdentifier string Level name.
---@param elements table POI list to complete.
function gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook: POI list for the tutorial, always that of the west_coast_usa level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1589
---@param elements table POI list to complete.
function gameplay_drag_core.onGetRawPoiListForTutorial(elements) end

--- Called when the player leaves the track zone (offline): full clear with unloading of the extensions. Also called from onUpdate.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1351
function gameplay_drag_core.onPlayerLeftDragArea() end

--- Hook: career profile save; writes the dial times file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1460
---@param currentSavePath string|nil Save path.
function gameplay_drag_core.onSaveCurrentProfile(currentSavePath) end

--- Per-frame hook: detects leaving the zone (stripZone) and staging runaway (> 25 m), then handles re-staging after DQ in freeroam and the remote staging timers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:1407
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw delta (s).
function gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: vehicle destroyed. In solo freeroam with the race started, marks the racer as removed and disqualified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:999
---@param vehicleId integer Vehicle ID.
function gameplay_drag_core.onVehicleDestroyed(vehicleId) end

--- Hook: vehicle reset. In solo freeroam with the race started, disqualifies the racer (vehicleReset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:973
---@param vehicleId integer Vehicle ID.
function gameplay_drag_core.onVehicleResetted(vehicleId) end

--- Hook: played vehicle switched. In solo freeroam with the race started, disqualifies the old and the new racer (vehicleSwitched).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/core.lua:985
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
function gameplay_drag_core.onVehicleSwitched(oldId, newId) end

--- Resets the race state according to the options (false/nil by default): raceState (isStarted/isCompleted), racers (phase, DQ, finished, timers of each racer), clearRacers (empties the list), timeslip (clears the UI slip), transitionLock, treeLightStaging (staging light on), hooks (emits onDragReset), raceId (passed to the hook). Then validates the state and logs a warning if inconsistent.
---Source: lua/ge/extensions/gameplay/drag/core.lua:644
---@param opts table|nil Named options.
function gameplay_drag_core.reset(opts) end

--- Records the slip times in the dial book via saveSystem.saveDialTimes (if data is loaded).
---Source: lua/ge/extensions/gameplay/drag/core.lua:1453
---@param timeslip table Slip data.
function gameplay_drag_core.saveDialTimes(timeslip) end

--- Sends the slip to the UI (guihook onDragRaceTimeslipData). In MP, emits the hook onDragMPTimeslipRequested instead and lets the gamemode finalize. Also saves the dial times; in drag multiseat gamemode, does not send the slip to the HUD.
---Source: lua/ge/extensions/gameplay/drag/core.lua:71
function gameplay_drag_core.sendTimeslipDataToUi() end

--- Grants the career reward (bmra currency, value 5) once per race, except in the 'activity' context or with career inactive.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1470
---@return table|nil  {bmra = n} if granted, nil otherwise.
function gameplay_drag_core.setCareerRewards() end

--- Arms the track data: normalizes the DQ fields, computes raceEndTimerId (timer with the greatest distance), restores the zones' metatables, synchronizes the waypoints with the scene, loads the required extensions, reads the dial book then emits onDragDataSet.
---Source: lua/ge/extensions/gameplay/drag/core.lua:493
---@param data table Track data (dragSettings).
function gameplay_drag_core.setDragRaceData(data) end

--- Sets the number of drivers that must be in staging before the start (minimum 1).
---Source: lua/ge/extensions/gameplay/drag/core.lua:906
---@param count integer Number of drivers.
function gameplay_drag_core.setExpectedStagingRacerCount(count) end

--- Replaces the active race type extension.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1484
---@param ext table|nil dragType extension.
function gameplay_drag_core.setExtension(ext) end

--- Marks the vehicle's racer as playable (isPlayable = true).
---Source: lua/ge/extensions/gameplay/drag/core.lua:789
---@param vehicleId integer Vehicle ID.
function gameplay_drag_core.setPlayableVehicle(vehicleId) end

--- Stores (val true) or forgets a participation request for a POI.
---Source: lua/ge/extensions/gameplay/drag/core.lua:1598
---@param poiKey string POI key.
---@param val boolean true to store, otherwise clears.
function gameplay_drag_core.setPoiJoinRequestSent(poiKey, val) end

--- Merges fields into the stored state of an MP race.
---Source: lua/ge/extensions/gameplay/drag/core.lua:897
---@param raceId any Race identifier.
---@param updates table Fields to write.
function gameplay_drag_core.setRaceState(raceId, updates) end

--- Sets the dial (announced time, in seconds) of a racer and marks it isSet. Creates the dial timer if missing.
---Source: lua/ge/extensions/gameplay/drag/core.lua:741
---@param vehicleId integer Vehicle ID.
---@param dialValue number Value >= 0.
---@return boolean  true if applied.
function gameplay_drag_core.setRacerDial(vehicleId, dialValue) end

--- Computes the vehicle's wheel geometry (groups by "frontness", offsets from the center) and initializes racer.allWheelsOffsets, wheelsCenter, beamState and frontWheelId. If no wheel is found, uses the OOBB.
---Source: lua/ge/extensions/gameplay/drag/core.lua:356
---@param racer table Racer to complete.
---@param vehicle userdata BeamNGVehicle object.
function gameplay_drag_core.setRacerWheelGeometry(racer, vehicle) end

--- Applies several dials at once.
---Source: lua/ge/extensions/gameplay/drag/core.lua:768
---@param dials table[] List of entries {racerId = vehId, value = dial}.
---@return boolean  true if at least one dial was applied.
function gameplay_drag_core.setRacersDial(dials) end

--- Creates a vehicle's racer in a lane (phases, timers from the track config, initial dial, wheel geometry, name, plate, stock state). Refuses an already occupied lane. In MP, creates a stub if the vehicle does not exist locally.
---Source: lua/ge/extensions/gameplay/drag/core.lua:384
---@param vehicleId integer Vehicle ID.
---@param lane integer|nil Lane.
function gameplay_drag_core.setupRacer(vehicleId, lane) end

--- Starts the drag activity: loads the extensions, creates the player's racer in solo freeroam, shows the 'drag' UI app, turns on staging, turns the ignition off/on to 3 for playable racers outside freeroam, emits onDragRacersSetup then calls the race type's startActivity.
---Source: lua/ge/extensions/gameplay/drag/core.lua:827
---@param lane integer|nil Player's lane.
---@param vehicleId integer|nil Vehicle (default: player 0's vehicle).
---@return boolean  true if started.
function gameplay_drag_core.startDragRaceActivity(lane, vehicleId) end

--- Checks that a reset is complete (race not started, racers in phase 1, neither DQ nor finished, timers stopped, phases reset).
---Source: lua/ge/extensions/gameplay/drag/core.lua:553
---@param data table|nil Track data.
---@return boolean  Valid or not.
---@return string  Explanatory message.
function gameplay_drag_core.validateResetState(data) end

