---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/rallyManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- RallyManager object returned by the module's constructor.
---@class gameplay_rally_rallyManager
local gameplay_rally_rallyManager = {}

--- Calls pacenote:playbackAllowed(); on error, the error is logged and playback is allowed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:647
---@param pacenote table Pacenote
---@return boolean  true if playback is allowed
function gameplay_rally_rallyManager:_playbackAllowed(pacenote) end

--- Invalidates the notebook's voicepack and custom audio caches and notifies it of a settings change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:87
function gameplay_rally_rallyManager:_refreshNotebookForVoicepackPick() end

--- Adds a recovery's penalty to the timer (RecoveryClockAdvance.getSpecialStageSeconds).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1096
---@param recoveryType string "recovery" or "flip"
---@return boolean  true if time was added (false if 0 s or timer inactive)
function gameplay_rally_rallyManager:addRecoveryRaceTime(recoveryType) end

--- Removes the HOLD at the head of the pacenote queue, if it is there.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:743
function gameplay_rally_rallyManager:clearQueueHold() end

--- Asks the notebook to forget the resolved audio objects.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:609
function gameplay_rally_rallyManager:clearResolvedAudioObjs() end

--- Clears all the splits' times and observation markers then resets the stage timer.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1259
function gameplay_rally_rallyManager:clearSplitTimes() end

--- Pacenote closest to the tracked vehicle's position.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:788
---@return table|nil  Pacenote
function gameplay_rally_rallyManager:closestPacenoteToVehicle() end

--- Selected co-driver of the notebook.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:328
---@return any  result of notebook:selectedCodriver()
function gameplay_rally_rallyManager:codriver() end

--- Debug-draws the next pacenote: the corner start waypoint with the compiled text.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:702
function gameplay_rally_rallyManager:drawPacenotesForDriving() end

--- Adds a HOLD value to the end of the queue: the following pacenotes wait for its release.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:756
function gameplay_rally_rallyManager:enqueueHold() end

--- Adds a pacenote to the end of the queue.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:751
---@param pacenote table Pacenote
function gameplay_rally_rallyManager:enqueuePacenote(pacenote) end

--- Adds a pause to the audio queue.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:842
---@param secs number Duration in seconds
function gameplay_rally_rallyManager:enqueuePauseSecs(secs) end

--- Picks a random system pacenote by name, reads the audio duration from its metadata (+ audioLenOffset) and sends it to the AudioManager. Logs an error if the name, the audio file or the duration are invalid.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:802
---@param name string System pacenote name
---@param audioLenOffset number|nil Seconds added to the audio duration (0 by default)
function gameplay_rally_rallyManager:enqueueRandomSystemPacenote(name, audioLenOffset) end

--- Builds the special stage state for the UI: currentSSTime (seconds to the tenth), isActive, isComplete, splits, authorityMode, source ('race', 'tracker' or 'trackerFallback'), completion {distPct, totalDistM}. Depends on the authority mode and the observer state.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1167
---@return table|nil  Reused shared table; nil without vehicleTracker
function gameplay_rally_rallyManager:getActiveStageData() end

--- Audio manager, nil before rebuildAssets.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:140
---@return table|nil
function gameplay_rally_rallyManager:getAudioManager() end

--- DrivelineRoute object.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:870
---@return table|nil
function gameplay_rally_rallyManager:getDrivelineRoute() end

--- Last error message intended for the user (missing race.json, invalid notebook, etc.).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:108
---@return string|nil  message
function gameplay_rally_rallyManager:getErrorMsgForUser() end

--- Last played pacenote (retrieved by its index in the notebook if it exists).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:892
---@return table|nil  Pacenote
function gameplay_rally_rallyManager:getLastPlayedPacenote() end

--- Computes a recovery position and rotation placed before the last played pacenote.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:900
---@param distanceBefore number Distance before the pacenote, in meters (inferred from code)
---@return vec3|nil  Position
---@return quat|nil  Rotation
---@return string|nil  Reason for the failure
---@return table|nil  Pacenote used
---@return vec3|nil  Forward direction
function gameplay_rally_rallyManager:getLastPlayedPacenoteRecoveryPose(distanceBefore) end

--- Time allocated for the road section in seconds.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1021
---@return number|nil  seconds
function gameplay_rally_rallyManager:getLiaisonAllocatedTimeSecs() end

--- Path of the loopPrefab.prefab.json file in the mission folder.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1279
---@return string
function gameplay_rally_rallyManager:getLoopPrefabPath() end

--- Mission folder.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:132
---@return string
function gameplay_rally_rallyManager:getMissionDir() end

--- Mission identifier.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:128
---@return string
function gameplay_rally_rallyManager:getMissionId() end

--- Translated name of the mission, computed once then cached.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:185
---@return string
function gameplay_rally_rallyManager:getMissionName() end

