# `flowgraph_nodes_ui_updatedUI_startScreenBegin`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua` · VM: Game Engine (GE) · 126 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin")` (file under extensions/ but not a regular extension)

Node "StartScreen Begin" (color ui). Starts building the start screen of a mission: on the first frame with flow active, it calls modules.ui:startUIBuilding('startScreen'), adds the header (project name), sets the Start button text and, if simple is true, switches the screen to simple mode. Inputs: flow, reset (pulse), triggerStart (pulse, simulates a click on Start), startButtonText (string, default "ui.scenarios.start.start"), simple (bool). Outputs: flow (true once the Start button is clicked), build (chainFlow, one frame to chain the panels). Ends with a "Screen Finish" node.

## Notes

- The timer fallback code (started/startTime) and the onUILayoutLoaded hook are commented out in the file.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets started/done/built and auto-skip when the project starts. | 25 |
| `C:_executionStopped()` | Called when the project stops; calls closeDialogue (no real effect). | 34 |
| `C:closeDialogue()` | Does nothing in practice: the navigation to "play" is commented out. | 42 |
| `C:onClientEndMission()` | End-of-mission hook on the client side; calls closeDialogue. | 38 |
| `C:onNodeReset()` | Called when the node is reset (reset pin or graph reset). | 48 |
| `C:startFromUi()` | Simulates the click on Start: sets done=true, emits the onUIStartButtonClicked hook, navigates to the "play" screen and clears modules.ui.uiLayout. | 107 |
| `C:work()` | Handles reset, builds the screen at the first flow, activates build for one frame, publishes done on the output flow pin, triggers startFromUi if triggerStart is received, and applies auto-skip (startingOptions.autoSkipStartScreen, after 2 s of real time). | 60 |
| `C:workOnce()` | Variant executed only once by the flowgraph engine (empty body here). | 57 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUIStartButtonClicked` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua`.*
