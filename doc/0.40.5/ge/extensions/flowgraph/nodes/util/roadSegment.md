# `flowgraph_nodes_util_roadSegment`

*File: `lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/roadSegment")` (file under extensions/ but not a regular extension)

Node "Road Properties" (repeat_instant). Gives the properties of a navgraph road segment defined by two nodes. Inputs: n1, n2 (node names), xnorm (hidden, 0.5 by default). Outputs: roadDir (normalized direction, takes one-way into account), length, width, drivability (0 to 1), speedLimit (m/s), lanesIncoming, lanesOutgoing, lanesTotal, isOneWay, isPrivate.

## Notes

- Bug: if no link exists between n1 and n2 (link == nil), the code still reads link.inNode and raises an error.
- The number of lanes is counted on the string link.lanes ("-" characters incoming, "+" outgoing).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the cache of the two names. | 38 |
| `C:init()` | Resets the cache of the two names. | 34 |
| `C:work()` | If both nodes exist in map.getMap().nodes, recomputes (when the pair changes) length, drivability, speed limit, one-way, private road, number of lanes (counting "-" and "+" in link.lanes, "-+" by default) and direction; always recomputes the width (2 × radius interpolated according to xnorm). | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/roadSegment.lua`.*
