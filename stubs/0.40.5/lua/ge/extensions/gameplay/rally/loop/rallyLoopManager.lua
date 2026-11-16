---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loop manager instance. Main fields: missionId, missionDir, mission, missionName, fgVariables, missionSequence (list of ids), currentMissionIndex (0 = not started), schedule (one entry per mission of the sequence), events (linear list of events), nextEventIndex, clock, clockPaused, environmentStartTimeSecs, rallyStartTimeSecs, scheduleParams, skipParams, eventLog (RallyEventLog), streamData/rallyClockData/scheduleData/timecardData/uiColors (tables reused in place), roadSectionPenaltyKeeper, speedingDetector, totalSSCount, totalSSDistanceKm, totalRoadSectionDistanceKm, totalDistanceKm.
---@class gameplay_rally_loop_rallyLoopManager
local gameplay_rally_loop_rallyLoopManager = {}

--- Adds the serviceIn entry (position of the serviceStallPos stall, with no time or TC).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1414
function gameplay_rally_loop_rallyLoopManager:_addServiceInToSchedule() end

--- Adds the serviceOut entry to the schedule (TC0, or TC{n-1}B if continuing a rally) and returns its label.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1385
---@param currentScheduleTimeSecs number Current time.
---@param startingSSNumber integer Number of the first stage.
---@return string  TC label.
function gameplay_rally_loop_rallyLoopManager:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber) end

--- Adds a validation problem (blocking = true by default) and marks the schedule invalid (scheduleValid = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:377
---@param issue table {type, missionId, missionType, label, message, hint, blocking}.
function gameplay_rally_loop_rallyLoopManager:_addValidationIssue(issue) end

--- Builds the events list: a TC for serviceOut, a 'service_in', and for each stage 'ss_start' + 'ss_stop', for each road section a 'tc' (TC_out). Sets nextEventIndex to the first event with a time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1721
function gameplay_rally_loop_rallyLoopManager:_buildEventsFromSchedule() end

--- Determines the TC_in and TC_out labels of a road section: TC_in reuses the last TC for the first road section or the return road section; TC_out = 'TC'..nextSSNumber, or 'TC'..(nextSSNumber-1)..'A' for the return road section.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1350
---@param roadSectionCount integer Rank of the road section.
---@param nextSSNumber integer Next stage number.
---@param isServiceInRoadSection boolean true for the return road section.
---@param lastTCLabel string|nil Last TC assigned.
---@param tcInPos vec3|nil TC_in position.
---@param tcOutPos vec3|nil TC_out position.
---@return string|nil  tcInLabel.
---@return string|nil  tcOutLabel.
---@return string|nil  Last TC updated.
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos) end

--- Computes the times of a road section: TC_in = current time, TC_out = next minute of (current time + allocated time).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1295
---@param tcInPos vec3|nil TC_in position.
---@param tcOutPos vec3|nil TC_out position.
---@param currentScheduleTimeSecs number Current schedule time.
---@param timeAllocationSecs number|nil Allocated time in seconds.
---@return number|nil  tcInTime.
---@return number|nil  tcOutTime.
---@return number|nil  Section duration.
---@return number  Updated current time.
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs) end

--- Computes the times of a stage: start line = next minute of (current time + 60 s), stop = next minute of (start + allocated time).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1321
---@param ssStartLinePos vec3|nil Start line position.
---@param ssStopControlPos vec3|nil Stop control position.
---@param currentScheduleTimeSecs number Current time.
---@param timeAllocationSecs number|nil Allocated time.
---@return number|nil  Start line time.
---@return number|nil  Stop control time.
---@return number|nil  Transition duration.
---@return number|nil  Section duration.
---@return number  Updated current time.
function gameplay_rally_loop_rallyLoopManager:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs) end

--- Searches forward, from nextEventIndex, for the next 'ss_start' event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1038
---@return table|nil  Event.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findNextSSStartEvent() end

--- Searches forward for the next 'tc' event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1071
---@return table|nil  Event.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findNextTCEvent() end

