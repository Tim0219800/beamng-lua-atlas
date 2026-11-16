# `flowgraph_nodes_types_genericValue`

*File: `lua/ge/extensions/flowgraph/nodes/types/genericValue.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/genericValue")` (file under extensions/ but not a regular extension)

Node "Generic Set/Get Variable" (repeat_instant). Reads or writes a flowgraph variable by name (varName, + optional numeric suffix concatenated). Source: project variables (mgr.variables) or those of the current graph. In getter mode: output pin val (any); in setter mode: input pin val. The flow is copied to the output.

## Notes

- In getter mode, the output is only written if the value read is "truthy": a variable equal to false or nil does not update the output.
- The field C.value = nil is not used.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores getter/global and recreates the pins. | 57 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 52 |
| `C:drawCustomProperties()` | "Use Project as Source" and "Is Getter" checkboxes. | 82 |
| `C:init()` | getter = true, global = true and getter pins. | 24 |
| `C:setupGetPins()` | Switches to "Generic Getter" mode: output pin val. | 67 |
| `C:setupSetPins()` | Switches to "Generic Setter" mode: input pin val. | 74 |
| `C:work()` | Chooses the variables table, builds the name, then reads (target:get) or writes (target:change) the variable. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/genericValue.lua`.*
