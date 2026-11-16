# `editor_flowgraph_variables`

*File: `lua/ge/extensions/editor/flowgraph/variables.lua` · VM: Game Engine (GE) · 368 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/variables")` (file under extensions/ but not a regular extension)

"Variables" window (fg_variables) of the Flowgraph editor. It shows the variables of the current graph (mgr.graph.variables) and those of the project (mgr.variables) as expandable cards, with the short value, a variable editor, creation of a getter (types/getVariable) or setter (types/setVariable) node by click or drag and drop, and reordering by dragging.

## Notes

- The node creation buttons are only active if mgr.allowEditing is true.
- The new variable order is applied with changeCustomVariableOrder then a "Changed Variable Order" history entry.
- drawGraph, drawRecursive and drawSortedGraphs are not called from draw() in this file (code available to display the variables of all graphs).

## Class `C`

Window class (windowName 'fg_variables', windowDescription 'Variables').

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Deserialization hook: empty. | 363 |
| `C:_onSerialize(data)` | Serialization hook: empty. | 359 |
| `C:draw()` | Draws the "Current Graph Variables" header, the add button (addVariablePopup popup), the graph's variables then the project's. | 30 |
| `C:drawGraph(graph)` | Draws the variables of a graph, with "(current)" if it is the current graph. | 326 |
| `C:drawRecursive(graph)` | Draws a graph in a TreeNode then its children sorted by id. | 330 |
| `C:drawSortedGraphs(source)` | Recursively draws the root graphs (without parentId) of a table, sorted by id. | 346 |
| `C:drawTarget(target, name, id, global)` | Draws all the variables of a container in customVariableOrder order and handles the drop to change the order. | 288 |
| `C:drawVariableCard(target, varName, global)` | Draws a variable's card: type icon, name, value, getter/setter buttons, drag handle and expanded editor. | 200 |
| `C:getAutoTypeFromName(name)` | Infers a variable type from a name via ui_flowgraph_editor.getAutoTypeFromName. | 195 |
| `C:init()` | Initializes the input fields, the drag and drop payload and registers the window. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/variables.lua`.*