--- Searches backward for the 'ss_start' of the current stage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1054
---@return table|nil  Event.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findPreviousSSStartEvent() end

--- Searches backward for the last 'tc' event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1087
---@return table|nil  Event.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findPreviousTCEvent() end

--- Expected label for a validation message: 'ROAD'..(roadSectionCount+1) for a road section, 'SS'..nextSSNumber for a stage, nil otherwise.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:353
---@param missionType string|nil 'rallyRoadSection' or 'rallyStage'.
---@param nextSSNumber integer|nil Next stage number.
---@param roadSectionCount integer|nil Number of road sections already processed.
---@return string|nil  Label.
function gameplay_rally_loop_rallyLoopManager:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount) end

--- Fix hint depending on the error message (word 'driveline' or 'race') and the mission type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:362
---@param missionType string|nil Mission type.
---@param errorMessage string|nil Error message from the rallyManager.
---@return string|nil  Hint or nil.
function gameplay_rally_loop_rallyLoopManager:_getValidationHint(missionType, errorMessage) end

--- Resets schedule, events, validation, totals, computes the rally start time, initializes the (negative) clock and creates the roadSectionPenaltyKeeper and the speedingDetector.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1632
---@return table  Initial state of the computation (returnRoadSectionId, startingSSNumber, nextSSNumber, roadSectionCount, lastTCLabel, rallyStartTimeSecs, currentScheduleTimeSecs).
function gameplay_rally_loop_rallyLoopManager:_initScheduleCalculation() end

--- Sets the trigger position of serviceOut (TC_in of the first road section), builds the events and the timecard data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1693
function gameplay_rally_loop_rallyLoopManager:_postProcessSchedule() end

--- Loads a stage or road section mission via a temporary RallyManager (distance, allocated time, speed limit, TC/SS positions), determines its type, computes its labels and times, adds the entry to the schedule. On failure, adds a validation problem (scheduleLoadFailed or scheduleMissingStageStartPositions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1434
---@param missionId string Mission id.
---@param currentScheduleTimeSecs number Current time.
---@param nextSSNumber integer Next stage number.
---@param roadSectionCount integer Number of road sections already processed.
---@param lastTCLabel string|nil Last TC.
---@param serviceInRoadSectionId string|nil Id of the return road section.
---@param includeDebugData boolean Keep the driveline points.
---@return table  {currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, success, isStage}.
function gameplay_rally_loop_rallyLoopManager:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData) end

--- Changes the time of the next 'ss_start' (marks scheduledTimeWasAdjusted, increments rescheduleCount).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1103
---@param newTime number New time in epoch.
---@param onlyIfLater boolean If true, only changes if newTime is strictly later.
---@param reason string Reason (log).
---@return table  {success, newTime, oldTime, rescheduleCount} or {success=false, reason}.
function gameplay_rally_loop_rallyLoopManager:_updateSSStartTime(newTime, onlyIfLater, reason) end

--- Enables (pushActionMap) or disables (popActionMap) the 'RallyModeInteract' action map.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2120
---@param enabled boolean|nil true to enable.
function gameplay_rally_loop_rallyLoopManager:activateRallyModeInteractActionMap(enabled) end

--- Adds seconds to the clock (forward or backward).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:564
---@param seconds number Seconds to add.
function gameplay_rally_loop_rallyLoopManager:adjustClock(seconds) end

