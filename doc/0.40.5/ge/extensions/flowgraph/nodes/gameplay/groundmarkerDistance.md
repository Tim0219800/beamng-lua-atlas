# `flowgraph_nodes_gameplay_groundmarkerDistance`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkerDistance.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/groundmarkerDistance")` (file under extensions/ but not a regular extension)

Flowgraph node "Groundmarker Remaining Distance" (category repeat_instant, depends on core_groundMarkers). Gives the remaining distance (m) to the target of the active groundmarkers. Outputs: active (flow, only if a path exists) and distance.

**Dependencies (loaded first):** `core_groundMarkers`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Reads core_groundMarkers.routePlanner.path[1].distToTarget; active = false if there is no path. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkerDistance.lua`.*
