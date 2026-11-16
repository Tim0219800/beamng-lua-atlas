# `flowgraph_nodes_ui_listDescription`

*File: `lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/listDescription")` (file under extensions/ but not a regular extension)

Flowgraph node "List Description" (category repeat_instant): builds a list text from translation keys or contextual translation objects. Inputs "item_i" (string or table) for each element; output "value" (string). Empty elements are ignored; formatting is done by self.mgr.modules.ui:buildListText.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores count. | 69 |
| `C:_onSerialize(res)` | Saves count. | 65 |
| `C:drawCustomProperties()` | "List Item Count" field. | 29 |
| `C:init()` | count = 1. | 21 |
| `C:postInit()` | Creates the initial pins. | 25 |
| `C:updatePins(old, new)` | Adjusts the number of item_i pins. | 47 |
| `C:work()` | Translates each element (core_locales.translateWithOrWithoutContext), builds the list and writes it to "value". | 74 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua`.*
