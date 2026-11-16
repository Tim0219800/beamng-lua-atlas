# `flowgraph_nodes_gameplay_dragRace_loadDragData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/loadDragData.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/loadDragData")` (file under extensions/ but not a regular extension)

Flowgraph node "Load Drag Race Data" (category once_instant). Loads and initializes the drag race data from a file (filepath pin), normally once at the start of the mission, via gameplay_drag_dragBridge.loadDragDataForMission. Outputs: flow (pulse) and success.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Loads the data, checks getData() and sets a node error on failure; always activates flow. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/loadDragData.lua`.*