--- Moves to the next event (nextEventIndex = #events + 1 at the end).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:855
function gameplay_rally_loop_rallyLoopManager:advanceToNextEvent() end

--- Applies the settings chosen on the start screen (rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties), updates isNgrcMode, the clock data and the colors.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:296
---@param values table|nil Table key -> boolean (ignored if not a table).
function gameplay_rally_loop_rallyLoopManager:applyStartScreenSettings(values) end

--- Applies the loop's traffic exclusion (TrafficExclusion.applyForRallyLoop).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2940
function gameplay_rally_loop_rallyLoopManager:applyTrafficExclusion() end

--- Builds missionSequence: 'serviceOut', then road section and stage of each stage 1 to 4 present, the return road section, then 'serviceIn'. Resets currentMissionIndex to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:384
function gameplay_rally_loop_rallyLoopManager:buildMissionSequence() end

--- Computes rallyStartTimeSecs: environment time rounded up to the next minute plus currentTimeToRallyStartSecs (120 s).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:468
---@return number  Seconds of the day.
function gameplay_rally_loop_rallyLoopManager:calculateRallyStartTime() end

--- Computes the whole schedule: initializes the state, walks the sequence (serviceOut, real missions loaded via a temporary RallyManager, serviceIn), then builds the events and the timecards. Stops and empties events at the first mission failure.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:601
---@param includeDebugData boolean|nil true to keep the driveline point list (debug drawing).
---@return boolean  false if a mission could not be processed.
function gameplay_rally_loop_rallyLoopManager:calculateSchedule(includeDebugData) end

--- Reschedules the stage start line based on the arrival time at the TC: next minute if at least 35 s remain in the minute, otherwise the full minute after arrival + 60 s. Only updates if the new time is later.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1141
---@param tcArrivalTime number Arrival time in epoch.
---@return number|nil  Resulting start time.
function gameplay_rally_loop_rallyLoopManager:calculateStartLineTime(tcArrivalTime) end

--- True if a time control or countdown skip is possible.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2214
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:canSkip() end

--- True if the countdown can be skipped.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2629
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:canSkipCountdown() end

--- Manual skip possible flag.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2210
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:canSkipTimeControls() end

--- Removes the traffic exclusion (TrafficExclusion.clearTrafficExclusion).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2949
function gameplay_rally_loop_rallyLoopManager:clearTrafficExclusion() end

--- Debug-draws the pins, TC/SS positions and optionally the trace and labels of each mission of the schedule (red for road sections, blue for stages, gray for services).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2336
---@param zOnTop boolean|nil Draw in the foreground.
---@param drawRoute boolean|nil Draw the shapes (true by default).
---@param drawLabels boolean|nil Draw the texts (false by default).
function gameplay_rally_loop_rallyLoopManager:drawDebug(zOnTop, drawRoute, drawLabels) end

--- Converts an epoch time to absolute seconds of the day (epoch + rallyStartTimeSecs, no modulo).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1285
---@param epochTime number|nil Epoch.
---@return number|nil  Seconds.
function gameplay_rally_loop_rallyLoopManager:epochToWallClock(epochTime) end

--- Evaluates whether the clock skip is possible: next 'tc' event, speed < 30 km/h (0.5 m/s hysteresis) and player distance to the TC between 5 m and 50 m. With early penalties, allows the manual skip; without, skips automatically.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2162
function gameplay_rally_loop_rallyLoopManager:evaluateSkip() end

--- Extracts the mission id from a fgVariable "Name (id)" value. Returns nil for nil or '<none>'.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:344
---@param value string|nil Field value.
---@return string|nil  Mission id.
function gameplay_rally_loop_rallyLoopManager:extractMissionId(value) end

--- If early penalties are disabled, removes the 'time_control_early' penalties from the timing result and recomputes the total.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:870
---@param timingResult table|nil Result of Penalties.getTimingStatus.
---@return table|nil  {status, totalPenalty, hasPenalty, penalties}.
function gameplay_rally_loop_rallyLoopManager:filterTimingResultForSettings(timingResult) end

--- Formats a duration as M:SS (absolute value).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1231
---@param seconds number|nil Seconds.
---@return string|nil  Text.
function gameplay_rally_loop_rallyLoopManager:formatDuration(seconds) end

--- Formats a stage time rounded to the tenth: S.T, M:SS.T or H:MM:SS.T depending on the duration.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1242
---@param seconds number|nil Seconds.
---@return string|nil  Text.
function gameplay_rally_loop_rallyLoopManager:formatStageTime(seconds) end

--- Formats seconds of the day according to the 24 h format (USE_24H_FORMAT = true) or 12 h.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1211
---@param timeSecs number Seconds of the day.
---@param includeSeconds boolean|nil Include seconds.
---@param includeTenths boolean|nil Include tenths.
---@return table  {time = 'HH:MM', ampm = 'AM'|'PM'|nil}.
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

--- Like formatTimeFromSeconds but returns a string (with AM/PM if 12 h).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1221
---@param timeSecs number Seconds of the day.
---@param includeSeconds boolean|nil Include seconds.
---@param includeTenths boolean|nil Include tenths.
---@return string  Text.
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths) end

