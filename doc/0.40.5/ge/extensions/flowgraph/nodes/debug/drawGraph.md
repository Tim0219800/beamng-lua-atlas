# `flowgraph_nodes_debug_drawGraph`

*File: `lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua` · VM: Game Engine (GE) · 123 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/drawGraph")` (file under extensions/ but not a regular extension)

Flowgraph node "Multi Graph" (category repeat_instant, tags util/draw/table/data). Plots several curves in the same graph in the node body: one number input pin (value1, value2...) per curve, their count is set by data.count. Keeps the last 400 values per curve; the scale (data.scaleMin/scaleMax) grows automatically with the values.

## Notes

- A game comment flags "TODO: fix invalid C type error" on the im.PlotMultiLines call.
- The series are indexed by the pairs() order over the pins, so the order of the curves is not guaranteed.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Recreates the pins according to data.count. | 103 |
| `C:_onSerialize(res)` | Empty. | 100 |
| `C:drawMiddle(builder, style)` | Editor: synchronizes the number of pins with data.count and draws the curves (PlotMultiLines). | 107 |
| `C:init()` | Initializes data tables, 400 points max, count = 1, scale 0..1. | 21 |
| `C:onLink()` | Editor hook: resets the data. | 92 |
| `C:onLinkDeleted()` | Editor hook: resets the data. | 88 |
| `C:onUnlink()` | Editor hook: resets the data. | 96 |
| `C:resetGraphData()` | Rebuilds labels, rainbow colors and series from the connected numeric pins. | 48 |
| `C:updatePins(old, new)` | Adds or removes value<i> pins to go from old to new (removes the links of removed pins), then resets the data. | 65 |
| `C:work()` | Adds the numeric value of each pin to its series, extends the scale, removes the oldest values beyond the max size. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua`.*
