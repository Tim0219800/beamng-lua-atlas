# `flowgraph_nodes_gameplay_traffic_signals_sequenceAdvance`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance")` (file under extensions/ but not a regular extension)

Flowgraph node "Advance Sequence" (once_instant). Advances a traffic light sequence to the next step (sequence:advance()).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls advance() on the input sequence if it exists. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance.lua`.*
