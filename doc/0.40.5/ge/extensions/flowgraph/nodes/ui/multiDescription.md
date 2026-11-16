# `flowgraph_nodes_ui_multiDescription`

*File: `lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/multiDescription")` (file under extensions/ but not a regular extension)

Flowgraph node "Multi Description" (category repeat_instant): merges several texts into a multiple description for Start Screen / End Screen. Inputs "value_i" (any); output "value" (table of type multiTranslationObject: list of values).

## Notes

- drawMiddle uses self.data.pattern, inherited from another node (nil in practice).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores count. | 69 |
| `C:_onSerialize(res)` | Saves count. | 65 |
| `C:drawCustomProperties()` | "Count" field. | 29 |
| `C:drawMiddle(builder, style)` | Displays self.data.pattern (first 10 characters) if defined. | 82 |
| `C:init()` | count = 1. | 21 |
| `C:postInit()` | Creates the initial pins. | 25 |
| `C:updatePins(old, new)` | Adjusts the number of value_i pins. | 47 |
| `C:work()` | Builds the list of input values and writes it to "value". | 75 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua`.*
