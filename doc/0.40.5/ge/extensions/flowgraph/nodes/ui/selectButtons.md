# `flowgraph_nodes_ui_selectButtons`

*File: `lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua` · VM: Game Engine (GE) · 224 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/selectButtons")` (file under extensions/ but not a regular extension)

Flowgraph node "Select Buttons" (category once_instant, once + singleActive): choice dialogue with several buttons (ui_missionInfo.openDialogue). Inputs: "title", "description" (string or multiTranslationObject), "altMode" (dialogue at the bottom of the screen, hidden), "hideApps" (hides the apps, hidden), and for each option (default accept / decline) a string input pin (label; empty = ignored) and a flow output pin set to true on click.

## Notes

- Showing two of these at the same time will break everything (todo from the code).
- _executionStarted is defined twice (same body).
- If the input flow drops to false while the dialogue is open, it is closed.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Closes the dialogue if the input flow is false. | 164 |
| `C:_executionStarted()` | Resets the outputs to false. | 39 |
| `C:_executionStopped()` | Closes the dialogue if it is open. | 158 |
| `C:_onDeserialized(nodeData)` | Restores options. | 147 |
| `C:_onSerialize(res)` | Saves options. | 143 |
| `C:buttonPushed(action)` | Sets the output of the clicked button to true (the others to false) and closes the dialogue. | 169 |
| `C:closeDialogue()` | Closes the dialogue (ui_missionInfo) and shows the apps again if hidden. | 182 |
| `C:drawCustomProperties()` | Button list editing. | 45 |
| `C:getCmd(action)` | Returns the Lua command that calls buttonPushed(action) back. | 178 |
| `C:init()` | Options {accept, decline}, count = 1. | 27 |
| `C:onNodeReset()` | Closes the dialogue and resets the outputs to false. | 209 |
| `C:openDialogue()` | Builds the buttons and opens the dialogue; hides the apps if hideApps. | 192 |
| `C:postInit()` | Creates the option pins. | 35 |
| `C:updateButtons()` | Recreates the pins per option, restoring the links. | 94 |
| `C:workOnce()` | Opens the dialogue. | 218 |

**UI events (guihooks.trigger):** `ShowApps`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua`.*
