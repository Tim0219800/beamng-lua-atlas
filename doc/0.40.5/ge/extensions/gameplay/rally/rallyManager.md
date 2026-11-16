# `gameplay_rally_rallyManager`

*File: `lua/ge/extensions/gameplay/rally/rallyManager.lua` · VM: Game Engine (GE) · 1290 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/rallyManager")` (file under extensions/ but not a regular extension)

Manager of a loaded rally mission (special stage or road section). A RallyManager object groups the notebook (pacenotes), the race path (race.json), the recorded driveline (DrivelineV3 / DrivelineRoute), vehicle tracking (VehicleTracker), the audio manager, the pacenote queue, the stage observer (StageObserver) and the timer (StageTimingState). It triggers the audio and visual pacenotes, handles vehicle recoveries, split times and the stage state for the UI. It is created and owned by the gameplay_rally extension (gameplay_rally.getRallyManager()). The module returns a constructor.

## Example

```lua
local rm = gameplay_rally.getRallyManager()
if rm then
  local data = rm:getActiveStageData()
  print(data.currentSSTime, data.completion.distPct)
end
```

## Notes

- The constructor is called with (missionDir, missionId); the resources (notebook, driveline, audio) are only built by rebuildAssets.
- The pacenote queue (dequeue) can contain the special value 'HOLD': while it is at the head, no pacenote is played. It is used for slow corners (slowCorner) and released by clearQueueHold.
- The activation parameters are read from settings: rallyAudioPacenotes and rallyVisualPacenotes. A notebook in custom audio mode does not emit visual pacenotes.
- Timer authority modes: 'shadow' (default, source = 'race' race data) or 'tracker' (source = crossing observer). Any other value falls back to 'shadow'.
- Vehicle recoveries call extensions.hook('onVehicleTeleportedToLastRoad', vehId); recoverVehicleToRouteDeparture also calls extensions.hook('onRallyRouteRecoveryComplete', {vehId, repairVehicle, recoveryData}).
- getActiveStageData always returns the same reused table (module local variable): copy the values if they must be kept between two calls.
- Potential bug: several methods do not check that drivelineRoute exists (getPointDistanceFromStartMeters/Km, getRaceCompletionData) and raise an error on nil before loading; getTimeAllocationSecs divides by drivelineV3:getSpeedLimitKph() without testing for a nil or zero value; codriver and closestPacenoteToVehicle assume notebook / vehicleTracker are non-nil.
- addRecoveryRaceTime always uses the penalties of a special stage ("Single stages are always a special stage", code comment) and ignores the non-special-stage penalties table of recoveryClockAdvance.

## Class `C`

RallyManager object returned by the module's constructor.

