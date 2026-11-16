# `flowgraph_nodes_gameplay_traffic_signals_sequence`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequence.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequence")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Signal Sequence" (repeat_instant). Reads a traffic light sequence (signalSequenceData): step (currStep), maxSteps (#timelineTimes), duration (totalDuration), phase (currPhase), active, timed (not ignoreTimer).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Copies the sequence's properties to the outputs. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequence.lua`.*
