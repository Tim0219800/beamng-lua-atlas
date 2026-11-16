# `flowgraph_nodes_ui_buttons_getMultipleButtons`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/getMultipleButtons")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Multiple Buttons" (category repeat_instant): watches several previously created buttons. For each i (number set in the properties, 'Button Ids'): input "buttonId_i" (number), outputs "clicked_i" (pulse) and "buttonId_i" (number, the output with the same name as the input).

## Notes

- The output pin buttonId_i is never written by work(); only 'clicked_i' is updated.
- The count is saved in 'count'.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores the node's state from the saved data. | 94 |
| `C:_onSerialize(res)` | Writes the node's state to the save table. | 90 |
| `C:drawCustomProperties()` | Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil. | 29 |
| `C:drawMiddle(builder, style)` | Draws the central area of the node in the flowgraph editor. | 25 |
| `C:init()` | count = 1. | 21 |
| `C:updatePins(old, new)` | Adjusts the number of triplets (input buttonId_i, outputs clicked_i and buttonId_i) by removing extra links and pins or creating the new ones. | 46 |
| `C:work()` | For each i, reads the button buttonId_i and copies button.clicked to "clicked_i". | 78 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/getMultipleButtons.lua`.*
