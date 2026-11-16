# `flowgraph_nodes_util_closestPath`

*File: `lua/ge/extensions/flowgraph/nodes/util/closestPath.lua` · VM: Game Engine (GE) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/closestPath")` (file under extensions/ but not a regular extension)

Node "Route Distance" (repeat_instant). Computes the approximate remaining distance along the navgraph between a tracked position and the end of a route. The route is defined either by two positions posA/posB, or by a list of waypoints ("Waypoints" checkbox in the inspector). Inputs: setRoute (pulse), trackedPos (vec3), posA, posB (or waypoints). Output: dist (number, -1 if invalid). Uses gameplay/route/route.

## Notes

- The route is stored in a local variable of the file (shared by all instances of the node).
- With posA/posB, the route is built in the order {posB, posA}.
- The comparison trackedPos ~= lastTrackedPosValue compares tables: it is almost always true.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Initializes lastTrackedPosValue to vec3(). | 28 |
| `C:_onDeserialized(nodeData)` | Restores the Waypoints checkbox and updates the pins. | 36 |
| `C:_onSerialize(res)` | Saves the state of the Waypoints checkbox. | 32 |
| `C:drawCustomProperties()` | Draws the "Waypoints" checkbox; changing it calls updatePins. | 41 |
| `C:init()` | Creates the "Waypoints" checkbox (BoolPtr false). | 24 |
| `C:updatePins()` | Replaces the posA/posB pins with a "waypoints" table pin (or the reverse) according to the checkbox, creating only the missing pins. | 47 |
| `C:work()` | Sets dist to -1; on setRoute, creates the route (route:setupPathMulti) from the points; tracks the position (route:trackPosition) when flow is active and trackedPos has changed; returns route.path[1].distToTarget. | 68 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/closestPath.lua`.*