The module returns a constructor: `local obj = require("gameplay_rally_rallyManager")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_playbackAllowed(pacenote)` | Calls pacenote:playbackAllowed(); on error, the error is logged and playback is allowed. | 647 |
| `C:_refreshNotebookForVoicepackPick()` | Invalidates the notebook's voicepack and custom audio caches and notifies it of a settings change. | 87 |
| `C:addRecoveryRaceTime(recoveryType)` | Adds a recovery's penalty to the timer (RecoveryClockAdvance.getSpecialStageSeconds). | 1096 |
| `C:clearQueueHold()` | Removes the HOLD at the head of the pacenote queue, if it is there. | 743 |
| `C:clearResolvedAudioObjs()` | Asks the notebook to forget the resolved audio objects. | 609 |
| `C:clearSplitTimes()` | Clears all the splits' times and observation markers then resets the stage timer. | 1259 |
| `C:closestPacenoteToVehicle()` | Pacenote closest to the tracked vehicle's position. | 788 |
| `C:codriver()` | Selected co-driver of the notebook. | 328 |
| `C:drawPacenotesForDriving()` | Debug-draws the next pacenote: the corner start waypoint with the compiled text. | 702 |
| `C:enqueueHold()` | Adds a HOLD value to the end of the queue: the following pacenotes wait for its release. | 756 |
| `C:enqueuePacenote(pacenote)` | Adds a pacenote to the end of the queue. | 751 |
| `C:enqueuePauseSecs(secs)` | Adds a pause to the audio queue. | 842 |
| `C:enqueueRandomSystemPacenote(name, audioLenOffset)` | Picks a random system pacenote by name, reads the audio duration from its metadata (+ audioLenOffset) and sends it to the AudioManager. Logs an error if the name, the audio file or the duration are invalid. | 802 |
| `C:getActiveStageData()` | Builds the special stage state for the UI: currentSSTime (seconds to the tenth), isActive, isComplete, splits, authorityMode, source ('race', 'tracker' or 'trackerFallback'), completion {distPct, totalDistM}. Depends on the authority mode and the observer state. | 1167 |
| `C:getAudioManager()` | Audio manager, nil before rebuildAssets. | 140 |
| `C:getDrivelineRoute()` | DrivelineRoute object. | 870 |
| `C:getErrorMsgForUser()` | Last error message intended for the user (missing race.json, invalid notebook, etc.). | 108 |
| `C:getLastPlayedPacenote()` | Last played pacenote (retrieved by its index in the notebook if it exists). | 892 |
| `C:getLastPlayedPacenoteRecoveryPose(distanceBefore)` | Computes a recovery position and rotation placed before the last played pacenote. | 900 |
| `C:getLiaisonAllocatedTimeSecs()` | Time allocated for the road section in seconds. | 1021 |
| `C:getLoopPrefabPath()` | Path of the loopPrefab.prefab.json file in the mission folder. | 1279 |
| `C:getMissionDir()` | Mission folder. | 132 |
| `C:getMissionId()` | Mission identifier. | 128 |
| `C:getMissionName()` | Translated name of the mission, computed once then cached. | 185 |
| `C:getMissionStartTrigger()` | Start trigger (startTrigger) of the mission in gameplay_missions_missions; nil and a logged error if the mission is not found. | 194 |
| `C:getNextPacenotes()` | List containing the driveline's next pacenote (a single element, possibly nil). | 797 |
| `C:getNotebookPath()` | Loaded notebook (NotebookPath object), nil before rebuildAssets. | 136 |
| `C:getPacenoteProcessingEnabled()` | Indicates whether pacenote queue processing is active. | 112 |
| `C:getPathnodeObservationList()` | List ordered by distance of the pathnodes to observe (splits, finish). | 422 |
| `C:getPointDistanceFromStartKm(point)` | Distance of the point from the start along the road, in kilometers. | 363 |
| `C:getPointDistanceFromStartMeters(point)` | Distance of the point from the start along the road, in meters. | 359 |
| `C:getRaceCompletionData()` | Race progress: distM (distance in m) and distPct (0 to 1); the code also reads totalDistM. | 1061 |
| `C:getRaceData()` | Current race data (vehicle states, times), provided by setRaceData. | 148 |
| `C:getRaceDistanceMeters()` | Race distance between start and finish along the driveline. | 1049 |
| `C:getRacePath()` | Race path loaded from race.json. | 144 |
| `C:getRecoveryDestinationPos()` | Destination position of a recovery: the resume pose, otherwise the road point ahead of the vehicle. | 998 |
| `C:getRouteDepartureRecoveryPose(options)` | Computes the recovery pose after leaving the road (DrivelineRoute:vehiclePlacementPosAndRotForRecovery). | 939 |
| `C:getSSStartLinePos()` | Start position named "SS_start_line" (special stage start line). | 177 |
| `C:getSSStopControlPos()` | Start position named "SS_stop_control" (stop control). | 181 |
| `C:getSpeedLimitKph()` | Driveline speed limit in km/h. | 1014 |
| `C:getSplitDataIndex()` | Index of the splits by pathnodeId. | 415 |
| `C:getSplitDataList()` | List of the DrivelineRoute's splits data. | 408 |
| `C:getStageObserverState()` | State of the stage observer (StageObserver:getState). | 1077 |
| `C:getStageRuntimeAuthorityMode()` | Current authority mode ('shadow' by default). | 1073 |
| `C:getStageRuntimeTime()` | Special stage time in seconds: the tracker's finish time if it exists, otherwise the timer's time. | 1087 |
| `C:getStageTimingState()` | Snapshot of the timer state (StageTimingState:getState). | 1092 |
| `C:getStartAndFinishStartPositions()` | Returns the start position (SS_start_line, otherwise TC_in) and the last pathnode (flying finish, not the stop control). | 1033 |
| `C:getStartPositionByName(name)` | Looks for a start position of the race path by its name. | 156 |
| `C:getTCInPos()` | Start position named "TC_in" (time control entry). | 169 |
| `C:getTCOutPos()` | Start position named "TC_out" (time control exit). | 173 |
| `C:getTimeAllocationSecs()` | Time allocated in seconds to travel the road at the driveline's speed limit (distance / speed). | 367 |
| `C:getTimeAllocationString()` | Allocated time rounded up to the next minute, in the format "Xh Ym". | 387 |
| `C:getTrackerStageTime()` | Special stage time as seen by the tracker: observer, otherwise tracker finish, active timer, or race time. | 1122 |
| `C:getVoicepackPick()` | Session voicepack choice; {type='preferences'} by default. | 79 |
| `C:getVoicepackPickWritesSettings()` | Indicates whether the voicepack choice is written to the settings (true unless explicitly disabled). | 83 |
| `C:hasAnyPacenotes()` | Indicates whether the notebook contains pacenotes. | 1028 |
| `C:init(missionDir, missionId)` | Initializes all fields (pacenote queue, notebook, racePath, driveline, audio nil, StageObserver, StageTimingState, authority mode 'shadow') for the given mission. | 36 |
| `C:onSettingsChanged()` | Called when the rally settings change: notifies the notebook and empties the audio queue. | 626 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame by gameplay_rally: updates the tracker, the DrivelineRoute, the timer (advances by dtSim), the split observations, the audio, then processes the pacenote queue. | 717 |
| `C:onVehicleResetted()` | Called when the vehicle is put back in place: clears the resolved audio and resyncs (preserving the recovery tracker once only if requested). | 637 |
| `C:playFirstPacenote()` | Plays (audio) the notebook's first sorted pacenote and stores it as the last played. | 853 |
| `C:processPacenoteQueue()` | If processing is active and the head is not HOLD, dequeues a pacenote and plays it via triggerPacenote. | 763 |
| `C:rebuildAssets(options)` | Builds the whole runtime context: VehicleTracker, race.json, notebook, AudioManager, driveline (DrivelineV3) and DrivelineRoute, notebook snaproad, compiled pacenotes, then runtimeResync. On failure, errorMsgForUser is set. | 447 |
| `C:recordSplit(pathnodeId, time)` | Records a race's time for a split (via the observer, or directly in splitData). | 1246 |
| `C:recoverVehicleToLastPlayedPacenote(veh, options)` | Teleports the vehicle 10 m (or options.distanceBefore) before the last played pacenote, resyncs then triggers the onVehicleTeleportedToLastRoad hook. | 918 |
| `C:recoverVehicleToRouteDeparture(veh, options)` | Teleports the vehicle to the road's resume point, with repair according to options.repairVehicle / resetVehicle / gameplay_rally.getRecoveryRepairVehicle (true by default), then triggers the onVehicleTeleportedToLastRoad and onRallyRouteRecoveryComplete hooks. | 960 |
| `C:reloadVoicepackAssets(pick, opts)` | Changes the voicepack then rebuilds all the compositor-derived states (including the distance calls). | 552 |
| `C:resetAudioQueue()` | Empties the AudioManager's audio queue. | 1009 |
| `C:resetPacenoteRuntime()` | Clears the visual pacenotes, the audio queue and the pacenote queue. | 575 |
| `C:resetStageRuntime()` | Resets the stage tracking state: timer, observer, end flags, and reapplies the authority mode to the observer. | 561 |
| `C:resolveAndLoadNotebook()` | Chooses the active voicepack (exact choice or preferences/MRU) then loads the mission's matching notebook. If none exists, returns an empty in-memory notebook ("Route Preview") to preview a route without pacenotes. | 432 |
| `C:resyncAfterTeleport(options)` | Resynchronizes the state after a vehicle move: empties the queues, forgets the observer's footprint and asks the DrivelineRoute to recompute (immediately if deferRuntime == false, otherwise at the next onUpdate). | 581 |
| `C:runtimeResync(options)` | Clears the resolved audio, resets the stage timer, then calls resyncAfterTeleport. | 615 |
| `C:sampleRaceStageTime(vehId)` | Special stage time for a vehicle: the timer's if active or finished by the tracker, otherwise that of the race data (finish time if finished). | 1110 |
| `C:sendPacenoteToAudioManager(pacenote)` | Sends the pacenote to the AudioManager for audio playback. | 847 |
| `C:setLastPlayedPacenote(pacenote)` | Stores the last played pacenote, its name and its index in the notebook's sorted list. | 874 |
| `C:setPacenoteProcessingEnabled(enabled)` | Enables or suspends pacenote queue processing. | 116 |
| `C:setPreserveRecoveryTrackerOnNextVehicleReset(val)` | Indicates that the next vehicle reset must preserve the recovery's static tracking. | 633 |
| `C:setRaceData(raceData)` | Stores the current race data. | 152 |
| `C:setStageRuntimeActive(active)` | Starts or stops the stage timer; does not start if the stage is already finished. | 1081 |
| `C:setStageRuntimeAuthorityMode(mode)` | Sets the timer authority mode ('tracker' or 'shadow') and passes it to the observer. | 1066 |
| `C:setVoicepackPick(pick, opts)` | Sets the session voicepack (type 'auto' converted to 'preferences'), adds it to the MRU list if needed, then refreshes the notebook unless deferNotebookRefresh. | 96 |
| `C:setupDrivelineRouteHooks()` | Wires up the DrivelineRoute callbacks (CsDynamic, CsImmediate, CsStatic, CeStatic, -40 offsets for Cs and -5 for Ce, corner percentage 0.5): they queue the pacenote, add a HOLD for slow corners, clear the visual pacenote and release the HOLD according to the pacenote's rule. | 230 |
| `C:triggerClearAllVisualPacenotes()` | Clears all visual pacenotes (guihooks 'clearAllVisualPacenotes'). | 695 |
| `C:triggerClearVisualPacenote(pacenote)` | Clears one visual pacenote (guihooks 'clearOneVisualPacenote' with visualSerialNo). | 687 |
| `C:triggerPacenote(pacenote)` | Plays a pacenote if playback is allowed: sends it to the audio (rallyAudioPacenotes setting) and triggers the visual display (rallyVisualPacenotes setting, except for a custom audio notebook). | 203 |
| `C:triggerShowVisualPacenote(pacenote)` | Sends the compiled pacenote to the UI via guihooks 'showVisualPacenote2'. Ignored if it has no visual event or no icon (empty visualPacenotes). | 661 |
| `C:updateTrackerSplitObservations()` | Calls StageObserver:update with the static tracker, the observation nodes and the frame times, then copies the stage end and ends the timer if the observer detected the finish. | 1133 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyRouteRecoveryComplete` — listened to by 1 module(s)
- `onVehicleTeleportedToLastRoad`

**UI events (guihooks.trigger):** `clearAllVisualPacenotes`, `clearOneVisualPacenote`, `showVisualPacenote2`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/rallyManager.lua`.*
