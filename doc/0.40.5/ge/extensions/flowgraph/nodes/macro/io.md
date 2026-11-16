# `flowgraph_nodes_macro_io`

*File: `lua/ge/extensions/flowgraph/nodes/macro/io.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/macro/io")` (file under extensions/ but not a regular extension)

Macro node 'I/O' (hidden, not deletable): acts as a gateway between a subgraph (macro) and its parent graph. ioType is 'in' (subgraph inputs, customizable output pins) or 'out' (outputs, customizable input pins). The 'out' node asks the Integrated node to update its pins.

## Notes

- Part of drawMiddle is commented-out code (--[[ ]] block); the file therefore contains remnants of an old highlighting.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Reads back name, color and ioType and allows custom pins in the right direction. | 35 |
| `C:_onSerialize(res)` | Saves name, color and ioType (error logged if ioType stayed 'io'). | 24 |
| `C:doubleClicked()` | Selects the target graph in the editor. | 71 |
| `C:drawMiddle(builder, style)` | Displays the name of the target graph and a hover preview. | 47 |
| `C:init()` | savePins=true, ioType='io' (must become 'in' or 'out'), ignoreAsRoot=true. | 17 |
| `C:work()` | For an 'out' node: calls integratedNode:updatePins(). | 77 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/macro/io.lua`.*
