# `flowgraph_nodes_ui_buttons_simpleMultipleButtons`

*File: `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua` · VM: Game Engine (GE) · 174 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons")` (file under extensions/ but not a regular extension)

Flowgraph node "Simple Multiple Buttons" (category once_instant): multi-button version of Simple Button. For each i: inputs "hideWhenDone_i", "label_i", "order_i", "style_i"; outputs "clicked_i" (pulse), "complete_i", "incomplete_i" (hidden), "buttonId_i". The number of buttons is set in the properties.

## Notes

- Bug: workOnce reads self.pinIn.active (nonexistent pin, error) for each button.
- Unlike Simple Button, the outputs are named complete_i / incomplete_i (not used/unused).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Initializes hiddenAfterDone/hiddenAfterReset to false for each button. | 34 |
| `C:_onDeserialized(res)` | Restores the node's state from the saved data. | 168 |
| `C:_onSerialize(res)` | Writes the node's state to the save table. | 164 |
| `C:drawCustomProperties()` | Draws the editor's custom properties panel; returns a string describing the change (for the undo history) or nil. | 43 |
| `C:drawMiddle(builder, style)` | Empty central area. | 30 |
| `C:init()` | count = 1. | 26 |
| `C:onNodeReset()` | Disables each button once and resets hiddenAfterDone to false. | 123 |
| `C:updatePins(old, new)` | Adjusts the number of pin groups (4 inputs, 4 outputs per button). | 60 |
| `C:work()` | For each button, updates clicked/complete/incomplete and disables it if hideWhenDone is set and it is completed. | 146 |
| `C:workOnce()` | Creates all the buttons and writes their ids (see notes: bug). | 135 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/buttons/simpleMultipleButtons.lua`.*