--- Start trigger (startTrigger) of the mission in gameplay_missions_missions; nil and a logged error if the mission is not found.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:194
---@return table|nil  table with pos, rot, level...
function gameplay_rally_rallyManager:getMissionStartTrigger() end

--- List containing the driveline's next pacenote (a single element, possibly nil).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:797
---@return table  {pacenote}
function gameplay_rally_rallyManager:getNextPacenotes() end

--- Loaded notebook (NotebookPath object), nil before rebuildAssets.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:136
---@return table|nil
function gameplay_rally_rallyManager:getNotebookPath() end

--- Indicates whether pacenote queue processing is active.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:112
---@return boolean
function gameplay_rally_rallyManager:getPacenoteProcessingEnabled() end

--- List ordered by distance of the pathnodes to observe (splits, finish).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:422
---@return table|nil
function gameplay_rally_rallyManager:getPathnodeObservationList() end

--- Distance of the point from the start along the road, in kilometers.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:363
---@param point any Road point or position (inferred from code)
---@return number  kilometers
function gameplay_rally_rallyManager:getPointDistanceFromStartKm(point) end

--- Distance of the point from the start along the road, in meters.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:359
---@param point any Road point or position (inferred from code)
---@return number  meters
function gameplay_rally_rallyManager:getPointDistanceFromStartMeters(point) end

--- Race progress: distM (distance in m) and distPct (0 to 1); the code also reads totalDistM.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1061
---@return table  {distM, distPct, totalDistM}
function gameplay_rally_rallyManager:getRaceCompletionData() end

--- Current race data (vehicle states, times), provided by setRaceData.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:148
---@return table|nil
function gameplay_rally_rallyManager:getRaceData() end

--- Race distance between start and finish along the driveline.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1049
---@return number|nil  meters
function gameplay_rally_rallyManager:getRaceDistanceMeters() end

--- Race path loaded from race.json.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:144
---@return table|nil
function gameplay_rally_rallyManager:getRacePath() end

--- Destination position of a recovery: the resume pose, otherwise the road point ahead of the vehicle.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:998
---@return vec3|nil  Position
function gameplay_rally_rallyManager:getRecoveryDestinationPos() end

--- Computes the recovery pose after leaving the road (DrivelineRoute:vehiclePlacementPosAndRotForRecovery).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:939
---@param options table|nil {backoffDistance=number, tangentLookAhead=number}
---@return vec3|nil  Position
---@return quat|nil  Rotation
---@return string|nil  Reason for the failure
---@return table|nil  {fwd, distToTarget, trackerState}
function gameplay_rally_rallyManager:getRouteDepartureRecoveryPose(options) end

--- Start position named "SS_start_line" (special stage start line).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:177
---@return table|nil
function gameplay_rally_rallyManager:getSSStartLinePos() end

--- Start position named "SS_stop_control" (stop control).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:181
---@return table|nil
function gameplay_rally_rallyManager:getSSStopControlPos() end

--- Driveline speed limit in km/h.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1014
---@return number|nil  km/h
function gameplay_rally_rallyManager:getSpeedLimitKph() end

--- Index of the splits by pathnodeId.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:415
---@return table|nil
function gameplay_rally_rallyManager:getSplitDataIndex() end

--- List of the DrivelineRoute's splits data.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:408
---@return table|nil
function gameplay_rally_rallyManager:getSplitDataList() end

--- State of the stage observer (StageObserver:getState).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1077
---@return table|nil
function gameplay_rally_rallyManager:getStageObserverState() end

--- Current authority mode ('shadow' by default).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1073
---@return string
function gameplay_rally_rallyManager:getStageRuntimeAuthorityMode() end

--- Special stage time in seconds: the tracker's finish time if it exists, otherwise the timer's time.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1087
---@return number  seconds
function gameplay_rally_rallyManager:getStageRuntimeTime() end

--- Snapshot of the timer state (StageTimingState:getState).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1092
---@return table|nil
function gameplay_rally_rallyManager:getStageTimingState() end

--- Returns the start position (SS_start_line, otherwise TC_in) and the last pathnode (flying finish, not the stop control).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1033
---@return table|nil  Start position
---@return table|nil  Last pathnode
function gameplay_rally_rallyManager:getStartAndFinishStartPositions() end

--- Looks for a start position of the race path by its name.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:156
---@param name string Position name (e.g. TC_in)
---@return table|nil  Starting position or nil
function gameplay_rally_rallyManager:getStartPositionByName(name) end

--- Start position named "TC_in" (time control entry).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:169
---@return table|nil
function gameplay_rally_rallyManager:getTCInPos() end

--- Start position named "TC_out" (time control exit).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:173
---@return table|nil
function gameplay_rally_rallyManager:getTCOutPos() end

