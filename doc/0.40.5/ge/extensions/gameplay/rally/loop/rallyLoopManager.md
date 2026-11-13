# `gameplay_rally_loop_rallyLoopManager`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua` · VM : Game Engine (GE) · 2981 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/rallyLoopManager")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_rallyLoopManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_addServiceInToSchedule()` |  | 1414 |
| `C:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber)` |  | 1385 |
| `C:_addValidationIssue(issue)` |  | 377 |
| `C:_buildEventsFromSchedule()` |  | 1721 |
| `C:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos)` |  | 1350 |
| `C:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs)` |  | 1295 |
| `C:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs)` |  | 1321 |
| `C:_findNextSSStartEvent()` |  | 1038 |
| `C:_findNextTCEvent()` |  | 1071 |
| `C:_findPreviousSSStartEvent()` |  | 1054 |
| `C:_findPreviousTCEvent()` |  | 1087 |
| `C:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount)` |  | 353 |
| `C:_getValidationHint(missionType, errorMessage)` |  | 362 |
| `C:_initScheduleCalculation()` |  | 1632 |
| `C:_postProcessSchedule()` |  | 1693 |
| `C:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData)` |  | 1434 |
| `C:_updateSSStartTime(newTime, onlyIfLater, reason)` |  | 1103 |
| `C:activateRallyModeInteractActionMap(enabled)` |  | 2120 |
| `C:adjustClock(seconds)` |  | 564 |
| `C:advanceToNextEvent()` |  | 855 |
| `C:applyStartScreenSettings(values)` |  | 296 |
| `C:applyTrafficExclusion()` |  | 2940 |
| `C:buildMissionSequence()` |  | 384 |
| `C:calculateRallyStartTime()` |  | 468 |
| `C:calculateSchedule(includeDebugData)` |  | 601 |
| `C:calculateStartLineTime(tcArrivalTime)` |  | 1141 |
| `C:canSkip()` |  | 2214 |
| `C:canSkipCountdown()` |  | 2629 |
| `C:canSkipTimeControls()` |  | 2210 |
| `C:clearTrafficExclusion()` |  | 2949 |
| `C:drawDebug(zOnTop, drawRoute, drawLabels)` |  | 2336 |
| `C:epochToWallClock(epochTime)` |  | 1285 |
| `C:evaluateSkip()` |  | 2162 |
| `C:extractMissionId(value)` |  | 344 |
| `C:filterTimingResultForSettings(timingResult)` |  | 870 |
| `C:formatDuration(seconds)` |  | 1231 |
| `C:formatStageTime(seconds)` |  | 1242 |
| `C:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` |  | 1211 |
| `C:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths)` |  | 1221 |
| `C:getClockPaused()` |  | 560 |
| `C:getCurrentMissionId()` |  | 648 |
| `C:getCurrentRacePath()` |  | 828 |
| `C:getDrawFlag(flagName)` |  | 2525 |
| `C:getEnableFalseStarts()` |  | 2964 |
| `C:getEnvironmentStartTimeFormatted()` |  | 2536 |
| `C:getEpochTime()` |  | 543 |
| `C:getEpochTimeFormatted()` |  | 549 |
| `C:getEventLog()` |  | 1170 |
| `C:getEvents()` |  | 820 |
| `C:getMissionExecutionTransferFlag()` |  | 2517 |
| `C:getNextEventIndex()` |  | 824 |
| `C:getNextMissionId()` |  | 710 |
| `C:getRallyLoopMission()` |  | 701 |
| `C:getRallyLoopMissionId()` |  | 693 |
| `C:getRallyLoopName()` |  | 697 |
| `C:getRallyManager()` |  | 2081 |
| `C:getRallyPreStartAllocatedDurationSecs()` |  | 506 |
| `C:getRallyStartDurationSecs()` |  | 498 |
| `C:getRallyStartTimeFormatted()` |  | 494 |
| `C:getRallyStartTimeSecs()` |  | 490 |
| `C:getRecoveryRepairVehicle()` |  | 315 |
| `C:getSSRescheduleCount()` |  | 2654 |
| `C:getSchedule()` |  | 780 |
| `C:getScheduledEventTime(eventName)` |  | 568 |
| `C:getServiceOutTCPos()` |  | 2819 |
| `C:getServiceOutTCRot()` |  | 2833 |
| `C:getServiceParkSpeedLimitDisplay()` |  | 72 |
| `C:getServiceParkSpeedLimitKph()` |  | 68 |
| `C:getShowStageApps()` |  | 333 |
| `C:getSlotSizeMinutes()` |  | 510 |
| `C:getStageLabels()` |  | 798 |
| `C:getStreamData()` |  | 2577 |
| `C:getTestMode()` |  | 2960 |
| `C:getTimeOfDay()` |  | 1194 |
| `C:getTimeOfDayFormatted()` |  | 1268 |
| `C:getTotalDistanceKm()` |  | 1182 |
| `C:getTotalPenalty()` |  | 1190 |
| `C:getTotalRoadSectionDistanceKm()` |  | 1178 |
| `C:getTotalSSDistanceKm()` |  | 1174 |
| `C:getTotalTime()` |  | 1186 |
| `C:getTrafficEnabled()` |  | 325 |
| `C:getUse24hFormat()` |  | 2088 |
| `C:getValidationIssues()` |  | 812 |
| `C:getVoicepackPickForMission(missionId, missionDir)` |  | 705 |
| `C:getWallClockDay()` |  | 523 |
| `C:getWallClockTimeFormatted()` |  | 532 |
| `C:getWallClockTimeSecs()` |  | 514 |
| `C:getWallClockTimeTable()` |  | 2092 |
| `C:gotoRallyLoopInstant()` |  | 769 |
| `C:hasValidationIssues()` |  | 816 |
| `C:init(missionId, missionDir)` |  | 77 |
| `C:initSettings()` |  | 286 |
| `C:initTimecardData()` |  | 1842 |
| `C:isDevTrafficDisabled()` |  | 279 |
| `C:isInRoadSection()` |  | 655 |
| `C:isInSpecialStage()` |  | 671 |
| `C:isScheduleValid()` |  | 808 |
| `C:isTimeControlSkipAvailable()` |  | 2206 |
| `C:onCreatedRallyGroundMarkerRoute()` |  | 2872 |
| `C:onGuiUpdate(dtReal, dtSim, dtRaw)` |  | 2155 |
| `C:onRallyDataUpdated(data)` |  | 2543 |
| `C:onRallyModeInteract()` |  | 2328 |
| `C:onRallyRouteRecoveryComplete(data)` |  | 2925 |
| `C:onRecalculatedRoute(source)` |  | 2861 |
| `C:onSettingsChanged()` |  | 340 |
| `C:onUIStartButtonClicked()` |  | 2847 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 2129 |
| `C:recordFalseStartPenalty()` |  | 2664 |
| `C:recordRouteRecalcPenalty(penaltyData)` |  | 2707 |
| `C:recordSpeedingPenalty(speedingData)` |  | 2733 |
| `C:recordTestPenalty(amount)` |  | 2783 |
| `C:recordTimeCardEntry(entryName, stageTimeSecs)` |  | 893 |
| `C:rescheduleNextSSStart()` |  | 2633 |
| `C:resolveGlobalBoolSetting(key, defaultValue)` |  | 268 |
| `C:resolveMissionBoolSetting(key, defaultValue)` | init settings with the loop manager so they cant be changed during the loop | 252 |
| `C:restartRallyLoop()` |  | 758 |
| `C:roundToNextMinute(timeSecs)` |  | 1033 |
| `C:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable)` |  | 2201 |
| `C:setClockPaused(paused)` |  | 556 |
| `C:setCountdownCanSkip(canSkip)` |  | 2624 |
| `C:setDrawFlag(flagName, value)` |  | 2529 |
| `C:setMissionExecutionTransferFlag(val)` |  | 2521 |
| `C:setTestActiveState(state)` |  | 2968 |
| `C:setTestMode(enabled)` |  | 2953 |
| `C:setupForNewMission()` |  | 2513 |
| `C:shouldPenalizeSpeeding()` |  | 687 |
| `C:skipLiaisonForTesting(options)` |  | 2252 |
| `C:skipToNextEvent()` |  | 2218 |
| `C:startNextMission()` |  | 727 |
| `C:trackRecovery(recoveryType)` |  | 2878 |
| `C:updateRallyClockData()` |  | 2107 |
| `C:updateScheduleData()` |  | 1956 |
| `C:updateTimecardEntry(eventIndex)` |  | 1910 |
| `C:validateMissionSequence()` |  | 435 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleTeleportedToLastRoad`

**Évènements UI (guihooks.trigger) :** `Message`, `RallyClockSkipped`, `RallyGameplayInteract`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua`.*
