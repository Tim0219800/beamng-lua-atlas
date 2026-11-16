# `flowgraph_nodes_logic_xor`

*File: `lua/ge/extensions/flowgraph/nodes/logic/xor.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/xor")` (file under extensions/ but not a regular extension)

Flowgraph node 'Xor' (logic category). The flow goes out if exactly one of the two inputs a and b has flow.

## Notes

- Compares the values with ~=: if one input is nil and the other false, the result is true (nil ~= false).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | pinOut.flow = (a ~= b). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/xor.lua`.*
