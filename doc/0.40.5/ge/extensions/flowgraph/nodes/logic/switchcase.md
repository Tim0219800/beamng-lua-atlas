# `flowgraph_nodes_logic_switchcase`

*File: `lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua` · VM: Game Engine (GE) · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/switchcase")` (file under extensions/ but not a regular extension)

Flowgraph node 'Switch Case' (logic category). Compares the input value 'value' with N values value_i (strict equality) and sets the matching output match_i to true; 'none' is true if none match. The output flow is always true.

## Notes

- The flow output is always true, even if the input flow is inactive: the input pin 'flow' is not read.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 36 |
| `C:_onDeserialized(res)` | Reads back count (1 by default) and recreates the pins. | 100 |
| `C:_onSerialize(res)` | Saves count. | 96 |
| `C:drawCustomProperties()` | Panel: number of cases (Count). | 40 |
| `C:drawMiddle(builder, style)` | Draws the middle of the node (empty). | 31 |
| `C:init()` | count=1. | 26 |
| `C:updatePins(old, new)` | Creates or deletes the value_i and match_i pins and the associated links. | 57 |
| `C:work()` | flow=true; for each i, match_i = (value_i == value); none = no match. | 82 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua`.*