--- Indicates whether the clock is paused.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:560
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:getClockPaused() end

--- Id of the current mission of the sequence.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:648
---@return string|nil  Id, nil if outside the sequence.
function gameplay_rally_loop_rallyLoopManager:getCurrentMissionId() end

--- Path of the current mission's race.race.json (nil for serviceOut/serviceIn).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:828
---@return string|nil  Path.
function gameplay_rally_loop_rallyLoopManager:getCurrentRacePath() end

--- Reads a drawing flag (for example showDebugInfo).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2525
---@param flagName string Flag name.
---@return boolean  Value (false by default).
function gameplay_rally_loop_rallyLoopManager:getDrawFlag(flagName) end

--- False start penalties enabled.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2964
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:getEnableFalseStarts() end

--- Environment time at start, formatted.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2536
---@return string  Text, or 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getEnvironmentStartTimeFormatted() end

--- Rally epoch time (negative before the start).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:543
---@return number  Seconds.
function gameplay_rally_loop_rallyLoopManager:getEpochTime() end

--- Epoch formatted with sign, for example '+0:01:30'.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:549
---@return string  Text.
function gameplay_rally_loop_rallyLoopManager:getEpochTimeFormatted() end

--- Event log (RallyEventLog).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1170
---@return table  Log.
function gameplay_rally_loop_rallyLoopManager:getEventLog() end

--- Linear list of events.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:820
---@return table[]|nil  Events.
function gameplay_rally_loop_rallyLoopManager:getEvents() end

--- Flag indicating that execution is being transferred to another mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2517
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:getMissionExecutionTransferFlag() end

--- 1-based index of the next event to validate.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:824
---@return integer  Index.
function gameplay_rally_loop_rallyLoopManager:getNextEventIndex() end

--- Moves to the next mission of the sequence and returns its id. Always increments the index, even past the end.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:710
---@return string|nil  Id, nil if the sequence is empty or finished.
function gameplay_rally_loop_rallyLoopManager:getNextMissionId() end

--- Mission object of the loop.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:701
---@return table|nil  Mission.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMission() end

--- Id of the rallyLoop mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:693
---@return string  Id.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMissionId() end

--- Name (untranslated) of the rallyLoop mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:697
---@return string|nil  Name.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopName() end

--- gameplay_rally RallyManager (cached); nil if the gameplay_rally extension is not loaded.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2081
---@return table|nil  RallyManager.
function gameplay_rally_loop_rallyLoopManager:getRallyManager() end

--- Planned duration before the start (scheduleParams.currentTimeToRallyStartSecs).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:506
---@return number  Seconds.
function gameplay_rally_loop_rallyLoopManager:getRallyPreStartAllocatedDurationSecs() end

--- Duration between the environment time and the rally start.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:498
---@return number|nil  Seconds.
function gameplay_rally_loop_rallyLoopManager:getRallyStartDurationSecs() end

--- Formatted start time (HH:MM).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:494
---@return string  Text.
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeFormatted() end

--- Rally start time in seconds of the day.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:490
---@return number|nil  Seconds.
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeSecs() end

--- Indicates whether the vehicle is repaired on recovery: always if rallyRepairVehicleOnRecovery, otherwise only outside a stage (hardcore/NGRC mode: no repair during a stage).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:315
---@return boolean  true if repair.
function gameplay_rally_loop_rallyLoopManager:getRecoveryRepairVehicle() end

