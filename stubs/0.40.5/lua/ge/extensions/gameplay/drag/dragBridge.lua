---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade of the drag system for flowgraph nodes (missions) and the Vue interface. It contains almost no logic: it forwards to gameplay_drag_core, saveSystem, rulesMenu, timeslip and phaseHandlers, provides ready-to-use data for the UI (race info, dial, tree state, live times, track rules) and pushes guihooks (dragRaceInfoChanged, dragDialDataChanged, onDragRaceLiveTimesData, onDragReset) when the drag state changes. A modder uses it to start/stop a race, set drivers and dials, or generate opponents.
--- Access: extension `gameplay_drag_dragBridge`: `extensions.load("gameplay_drag_dragBridge")`, then the global `gameplay_drag_dragBridge`
---@class gameplay_drag_dragBridge
gameplay_drag_dragBridge = {}

--- Returns the saved rules of a track (delegates to rulesMenu.applyRulesRestore).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:548
---@param levelId string Level identifier.
---@param stripId string Track identifier.
---@return table|nil  Rules, nil if rulesMenu is absent.
function gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId) end

--- Saves the rules of a track (rulesMenu). In MP, broadcasts them to the clients (broadcastRulesUpdate); also applies importantTimerId, dragType and treeType to the current race data.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:527
---@param levelId string Level identifier.
---@param stripId string Track identifier.
---@param rules table Rules (importantTimerId, dragType, treeType...).
function gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules) end

--- Stops the race if it is started (stopDragRace).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:563
function gameplay_drag_dragBridge.cleanup() end

--- Removes all racers from the current data (core.reset with clearRacers = true).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:400
function gameplay_drag_dragBridge.clearRacers() end

--- Clears the slip on the UI side (core.reset with timeslip = true).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:483
function gameplay_drag_dragBridge.clearTimeslip() end

--- Closes all career menus (career_career.closeAllMenus). Also serves as the tether callback.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:558
function gameplay_drag_dragBridge.closeMenu() end

--- Compatibility: returns true if dragStrip is not nil. The actual config is applied by core.setDragRaceData.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:118
---@param dragStrip table|nil Track data.
---@return boolean  dragStrip ~= nil.
function gameplay_drag_dragBridge.configureDragStrip(dragStrip) end

--- Delegates to core.createTimeslipData.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:471
---@return table  Slip data.
function gameplay_drag_dragBridge.createTimeslipData() end

--- Identification hash of a vehicle/config for the dial book (saveSystem.generateHashFromFile). Without argument, uses player 0's vehicle.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:421
---@param vehicleId integer|nil Vehicle ID.
---@return string  Hash.
function gameplay_drag_dragBridge.generateHashFromFile(vehicleId) end

