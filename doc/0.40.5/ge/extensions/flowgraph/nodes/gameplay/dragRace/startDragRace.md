# `flowgraph_nodes_gameplay_dragRace_startDragRace`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/startDragRace.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/startDragRace")` (file under extensions/ but not a regular extension)

Flowgraph node "Start Drag Race" (category once_instant). Starts the drag race activity, to be called after the vehicles are set up. Input pin: lane (hidden, optional, freeroam context). Outputs: flow (pulse) and success. Fails if the data is not loaded or if the race is already started.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls dragBridge.startDragRaceActivity(lane) after checks and fills success; flow is always activated. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/startDragRace.lua`.*
