# `flowgraph_nodes_ui_threeElementSelect`

*File: `lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua` · VM: Game Engine (GE) · 152 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/threeElementSelect")` (file under extensions/ but not a regular extension)

Flowgraph node "Three Element Select" (default category, once + singleActive): lets the player choose between three elements (UI navigation 'menu.threeElementSelect'). Inputs: flow, "reset", "description", then for i = 1..3: "veh<i>image", "veh<i>name", "veh<i>desc". Outputs: "pick1", "pick2", "pick3".

## Notes

- Showing two of these at the same time will break everything (todo from the code).
- started() sets self.pinOut.flow to true, but this node has no "flow" output pin (error if called).

**Dependencies (loaded first):** `core_input_bindings`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Outputs to false, _active = false. | 44 |
| `C:_executionStopped()` | Closes and resets. | 63 |
| `C:buttonPushed(action)` | Sets the chosen pick output to true, the others to false. | 76 |
| `C:closeDialogue()` | Marks the screen as closed. | 86 |
| `C:closed()` | done = true. | 114 |
| `C:getCmd(action)` | Returns the Lua command that calls buttonPushed(action) back. | 82 |
| `C:init()` | open = false, done = false. | 39 |
| `C:onClientEndMission()` | Hook: resets open and _active. | 127 |
| `C:openDialogue()` | Builds the three elements (image, name, description, button code) and navigates to 'menu.threeElementSelect'. | 91 |
| `C:postInit()` | Empty. | 53 |
| `C:reset()` | Resets done, open and _active to false. | 70 |
| `C:started()` | Closes the screen then writes pinOut.flow (see notes). | 120 |
| `C:work()` | Handles reset; opens the screen when the input flow is active. | 132 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua`.*
