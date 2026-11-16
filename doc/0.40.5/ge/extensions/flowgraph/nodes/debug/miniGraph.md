# `flowgraph_nodes_debug_miniGraph`

*File: `lua/ge/extensions/flowgraph/nodes/debug/miniGraph.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/miniGraph")` (file under extensions/ but not a regular extension)

Flowgraph node "Mini Graph" (category repeat_instant, tags util/draw/table/data). Small graph (200x60) in the node that plots a single number value over frames (last 100 points). Parameters in data: scaleMin/scaleMax (0..1 by default), autoScale (true: the scale grows with the values) and stop (true: stops recording). Input: value (number).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Editor: draws the curve (PlotMultiLines). | 48 |
| `C:init()` | Initializes the data and parameters. | 23 |
| `C:work()` | Adds the value (0 if nil) to the series, updates the scale and removes the oldest point beyond the max size, unless data.stop. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/miniGraph.lua`.*
