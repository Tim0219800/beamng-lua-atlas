# `flowgraph_nodes_ui_customButtonTEST`

*File: `lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua` · VM: Game Engine (GE) · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/customButtonTEST")` (file under extensions/ but not a regular extension)

Flowgraph node "Custom Button TEST" (category once_instant, description "TEST"): test node that displays a "Click me!" button via the UI hook 'CustomFGButtons'. Output "btn_1" (flow) set to true when the button is clicked. Do not use in production.

## Notes

- Test node: openDialogue/closeDialogue reference self.open but workOnce does not open via openDialogue; self.open stays false, so the dialogue is not closed on stop.
- Depends on core_input_bindings.

**Dependencies (loaded first):** `core_input_bindings`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | open = false. | 25 |
| `C:_executionStopped()` | Closes the dialogue if it is open. | 29 |
| `C:buttonPushed(action)` | Sets the output pin matching the clicked button to true, the others to false. | 35 |
| `C:closeDialogue()` | Sends an empty list to 'CustomFGButtons' (hides the buttons). | 45 |
| `C:getCmd(action)` | Builds the Lua command that calls buttonPushed(action) back on this node. | 41 |
| `C:init()` | open = false. | 21 |
| `C:onNodeReset()` | Closes the dialogue if it is open. | 60 |
| `C:openDialogue()` | Sends the "Click me!" button to the UI and sets done = true. | 49 |
| `C:workOnce()` | Sends the "Click me!" button to the UI (guihooks 'CustomFGButtons'). | 66 |

**UI events (guihooks.trigger):** `CustomFGButtons`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua`.*
