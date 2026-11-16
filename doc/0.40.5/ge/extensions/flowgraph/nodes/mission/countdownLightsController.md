# `flowgraph_nodes_mission_countdownLightsController`

*File: `lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua` · VM: Game Engine (GE) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/countdownLightsController")` (file under extensions/ but not a regular extension)

Flowgraph node 'Countdown Lights Controller' (repeat_instant category) for the drag race starting light. Turns on the ambers then the green following the time ('Pro' tree: 3 simultaneous ambers at 2.0 s then green at 2.4 s; classic tree: successive ambers, green at 2.5 s). If the vehicle moves more than 0.2 (pin 'distance') before the green, it is a false start: disqualified=true and red lights. Outputs: flow, disqualified, started.

## Notes

- self.lights is only created by initLights, called only on the 'reset' impulse: without a prior reset, work raises an error (indexing nil).
- The node's description ('Updates the lights for the Drag Races missions') is the same as that of Lights Controller and UpdateDisplay.
- flow is always true on output.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the state (started, starttimer, jumpStarted, timerOn) and the outputs to zero. | 40 |
| `C:init()` | Same initialization. | 49 |
| `C:initLights()` | Searches the scene for the countdown light objects (Amberlight1-3, Greenlight, Redlight, left/right). | 23 |
| `C:work()` | On reset: resets the state and hides all lights (initLights). Otherwise advances the timer (dtSim), turns the lights on/off according to proTree, sets started=true at green, detects the false start. | 58 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua`.*
