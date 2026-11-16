# `flowgraph_nodes_gameplay_rally_rallySuperCountdown`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua` · VM: Game Engine (GE) · 1227 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Super Countdown" (timer icon, tag rally, rallyLoop color). Complete start line system of the rally loop: clock, start position lookup, proximity, placement validation (staging), countdown, reschedule and false start detection. Replaces Rally Clock, Rally Position Getter and Stopped Near Plane. Depends on the rally loop manager: epoch time (getEpochTime), scheduled time of the event eventName (e.g. "SS_start_line"). Sequence: waiting_for_staging_check, then at stagingCheckTime seconds (10 by default) before the start, if the vehicle is placed (in front of the plane within distance m and stopped) → countdown_armed (vehicle frozen if false starts are disabled); otherwise reschedule to the next slot (rm:rescheduleNextSSStart) up to maxReschedules (3). Then countdown_running (voice/visual announcements), launched (0.5 s) then finished. Inputs: flow, reset (pulse), pathData, spName, eventName, vehId, distance, stagingCheckTime, maxReschedules. Outputs: flow, finished, ongoing, waiting, rescheduled, falseStart, maxReschedulesReached (pulses for finished/rescheduled/falseStart/maxReschedulesReached).

## Notes

- Warnings at 60, 30, 15 and 10 s (pacenotes warningSeconds<N>); on the original schedule, 60 s plays commsCheck, 30 s beltsCheck and 10 s precountdown.
- False start (signedDistance < 0): pacenote 'falseStart', penalty rm:recordFalseStartPenalty(), unfreeze, the stage starts anyway.
- A vehicle that leaves the launch zone during the countdown cancels and reschedules the start.
- Countdown skip (onGameplayInteract) possible when the vehicle is placed: sets the loop clock to scheduled - 6 s (COUNTDOWN_SKIP_LEAD_SECONDS) with a 2 s debounce and cuts the side audio. Availability signaled via rm:setCountdownCanSkip.
- Thresholds: stopped if speed < 0.08 m/s (hysteresis +0.6 km/h); skip possible below 1 km/h (hysteresis +1 km/h, distance +0.5 m).
- Data options: useImgui, useMessages, bigFinishMsg, test (test mode without loop manager), drawDebug.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the node state when the graph starts. | 145 |
| `C:_executionStopped()` | Stops the timer and unfreezes the vehicle. | 169 |
| `C:canSkipCountdown()` | Indicates whether skipping the countdown is possible (waiting, vehicle placed with hysteresis, no debounce). | 1030 |
| `C:checkStagingAt10s()` | Placement check: armed if placed, otherwise reschedule or end if no reschedules remain. | 649 |
| `C:configureCountdownSettings()` | Sets duration (6 s/5 announcements with voice, 3 s/3 without), voice, visual and freeze according to the rallyAudioPacenotes/rallyVisualPacenotes settings and false starts. | 572 |
| `C:drawDebugVisualization()` | Draws the start plane and the debug markers. | 980 |
| `C:drawMiddle(builder, style)` | Draws the countdown state in the node. | 995 |
| `C:enableRallyManagerPacenoteProcessing()` | Re-enables the pacenote processing of the rally manager. | 513 |
| `C:enqueuePauseSecs(secs)` | Queues an audio pause. | 532 |
| `C:enqueueSystemPacenote(pacenote_name, audioLenOffset)` | Queues a random system pacenote. | 522 |
| `C:finishCountdownImmediately()` | Ends immediately (skipCountdowns): pacenotes, unfreeze, state finished, flow = true. | 755 |
| `C:freezeVehicle()` | Freezes the vehicle via StagedCountdownUtils.freezeVehicle (only once). | 217 |
| `C:getCurrentEpochTime()` | Current rally epoch time (test mode: test clock). | 396 |
| `C:getRallyLoopManager()` | Returns the rally loop manager (nil in test mode or if the extension is not loaded). | 385 |
| `C:getScheduledEventTime()` | Scheduled time of the event eventName (cached per event and mission). | 408 |
| `C:getWallClockTime()` | Simulated wall clock time (environment start + epoch, modulo 86400). | 942 |
| `C:hasCrossedStartLine()` | True if the signed distance is negative (line crossed). | 380 |
| `C:init(mgr, ...)` | Initializes states, caches, audio flags and data options. | 81 |
| `C:isFlowActive()` | True if the state is finished or false_start. | 767 |
| `C:isInLaunchZone()` | True if near the plane (stop not required). | 375 |
| `C:isNearPlane()` | Cached proximity state. | 365 |
| `C:isOngoing()` | True if the countdown is running. | 771 |
| `C:isOriginalSchedule()` | True if no reschedule has taken place. | 763 |
| `C:isStaged()` | True if near the plane and stopped. | 370 |
| `C:isStopped()` | Cached "stopped" state. | 360 |
| `C:isWaiting()` | True in the waiting states (staging check, armed, waiting_for_staged). | 775 |
| `C:monitorCountdown()` | Monitors false start and leaving the zone during the countdown. | 689 |
| `C:onGameplayInteract()` | Player interaction hook: requests a countdown skip if possible. | 1100 |
| `C:processWarnings()` | Triggers the 60/30/15/10 s warnings (message and pacenotes). | 781 |
| `C:randomPauseSecs(min, max)` | Audio pause of random integer duration between min and max. | 542 |
| `C:requestReschedule()` | Requests postponing the start to the next slot; updates rescheduleCount and the warnings. | 441 |
| `C:reset()` | Stops the timer, unfreezes the vehicle and sets the outputs to false. | 174 |
| `C:shouldDrawDebug()` | True if data.drawDebug or the loop's stopZones flag is active. | 975 |
| `C:shouldPlayVoiceCountdown()` | Voice countdown setting. | 505 |
| `C:shouldShowVisualCountdown()` | Visual display setting. | 509 |
| `C:shouldStartTimer()` | True if flow is active, the state is waiting_for_staging_check and no start is scheduled yet. | 565 |
| `C:show(msg, big, duration)` | Displays a message via the Message channel if useMessages is active (the flash message is commented out). | 547 |
| `C:skipToCountdown()` | Advances the loop clock to 6 s before the start. | 1070 |
| `C:startTimer()` | Reads the scheduled time and computes targetStartTime and stagingCheckTime. | 606 |
| `C:stopTimer()` | Resets states, scheduling, counters, warnings, flags and audio. | 191 |
| `C:unfreezeVehicle()` | Unfreezes the vehicle if it was frozen by this node. | 225 |
| `C:updateCountdownStateMachine()` | Main start state machine. | 827 |
| `C:updateProximityState()` | Computes signed distance, stop (with hysteresis), proximity and "staged" state. | 307 |
| `C:updateStartPosition()` | Looks for the named start position in pathData (with cache) and stores the reason on failure. | 256 |
| `C:updateTimesAfterReschedule()` | Recomputes targetStartTime and stagingCheckTime after a reschedule. | 643 |
| `C:updateVehicleData()` | Updates the front position and speed of the tracked vehicle. | 233 |
| `C:work(args)` | Every frame: position, vehicle, proximity, start, state machine, skip, UI update (proximity/countdown hooks) and outputs. | 1106 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `Message`, `RallyUIContextEnter_START_LINE`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua`.*
