# `flowgraph_nodes_ui_buttons_setMultipleButtonsProperty`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua` · VM: Game Engine (GE) · 113 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Multiple Buttons Property" (category repeat_instant): same as Set Button Property for several buttons. For each i: inputs "buttonId_i", "label_i", "active_i", "order_i", "style_i". Only non-nil properties are applied.

## Notes

- The default value of label_i is "Button": the label is therefore rewritten every frame as long as the pin keeps this value.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores the node's state from the saved data. | 107 |
| `C:_onSerialize(res)` | Writes the node's state to the save table. | 103 |
| `C:drawCustomProperties()` | Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil. | 31 |
| `C:drawMiddle(builder, style)` | Draws the central area of the node in the flowgraph editor. | 27 |
| `C:init()` | count = 1. | 23 |
| `C:updatePins(old, new)` | Adjusts the number of groups of 5 input pins (buttonId, label, active, order, style). | 48 |
| `C:work()` | For each i whose button exists, applies the non-nil properties. | 89 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/setMultipleButtonsProperty.lua`.*