--- Time allocated in seconds to travel the road at the driveline's speed limit (distance / speed).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:367
---@return number|nil  seconds; nil if road/driveline absent or negative distance
function gameplay_rally_rallyManager:getTimeAllocationSecs() end

--- Allocated time rounded up to the next minute, in the format "Xh Ym".
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:387
---@return string  text, or "N/A" if unavailable
function gameplay_rally_rallyManager:getTimeAllocationString() end

--- Special stage time as seen by the tracker: observer, otherwise tracker finish, active timer, or race time.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1122
---@return number|nil  seconds
function gameplay_rally_rallyManager:getTrackerStageTime() end

--- Session voicepack choice; {type='preferences'} by default.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:79
---@return table  {type='preferences'} or {type='voicepack', id, scope, dirname}
function gameplay_rally_rallyManager:getVoicepackPick() end

--- Indicates whether the voicepack choice is written to the settings (true unless explicitly disabled).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:83
---@return boolean
function gameplay_rally_rallyManager:getVoicepackPickWritesSettings() end

--- Indicates whether the notebook contains pacenotes.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1028
---@return boolean
function gameplay_rally_rallyManager:hasAnyPacenotes() end

--- Initializes all fields (pacenote queue, notebook, racePath, driveline, audio nil, StageObserver, StageTimingState, authority mode 'shadow') for the given mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:36
---@param missionDir string Mission folder
---@param missionId string Mission identifier
function gameplay_rally_rallyManager:init(missionDir, missionId) end

--- Called when the rally settings change: notifies the notebook and empties the audio queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:626
function gameplay_rally_rallyManager:onSettingsChanged() end

--- Called every frame by gameplay_rally: updates the tracker, the DrivelineRoute, the timer (advances by dtSim), the split observations, the audio, then processes the pacenote queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:717
---@param dtReal number Real time elapsed (s)
---@param dtSim number Simulation time elapsed (s)
---@param dtRaw number Raw time elapsed (s)
function gameplay_rally_rallyManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Called when the vehicle is put back in place: clears the resolved audio and resyncs (preserving the recovery tracker once only if requested).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:637
function gameplay_rally_rallyManager:onVehicleResetted() end

--- Plays (audio) the notebook's first sorted pacenote and stores it as the last played.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:853
function gameplay_rally_rallyManager:playFirstPacenote() end

--- If processing is active and the head is not HOLD, dequeues a pacenote and plays it via triggerPacenote.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:763
function gameplay_rally_rallyManager:processPacenoteQueue() end

--- Builds the whole runtime context: VehicleTracker, race.json, notebook, AudioManager, driveline (DrivelineV3) and DrivelineRoute, notebook snaproad, compiled pacenotes, then runtimeResync. On failure, errorMsgForUser is set.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:447
---@param options table|nil {assets=false to only resync, deferRuntime=boolean (default true)}
---@return boolean  true if everything went well
function gameplay_rally_rallyManager:rebuildAssets(options) end

--- Records a race's time for a split (via the observer, or directly in splitData).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1246
---@param pathnodeId integer Id of the split's pathnode
---@param time number Time in seconds
function gameplay_rally_rallyManager:recordSplit(pathnodeId, time) end

--- Teleports the vehicle 10 m (or options.distanceBefore) before the last played pacenote, resyncs then triggers the onVehicleTeleportedToLastRoad hook.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:918
---@param veh userdata|nil Vehicle (player 0 by default)
---@param options table|nil {distanceBefore=number, resetVehicle=boolean, unlimitedSafeSpawnRange=boolean}
---@return boolean  true if successful
---@return string|nil  Reason for the failure
---@return table|nil  Pacenote used
function gameplay_rally_rallyManager:recoverVehicleToLastPlayedPacenote(veh, options) end

--- Teleports the vehicle to the road's resume point, with repair according to options.repairVehicle / resetVehicle / gameplay_rally.getRecoveryRepairVehicle (true by default), then triggers the onVehicleTeleportedToLastRoad and onRallyRouteRecoveryComplete hooks.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:960
---@param veh userdata|nil Vehicle (player 0 by default)
---@param options table|nil {repairVehicle, resetVehicle, backoffDistance, tangentLookAhead, unlimitedSafeSpawnRange}
---@return boolean  true if successful
---@return string|nil  Reason for the failure
---@return table|nil  recoveryData
function gameplay_rally_rallyManager:recoverVehicleToRouteDeparture(veh, options) end

--- Changes the voicepack then rebuilds all the compositor-derived states (including the distance calls).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:552
---@param pick table|nil Voicepack choice
---@param opts table|nil {writeSettings=boolean}
---@return boolean  result of rebuildAssets
function gameplay_rally_rallyManager:reloadVoicepackAssets(pick, opts) end

--- Empties the AudioManager's audio queue.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1009
function gameplay_rally_rallyManager:resetAudioQueue() end

