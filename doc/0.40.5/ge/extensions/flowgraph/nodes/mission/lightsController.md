# `flowgraph_nodes_mission_lightsController`

*File: `lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/lightsController")` (file under extensions/ but not a regular extension)

Flowgraph node 'Lights Controller' (repeat_instant category) for the drag race starting light (speed-based version). Same sequence as Countdown Lights Controller (Pro or classic tree), but the false start is detected with the 'velocity' pin > 0.5. Outputs: flow, disqualified, started.

## Notes

- self.lights is only created by the 'reset' impulse: without a prior reset, work raises an error.
- flow is always true on output.
- The node's description is identical to that of the other drag race light nodes.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the state and the outputs to zero. | 46 |
| `C:init()` | Same initialization. | 54 |
| `C:initLights()` | Searches the scene for the stage and countdown lights. | 23 |
| `C:work()` | On reset: resets the state and hides the lights. Otherwise advances the timer, handles the ambers/green, sets started=true, detects the false start (velocity > 0.5): disqualified=true, ambers and right red on. | 62 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua`.*
