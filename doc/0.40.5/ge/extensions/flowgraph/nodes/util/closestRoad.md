# `flowgraph_nodes_util_closestRoad`

*File: `lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/closestRoad")` (file under extensions/ but not a regular extension)

Node "Closest Road" (repeat_instant). Finds the navgraph road closest to a position (map.findClosestRoad) and returns the two segment nodes (the closest first), the distance, the road width and the projected point. Input: pos (vec3). Outputs: name_a, pos_a, name_b, pos_b, dist, and hidden pins roadId/roadIdx a/b, exists, width, projectedPoint. Only recomputes if pos changes.

## Notes

- Bug in findDecalroad: the test "if not idId" uses a nonexistent variable (idId instead of rdId), so the lookup by name is always attempted even when the number was read.
- findDecalroad returns nothing (nil) when the name does not start with "DecalRoad": roadId/roadIdx are then nil.
- If the name exists in scenetree, it returns -1,-1 (the branch test is inverted compared to the comment).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the last position (oldPos=nil). | 37 |
| `C:findDecalroad(name)` | For a compound node name "DecalRoad<id>_<index>", returns the DecalRoad id and the point index; returns -1,-1 if an object with that name exists in scenetree; nil otherwise. | 41 |
| `C:init(mgr)` | Does nothing. | 34 |
| `C:work()` | If pos has changed, looks for the closest road, orders the nodes by proximity, fills the pins (positions, DecalRoad ids, distance, projected point, width = 2 × interpolated radius) and exists. Sets exists to false if nothing is found. | 66 |

## Calls into the engine (C++)

- `obj:` `getId`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua`.*
