# `flowgraph_nodes_types_getVariable`

*File: `lua/ge/extensions/flowgraph/nodes/types/getVariable.lua` · VM: Game Engine (GE) · 142 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/getVariable")` (file under extensions/ but not a regular extension)

Node "Get Variable" (provider, hidden from the menus: created from the variable editor). Exposes a graph or project variable ("Use Project as Source" checkbox) on an output pin bearing its name and type. Handles renaming and type changes while keeping compatible links.

## Notes

- Bug: globalColor = im.ImVec4(1,0.6,0,8,0.75) has 5 arguments ("0,8" instead of "0.8"): the last one is ignored, alpha = 8.
- work fails if varName is nil (no variable chosen).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores scope and variable. | 136 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 131 |
| `C:drawCustomProperties()` | Scope checkbox, variable list and variable editor. | 25 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 118 |
| `C:init()` | varName = nil, global = false, target = graph variables. | 19 |
| `C:renameVariable(source, name, newName)` | Hook: updates the node and pin name if the tracked variable is renamed. | 85 |
| `C:setGlobal(global)` | Changes the scope (project/graph), the node color and removes the current pin. | 44 |
| `C:setVar(name)` | Chooses the variable: recreates the output pin with the right type and redoes the compatible links. | 59 |
| `C:typeUpdated(source, name, newType)` | Hook: recreates the pin when the variable's type changes. | 101 |
| `C:work()` | Writes target:get(varName) to the pin. | 97 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/getVariable.lua`.*
