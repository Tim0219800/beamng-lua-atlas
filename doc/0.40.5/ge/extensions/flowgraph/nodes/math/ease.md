# `flowgraph_nodes_math_ease`

*File: `lua/ge/extensions/flowgraph/nodes/math/ease.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/ease")` (file under extensions/ but not a regular extension)

Flowgraph node 'Ease' (simple category). Applies an easing function to the input value (normally between 0 and 1): linear, in/out/inOut for Quad, Cubic, Quart, Quint, Sin, Exp and Circ. The function is chosen in the node properties.

## Notes

- The UI list (easeFuncNameList) does not include inCubic, outCubic, inOutCubic, although they are defined in easeFunctions.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Reads back easeFuncName and the associated function. | 88 |
| `C:_onSerialize(res)` | Saves easeFuncName. | 84 |
| `C:drawCustomProperties()` | Dropdown of easing functions. | 69 |
| `C:drawMiddle(builder, style)` | Displays the function name. | 102 |
| `C:init()` | Default function: linear. | 63 |
| `C:work()` | If the input is not nil/false, writes easeFunc(value) to the output. | 96 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/ease.lua`.*
