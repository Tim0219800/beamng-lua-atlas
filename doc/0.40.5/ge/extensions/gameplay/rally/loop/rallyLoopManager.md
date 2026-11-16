# `gameplay_rally_loop_rallyLoopManager`

*File: `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua` · VM: Game Engine (GE) · 2981 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/loop/rallyLoopManager")` (file under extensions/ but not a regular extension)

Manager of a rally loop: a mission that chains the start service, up to 4 road section/stage pairs (stageN_rallyRoadSection / stageN_rallyStage), a return road section and the service park. It builds the mission sequence from the mission's fgVariables, computes the schedule (time controls TC, SS start lines, stops), derives a linear list of events from it, keeps the rally clock (epoch), records penalties and timecards in a rallyEventLog, and provides stream data (getStreamData) for the interface. Instantiated by the gameplay_rallyLoop extension with (missionId, missionDir); the rally flowgraph nodes call it to record passages through the controls.

## Example

```lua
local mgr = require('gameplay_rally_loop_rallyLoopManager')(missionId, missionDir)
mgr:setClockPaused(false)
local ev = mgr:getEvents()[mgr:getNextEventIndex()]
print(ev.label, ev.time)
```

## Notes

- The module returns a constructor; C:init(missionId, missionDir) is called automatically. If the mission has fgVariables, the sequence and schedule are computed in init; otherwise the sequence stays empty.
- Clock (self.clock): in seconds in the rally's epoch. It is negative before the rally start (start = next full minute after the environment time + 120 s), is 0 at the rally start then increases. It starts paused (clockPaused = true) and is only released by onUIStartButtonClicked.
- Wall-clock time = (rallyStartTimeSecs + clock) modulo 86400. For the engine's tod.time, 0 corresponds to noon: seconds of the day = ((tod.time*24 + 12) % 24) * 3600.
- Mission sequence: 'serviceOut', then for each stage 1 to 4 the road section then the stage, then the return road section, then 'serviceIn'. serviceOut and serviceIn are dummy entries (notActualMission = true).
- Labels: TC0 at the first start (TC{n-1}B if startingSSNumber > 1), TC{n} for the road section before stage n, TC{n-1}A for the return road section. The schedule's ssLabel values are number strings ("1", "2"...); the displayed label is 'SS' .. ssLabel.
- Event types (self.events[i].type): 'tc', 'ss_start', 'ss_stop', 'service_in'. Fields of an event: type, label, spName (name of the race path's start position), time (epoch, minute-aligned, nil for service_in), pos ({x,y,z}), missionId, missionIndex, canIncurLatePenalty, hideTimecardEntry, eventId, eventGroup, inServicePark, timecardIndex.
- Penalties recorded in eventLog via addItem(event, clock, 'penalty', data): penaltyType = false_start, route_recalc, speeding (fixed 10 s), test_penalty, as well as the time penalties from loop/penalties (getTimingStatus: time_control_early, late...). 'time_control_early' penalties are removed when rallyEnableEarlyTimeControlPenalties is false.
- Settings frozen at loop start (initSettings): rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties, rallyEnableTraffic (mission.lastUserSettings first, otherwise global settings); rallyShowStageApps is global. isNgrcMode = not repairVehicleOnRecovery.
- Timers and stage times are in seconds; distances in km for distanceKm and totals; service park speed limit: 30 km/h (serviceParkSpeedLimitKph).
- Minor bug: in init, UiColors.updateForLoop and rallyClockData.isNgrcMode are first called with self.isNgrcMode = nil (defined further down by initSettings); they are reapplied at the end of init.
- Dead code: validateMissionSequence is not called (call commented out in buildMissionSequence); onRecalculatedRoute is entirely commented out (the recalculation counter is therefore never incremented by this hook); in _processRegularMission, ssLabel is first 'SS'..n then immediately overwritten by tostring(n).
- getNextMissionId increments currentMissionIndex even when the end of the sequence is exceeded (the index stays past the last entry, so getCurrentMissionId returns nil).
- updateScheduleData: timeDiffWithEnd uses nextEvent.time + 59 whereas eventWallClockEnd uses nextEvent.time + 60 (exclusive end).
- extractMissionId uses the pattern '%((.+)%)$': returns what is between the last trailing parentheses of a "Name (id)" string (greedy), nil for '<none>' or a string without parentheses.
- The module calls guihooks.trigger with 'Message', 'RallyClockSkipped' (oldTime, newTime, skippedSeconds) and 'RallyGameplayInteract' ({forceShowTimecard} or {}), and extensions.hook('onVehicleTeleportedToLastRoad', vehId).

## Class `C`

Loop manager instance. Main fields: missionId, missionDir, mission, missionName, fgVariables, missionSequence (list of ids), currentMissionIndex (0 = not started), schedule (one entry per mission of the sequence), events (linear list of events), nextEventIndex, clock, clockPaused, environmentStartTimeSecs, rallyStartTimeSecs, scheduleParams, skipParams, eventLog (RallyEventLog), streamData/rallyClockData/scheduleData/timecardData/uiColors (tables reused in place), roadSectionPenaltyKeeper, speedingDetector, totalSSCount, totalSSDistanceKm, totalRoadSectionDistanceKm, totalDistanceKm.

The module returns a constructor: `local obj = require("gameplay_rally_loop_rallyLoopManager")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_addServiceInToSchedule()` | Adds the serviceIn entry (position of the serviceStallPos stall, with no time or TC). | 1414 |
| `C:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber)` | Adds the serviceOut entry to the schedule (TC0, or TC{n-1}B if continuing a rally) and returns its label. | 1385 |
| `C:_addValidationIssue(issue)` | Adds a validation problem (blocking = true by default) and marks the schedule invalid (scheduleValid = false). | 377 |
| `C:_buildEventsFromSchedule()` | Builds the events list: a TC for serviceOut, a 'service_in', and for each stage 'ss_start' + 'ss_stop', for each road section a 'tc' (TC_out). Sets nextEventIndex to the first event with a time. | 1721 |
| `C:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos)` | Determines the TC_in and TC_out labels of a road section: TC_in reuses the last TC for the first road section or the return road section; TC_out = 'TC'..nextSSNumber, or 'TC'..(nextSSNumber-1)..'A' for the return road section. | 1350 |
| `C:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs)` | Computes the times of a road section: TC_in = current time, TC_out = next minute of (current time + allocated time). | 1295 |
| `C:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs)` | Computes the times of a stage: start line = next minute of (current time + 60 s), stop = next minute of (start + allocated time). | 1321 |
| `C:_findNextSSStartEvent()` | Searches forward, from nextEventIndex, for the next 'ss_start' event. | 1038 |
| `C:_findNextTCEvent()` | Searches forward for the next 'tc' event. | 1071 |
| `C:_findPreviousSSStartEvent()` | Searches backward for the 'ss_start' of the current stage. | 1054 |
| `C:_findPreviousTCEvent()` | Searches backward for the last 'tc' event. | 1087 |
| `C:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount)` | Expected label for a validation message: 'ROAD'..(roadSectionCount+1) for a road section, 'SS'..nextSSNumber for a stage, nil otherwise. | 353 |
| `C:_getValidationHint(missionType, errorMessage)` | Fix hint depending on the error message (word 'driveline' or 'race') and the mission type. | 362 |
| `C:_initScheduleCalculation()` | Resets schedule, events, validation, totals, computes the rally start time, initializes the (negative) clock and creates the roadSectionPenaltyKeeper and the speedingDetector. | 1632 |
| `C:_postProcessSchedule()` | Sets the trigger position of serviceOut (TC_in of the first road section), builds the events and the timecard data. | 1693 |
| `C:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData)` | Loads a stage or road section mission via a temporary RallyManager (distance, allocated time, speed limit, TC/SS positions), determines its type, computes its labels and times, adds the entry to the schedule. On failure, adds a validation problem (scheduleLoadFailed or scheduleMissingStageStartPositions). | 1434 |
| `C:_updateSSStartTime(newTime, onlyIfLater, reason)` | Changes the time of the next 'ss_start' (marks scheduledTimeWasAdjusted, increments rescheduleCount). | 1103 |
| `C:activateRallyModeInteractActionMap(enabled)` | Enables (pushActionMap) or disables (popActionMap) the 'RallyModeInteract' action map. | 2120 |
| `C:adjustClock(seconds)` | Adds seconds to the clock (forward or backward). | 564 |
| `C:advanceToNextEvent()` | Moves to the next event (nextEventIndex = #events + 1 at the end). | 855 |
| `C:applyStartScreenSettings(values)` | Applies the settings chosen on the start screen (rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties), updates isNgrcMode, the clock data and the colors. | 296 |
| `C:applyTrafficExclusion()` | Applies the loop's traffic exclusion (TrafficExclusion.applyForRallyLoop). | 2940 |
| `C:buildMissionSequence()` | Builds missionSequence: 'serviceOut', then road section and stage of each stage 1 to 4 present, the return road section, then 'serviceIn'. Resets currentMissionIndex to 0. | 384 |
| `C:calculateRallyStartTime()` | Computes rallyStartTimeSecs: environment time rounded up to the next minute plus currentTimeToRallyStartSecs (120 s). | 468 |
| `C:calculateSchedule(includeDebugData)` | Computes the whole schedule: initializes the state, walks the sequence (serviceOut, real missions loaded via a temporary RallyManager, serviceIn), then builds the events and the timecards. Stops and empties events at the first mission failure. | 601 |
| `C:calculateStartLineTime(tcArrivalTime)` | Reschedules the stage start line based on the arrival time at the TC: next minute if at least 35 s remain in the minute, otherwise the full minute after arrival + 60 s. Only updates if the new time is later. | 1141 |
| `C:canSkip()` | True if a time control or countdown skip is possible. | 2214 |
| `C:canSkipCountdown()` | True if the countdown can be skipped. | 2629 |
| `C:canSkipTimeControls()` | Manual skip possible flag. | 2210 |
| `C:clearTrafficExclusion()` | Removes the traffic exclusion (TrafficExclusion.clearTrafficExclusion). | 2949 |
| `C:drawDebug(zOnTop, drawRoute, drawLabels)` | Debug-draws the pins, TC/SS positions and optionally the trace and labels of each mission of the schedule (red for road sections, blue for stages, gray for services). | 2336 |
| `C:epochToWallClock(epochTime)` | Converts an epoch time to absolute seconds of the day (epoch + rallyStartTimeSecs, no modulo). | 1285 |
| `C:evaluateSkip()` | Evaluates whether the clock skip is possible: next 'tc' event, speed < 30 km/h (0.5 m/s hysteresis) and player distance to the TC between 5 m and 50 m. With early penalties, allows the manual skip; without, skips automatically. | 2162 |
| `C:extractMissionId(value)` | Extracts the mission id from a fgVariable "Name (id)" value. Returns nil for nil or '<none>'. | 344 |
| `C:filterTimingResultForSettings(timingResult)` | If early penalties are disabled, removes the 'time_control_early' penalties from the timing result and recomputes the total. | 870 |
| `C:formatDuration(seconds)` | Formats a duration as M:SS (absolute value). | 1231 |
| `C:formatStageTime(seconds)` | Formats a stage time rounded to the tenth: S.T, M:SS.T or H:MM:SS.T depending on the duration. | 1242 |
| `C:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` | Formats seconds of the day according to the 24 h format (USE_24H_FORMAT = true) or 12 h. | 1211 |
| `C:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths)` | Like formatTimeFromSeconds but returns a string (with AM/PM if 12 h). | 1221 |
| `C:getClockPaused()` | Indicates whether the clock is paused. | 560 |
| `C:getCurrentMissionId()` | Id of the current mission of the sequence. | 648 |
| `C:getCurrentRacePath()` | Path of the current mission's race.race.json (nil for serviceOut/serviceIn). | 828 |
| `C:getDrawFlag(flagName)` | Reads a drawing flag (for example showDebugInfo). | 2525 |
| `C:getEnableFalseStarts()` | False start penalties enabled. | 2964 |
| `C:getEnvironmentStartTimeFormatted()` | Environment time at start, formatted. | 2536 |
| `C:getEpochTime()` | Rally epoch time (negative before the start). | 543 |
| `C:getEpochTimeFormatted()` | Epoch formatted with sign, for example '+0:01:30'. | 549 |
| `C:getEventLog()` | Event log (RallyEventLog). | 1170 |
| `C:getEvents()` | Linear list of events. | 820 |
| `C:getMissionExecutionTransferFlag()` | Flag indicating that execution is being transferred to another mission. | 2517 |
| `C:getNextEventIndex()` | 1-based index of the next event to validate. | 824 |
| `C:getNextMissionId()` | Moves to the next mission of the sequence and returns its id. Always increments the index, even past the end. | 710 |
| `C:getRallyLoopMission()` | Mission object of the loop. | 701 |
| `C:getRallyLoopMissionId()` | Id of the rallyLoop mission. | 693 |
| `C:getRallyLoopName()` | Name (untranslated) of the rallyLoop mission. | 697 |
| `C:getRallyManager()` | gameplay_rally RallyManager (cached); nil if the gameplay_rally extension is not loaded. | 2081 |
| `C:getRallyPreStartAllocatedDurationSecs()` | Planned duration before the start (scheduleParams.currentTimeToRallyStartSecs). | 506 |
| `C:getRallyStartDurationSecs()` | Duration between the environment time and the rally start. | 498 |
| `C:getRallyStartTimeFormatted()` | Formatted start time (HH:MM). | 494 |
| `C:getRallyStartTimeSecs()` | Rally start time in seconds of the day. | 490 |
| `C:getRecoveryRepairVehicle()` | Indicates whether the vehicle is repaired on recovery: always if rallyRepairVehicleOnRecovery, otherwise only outside a stage (hardcore/NGRC mode: no repair during a stage). | 315 |
| `C:getSSRescheduleCount()` | Number of reschedulings of the next 'ss_start'. | 2654 |
| `C:getSchedule()` | Schedule table (one entry per mission of the sequence: tcIn/tcOut/ssStartLine/ssStopControl with pos, rot, name, label, time, speedLimitKph, distanceKm...). | 780 |
| `C:getScheduledEventTime(eventName)` | Looks in events for the scheduled time of the event whose spName equals eventName for the current mission. | 568 |
| `C:getServiceOutTCPos()` | Position {x,y,z} of the serviceOut trigger (TC_in of the first road section). | 2819 |
| `C:getServiceOutTCRot()` | Rotation {x,y,z,w} of the serviceOut trigger. | 2833 |
| `C:getServiceParkSpeedLimitDisplay()` | Same limit formatted for display, in km/h or mph rounded to 5 depending on the uiUnitLength setting. | 72 |
| `C:getServiceParkSpeedLimitKph()` | Speed limit in the service park (30 km/h). | 68 |
| `C:getShowStageApps()` | rallyShowStageApps setting (true by default). | 333 |
| `C:getSlotSizeMinutes()` | Size of the stage start rescheduling slot (1 minute). | 510 |
| `C:getStageLabels()` | List of stage labels ('SS1', 'SS2'...). | 798 |
| `C:getStreamData()` | Updates in place and returns the stream table sent to the UI: activeState (testActiveState in test mode), rallyClock, stageData (only during a stage, with label and km unit), vehicleProximity, countdownData, scheduleData, timecardData, penaltyData (penalty summary), showStageApps, translated missionName, uiColors. | 2577 |
| `C:getTestMode()` | Test mode active. | 2960 |
| `C:getTimeOfDay()` | Environment time of day; falls back to {time = 0.92} (default start time for Italy) if core_environment returns nothing. | 1194 |
| `C:getTimeOfDayFormatted()` | Environment time of day, formatted (with seconds). | 1268 |
| `C:getTotalDistanceKm()` | Total distance in km. | 1182 |
| `C:getTotalPenalty()` | Total penalties of the log. | 1190 |
| `C:getTotalRoadSectionDistanceKm()` | Total road section distance in km. | 1178 |
| `C:getTotalSSDistanceKm()` | Total stage distance in km. | 1174 |
| `C:getTotalTime()` | Total time (stages + penalties) of the log. | 1186 |
| `C:getTrafficEnabled()` | Traffic enabled for the loop (false for a dev mission that disables it). | 325 |
| `C:getUse24hFormat()` | 24 h format (constant USE_24H_FORMAT = true). | 2088 |
| `C:getValidationIssues()` | List of validation problems. | 812 |
| `C:getVoicepackPickForMission(missionId, missionDir)` | Resolves the voicepack to use via voicepack.resolveLoopVoicepackPick according to the rallyVoicepackPick setting. | 705 |
| `C:getWallClockDay()` | Day number (1, 2...) of the wall clock. | 523 |
| `C:getWallClockTimeFormatted()` | Wall-clock time with seconds and tenths, followed by ", Day N". | 532 |
| `C:getWallClockTimeSecs()` | Current wall-clock time = (rallyStartTimeSecs + clock) % 86400. | 514 |
| `C:getWallClockTimeTable()` | Wall-clock time with seconds as a {time, ampm} table. | 2092 |
| `C:gotoRallyLoopInstant()` | Same as restartRallyLoop: instantly restarts the rallyLoop mission. | 769 |
| `C:hasValidationIssues()` | True if there is at least one validation problem. | 816 |
| `C:init(missionId, missionDir)` | Initializes the loop state: UI tables, environment start time, paused clock, schedule parameters (rally start 120 s after the full minute, 60 s of TC at the start line, 1 min slot) and skip parameters. If the mission provides fgVariables, builds the sequence and computes the schedule (calculateSchedule(true)), then reads the settings. | 77 |
| `C:initSettings()` | Freezes the loop settings: enableFalseStarts, repairVehicleOnRecovery, earlyTimeControlPenaltiesEnabled, trafficEnabled, showStageApps and isNgrcMode. | 286 |
| `C:initTimecardData()` | Builds the timecardData structure once (one entry per TC, plus one time entry per stage), with 'group-N' groups. | 1842 |
| `C:isDevTrafficDisabled()` | True for a dev mission whose missionTypeData.devDisableTraffic is true. | 279 |
| `C:isInRoadSection()` | True if the current schedule entry is a road section (roadSectionLabel defined). | 655 |
| `C:isInSpecialStage()` | True if the current entry is a timed stage (ssLabel defined). | 671 |
| `C:isScheduleValid()` | True as long as no blocking problem has been found. | 808 |
| `C:isTimeControlSkipAvailable()` | Skip available flag. | 2206 |
| `C:onCreatedRallyGroundMarkerRoute()` | Hook called when the ground markers route is created: resets the roadSectionPenaltyKeeper. | 2872 |
| `C:onGuiUpdate(dtReal, dtSim, dtRaw)` | Called by the GUI loop; does nothing (profiler instrumentation only). | 2155 |
| `C:onRallyDataUpdated(data)` | Receives data from the rallyManager or the nodes (activeState, vehicleProximity with distances rounded to the centimeter, countdownData) and stores it for the UI stream. | 2543 |
| `C:onRallyModeInteract()` | Hook of the interact action: skips to the next event if possible, otherwise triggers the UI event RallyGameplayInteract. | 2328 |
| `C:onRallyRouteRecoveryComplete(data)` | Hook at the end of a route recovery: stores data in lastRouteRecoveryData and logs. | 2925 |
| `C:onRecalculatedRoute(source)` | Route recalculation hook; currently has no effect (code commented out). | 2861 |
| `C:onSettingsChanged()` | Hook called when settings change: rereads rallyShowStageApps. | 340 |
| `C:onUIStartButtonClicked()` | Called when the player clicks Start: applies the start screen settings, resumes the clock, enables the restartMission button of core_recoveryPrompt and unfreezes the vehicle. | 2847 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: advances the clock by dtSim if it is not paused, evaluates the skip, enables the action map if skipping is possible, updates the roadSectionPenaltyKeeper and the speedingDetector (outside a stage, with a limit; strict mode for serviceIn and serviceOut). | 2129 |
| `C:recordFalseStartPenalty()` | Records a false start penalty for the next stage: counts the false starts already logged for the event and uses Penalties.calculateFalseStartPenalty(n). | 2664 |
| `C:recordRouteRecalcPenalty(penaltyData)` | Records a route recalculation penalty (penaltyType 'route_recalc') on the next TC and shows a "Route penalty recorded" message. | 2707 |
| `C:recordSpeedingPenalty(speedingData)` | Records a fixed 10 s speeding penalty on the next 'tc' or 'service_in' event. | 2733 |
| `C:recordTestPenalty(amount)` | Test tool: records a 'test_penalty' penalty (10 s by default) on the current event and shows a message. | 2783 |
| `C:recordTimeCardEntry(entryName, stageTimeSecs)` | Records the passage at the current event. Checks that the event belongs to the current mission and that entryName == spName. Computes the time difference, logs the time penalties then a 'timecard' item (actualTime, timeDiff, timingResult, stageTimeSecs, splits for ss_stop), forces the timecard to be shown, reschedules the start line if arriving at a TC too close, updates the timecard then advances. | 893 |
| `C:rescheduleNextSSStart()` | Pushes the next 'ss_start' to the next slot (slotSizeMinutes, rounded to the minute) when the vehicle is not in position at -10 s. Always reschedules. | 2633 |
| `C:resolveGlobalBoolSetting(key, defaultValue)` | Reads a global boolean setting (settings.getValue) or the default value. | 268 |
| `C:resolveMissionBoolSetting(key, defaultValue)` | Reads a boolean setting first from mission.lastUserSettings, otherwise from settings.getValue, otherwise the default value. | 252 |
| `C:restartRallyLoop()` | Restarts the rallyLoop mission from itself (instant) and raises missionExecutionTransferFlag. | 758 |
| `C:roundToNextMinute(timeSecs)` | Rounds up to the next minute (delegates to scheduleUtils). | 1033 |
| `C:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable)` | Sets the two time control skip flags. | 2201 |
| `C:setClockPaused(paused)` | Pauses or resumes the clock. | 556 |
| `C:setCountdownCanSkip(canSkip)` | Stores that the countdown can be skipped (updated by the countdown node). | 2624 |
| `C:setDrawFlag(flagName, value)` | Sets a drawing flag. | 2529 |
| `C:setMissionExecutionTransferFlag(val)` | Sets the execution transfer flag. | 2521 |
| `C:setTestActiveState(state)` | Sets the forced active state in test mode (and currentActiveState if test mode is active). | 2968 |
| `C:setTestMode(enabled)` | Enables or disables test mode; when disabling, resets currentActiveState to inactive. | 2953 |
| `C:setupForNewMission()` | Forgets the cached rallyManager. | 2513 |
| `C:shouldPenalizeSpeeding()` | Speeding is penalized everywhere except during a stage. | 687 |
| `C:skipLiaisonForTesting(options)` | Test tool: teleports the vehicle to distanceBefore m (50 by default) before the TC_out of the current road section, resynchronizes the rallyManager and sets the clock 1 s before the TC_out time. | 2252 |
| `C:skipToNextEvent()` | Advances the clock to 1 s before the next TC and notifies the UI (RallyClockSkipped). Refuses if the next event is not a TC or if the target is not in the future. | 2218 |
| `C:startNextMission()` | Starts the next mission of the sequence from the current mission (instant startFromWithinMission) and raises missionExecutionTransferFlag. Fails if there is no foreground mission. | 727 |
| `C:trackRecovery(recoveryType)` | Records a recovery ('recovery') or a flip ('flip'): advances the clock by RecoveryClockAdvance.getSeconds(type, inStage), also advances the time of day (RallyLoopTime.advancePlayingTime), notifies the UI and logs the item with the player's position. | 2878 |
| `C:updateRallyClockData()` | Updates rallyClockData in place: time, day, total time, skip flags, early penalties enabled. | 2107 |
| `C:updateScheduleData()` | Updates scheduleData in place for the next event: label, type, times of the scheduled minute, difference (negative timeDiff = early), current status and penalty, speed limit, service park, isSpeeding. | 1956 |
| `C:updateTimecardEntry(eventIndex)` | Updates an event's timecard entry (recorded time, early/late/on-time status, stage time) from the log. | 1910 |
| `C:validateMissionSequence()` | Checks that the first mission is serviceOutMission. Not called in this version (call commented out). | 435 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleTeleportedToLastRoad`

**UI events (guihooks.trigger):** `Message`, `RallyClockSkipped`, `RallyGameplayInteract`

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua`.*
