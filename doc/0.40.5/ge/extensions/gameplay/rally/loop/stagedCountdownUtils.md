# `gameplay_rally_loop_stagedCountdownUtils`

*File: `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua` · VM: Game Engine (GE) · 240 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_loop_stagedCountdownUtils`: `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, then the global `gameplay_rally_loop_stagedCountdownUtils`

Functions common to the stage start countdown (flowgraph node and test simulation): reading the environment's wall clock, countdown settings according to the rallyVisualPacenotes/rallyAudioPacenotes options, computing a countdown aligned on the next minute, freezing/unfreezing the vehicle, debug drawing of the start plane and ImGui status display in the node.

## Notes

- Wall clock: ((tod.time + 0.5) % 1) * 86400 seconds; tod.time = 0 corresponds to noon.
- getStageCountdownSettings: the defaultMaxAnnounced parameter is ignored; maxAnnounced receives defaultDuration.
- In the debug plane, the Y axis is the normal: +Y is "back" (behind the line) and -Y "front".

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs)` | Clock data for the UI: wallClockSecs, wallClockTime (24 h text via rallyUtil.formatTime24Hour) and three skip flags set to false. | 54 |
| `gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration)` | Prepares a countdown that ends at the next full minute of the wall clock (launch window = duration + 1 s). | 30 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals)` | Draws a purple plane (two triangles 10 m wide) with a sphere at the origin point; with normals, adds the "back" (green) and "front" (red) axes. | 64 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside)` | Draws a small sphere at the vehicle: green if inside, red otherwise. | 145 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds)` | Displays in the node (drawMiddle, ImGui): TEST MODE indicator, clock, epoch, event time, remaining time, staging check, state, reschedulings, and zone/staged. Does nothing if nodeData.useImgui is false. | 174 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED)` | Node progress bar: "Running" with (duration - timer)/duration, "Done" (full) if finished, "Waiting" (empty) otherwise. | 227 |
| `gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint)` | Draws the vehicle's projection onto the plane, a line and the signed distance ("past" orange if the vehicle has crossed the line, "before" green otherwise). The vec3 passed as parameters serve as buffers to avoid allocations. | 95 |
| `gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag)` | Freezes the vehicle ('setFreeze' action true via core_vehicleBridge) during the staging phase. | 150 |
| `gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs()` | Current wall-clock time of the environment, in seconds since midnight. | 9 |
| `gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced)` | Builds the countdown settings table: duration, maxAnnounced, showVisualCountdown (rallyVisualPacenotes setting or nil), playSoundEffects (true if rallyAudioPacenotes is disabled), playVoiceCountdown (rallyAudioPacenotes setting). | 17 |
| `gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime)` | Wall-clock time = (environmentStartTimeSecs + epochTime) modulo 86400. | 50 |
| `gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag)` | Unfreezes the vehicle ('setFreeze' action false). | 162 |

### Parameter details

#### `gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs)`

Clock data for the UI: wallClockSecs, wallClockTime (24 h text via rallyUtil.formatTime24Hour) and three skip flags set to false.

- `wallClockSecs` (*number*) : Wall-clock time in seconds.
- **returns**: table {wallClockSecs, wallClockTime, canSkipTimeControls, isTimeControlSkipAvailable, canSkipCountdown}.

#### `gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration)`

Prepares a countdown that ends at the next full minute of the wall clock (launch window = duration + 1 s).

- `duration` (*number*) : Countdown duration in seconds.
- **returns**: table {environmentStartTimeSecs, epochTime = 0, scheduledEventTime, targetStartTime = 1, timer}.

#### `gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals)`

Draws a purple plane (two triangles 10 m wide) with a sphere at the origin point; with normals, adds the "back" (green) and "front" (red) axes.

- `pos` (*vec3*) : Plane position.
- `rot` (*quat*) : Plane orientation.
- `normals` (*boolean|nil*) : true to draw the normals.

#### `gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside)`

Draws a small sphere at the vehicle: green if inside, red otherwise.

- `vehPos` (*vec3*) : Position.
- `inside` (*boolean*) : Vehicle in the zone.

#### `gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds)`

Displays in the node (drawMiddle, ImGui): TEST MODE indicator, clock, epoch, event time, remaining time, staging check, state, reschedulings, and zone/staged. Does nothing if nodeData.useImgui is false.

- `im` (*table*) : ui_imgui.
- `nodeData` (*table*) : Node data (useImgui, test, wallClockSecs, currentEpochTime, scheduledEventTime, stagingCheckTime, state, rescheduleCount, maxReschedules, inZone, staged...).
- `formatTimeFromSeconds` (*function*) : Function seconds -> text.

#### `gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED)`

Node progress bar: "Running" with (duration - timer)/duration, "Done" (full) if finished, "Waiting" (empty) otherwise.

- `im` (*table*) : ui_imgui.
- `state` (*any*) : Current state of the node.
- `duration` (*number*) : Total duration in seconds.
- `timer` (*number*) : Remaining time in seconds.
- `STATE_COUNTDOWN_RUNNING` (*any*) : "Running" state value.
- `STATE_FINISHED` (*any*) : "Finished" state value.

#### `gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint)`

Draws the vehicle's projection onto the plane, a line and the signed distance ("past" orange if the vehicle has crossed the line, "before" green otherwise). The vec3 passed as parameters serve as buffers to avoid allocations.

- `vehPos` (*vec3*) : Vehicle position.
- `planePos` (*vec3*) : Plane position.
- `rot` (*quat*) : Plane orientation.
- `tmpPlaneNormal` (*vec3*) : Reusable buffer.
- `tmpToVehicle` (*vec3*) : Reusable buffer.
- `tmpClosestPoint` (*vec3*) : Reusable buffer.
- `tmpMidPoint` (*vec3*) : Reusable buffer.

#### `gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag)`

Freezes the vehicle ('setFreeze' action true via core_vehicleBridge) during the staging phase.

- `vehId` (*integer|nil*) : Vehicle id.
- `logTag` (*string*) : Log label.
- **returns**: boolean true if the vehicle was found.

#### `gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs()`

Current wall-clock time of the environment, in seconds since midnight.

- **returns**: number Seconds (0 if core_environment or the time is unavailable).

#### `gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced)`

Builds the countdown settings table: duration, maxAnnounced, showVisualCountdown (rallyVisualPacenotes setting or nil), playSoundEffects (true if rallyAudioPacenotes is disabled), playVoiceCountdown (rallyAudioPacenotes setting).

- `defaultDuration` (*number*) : Countdown duration in seconds.
- `defaultMaxAnnounced` (*number*) : Unused (inferred from code).
- **returns**: table {duration, maxAnnounced, showVisualCountdown, playSoundEffects, playVoiceCountdown}.

#### `gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime)`

Wall-clock time = (environmentStartTimeSecs + epochTime) modulo 86400.

- `environmentStartTimeSecs` (*number|nil*) : Start time, 0 if nil.
- `epochTime` (*number|nil*) : Elapsed seconds, 0 if nil.
- **returns**: number Seconds since midnight.

#### `gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag)`

Unfreezes the vehicle ('setFreeze' action false).

- `vehId` (*integer|nil*) : Vehicle id.
- `logTag` (*string*) : Log label.
- **returns**: boolean true if the vehicle was found.

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua`.*
