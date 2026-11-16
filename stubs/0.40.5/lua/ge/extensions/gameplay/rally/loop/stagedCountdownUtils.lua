---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Functions common to the stage start countdown (flowgraph node and test simulation): reading the environment's wall clock, countdown settings according to the rallyVisualPacenotes/rallyAudioPacenotes options, computing a countdown aligned on the next minute, freezing/unfreezing the vehicle, debug drawing of the start plane and ImGui status display in the node.
--- Access: extension `gameplay_rally_loop_stagedCountdownUtils`: `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, then the global `gameplay_rally_loop_stagedCountdownUtils`
---@class gameplay_rally_loop_stagedCountdownUtils
gameplay_rally_loop_stagedCountdownUtils = {}

--- Clock data for the UI: wallClockSecs, wallClockTime (24 h text via rallyUtil.formatTime24Hour) and three skip flags set to false.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:54
---@param wallClockSecs number Wall-clock time in seconds.
---@return table  {wallClockSecs, wallClockTime, canSkipTimeControls, isTimeControlSkipAvailable, canSkipCountdown}.
function gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs) end

--- Prepares a countdown that ends at the next full minute of the wall clock (launch window = duration + 1 s).
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:30
---@param duration number Countdown duration in seconds.
---@return table  {environmentStartTimeSecs, epochTime = 0, scheduledEventTime, targetStartTime = 1, timer}.
function gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration) end

--- Draws a purple plane (two triangles 10 m wide) with a sphere at the origin point; with normals, adds the "back" (green) and "front" (red) axes.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:64
---@param pos vec3 Plane position.
---@param rot quat Plane orientation.
---@param normals boolean|nil true to draw the normals.
function gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals) end

--- Draws a small sphere at the vehicle: green if inside, red otherwise.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:145
---@param vehPos vec3 Position.
---@param inside boolean Vehicle in the zone.
function gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside) end

--- Displays in the node (drawMiddle, ImGui): TEST MODE indicator, clock, epoch, event time, remaining time, staging check, state, reschedulings, and zone/staged. Does nothing if nodeData.useImgui is false.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:174
---@param im table ui_imgui.
---@param nodeData table Node data (useImgui, test, wallClockSecs, currentEpochTime, scheduledEventTime, stagingCheckTime, state, rescheduleCount, maxReschedules, inZone, staged...).
---@param formatTimeFromSeconds function Function seconds -> text.
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds) end

--- Node progress bar: "Running" with (duration - timer)/duration, "Done" (full) if finished, "Waiting" (empty) otherwise.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:227
---@param im table ui_imgui.
---@param state any Current state of the node.
---@param duration number Total duration in seconds.
---@param timer number Remaining time in seconds.
---@param STATE_COUNTDOWN_RUNNING any "Running" state value.
---@param STATE_FINISHED any "Finished" state value.
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED) end

--- Draws the vehicle's projection onto the plane, a line and the signed distance ("past" orange if the vehicle has crossed the line, "before" green otherwise). The vec3 passed as parameters serve as buffers to avoid allocations.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:95
---@param vehPos vec3 Vehicle position.
---@param planePos vec3 Plane position.
---@param rot quat Plane orientation.
---@param tmpPlaneNormal vec3 Reusable buffer.
---@param tmpToVehicle vec3 Reusable buffer.
---@param tmpClosestPoint vec3 Reusable buffer.
---@param tmpMidPoint vec3 Reusable buffer.
function gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint) end

--- Freezes the vehicle ('setFreeze' action true via core_vehicleBridge) during the staging phase.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:150
---@param vehId integer|nil Vehicle id.
---@param logTag string Log label.
---@return boolean  true if the vehicle was found.
function gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag) end

--- Current wall-clock time of the environment, in seconds since midnight.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:9
---@return number  Seconds (0 if core_environment or the time is unavailable).
function gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs() end

--- Builds the countdown settings table: duration, maxAnnounced, showVisualCountdown (rallyVisualPacenotes setting or nil), playSoundEffects (true if rallyAudioPacenotes is disabled), playVoiceCountdown (rallyAudioPacenotes setting).
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:17
---@param defaultDuration number Countdown duration in seconds.
---@param defaultMaxAnnounced number Unused (inferred from code).
---@return table  {duration, maxAnnounced, showVisualCountdown, playSoundEffects, playVoiceCountdown}.
function gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced) end

--- Wall-clock time = (environmentStartTimeSecs + epochTime) modulo 86400.
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:50
---@param environmentStartTimeSecs number|nil Start time, 0 if nil.
---@param epochTime number|nil Elapsed seconds, 0 if nil.
---@return number  Seconds since midnight.
function gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime) end

--- Unfreezes the vehicle ('setFreeze' action false).
---Source: lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:162
---@param vehId integer|nil Vehicle id.
---@param logTag string Log label.
---@return boolean  true if the vehicle was found.
function gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag) end