--- Number of reschedulings of the next 'ss_start'.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2654
---@return integer  Counter.
function gameplay_rally_loop_rallyLoopManager:getSSRescheduleCount() end

--- Schedule table (one entry per mission of the sequence: tcIn/tcOut/ssStartLine/ssStopControl with pos, rot, name, label, time, speedLimitKph, distanceKm...).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:780
---@return table|nil  Schedule.
function gameplay_rally_loop_rallyLoopManager:getSchedule() end

--- Looks in events for the scheduled time of the event whose spName equals eventName for the current mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:568
---@param eventName string Name of the start position (spName).
---@return number|nil  Time in epoch, nil if not found.
function gameplay_rally_loop_rallyLoopManager:getScheduledEventTime(eventName) end

--- Position {x,y,z} of the serviceOut trigger (TC_in of the first road section).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2819
---@return number[]|nil  Position.
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCPos() end

--- Rotation {x,y,z,w} of the serviceOut trigger.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2833
---@return number[]|nil  Quaternion.
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCRot() end

--- Same limit formatted for display, in km/h or mph rounded to 5 depending on the uiUnitLength setting.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:72
---@return string  For example '30 km/h'.
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitDisplay() end

--- Speed limit in the service park (30 km/h).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:68
---@return number  km/h.
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitKph() end

--- rallyShowStageApps setting (true by default).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:333
---@return boolean  true if the stage apps are shown.
function gameplay_rally_loop_rallyLoopManager:getShowStageApps() end

--- Size of the stage start rescheduling slot (1 minute).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:510
---@return number  Minutes.
function gameplay_rally_loop_rallyLoopManager:getSlotSizeMinutes() end

--- List of stage labels ('SS1', 'SS2'...).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:798
---@return string[]  Labels.
function gameplay_rally_loop_rallyLoopManager:getStageLabels() end

--- Updates in place and returns the stream table sent to the UI: activeState (testActiveState in test mode), rallyClock, stageData (only during a stage, with label and km unit), vehicleProximity, countdownData, scheduleData, timecardData, penaltyData (penalty summary), showStageApps, translated missionName, uiColors.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2577
---@return table  Stream data.
function gameplay_rally_loop_rallyLoopManager:getStreamData() end

--- Test mode active.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2960
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:getTestMode() end

--- Environment time of day; falls back to {time = 0.92} (default start time for Italy) if core_environment returns nothing.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1194
---@return table|nil  tod table.
function gameplay_rally_loop_rallyLoopManager:getTimeOfDay() end

--- Environment time of day, formatted (with seconds).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1268
---@return string  Text, or 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getTimeOfDayFormatted() end

--- Total distance in km.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1182
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalDistanceKm() end

--- Total penalties of the log.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1190
---@return number  Seconds.
function gameplay_rally_loop_rallyLoopManager:getTotalPenalty() end

--- Total road section distance in km.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1178
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalRoadSectionDistanceKm() end

--- Total stage distance in km.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1174
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalSSDistanceKm() end

--- Total time (stages + penalties) of the log.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1186
---@return number  Seconds.
function gameplay_rally_loop_rallyLoopManager:getTotalTime() end

--- Traffic enabled for the loop (false for a dev mission that disables it).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:325
---@return boolean  true if enabled.
function gameplay_rally_loop_rallyLoopManager:getTrafficEnabled() end

--- 24 h format (constant USE_24H_FORMAT = true).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2088
---@return boolean  true.
function gameplay_rally_loop_rallyLoopManager:getUse24hFormat() end

--- List of validation problems.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:812
---@return table[]  Problems.
function gameplay_rally_loop_rallyLoopManager:getValidationIssues() end

--- Resolves the voicepack to use via voicepack.resolveLoopVoicepackPick according to the rallyVoicepackPick setting.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:705
---@param missionId string Mission id.
---@param missionDir string Mission folder.
---@return any  Voicepack choice (inferred from code: value returned by voicepack.resolveLoopVoicepackPick).
function gameplay_rally_loop_rallyLoopManager:getVoicepackPickForMission(missionId, missionDir) end