--- Builds a list of opponents (model, config, paint) whose time_1_4 time (Performance Data or Drag Times) is in [dial - offset; dial + 0.4[ and that respect the vehicle permission rules. If none is eligible, falls back to the player's vehicle. Excludes simple_traffic configs.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:280
---@param vehId any Identifier used for core_vehicles.getVehicleDetails (model/config name of the player's vehicle, inferred from code).
---@param dial number|nil Target time (s); default time_1_4 of the vehicle, otherwise 10.
---@param vehiclePermissionRules table[] Rules {path = {keys...}, allowedValues = {...}} or {path, value} tested on the model.
---@param amount integer|nil Number of opponents (default 1).
---@param offset number|nil Lower time margin (default 0.1 s).
---@return table[]|nil  List {model, config, paint}, nil if invalid input or no time data.
function gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset) end

--- Vehicle ID of the first playable racer.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:232
---@return integer|nil  ID or nil.
function gameplay_drag_dragBridge.getActiveRacerId() end

--- Delegates to core.getData.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:374
---@return table|nil  dragData.
function gameplay_drag_dragBridge.getData() end

--- Book of the saved dial times (saveSystem.getDialTimes), keyed by vehicle hash.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:417
---@return table  Times per vehicle.
function gameplay_drag_dragBridge.getDialTimes() end

--- Dial data of the local playable racer: vehicleId, dialValue (10 by default), isSet, importantTimerId, importantTimerLabel, isBracketRace.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:764
---@return table|nil  Data, nil if unavailable.
function gameplay_drag_dragBridge.getDragDialData() end

--- All the data of the drag info HUD widget: dragType, stripName, treeType and label, important timer, dial, isStarted/isCompleted, current phase, list of racers (name, lane, phase, dial, finished, DQ), and in MP the current round, the number of rounds and the waiting list.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:572
---@return table|nil  Data, nil if no track is loaded.
function gameplay_drag_dragBridge.getDragInfoData() end

--- True if the race is started.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:429
---@return boolean  isStarted.
function gameplay_drag_dragBridge.getDragIsStarted() end

--- Data of the playable racer: vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:151
---@return table|nil  Data or nil.
function gameplay_drag_dragBridge.getDragRaceData() end

--- Runtime data of the playable racer: phase, isStarted, isCompleted, timers, phases, DQ, damage, vehiclePosition (vehPos), vehicleSpeed (vehSpeed).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:175
---@return table|nil  Data or nil.
function gameplay_drag_dragBridge.getDragRaceRuntimeData() end

--- Info of a track: stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Loads the track by id (saveSystem.loadCompleteDragRaceData) or uses the current data.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:202
---@param dragStripId string|nil Track identifier; nil = current track.
---@return table|nil  Info or nil.
function gameplay_drag_dragBridge.getDragStripInfo(dragStripId) end

--- Race history of a facility (saveSystem.getHistory).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:487
---@param id string Facility/track identifier.
---@return table  History.
function gameplay_drag_dragBridge.getHistory(id) end

--- Player's result from generateWinData: playerWin, playerPos, winners, dialDiff (player's time minus their dial) and threshold (time of the best non-disqualified opponent minus the player's).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:439
---@return table  {playerWin, playerPos, winners, dialDiff, threshold}.
function gameplay_drag_dragBridge.getPlayerRaceResult() end

--- Full racer table of a vehicle.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:379
---@param vehicleId integer Vehicle ID.
---@return table  Racer, {} if unknown.
function gameplay_drag_dragBridge.getRacerData(vehicleId) end

--- Data of the Vue rules screen (delegates to rulesMenu.getRulesScreenData).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:521
---@param facilityIdOrStripId string Facility or track identifier.
---@return table|nil  Data, nil if rulesMenu is absent.
function gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId) end

--- Lane info of the first track of the current level: lanes list (index, longName, shortName, color), timers (or DEFAULT_TIMERS) and importantTimerId.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:807
---@return table|nil  Info or nil.
function gameplay_drag_dragBridge.getStripLaneInfo() end

--- Timers of a racer.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:367
---@param vehicleId integer Vehicle ID.
---@return table  Timers, {} if unknown.
function gameplay_drag_dragBridge.getTimers(vehicleId) end

--- Tree state for the UI, on the lane side of the playable racer: isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:720
---@return table|nil  State or nil.
function gameplay_drag_dragBridge.getTreeLightUIState() end

--- Ranking data (phaseHandlers.generateWinData).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:435
---@return table|nil  Sorted list of results.
function gameplay_drag_dragBridge.getWinnersData() end

--- True if a race is started (countdown or in progress).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:227
---@return boolean  isStarted.
function gameplay_drag_dragBridge.isDragRaceActive() end

--- Loads the track data from a file via core.loadDragDataForMission; logs an error on failure.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:386
---@param filepath string File path.
---@return table|nil  Loaded data.
function gameplay_drag_dragBridge.loadDragDataForMission(filepath) end

--- Loads a track by id: tries saveSystem.loadCompleteDragRaceData then loadDragStripData.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:101
---@param dragStripId string Track identifier/path.
---@return table|nil  Track data or nil.
function gameplay_drag_dragBridge.loadDragStrip(dragStripId) end

--- Hook: when drag is cleared, sends nil to the guihooks dragRaceInfoChanged/dragDialDataChanged and hides the topLeft apps dragInfo and dragDialControl.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:854
function gameplay_drag_dragBridge.onDragClear() end

--- Hook: track armed; pushes info and dial to the UI and shows the topLeft app dragInfo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:840
---@param data table Track data.
function gameplay_drag_dragBridge.onDragDataSet(data) end

--- MP hook: the race list changes; pushes dragRaceInfoChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:874
function gameplay_drag_dragBridge.onDragRaceListChanged() end

--- MP hook: players updated; pushes dragRaceInfoChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:866
function gameplay_drag_dragBridge.onDragRacePlayersUpdated() end

--- MP hook: round started; empties the live times cache and pushes dragRaceInfoChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:878
function gameplay_drag_dragBridge.onDragRaceStarted() end

--- MP hook: the race state changes; pushes dragRaceInfoChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:870
function gameplay_drag_dragBridge.onDragRaceStateChanged() end

--- Hook emitted by core.startDragRaceActivity: empties the times cache and pushes info and dial to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:834
---@param data table dragData.
function gameplay_drag_dragBridge.onDragRacersSetup(data) end

--- Reset hook: empties the times cache, pushes info and dial to the UI and triggers the guihook onDragReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:847
---@param opts table Reset options.
function gameplay_drag_dragBridge.onDragReset(opts) end

--- Hook: a menu is closed; removes the facility's proximity tether.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:554
function gameplay_drag_dragBridge.onMenuClosed() end

--- Hook emitted by phaseHandlers on a racer's phase change; refreshes the HUD info.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:862
---@param vehId integer Vehicle.
---@param oldPhase integer Old phase.
---@param newPhase integer New phase.
---@param newPhaseName string Name of the new phase.
function gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

--- Per-frame hook: sends to the UI (onDragRaceLiveTimesData) the new or modified timer values of each lane, local or received from the network.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:883
function gameplay_drag_dragBridge.onUpdate() end

--- Opens the drag history screen (route mission.dragHistory); in career, places a 4 m spherical tether near the facility's door.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:495
---@param facility table Facility (id, name, level).
function gameplay_drag_dragBridge.openHistoryScreen(facility) end

--- Opens the Vue screen of drag rules and settings (route mission.dragRules) for a facility; 4 m tether in career.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:505
---@param facility table Facility (id, level).
function gameplay_drag_dragBridge.openRulesScreen(facility) end

--- Opens the rules screen for a given track (e.g. from the MP gamemode UI).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:515
---@param levelId string Level.
---@param stripId string Track.
function gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId) end

