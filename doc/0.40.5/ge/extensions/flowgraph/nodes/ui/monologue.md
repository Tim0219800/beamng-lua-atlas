# `flowgraph_nodes_ui_monologue`

*File: `lua/ge/extensions/flowgraph/nodes/ui/monologue.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/monologue")` (file under extensions/ but not a regular extension)

Flowgraph node "Monologue" (category once_f_duration, duration): displays a series of messages one after another with ui_message. Inputs: "category" (flowgraph), "icon" (error), then for each message i: "message_i" (any) and "duration_i" (5 s). The duration output goes to 'finished' at the end of the sum of the durations.

## Notes

- Uses dtSim (simulation time), so the progression stops when paused.
- The message_i/duration_i pins are removed according to lnk.sourcePin (instead of targetPin), so the links are not removed properly.
- If a duration_i is nil, the sum causes an error.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets index, time and current message. | 29 |
| `C:_onDeserialized(res)` | Restores count and mode. | 120 |
| `C:_onSerialize(res)` | Saves count and mode. | 115 |
| `C:drawCustomProperties()` | "Count" field. | 36 |
| `C:init()` | count = 1. | 25 |
| `C:onNodeReset()` | Duration state 'inactive'. | 79 |
| `C:updatePins(old, new)` | Adjusts the number of pin pairs. | 53 |
| `C:work()` | Advances the simulation time and displays each message in turn; finishes after the last duration. | 88 |
| `C:workOnce()` | time = 0, state 'started'. | 83 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/monologue.lua`.*
