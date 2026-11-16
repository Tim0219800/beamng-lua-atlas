# `flowgraph_nodes_gameplay_countdown`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua` · VM: Game Engine (GE) · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/countdown")` (file under extensions/ but not a regular extension)

Flowgraph node "Countdown" (tag scenario). Manages a countdown displayed on screen via the ScenarioFlashMessage hook (and Message if data.useMessages). Input pins: flow, reset (pulse), duration (3 s by default), countdownMsg (hidden, '%d'), finishMsg ('Go!'), finishMsgDuration (hidden, 1 s). Outputs: flow (true once finished), finished (pulse), ongoing (in progress). The countdown starts when flow is active, and uses mgr.dtSim.

## Notes

- data.playSounds (true by default) plays UI_Countdown1 every second and UI_CountdownGo at the end.
- If core_flowgraphManager.skipCountdowns is true, the timer starts at 0 (immediate end).
- If finishMsg is nil, the message is the translation key "ui.scenarios.go".

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls stopTimer. | 50 |
| `C:countdown()` | Decrements the timer by mgr.dtSim, displays every second and signals the end. | 93 |
| `C:drawMiddle(builder, style)` | Progress bar and state (Running, Done, Stopped) in the editor. | 126 |
| `C:init(mgr, ...)` | Initializes the data options (useImgui, useMessages, playSounds, bigFinishMsg) and the state. | 28 |
| `C:onExecutionStarted()` | Resets duration, timer and message to defaults. | 44 |
| `C:reset()` | Stops the countdown and resets the outputs to false. | 54 |
| `C:show(msg, big, duration, luaCall)` | Displays a flash message (ScenarioFlashMessage), and a Message if data.useMessages. | 79 |
| `C:startTimer()` | Reads the duration, arms the timer, clears the previous flash message and starts. | 69 |
| `C:stopTimer()` | Stops the timer and clears done and flags. | 61 |
| `C:work(args)` | Handles reset, starts the timer if flow is active, calls countdown and fills the outputs. | 140 |

**UI events (guihooks.trigger):** `Message`, `ScenarioFlashMessage`, `ScenarioFlashMessageClear`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua`.*
