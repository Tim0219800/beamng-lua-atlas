# `flowgraph_nodes_gameplay_traffic_trafficScatter`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficScatter.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficScatter")` (file under extensions/ but not a regular extension)

Flowgraph node "Scatter Traffic" (once_instant). Teleports all traffic vehicles away from the player or the camera with gameplay_traffic.scatterTraffic(nil, minDist, maxDist); minDist and maxDist are optional.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls gameplay_traffic.scatterTraffic(nil, minDist, maxDist). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficScatter.lua`.*