--- Day number (1, 2...) of the wall clock.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:523
---@return integer|nil  Day.
function gameplay_rally_loop_rallyLoopManager:getWallClockDay() end

--- Wall-clock time with seconds and tenths, followed by ", Day N".
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:532
---@return string  Text, or 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeFormatted() end

--- Current wall-clock time = (rallyStartTimeSecs + clock) % 86400.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:514
---@return number|nil  Seconds of the day, nil if the schedule is not computed.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeSecs() end

--- Wall-clock time with seconds as a {time, ampm} table.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2092
---@return table|nil  Table.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeTable() end

--- Same as restartRallyLoop: instantly restarts the rallyLoop mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:769
function gameplay_rally_loop_rallyLoopManager:gotoRallyLoopInstant() end

--- True if there is at least one validation problem.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:816
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:hasValidationIssues() end

--- Initializes the loop state: UI tables, environment start time, paused clock, schedule parameters (rally start 120 s after the full minute, 60 s of TC at the start line, 1 min slot) and skip parameters. If the mission provides fgVariables, builds the sequence and computes the schedule (calculateSchedule(true)), then reads the settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:77
---@param missionId string Id of the rallyLoop mission.
---@param missionDir string Mission folder.
function gameplay_rally_loop_rallyLoopManager:init(missionId, missionDir) end

--- Freezes the loop settings: enableFalseStarts, repairVehicleOnRecovery, earlyTimeControlPenaltiesEnabled, trafficEnabled, showStageApps and isNgrcMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:286
function gameplay_rally_loop_rallyLoopManager:initSettings() end

--- Builds the timecardData structure once (one entry per TC, plus one time entry per stage), with 'group-N' groups.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1842
function gameplay_rally_loop_rallyLoopManager:initTimecardData() end

--- True for a dev mission whose missionTypeData.devDisableTraffic is true.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:279
---@return boolean  true if traffic is disabled by the dev mission.
function gameplay_rally_loop_rallyLoopManager:isDevTrafficDisabled() end

--- True if the current schedule entry is a road section (roadSectionLabel defined).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:655
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:isInRoadSection() end

--- True if the current entry is a timed stage (ssLabel defined).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:671
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:isInSpecialStage() end

--- True as long as no blocking problem has been found.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:808
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:isScheduleValid() end

--- Skip available flag.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2206
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:isTimeControlSkipAvailable() end

--- Hook called when the ground markers route is created: resets the roadSectionPenaltyKeeper.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2872
function gameplay_rally_loop_rallyLoopManager:onCreatedRallyGroundMarkerRoute() end

--- Called by the GUI loop; does nothing (profiler instrumentation only).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2155
---@param dtReal number Real time.
---@param dtSim number Simulation time.
---@param dtRaw number Raw time.
function gameplay_rally_loop_rallyLoopManager:onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Receives data from the rallyManager or the nodes (activeState, vehicleProximity with distances rounded to the centimeter, countdownData) and stores it for the UI stream.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2543
---@param data table|nil Data packet.
function gameplay_rally_loop_rallyLoopManager:onRallyDataUpdated(data) end

--- Hook of the interact action: skips to the next event if possible, otherwise triggers the UI event RallyGameplayInteract.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2328
function gameplay_rally_loop_rallyLoopManager:onRallyModeInteract() end

--- Hook at the end of a route recovery: stores data in lastRouteRecoveryData and logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2925
---@param data table|nil {vehId, repairVehicle}.
function gameplay_rally_loop_rallyLoopManager:onRallyRouteRecoveryComplete(data) end

