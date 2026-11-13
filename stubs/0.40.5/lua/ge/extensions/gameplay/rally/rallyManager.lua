---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/rallyManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/rallyManager.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_rallyManager
local gameplay_rally_rallyManager = {}

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:647
---@param pacenote any
function gameplay_rally_rallyManager:_playbackAllowed(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:87
function gameplay_rally_rallyManager:_refreshNotebookForVoicepackPick() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1096
---@param recoveryType any
function gameplay_rally_rallyManager:addRecoveryRaceTime(recoveryType) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:743
function gameplay_rally_rallyManager:clearQueueHold() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:609
function gameplay_rally_rallyManager:clearResolvedAudioObjs() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1259
function gameplay_rally_rallyManager:clearSplitTimes() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:788
function gameplay_rally_rallyManager:closestPacenoteToVehicle() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:328
function gameplay_rally_rallyManager:codriver() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:702
function gameplay_rally_rallyManager:drawPacenotesForDriving() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:756
function gameplay_rally_rallyManager:enqueueHold() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:751
---@param pacenote any
function gameplay_rally_rallyManager:enqueuePacenote(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:842
---@param secs any
function gameplay_rally_rallyManager:enqueuePauseSecs(secs) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:802
---@param name any
---@param audioLenOffset any
function gameplay_rally_rallyManager:enqueueRandomSystemPacenote(name, audioLenOffset) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1167
function gameplay_rally_rallyManager:getActiveStageData() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:140
function gameplay_rally_rallyManager:getAudioManager() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:870
function gameplay_rally_rallyManager:getDrivelineRoute() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:108
function gameplay_rally_rallyManager:getErrorMsgForUser() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:892
function gameplay_rally_rallyManager:getLastPlayedPacenote() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:900
---@param distanceBefore any
function gameplay_rally_rallyManager:getLastPlayedPacenoteRecoveryPose(distanceBefore) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1021
function gameplay_rally_rallyManager:getLiaisonAllocatedTimeSecs() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1279
function gameplay_rally_rallyManager:getLoopPrefabPath() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:132
function gameplay_rally_rallyManager:getMissionDir() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:128
function gameplay_rally_rallyManager:getMissionId() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:185
function gameplay_rally_rallyManager:getMissionName() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:194
function gameplay_rally_rallyManager:getMissionStartTrigger() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:797
function gameplay_rally_rallyManager:getNextPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:136
function gameplay_rally_rallyManager:getNotebookPath() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:112
function gameplay_rally_rallyManager:getPacenoteProcessingEnabled() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:422
function gameplay_rally_rallyManager:getPathnodeObservationList() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:363
---@param point any
function gameplay_rally_rallyManager:getPointDistanceFromStartKm(point) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:359
---@param point any
function gameplay_rally_rallyManager:getPointDistanceFromStartMeters(point) end

--- returns a table with the following fields:
---  distM: distance in meters
---  distPct: percentage of the race completed from 0 to 1
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1061
function gameplay_rally_rallyManager:getRaceCompletionData() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:148
function gameplay_rally_rallyManager:getRaceData() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1049
function gameplay_rally_rallyManager:getRaceDistanceMeters() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:144
function gameplay_rally_rallyManager:getRacePath() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:998
function gameplay_rally_rallyManager:getRecoveryDestinationPos() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:939
---@param options any
function gameplay_rally_rallyManager:getRouteDepartureRecoveryPose(options) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:177
function gameplay_rally_rallyManager:getSSStartLinePos() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:181
function gameplay_rally_rallyManager:getSSStopControlPos() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1014
function gameplay_rally_rallyManager:getSpeedLimitKph() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:415
function gameplay_rally_rallyManager:getSplitDataIndex() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:408
function gameplay_rally_rallyManager:getSplitDataList() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1077
function gameplay_rally_rallyManager:getStageObserverState() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1073
function gameplay_rally_rallyManager:getStageRuntimeAuthorityMode() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1087
function gameplay_rally_rallyManager:getStageRuntimeTime() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1092
function gameplay_rally_rallyManager:getStageTimingState() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1033
function gameplay_rally_rallyManager:getStartAndFinishStartPositions() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:156
---@param name any
function gameplay_rally_rallyManager:getStartPositionByName(name) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:169
function gameplay_rally_rallyManager:getTCInPos() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:173
function gameplay_rally_rallyManager:getTCOutPos() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:367
function gameplay_rally_rallyManager:getTimeAllocationSecs() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:387
function gameplay_rally_rallyManager:getTimeAllocationString() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1122
function gameplay_rally_rallyManager:getTrackerStageTime() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:79
function gameplay_rally_rallyManager:getVoicepackPick() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:83
function gameplay_rally_rallyManager:getVoicepackPickWritesSettings() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1028
function gameplay_rally_rallyManager:hasAnyPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:36
---@param missionDir any
---@param missionId any
function gameplay_rally_rallyManager:init(missionDir, missionId) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:626
function gameplay_rally_rallyManager:onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:717
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_rallyManager:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:637
function gameplay_rally_rallyManager:onVehicleResetted() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:853
function gameplay_rally_rallyManager:playFirstPacenote() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:763
function gameplay_rally_rallyManager:processPacenoteQueue() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:447
---@param options any
function gameplay_rally_rallyManager:rebuildAssets(options) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1246
---@param pathnodeId any
---@param time any
function gameplay_rally_rallyManager:recordSplit(pathnodeId, time) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:918
---@param veh any
---@param options any
function gameplay_rally_rallyManager:recoverVehicleToLastPlayedPacenote(veh, options) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:960
---@param veh any
---@param options any
function gameplay_rally_rallyManager:recoverVehicleToRouteDeparture(veh, options) end

--- Voicepack changes rebuild all compositor-derived state, including distance calls.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:552
---@param pick any
---@param opts any
function gameplay_rally_rallyManager:reloadVoicepackAssets(pick, opts) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1009
function gameplay_rally_rallyManager:resetAudioQueue() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:575
function gameplay_rally_rallyManager:resetPacenoteRuntime() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:561
function gameplay_rally_rallyManager:resetStageRuntime() end

--- Picks the active voicepack via an exact toolbox/mission pick or the preference/MRU resolver,
---  then finds the matching notebook in this mission. If none exists, returns an in-memory
---  empty notebook so geometry-only rally routes can still be previewed.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:432
function gameplay_rally_rallyManager:resolveAndLoadNotebook() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:581
---@param options any
function gameplay_rally_rallyManager:resyncAfterTeleport(options) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:615
---@param options any
function gameplay_rally_rallyManager:runtimeResync(options) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1110
---@param vehId any
function gameplay_rally_rallyManager:sampleRaceStageTime(vehId) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:847
---@param pacenote any
function gameplay_rally_rallyManager:sendPacenoteToAudioManager(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:874
---@param pacenote any
function gameplay_rally_rallyManager:setLastPlayedPacenote(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:116
---@param enabled any
function gameplay_rally_rallyManager:setPacenoteProcessingEnabled(enabled) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:633
---@param val any
function gameplay_rally_rallyManager:setPreserveRecoveryTrackerOnNextVehicleReset(val) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:152
---@param raceData any
function gameplay_rally_rallyManager:setRaceData(raceData) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1081
---@param active any
function gameplay_rally_rallyManager:setStageRuntimeActive(active) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1066
---@param mode any
function gameplay_rally_rallyManager:setStageRuntimeAuthorityMode(mode) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:96
---@param pick any
---@param opts any
function gameplay_rally_rallyManager:setVoicepackPick(pick, opts) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:230
function gameplay_rally_rallyManager:setupDrivelineRouteHooks() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:695
function gameplay_rally_rallyManager:triggerClearAllVisualPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:687
---@param pacenote any
function gameplay_rally_rallyManager:triggerClearVisualPacenote(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:203
---@param pacenote any
function gameplay_rally_rallyManager:triggerPacenote(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:661
---@param pacenote any
function gameplay_rally_rallyManager:triggerShowVisualPacenote(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1133
function gameplay_rally_rallyManager:updateTrackerSplitObservations() end