--- Resets the race. Without argument: full reset (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks); otherwise passes opts to core.reset.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:139
---@param opts table|nil Options of core.reset.
---@return boolean  false if no drag data, otherwise true.
function gameplay_drag_dragBridge.reset(opts) end

--- Takes a screenshot of the slip (gameplay_drag_timeslip.screenshotTimeslip).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:479
---@return any  Value returned by timeslip.
function gameplay_drag_dragBridge.screenshotTimeslip() end

--- Delegates to core.sendTimeslipDataToUi.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:475
function gameplay_drag_dragBridge.sendTimeslipDataToUi() end

--- Sets the dial of the local playable racer then refreshes the HUD info.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:793
---@param value number Dial in seconds (>= 0).
---@return boolean  true if applied.
function gameplay_drag_dragBridge.setLocalPlayerDial(value) end

--- Delegates to core.setRacerDial.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:404
---@param vehicleId integer Vehicle ID.
---@param dialValue number Dial (s).
---@return boolean  true if applied.
function gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue) end

--- Delegates to core.setRacersDial.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:408
---@param dials table[] List {racerId, value}.
---@return boolean  true if at least one applied.
function gameplay_drag_dragBridge.setRacersDial(dials) end

--- Creates several racers at once and sets isPlayable and the dial (if > 0).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:346
---@param vehicleIds table[] List of {id, lane, isPlayable, dial}.
function gameplay_drag_dragBridge.setVehicles(vehicleIds) end

--- Delegates to core.setupRacer.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:341
---@param vehicleId integer Vehicle ID.
---@param lane integer Lane.
function gameplay_drag_dragBridge.setupRacer(vehicleId, lane) end

--- Shows the dial setting app (dragDialControl) in the topLeft container.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:802
function gameplay_drag_dragBridge.showDialControl() end

--- Starts a race (core.startDragRaceActivity(lane or 1)) after checking that a valid vehicle exists.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:123
---@param vehicleId integer|nil Vehicle to check (default: player 0's vehicle).
---@param lane integer|nil Lane (default 1).
---@return boolean  false if no vehicle, otherwise always true (see notes).
function gameplay_drag_dragBridge.startDragRace(vehicleId, lane) end

--- Delegates to core.startDragRaceActivity(lane).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:395
---@param lane integer|nil Lane.
---@return boolean  true if started.
function gameplay_drag_dragBridge.startDragRaceActivity(lane) end

--- Stops the race: full clear (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging).
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:133
---@return boolean  Always true.
function gameplay_drag_dragBridge.stopDragRace() end

--- Same full clear as stopDragRace, with no return value.
---Source: lua/ge/extensions/gameplay/drag/dragBridge.lua:413
function gameplay_drag_dragBridge.unloadRace() end

