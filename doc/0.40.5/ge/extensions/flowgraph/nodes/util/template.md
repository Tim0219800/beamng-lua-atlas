# `flowgraph_nodes_util_template`

*File: `lua/ge/extensions/flowgraph/nodes/util/template.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/template")` (file under extensions/ but not a regular extension)

Node "Template Node": documented example of everything a programmer can use to create a flowgraph node. Shows the possible categories (repeat_instant, repeat_p_duration, repeat_f_duration, once_instant, once_p_duration, once_f_duration, dynamic_*, simple, provider, logic), all pin types (flow, number, bool, string, vec3, quat, color, table, any, multi-type), pin options (default, hidden, hardcoded, tableType), C.todo, C.dependencies, C.color, C.type, C.tags and the lifecycle functions. Each function just displays a message with print. Useful as a template for a modder.

## Notes

- In _onDeserialized, myField stays nil if the old record did not have this field, which would make im.ArrayChar fail in drawCustomProperties.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the project starts, before any work. | 121 |
| `C:_executionStopped()` | Called when the project stops. | 130 |
| `C:_onClear()` | Called when the node must be cleaned up (before serialization, before start...); by default calls _executionStopped. | 135 |
| `C:_onDeserialized(data)` | Restores the custom fields (self.data is restored automatically). | 189 |
| `C:_onSerialize(res)` | Saves the custom fields in res (self.data is saved automatically). | 182 |
| `C:destroy()` | Called when the node is deleted. | 195 |
| `C:drawCustomProperties()` | Imgui code displayed in the properties window (text field and slider); returning a string creates a history point (undo/redo). | 148 |
| `C:drawMiddle(builder, style)` | Imgui code displayed in the node; must start with builder:Middle(). | 166 |
| `C:hideProperties()` | Called when the properties are no longer displayed. | 160 |
| `C:init(mgr)` | Called when the node is first created; initializes myField, the data table and the sliderWidth cursor. | 109 |
| `C:showProperties()` | Called when the node's properties are displayed. | 141 |
| `C:work()` | Called when the node must run its function. | 125 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/template.lua`.*
