# `flowgraph_nodes_util_distanceBetween`

*File: `lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/distanceBetween")` (file under extensions/ but not a regular extension)

Node "Distance Between" (repeat_instant). Computes the distance between two positions, each of which can be a vehicle id (number) or a vec3. Inputs: posA, posB. Output: distance (number).

## Notes

- The result of getPosition(nil) is passed to posA:set: an unconnected input can cause an error.
- The test "if posA and posB" is always true (they are local vec3 values).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:getPosition(pinInput)` | Returns a position: for a number, the vehicle's position (getObjectByID) or a zero vec3 if not found; for a table, a converted vec3; nil if the input is empty. | 36 |
| `C:work()` | Resolves the two positions via getPosition and writes the distance to the distance pin. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua`.*
