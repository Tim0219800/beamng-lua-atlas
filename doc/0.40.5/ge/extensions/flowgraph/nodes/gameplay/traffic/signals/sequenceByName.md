# `flowgraph_nodes_gameplay_traffic_signals_sequenceByName`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName")` (file under extensions/ but not a regular extension)

Flowgraph node "Sequence by Name" (once_instant). Looks up a traffic light sequence (signal group / phase logic) by name in signalsData.sequences. Outputs: exists (hidden), sequenceData.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 31 |
| `C:init()` | Calls onNodeReset(). | 27 |
| `C:onNodeReset()` | Clears the sequenceData output. | 23 |
| `C:work(args)` | Iterates over signalsData.sequences and publishes the sequence with the same name. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName.lua`.*