--- Clears the visual pacenotes, the audio queue and the pacenote queue.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:575
function gameplay_rally_rallyManager:resetPacenoteRuntime() end

--- Resets the stage tracking state: timer, observer, end flags, and reapplies the authority mode to the observer.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:561
function gameplay_rally_rallyManager:resetStageRuntime() end

--- Chooses the active voicepack (exact choice or preferences/MRU) then loads the mission's matching notebook. If none exists, returns an empty in-memory notebook ("Route Preview") to preview a route without pacenotes.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:432
---@return table|nil  Notebook
function gameplay_rally_rallyManager:resolveAndLoadNotebook() end

--- Resynchronizes the state after a vehicle move: empties the queues, forgets the observer's footprint and asks the DrivelineRoute to recompute (immediately if deferRuntime == false, otherwise at the next onUpdate).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:581
---@param options table|nil {deferRuntime=boolean, preserveRecoveryTracker=boolean}
---@return boolean  always true
function gameplay_rally_rallyManager:resyncAfterTeleport(options) end

--- Clears the resolved audio, resets the stage timer, then calls resyncAfterTeleport.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:615
---@param options table|nil Same options as resyncAfterTeleport
---@return boolean  result of resyncAfterTeleport
function gameplay_rally_rallyManager:runtimeResync(options) end

--- Special stage time for a vehicle: the timer's if active or finished by the tracker, otherwise that of the race data (finish time if finished).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1110
---@param vehId integer|nil Vehicle id
---@return number|nil  seconds
function gameplay_rally_rallyManager:sampleRaceStageTime(vehId) end

--- Sends the pacenote to the AudioManager for audio playback.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:847
---@param pacenote table Pacenote
---@return boolean  false if there is no AudioManager
function gameplay_rally_rallyManager:sendPacenoteToAudioManager(pacenote) end

--- Stores the last played pacenote, its name and its index in the notebook's sorted list.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:874
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:setLastPlayedPacenote(pacenote) end

--- Enables or suspends pacenote queue processing.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:116
---@param enabled boolean true to process the queue
function gameplay_rally_rallyManager:setPacenoteProcessingEnabled(enabled) end

--- Indicates that the next vehicle reset must preserve the recovery's static tracking.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:633
---@param val boolean true to preserve (only the strict value true counts)
function gameplay_rally_rallyManager:setPreserveRecoveryTrackerOnNextVehicleReset(val) end

--- Stores the current race data.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:152
---@param raceData table|nil Race data (states, time...)
function gameplay_rally_rallyManager:setRaceData(raceData) end

--- Starts or stops the stage timer; does not start if the stage is already finished.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1081
---@param active boolean true to start
function gameplay_rally_rallyManager:setStageRuntimeActive(active) end

--- Sets the timer authority mode ('tracker' or 'shadow') and passes it to the observer.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1066
---@param mode string 'tracker' or 'shadow'
function gameplay_rally_rallyManager:setStageRuntimeAuthorityMode(mode) end

--- Sets the session voicepack (type 'auto' converted to 'preferences'), adds it to the MRU list if needed, then refreshes the notebook unless deferNotebookRefresh.
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:96
---@param pick table|nil Voicepack choice
---@param opts table|nil {writeSettings=boolean, deferNotebookRefresh=boolean}
function gameplay_rally_rallyManager:setVoicepackPick(pick, opts) end

--- Wires up the DrivelineRoute callbacks (CsDynamic, CsImmediate, CsStatic, CeStatic, -40 offsets for Cs and -5 for Ce, corner percentage 0.5): they queue the pacenote, add a HOLD for slow corners, clear the visual pacenote and release the HOLD according to the pacenote's rule.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:230
function gameplay_rally_rallyManager:setupDrivelineRouteHooks() end

--- Clears all visual pacenotes (guihooks 'clearAllVisualPacenotes').
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:695
function gameplay_rally_rallyManager:triggerClearAllVisualPacenotes() end

--- Clears one visual pacenote (guihooks 'clearOneVisualPacenote' with visualSerialNo).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:687
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:triggerClearVisualPacenote(pacenote) end

--- Plays a pacenote if playback is allowed: sends it to the audio (rallyAudioPacenotes setting) and triggers the visual display (rallyVisualPacenotes setting, except for a custom audio notebook).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:203
---@param pacenote table Notebook pacenote
function gameplay_rally_rallyManager:triggerPacenote(pacenote) end

--- Sends the compiled pacenote to the UI via guihooks 'showVisualPacenote2'. Ignored if it has no visual event or no icon (empty visualPacenotes).
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:661
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:triggerShowVisualPacenote(pacenote) end

--- Calls StageObserver:update with the static tracker, the observation nodes and the frame times, then copies the stage end and ends the timer if the observer detected the finish.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/rallyManager.lua:1133
function gameplay_rally_rallyManager:updateTrackerSplitObservations() end

