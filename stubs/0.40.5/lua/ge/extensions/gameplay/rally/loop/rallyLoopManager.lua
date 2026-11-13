---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_loop_rallyLoopManager
local gameplay_rally_loop_rallyLoopManager = {}

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1414
function gameplay_rally_loop_rallyLoopManager:_addServiceInToSchedule() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1385
---@param currentScheduleTimeSecs any
---@param startingSSNumber any
function gameplay_rally_loop_rallyLoopManager:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:377
---@param issue any
function gameplay_rally_loop_rallyLoopManager:_addValidationIssue(issue) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1721
function gameplay_rally_loop_rallyLoopManager:_buildEventsFromSchedule() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1350
---@param roadSectionCount any
---@param nextSSNumber any
---@param isServiceInRoadSection any
---@param lastTCLabel any
---@param tcInPos any
---@param tcOutPos any
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1295
---@param tcInPos any
---@param tcOutPos any
---@param currentScheduleTimeSecs any
---@param timeAllocationSecs any
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1321
---@param ssStartLinePos any
---@param ssStopControlPos any
---@param currentScheduleTimeSecs any
---@param timeAllocationSecs any
function gameplay_rally_loop_rallyLoopManager:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1038
function gameplay_rally_loop_rallyLoopManager:_findNextSSStartEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1071
function gameplay_rally_loop_rallyLoopManager:_findNextTCEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1054
function gameplay_rally_loop_rallyLoopManager:_findPreviousSSStartEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1087
function gameplay_rally_loop_rallyLoopManager:_findPreviousTCEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:353
---@param missionType any
---@param nextSSNumber any
---@param roadSectionCount any
function gameplay_rally_loop_rallyLoopManager:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:362
---@param missionType any
---@param errorMessage any
function gameplay_rally_loop_rallyLoopManager:_getValidationHint(missionType, errorMessage) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1632
function gameplay_rally_loop_rallyLoopManager:_initScheduleCalculation() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1693
function gameplay_rally_loop_rallyLoopManager:_postProcessSchedule() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1434
---@param missionId any
---@param currentScheduleTimeSecs any
---@param nextSSNumber any
---@param roadSectionCount any
---@param lastTCLabel any
---@param serviceInRoadSectionId any
---@param includeDebugData any
function gameplay_rally_loop_rallyLoopManager:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1103
---@param newTime any
---@param onlyIfLater any
---@param reason any
function gameplay_rally_loop_rallyLoopManager:_updateSSStartTime(newTime, onlyIfLater, reason) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2120
---@param enabled any
function gameplay_rally_loop_rallyLoopManager:activateRallyModeInteractActionMap(enabled) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:564
---@param seconds any
function gameplay_rally_loop_rallyLoopManager:adjustClock(seconds) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:855
function gameplay_rally_loop_rallyLoopManager:advanceToNextEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:296
---@param values any
function gameplay_rally_loop_rallyLoopManager:applyStartScreenSettings(values) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2940
function gameplay_rally_loop_rallyLoopManager:applyTrafficExclusion() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:384
function gameplay_rally_loop_rallyLoopManager:buildMissionSequence() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:468
function gameplay_rally_loop_rallyLoopManager:calculateRallyStartTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:601
---@param includeDebugData any
function gameplay_rally_loop_rallyLoopManager:calculateSchedule(includeDebugData) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1141
---@param tcArrivalTime any
function gameplay_rally_loop_rallyLoopManager:calculateStartLineTime(tcArrivalTime) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2214
function gameplay_rally_loop_rallyLoopManager:canSkip() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2629
function gameplay_rally_loop_rallyLoopManager:canSkipCountdown() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2210
function gameplay_rally_loop_rallyLoopManager:canSkipTimeControls() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2949
function gameplay_rally_loop_rallyLoopManager:clearTrafficExclusion() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2336
---@param zOnTop any
---@param drawRoute any
---@param drawLabels any
function gameplay_rally_loop_rallyLoopManager:drawDebug(zOnTop, drawRoute, drawLabels) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1285
---@param epochTime any
function gameplay_rally_loop_rallyLoopManager:epochToWallClock(epochTime) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2162
function gameplay_rally_loop_rallyLoopManager:evaluateSkip() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:344
---@param value any
function gameplay_rally_loop_rallyLoopManager:extractMissionId(value) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:870
---@param timingResult any
function gameplay_rally_loop_rallyLoopManager:filterTimingResultForSettings(timingResult) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1231
---@param seconds any
function gameplay_rally_loop_rallyLoopManager:formatDuration(seconds) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1242
---@param seconds any
function gameplay_rally_loop_rallyLoopManager:formatStageTime(seconds) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1211
---@param timeSecs any
---@param includeSeconds any
---@param includeTenths any
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1221
---@param timeSecs any
---@param includeSeconds any
---@param includeTenths any
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:560
function gameplay_rally_loop_rallyLoopManager:getClockPaused() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:648
function gameplay_rally_loop_rallyLoopManager:getCurrentMissionId() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:828
function gameplay_rally_loop_rallyLoopManager:getCurrentRacePath() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2525
---@param flagName any
function gameplay_rally_loop_rallyLoopManager:getDrawFlag(flagName) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2964
function gameplay_rally_loop_rallyLoopManager:getEnableFalseStarts() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2536
function gameplay_rally_loop_rallyLoopManager:getEnvironmentStartTimeFormatted() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:543
function gameplay_rally_loop_rallyLoopManager:getEpochTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:549
function gameplay_rally_loop_rallyLoopManager:getEpochTimeFormatted() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1170
function gameplay_rally_loop_rallyLoopManager:getEventLog() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:820
function gameplay_rally_loop_rallyLoopManager:getEvents() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2517
function gameplay_rally_loop_rallyLoopManager:getMissionExecutionTransferFlag() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:824
function gameplay_rally_loop_rallyLoopManager:getNextEventIndex() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:710
function gameplay_rally_loop_rallyLoopManager:getNextMissionId() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:701
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMission() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:693
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMissionId() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:697
function gameplay_rally_loop_rallyLoopManager:getRallyLoopName() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2081
function gameplay_rally_loop_rallyLoopManager:getRallyManager() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:506
function gameplay_rally_loop_rallyLoopManager:getRallyPreStartAllocatedDurationSecs() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:498
function gameplay_rally_loop_rallyLoopManager:getRallyStartDurationSecs() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:494
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeFormatted() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:490
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeSecs() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:315
function gameplay_rally_loop_rallyLoopManager:getRecoveryRepairVehicle() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2654
function gameplay_rally_loop_rallyLoopManager:getSSRescheduleCount() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:780
function gameplay_rally_loop_rallyLoopManager:getSchedule() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:568
---@param eventName any
function gameplay_rally_loop_rallyLoopManager:getScheduledEventTime(eventName) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2819
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCPos() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2833
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCRot() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:72
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitDisplay() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:68
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitKph() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:333
function gameplay_rally_loop_rallyLoopManager:getShowStageApps() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:510
function gameplay_rally_loop_rallyLoopManager:getSlotSizeMinutes() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:798
function gameplay_rally_loop_rallyLoopManager:getStageLabels() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2577
function gameplay_rally_loop_rallyLoopManager:getStreamData() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2960
function gameplay_rally_loop_rallyLoopManager:getTestMode() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1194
function gameplay_rally_loop_rallyLoopManager:getTimeOfDay() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1268
function gameplay_rally_loop_rallyLoopManager:getTimeOfDayFormatted() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1182
function gameplay_rally_loop_rallyLoopManager:getTotalDistanceKm() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1190
function gameplay_rally_loop_rallyLoopManager:getTotalPenalty() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1178
function gameplay_rally_loop_rallyLoopManager:getTotalRoadSectionDistanceKm() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1174
function gameplay_rally_loop_rallyLoopManager:getTotalSSDistanceKm() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1186
function gameplay_rally_loop_rallyLoopManager:getTotalTime() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:325
function gameplay_rally_loop_rallyLoopManager:getTrafficEnabled() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2088
function gameplay_rally_loop_rallyLoopManager:getUse24hFormat() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:812
function gameplay_rally_loop_rallyLoopManager:getValidationIssues() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:705
---@param missionId any
---@param missionDir any
function gameplay_rally_loop_rallyLoopManager:getVoicepackPickForMission(missionId, missionDir) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:523
function gameplay_rally_loop_rallyLoopManager:getWallClockDay() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:532
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeFormatted() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:514
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeSecs() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2092
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeTable() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:769
function gameplay_rally_loop_rallyLoopManager:gotoRallyLoopInstant() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:816
function gameplay_rally_loop_rallyLoopManager:hasValidationIssues() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:77
---@param missionId any
---@param missionDir any
function gameplay_rally_loop_rallyLoopManager:init(missionId, missionDir) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:286
function gameplay_rally_loop_rallyLoopManager:initSettings() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1842
function gameplay_rally_loop_rallyLoopManager:initTimecardData() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:279
function gameplay_rally_loop_rallyLoopManager:isDevTrafficDisabled() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:655
function gameplay_rally_loop_rallyLoopManager:isInRoadSection() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:671
function gameplay_rally_loop_rallyLoopManager:isInSpecialStage() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:808
function gameplay_rally_loop_rallyLoopManager:isScheduleValid() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2206
function gameplay_rally_loop_rallyLoopManager:isTimeControlSkipAvailable() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2872
function gameplay_rally_loop_rallyLoopManager:onCreatedRallyGroundMarkerRoute() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2155
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_loop_rallyLoopManager:onGuiUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2543
---@param data any
function gameplay_rally_loop_rallyLoopManager:onRallyDataUpdated(data) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2328
function gameplay_rally_loop_rallyLoopManager:onRallyModeInteract() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2925
---@param data any
function gameplay_rally_loop_rallyLoopManager:onRallyRouteRecoveryComplete(data) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2861
---@param source any
function gameplay_rally_loop_rallyLoopManager:onRecalculatedRoute(source) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:340
function gameplay_rally_loop_rallyLoopManager:onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2847
function gameplay_rally_loop_rallyLoopManager:onUIStartButtonClicked() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2129
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_loop_rallyLoopManager:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2664
function gameplay_rally_loop_rallyLoopManager:recordFalseStartPenalty() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2707
---@param penaltyData any
function gameplay_rally_loop_rallyLoopManager:recordRouteRecalcPenalty(penaltyData) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2733
---@param speedingData any
function gameplay_rally_loop_rallyLoopManager:recordSpeedingPenalty(speedingData) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2783
---@param amount any
function gameplay_rally_loop_rallyLoopManager:recordTestPenalty(amount) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:893
---@param entryName any
---@param stageTimeSecs any
function gameplay_rally_loop_rallyLoopManager:recordTimeCardEntry(entryName, stageTimeSecs) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2633
function gameplay_rally_loop_rallyLoopManager:rescheduleNextSSStart() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:268
---@param key any
---@param defaultValue any
function gameplay_rally_loop_rallyLoopManager:resolveGlobalBoolSetting(key, defaultValue) end

