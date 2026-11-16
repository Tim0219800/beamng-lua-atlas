# `flowgraph_nodes_util_randomNumber`

*File: `lua/ge/extensions/flowgraph/nodes/util/randomNumber.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/randomNumber")` (file under extensions/ but not a regular extension)

Node "Random Number" (repeat_instant, casino icon). Generates a random number in [rangeStart, rangeEnd] every frame. Inputs: rangeStart (0), rangeEnd (10), float (hidden, false: integer). Output: random.

## Notes

- In integer mode, math.random requires integers and rangeStart <= rangeEnd.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If the bounds are defined, returns an integer (math.random(a, b)) or a float (a + random × (b-a)) depending on float; without bounds, returns math.random(). | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/randomNumber.lua`.*