--- Route recalculation hook; currently has no effect (code commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2861
---@param source any Source of the recalculation.
function gameplay_rally_loop_rallyLoopManager:onRecalculatedRoute(source) end

--- Hook called when settings change: rereads rallyShowStageApps.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:340
function gameplay_rally_loop_rallyLoopManager:onSettingsChanged() end

--- Called when the player clicks Start: applies the start screen settings, resumes the clock, enables the restartMission button of core_recoveryPrompt and unfreezes the vehicle.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2847
function gameplay_rally_loop_rallyLoopManager:onUIStartButtonClicked() end

--- Called every frame: advances the clock by dtSim if it is not paused, evaluates the skip, enables the action map if skipping is possible, updates the roadSectionPenaltyKeeper and the speedingDetector (outside a stage, with a limit; strict mode for serviceIn and serviceOut).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2129
---@param dtReal number Real time.
---@param dtSim number Simulation time.
---@param dtRaw number Raw time.
function gameplay_rally_loop_rallyLoopManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Records a false start penalty for the next stage: counts the false starts already logged for the event and uses Penalties.calculateFalseStartPenalty(n).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2664
---@return boolean  false if there is no upcoming ss_start.
function gameplay_rally_loop_rallyLoopManager:recordFalseStartPenalty() end

--- Records a route recalculation penalty (penaltyType 'route_recalc') on the next TC and shows a "Route penalty recorded" message.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2707
---@param penaltyData table {amount, data = {violationNumber, recalcCount}} (produced by roadSectionPenaltyKeeper).
---@return boolean  false if there is no upcoming TC.
function gameplay_rally_loop_rallyLoopManager:recordRouteRecalcPenalty(penaltyData) end

--- Records a fixed 10 s speeding penalty on the next 'tc' or 'service_in' event.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2733
---@param speedingData table {speedOver, speedLimit, strictMode, ...} produced by speedingDetector.
---@return boolean  false if there is no eligible event.
function gameplay_rally_loop_rallyLoopManager:recordSpeedingPenalty(speedingData) end

--- Test tool: records a 'test_penalty' penalty (10 s by default) on the current event and shows a message.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2783
---@param amount number|nil Seconds (integer > 0).
---@return boolean  false if amount <= 0 or no event.
function gameplay_rally_loop_rallyLoopManager:recordTestPenalty(amount) end

--- Records the passage at the current event. Checks that the event belongs to the current mission and that entryName == spName. Computes the time difference, logs the time penalties then a 'timecard' item (actualTime, timeDiff, timingResult, stageTimeSecs, splits for ss_stop), forces the timecard to be shown, reschedules the start line if arriving at a TC too close, updates the timecard then advances.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:893
---@param entryName string Name of the start position crossed.
---@param stageTimeSecs number|nil Stage time (for ss_stop).
---@return boolean  false if the recording is refused.
function gameplay_rally_loop_rallyLoopManager:recordTimeCardEntry(entryName, stageTimeSecs) end

--- Pushes the next 'ss_start' to the next slot (slotSizeMinutes, rounded to the minute) when the vehicle is not in position at -10 s. Always reschedules.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2633
---@return table  Result of _updateSSStartTime.
function gameplay_rally_loop_rallyLoopManager:rescheduleNextSSStart() end

--- Reads a global boolean setting (settings.getValue) or the default value.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:268
---@param key string Setting name.
---@param defaultValue boolean Fallback value.
---@return boolean  Resolved value.
function gameplay_rally_loop_rallyLoopManager:resolveGlobalBoolSetting(key, defaultValue) end

--- Reads a boolean setting first from mission.lastUserSettings, otherwise from settings.getValue, otherwise the default value.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:252
---@param key string Setting name.
---@param defaultValue boolean Fallback value.
---@return boolean  Resolved value.
function gameplay_rally_loop_rallyLoopManager:resolveMissionBoolSetting(key, defaultValue) end

--- Restarts the rallyLoop mission from itself (instant) and raises missionExecutionTransferFlag.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:758
function gameplay_rally_loop_rallyLoopManager:restartRallyLoop() end

--- Rounds up to the next minute (delegates to scheduleUtils).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1033
---@param timeSecs number Seconds.
---@return number  Seconds.
function gameplay_rally_loop_rallyLoopManager:roundToNextMinute(timeSecs) end

--- Sets the two time control skip flags.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2201
---@param canSkip boolean Manual skip possible now.
---@param isTimeControlSkipAvailable boolean Skip available (display).
function gameplay_rally_loop_rallyLoopManager:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable) end

