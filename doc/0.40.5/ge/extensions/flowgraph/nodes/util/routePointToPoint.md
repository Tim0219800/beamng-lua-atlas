# `flowgraph_nodes_util_routePointToPoint`

*File: `lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/routePointToPoint")` (file under extensions/ but not a regular extension)

Node "Get Navgraph Route" (once_instant). Computes a route on the navgraph between a start position and an end position. Inputs: posA, posB (vec3), legalRoute (hidden, true: respects traffic directions). Output: navgraphRoute (list of waypoints, type navgraphPath).

## Notes

- The 4th argument of map.getPath is 1000 if legalRoute (penalty for forbidden directions) and 1 otherwise (inferred from code).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | For each position, finds the closest road (map.findClosestRoad) and keeps the closest node; if one fails, does nothing. Then computes map.getPath(start, end, nil, 1000 or 1) and writes it to the output. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua`.*
