# `flowgraph_nodes_util_distanceRemaining`

*File: `lua/ge/extensions/flowgraph/nodes/util/distanceRemaining.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/distanceRemaining")` (file under extensions/ but not a regular extension)

Node "Waypoints Distance" (repeat_instant). Computes the remaining distance along a list of waypoints for a vehicle and indicates whether it is driving in the right direction. Inputs: alwaysUpdate (hidden flow), vehId, waypoints (table of vec3). Outputs: distLeft, rightWay (bool), goingRightWay and goingWrongWay (flow). Without alwaysUpdate, the distance is updated only if the vehicle is moving faster than 0.5 m/s.

## Notes

- Bug: the code writes self.pinOut.goingRigthWay (typo) while the pin is named goingRightWay: this access is nil and raises an error as soon as the calculation is reached.
- Speed threshold 0.5 m/s; below this threshold the direction is considered correct.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Finds the segment closest to the vehicle (map.objects), sums the distance to the end, compares the speed with the segment direction for the driving direction and writes the pins. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/distanceRemaining.lua`.*
