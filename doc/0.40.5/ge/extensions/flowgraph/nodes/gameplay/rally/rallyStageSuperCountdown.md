# `flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua` · VM: Game Engine (GE) · 609 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Stage Super Countdown" (timer icon, tag rally, no category). Standalone rally stage start countdown, with no dependency on the rally loop schedule: finds the start line in pathData (named position spName), measures the vehicle's proximity (signed distance to the plane, finite lateral zone of 10 m, stopped if speed < 0.08 m/s), starts a smoothed countdown (duration and number of announcements from StagedCountdownUtils.getStageCountdownSettings, defaults 3 s and 3), announces 3-2-1 then "Go!" (ScenarioFlashMessage messages, sounds, system pacenotes countdown<n>/countdowngo), unfreezes the vehicle, re-enables the pacenotes, and detects a false start (state false_start, pacenote 'falseStart'). Inputs: flow, reset (pulse), pathData, spName, vehId, distance (launch zone, 1 m by default). Outputs: flow (end, or false start), finished (pulse), ongoing, waiting, falseStart (pulse). Sends onRallyDataUpdated every frame (state countdown or vehicleProximity, rally clock).

## Notes

- Internal states: waiting, countdown_running, launched, finished, false_start. "Go!" stays displayed for 0.1 s (GO_DISPLAY_DURATION) and the message lasts 1 s.
- hasCrossedStartLine() always returns false in this file: the false start (triggerFalseStart) is therefore never triggered by this node as is.
- core_flowgraphManager.skipCountdowns allows skipping the countdown.
- Data options: useImgui, useMessages, bigFinishMsg (true), drawDebug.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Loads the rally loop bridge, resets the countdown and the start position cache. | 114 |
| `C:_executionStopped()` | Resets the countdown. | 124 |
| `C:calculateScheduledEventTime()` | Computes the clock and the launch time of an immediate countdown (StagedCountdownUtils.calculateImmediateMinuteCountdown). | 279 |
| `C:configureCountdownSettings()` | Loads duration, number of announcements and visual/sound/voice options from StagedCountdownUtils. | 270 |
| `C:drawDebugVisualization()` | Draws the plane, the vehicle-plane line and the vehicle point if debug is active. | 260 |
| `C:drawMiddle(builder, style)` | Progress bar and state in the node. | 572 |
| `C:enableRallyManagerPacenoteProcessing()` | Re-enables the pacenote processing of the rally manager. | 389 |
| `C:enqueueSystemPacenote(pacenoteName)` | Queues a random system pacenote in the rally manager. | 379 |
| `C:finishCountdown()` | Ends the countdown: "Go!", sound, unfreeze, pacenotes, state launched, flow = true. | 415 |
| `C:getCountdownPhase(showingGo)` | Computes the countdown phase (time remaining, integer value, announced value, progress). | 292 |
| `C:getRallyClockData()` | Builds the rally clock data for the UI. | 331 |
| `C:getTimeUntilLaunch()` | Time remaining before launch. | 288 |
| `C:getWallClockTime()` | Simulated wall clock time (seconds) via StagedCountdownUtils. | 327 |
| `C:hasCrossedStartLine()` | Intended to detect a false start; always returns false. | 249 |
| `C:init(mgr, ...)` | Initializes all state variables and data options. | 67 |
| `C:reset()` | Stops the timer and sets all outputs to false. | 128 |
| `C:sendRallyDataUpdate()` | Broadcasts the proximity and countdown state via the onRallyDataUpdated hook. | 530 |
| `C:shouldDrawDebug()` | Returns data.drawDebug. | 256 |
| `C:shouldPlaySoundEffects()` | Returns the sound effects setting. | 375 |
| `C:shouldPlayVoiceCountdown()` | Returns the voice countdown setting. | 371 |
| `C:shouldShowVisualCountdown()` | Returns the visual countdown display setting. | 367 |
| `C:show(msg, big, duration, luaCall)` | Displays a flash message (ScenarioFlashMessage) and optionally a UI Message. | 399 |
| `C:startTimer()` | Starts the countdown: settings, launch time computation, state countdown_running. | 352 |
| `C:stopTimer()` | Resets state, timers, rally clock and flags. | 137 |
| `C:triggerFalseStart()` | Declares a false start (log, pacenote, state false_start, flow = true). | 442 |
| `C:unfreezeVehicle()` | Unfreezes the vehicle (setFreeze false) via core_vehicleBridge. | 335 |
| `C:updateClock()` | Advances the countdown clock by dtSim while it is running. | 319 |
| `C:updateCountdown()` | Countdown state machine: 3-2-1 announcements and end. | 459 |
| `C:updateGoDisplay()` | Counts down the display of "Go!" then switches to the finished state. | 519 |
| `C:updateProximityState()` | Computes signed distance, lateral distance, proximity, stop, "staged" and display distance. | 204 |
| `C:updateStartPosition()` | Looks for the named start position in pathData (with cache) and stores pos/rot. | 156 |
| `C:updateVehicleData()` | Updates the front position and speed of the tracked vehicle. | 184 |
| `C:work(args)` | Every frame: handles reset, start position, vehicle, start, countdown, UI and outputs. | 579 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `Message`, `ScenarioFlashMessage`, `ScenarioFlashMessageClear`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua`.*
