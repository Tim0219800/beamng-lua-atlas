# `flowgraph_nodes_types_setVariable`

*File: `lua/ge/extensions/flowgraph/nodes/types/setVariable.lua` · VM: Game Engine (GE) · 151 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/setVariable")` (file under extensions/ but not a regular extension)

Node "Set Variable" (repeat_instant, hidden from the menus). Writes a graph or project variable from an input pin bearing its name and type. Handles renaming and type changes while keeping compatible links; copies flow to the output.

## Notes

- globalColor = im.ImVec4(1,0.6,0,8,0.75): 5 arguments ("0,8" instead of "0.8").
- The global field is nil until setGlobal is called.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores scope and variable. | 145 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 140 |
| `C:drawCustomProperties()` | Scope checkbox, variable list and variable editor. | 43 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 127 |
| `C:init()` | varName = nil, target = graph variables, useSuffix = false. | 22 |
| `C:renameVariable(source, name, newName)` | Hook: updates node and pin if the variable is renamed. | 88 |
| `C:setGlobal(global)` | Changes the scope (project/graph), the color and removes the current pin. | 28 |
| `C:setVar(name)` | Chooses the variable: recreates the input pin and redoes the links. | 62 |
| `C:typeUpdated(source, name, newType)` | Hook: recreates the pin when the variable's type changes. | 109 |
| `C:work()` | Calls target:change(varName, pin value) and copies flow. | 104 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/setVariable.lua`.*
