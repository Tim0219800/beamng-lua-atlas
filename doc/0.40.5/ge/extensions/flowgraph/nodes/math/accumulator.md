# `flowgraph_nodes_math_accumulator`

*File: `lua/ge/extensions/flowgraph/nodes/math/accumulator.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/accumulator")` (file under extensions/ but not a regular extension)

Flowgraph node 'Accumulator' (repeat_instant category). Adds the value of the 'value' pin (1 by default) to an internal sum every frame the 'add' pin has flow; 'reset' resets the sum to data.resetValue (0). Outputs: 'result' (sum) and impulse 'changed'.

## Notes

- The description of the reset pin says it 'has priority over add', but if both are active the value is first reset to zero then incremented.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the sum to resetValue and updates result. | 29 |
| `C:_executionStopped()` | Resets the sum to resetValue and updates result. | 34 |
| `C:_onDeserialized()` | Resets the sum to resetValue. | 56 |
| `C:drawMiddle(builder, style)` | Displays the current sum. | 60 |
| `C:init()` | currentSum=0, resetValue=0. | 24 |
| `C:work()` | Applies reset, then adds value if add is active (changed=true), writes result. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/accumulator.lua`.*
