# `flowgraph_nodes_ui_endStats`

*File: `lua/ge/extensions/flowgraph/nodes/ui/endStats.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/endStats")` (file under extensions/ but not a regular extension)

Flowgraph node "End Stats" (category repeat_instant): gathers the statistics to display on the end screen. For each statistic i: inputs "label_i" (string or translationObject table), "points_i", "maxPoints_i". Hidden input "statData" (previous list) and output "statData" (endStats table) to connect to End Screen, optionally chaining several nodes.

## Notes

- Each statistic also adds relativePoints = points*100/maxPoints when points and maxPoints exist (division by zero if maxPoints = 0).
- The minimum counter in the editor is 1 (ptr < 1 -> 1), whereas count is 0 at initialization.
- work() adds elements to the input table statData (modified in place) every frame.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 37 |
| `C:_onDeserialized(res)` | Restores count. | 105 |
| `C:_onSerialize(res)` | Saves count. | 101 |
| `C:drawCustomProperties()` | "Count" field for the number of statistics. | 41 |
| `C:drawMiddle(builder, style)` | Empty central area. | 32 |
| `C:init()` | count = 0. | 28 |
| `C:updatePins(old, new)` | Adjusts the number of groups of 3 input pins (label, points, maxPoints). | 58 |
| `C:work()` | Takes the input list, adds an entry {label, points, maxPoints, relativePoints} per statistic and writes it to "statData". | 86 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/endStats.lua`.*
