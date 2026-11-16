# `flowgraph_nodes_util_randomVector`

*File: `lua/ge/extensions/flowgraph/nodes/util/randomVector.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/randomVector")` (file under extensions/ but not a regular extension)

Node "Random Vector" (repeat_instant, casino icon). Provides a non-normalized random vector. Inputs: xMin/xMax, yMin/yMax, zMin/zMax (default -1 and 1). Output: vector ({x, y, z}).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Draws each component uniformly between its min and max and writes {x, y, z}. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/randomVector.lua`.*
