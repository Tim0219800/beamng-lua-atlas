# `flowgraph_nodes_gameplay_dragRace_dragRaceState`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState.lua` · VM: Game Engine (GE) · 130 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState")` (file under extensions/ but not a regular extension)

Flowgraph node "Drag Race State" (category repeat_instant). Pure monitoring node for the drag race state (data from gameplay_drag_dragBridge.getData). Outputs: flow, started, completed, staged, countdownOver (pulses), isStarted, isCompleted, isStaged (bool), dragType (drag, bracketRace, headsUpRace), context (freeroam, activity...), localPhase (stage, countdown, race, stop).

## Notes

- Without race data, all outputs are reset to false or empty string.
- Overwrites self.data (the node's data table) with {} at start.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the last states. | 34 |
| `C:work()` | Reads dragBridge.getData(), detects the started/completed transitions and the phase changes of the playable driver. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragRaceState.lua`.*