--- Pauses or resumes the clock.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:556
---@param paused boolean true to freeze.
function gameplay_rally_loop_rallyLoopManager:setClockPaused(paused) end

--- Stores that the countdown can be skipped (updated by the countdown node).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2624
---@param canSkip boolean|nil State.
function gameplay_rally_loop_rallyLoopManager:setCountdownCanSkip(canSkip) end

--- Sets a drawing flag.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2529
---@param flagName string Flag name.
---@param value boolean Value.
function gameplay_rally_loop_rallyLoopManager:setDrawFlag(flagName, value) end

--- Sets the execution transfer flag.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2521
---@param val boolean Value.
function gameplay_rally_loop_rallyLoopManager:setMissionExecutionTransferFlag(val) end

--- Sets the forced active state in test mode (and currentActiveState if test mode is active).
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2968
---@param state any RallyUtil.activeState_* value.
function gameplay_rally_loop_rallyLoopManager:setTestActiveState(state) end

--- Enables or disables test mode; when disabling, resets currentActiveState to inactive.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2953
---@param enabled boolean|nil State.
function gameplay_rally_loop_rallyLoopManager:setTestMode(enabled) end

--- Forgets the cached rallyManager.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2513
function gameplay_rally_loop_rallyLoopManager:setupForNewMission() end

--- Speeding is penalized everywhere except during a stage.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:687
---@return boolean  State.
function gameplay_rally_loop_rallyLoopManager:shouldPenalizeSpeeding() end

--- Test tool: teleports the vehicle to distanceBefore m (50 by default) before the TC_out of the current road section, resynchronizes the rallyManager and sets the clock 1 s before the TC_out time.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2252
---@param options table|nil {distanceBefore = 50, resetVehicle = true}.
---@return boolean  true if successful.
---@return string|nil  Failure reason.
function gameplay_rally_loop_rallyLoopManager:skipLiaisonForTesting(options) end

--- Advances the clock to 1 s before the next TC and notifies the UI (RallyClockSkipped). Refuses if the next event is not a TC or if the target is not in the future.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2218
---@return boolean  true if the clock was advanced.
function gameplay_rally_loop_rallyLoopManager:skipToNextEvent() end

--- Starts the next mission of the sequence from the current mission (instant startFromWithinMission) and raises missionExecutionTransferFlag. Fails if there is no foreground mission.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:727
---@return boolean  true if started.
function gameplay_rally_loop_rallyLoopManager:startNextMission() end

--- Records a recovery ('recovery') or a flip ('flip'): advances the clock by RecoveryClockAdvance.getSeconds(type, inStage), also advances the time of day (RallyLoopTime.advancePlayingTime), notifies the UI and logs the item with the player's position.
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2878
---@param recoveryType string 'recovery' or 'flip'.
function gameplay_rally_loop_rallyLoopManager:trackRecovery(recoveryType) end

--- Updates rallyClockData in place: time, day, total time, skip flags, early penalties enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2107
function gameplay_rally_loop_rallyLoopManager:updateRallyClockData() end

--- Updates scheduleData in place for the next event: label, type, times of the scheduled minute, difference (negative timeDiff = early), current status and penalty, speed limit, service park, isSpeeding.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1956
function gameplay_rally_loop_rallyLoopManager:updateScheduleData() end

--- Updates an event's timecard entry (recorded time, early/late/on-time status, stage time) from the log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1910
---@param eventIndex integer Index in events.
function gameplay_rally_loop_rallyLoopManager:updateTimecardEntry(eventIndex) end

--- Checks that the first mission is serviceOutMission. Not called in this version (call commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:435
---@return boolean  true if valid.
function gameplay_rally_loop_rallyLoopManager:validateMissionSequence() end