--- init settings with the loop manager so they cant be changed during the loop
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:252
---@param key any
---@param defaultValue any
function gameplay_rally_loop_rallyLoopManager:resolveMissionBoolSetting(key, defaultValue) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:758
function gameplay_rally_loop_rallyLoopManager:restartRallyLoop() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1033
---@param timeSecs any
function gameplay_rally_loop_rallyLoopManager:roundToNextMinute(timeSecs) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2201
---@param canSkip any
---@param isTimeControlSkipAvailable any
function gameplay_rally_loop_rallyLoopManager:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:556
---@param paused any
function gameplay_rally_loop_rallyLoopManager:setClockPaused(paused) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2624
---@param canSkip any
function gameplay_rally_loop_rallyLoopManager:setCountdownCanSkip(canSkip) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2529
---@param flagName any
---@param value any
function gameplay_rally_loop_rallyLoopManager:setDrawFlag(flagName, value) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2521
---@param val any
function gameplay_rally_loop_rallyLoopManager:setMissionExecutionTransferFlag(val) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2968
---@param state any
function gameplay_rally_loop_rallyLoopManager:setTestActiveState(state) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2953
---@param enabled any
function gameplay_rally_loop_rallyLoopManager:setTestMode(enabled) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2513
function gameplay_rally_loop_rallyLoopManager:setupForNewMission() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:687
function gameplay_rally_loop_rallyLoopManager:shouldPenalizeSpeeding() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2252
---@param options any
function gameplay_rally_loop_rallyLoopManager:skipLiaisonForTesting(options) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2218
function gameplay_rally_loop_rallyLoopManager:skipToNextEvent() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:727
function gameplay_rally_loop_rallyLoopManager:startNextMission() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2878
---@param recoveryType any
function gameplay_rally_loop_rallyLoopManager:trackRecovery(recoveryType) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2107
function gameplay_rally_loop_rallyLoopManager:updateRallyClockData() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1956
function gameplay_rally_loop_rallyLoopManager:updateScheduleData() end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1910
---@param eventIndex any
function gameplay_rally_loop_rallyLoopManager:updateTimecardEntry(eventIndex) end

---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:435
function gameplay_rally_loop_rallyLoopManager:validateMissionSequence() end

