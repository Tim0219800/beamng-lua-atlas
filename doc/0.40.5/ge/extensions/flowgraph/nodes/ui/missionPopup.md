# `flowgraph_nodes_ui_missionPopup`

*File: `lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/missionPopup")` (file under extensions/ but not a regular extension)

Flowgraph node "Popup" (default category, once + singleActive): displays an information popup that only the button closes (ui_popup.openPopupEntries, type 'info'). Inputs: flow, "reset" (pulse), "title", "text" (string or translatable table), "buttonText" (default 'ui.scenarios.start.start'). Output: flow, set to true on close. Depends on core_input_bindings and ui_popup.

## Notes

- Showing two popups at once queues them (todo from the code).
- _executionStarted is defined twice (the last definition replaces the first and does not reset open/done).
- onFilteredInputChanged is empty.

**Dependencies (loaded first):** `core_input_bindings`, `ui_popup`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets outputs and state. | 30 |
| `C:_executionStopped()` | Closes the popup if open and resets the state. | 50 |
| `C:closeDialogue()` | Closes the tutorial popup if open. | 67 |
| `C:getPopupId()` | Returns the unique identifier of the popup (manager, graph, node). | 63 |
| `C:init()` | open = false, done = false. | 25 |
| `C:onClientEndMission()` | Hook: resets open and _active. | 103 |
| `C:onFilteredInputChanged(devName, action, value)` | Filtered input hook; empty body. | 99 |
| `C:onIntroPopupCareerClosed(id)` | Hook: popup closed (id); if it is this node's, sets the output flow to true. | 91 |
| `C:openDialogue()` | Opens the popup with title, text and button label. | 75 |
| `C:postInit()` | Empty. | 39 |
| `C:reset()` | Resets done, open and _active to false. | 57 |
| `C:work()` | Handles the reset; opens the popup when the input flow is active and it is not already open. | 108 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua`.*
