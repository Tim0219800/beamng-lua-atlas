# `flowgraph_nodes_gameplay_dragRace_resetDragRace`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace")` (file under extensions/ but not a regular extension)

Flowgraph node "Reset Drag Race" (category once_instant). Resets the drag race (dragBridge.reset) and can also clear the drivers (clearRacers pin) for a new attempt with other opponents. Outputs: flow (pulse) and success.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls dragBridge.reset() if data exists, then clearRacers() if requested. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/resetDragRace.lua`.*
