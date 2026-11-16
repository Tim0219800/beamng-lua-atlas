# `flowgraph_nodes_util_routePosition`

*File: `lua/ge/extensions/flowgraph/nodes/util/routePosition.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/routePosition")` (file under extensions/ but not a regular extension)

Node "Route Position" (once_instant). Gives the position along a route at a given distance ahead. Inputs: navgraphRoute (type navgraphPath), distance. Outputs: pos (vec3), dirVec (segment direction), n1 and n2 (segment nodes). Uses gameplay/route/route.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 29 |
| `C:init()` | Calls onNodeReset (creates the route). | 25 |
| `C:onNodeReset()` | Creates a new route object (local variable of the file, shared between instances). | 33 |
| `C:workOnce()` | Initializes the route with route:setupPathMultiWaypoints, advances by distance with route:stepAhead and writes n1, n2, pos and dirVec (normalized direction from n1 to n2). | 37 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/routePosition.lua`.*
