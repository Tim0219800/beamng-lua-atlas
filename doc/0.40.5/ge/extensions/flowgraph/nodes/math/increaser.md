# `flowgraph_nodes_math_increaser`

*File: `lua/ge/extensions/flowgraph/nodes/math/increaser.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/increaser")` (file under extensions/ but not a regular extension)

Flowgraph node 'Increaser' (repeat_instant category). Keeps the maximum of the input value in memory: if 'value' exceeds the internal value, the latter is replaced. 'clear' resets to data.resetValue (0). Outputs: flow, impulse 'changed', 'result'.

## Notes

- pinOut.changed is only reset to false if 'value' is not nil.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets currentValue to resetValue. | 36 |
| `C:drawMiddle(builder, style)` | Displays the current value. | 60 |
| `C:init()` | currentValue=0, resetValue=0. | 31 |
| `C:work()` | Applies clear, updates the maximum, writes result; flow follows the flow input. | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/increaser.lua`.*
