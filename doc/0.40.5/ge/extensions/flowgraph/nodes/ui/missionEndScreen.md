# `flowgraph_nodes_ui_missionEndScreen`

*File: `lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua` · VM: Game Engine (GE) · 316 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/missionEndScreen")` (file under extensions/ but not a regular extension)

Flowgraph node "Mission End Screen" (category once_instant, singleActive): mission end screen with default and custom buttons (UI navigation 'scenario.end'). Inputs: "text" (string or table), "failed", "change", "progressKey", "customBtnsFirst" (custom buttons before the default ones). Outputs: "retry", "contStart" (continue at the start of the mission), "contHere" (continue here; in career only with its vehicle), plus, for each custom button, an input pin (label), a "<name>_active" pin (hidden bool) and a flow output pin. Default buttons: next missions, Retry, Continue at start (or Scenarios), Continue here.

## Notes

- Showing two of these at the same time will break everything (todo from the code).
- openDialogue reads career_career.isActive() without checking that career_career exists (isTutorial): error if the career extension is not loaded.
- In the career tutorial, only the "Continue here" buttons remain.
- On retry, onResetGameplay sets "retry" to true before closing.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Empty. | 153 |
| `C:_executionStarted()` | Outputs to false, open = false. | 43 |
| `C:_executionStopped()` | Closes the screen. | 149 |
| `C:_onDeserialized(nodeData)` | Restores options. | 144 |
| `C:_onSerialize(res)` | Saves options. | 140 |
| `C:buttonPushed(action)` | Sets the output pin of the clicked button to true (without resetting the others to false) and closes the screen. | 159 |
| `C:closeDialogue()` | If open, navigates to 'play'. | 181 |
| `C:drawCustomProperties()` | Editing of the custom button list. | 50 |
| `C:getCmd(action)` | Returns the Lua command that calls buttonPushed(action) back. | 169 |
| `C:init()` | Empty options and includeRetryButton = true. | 31 |
| `C:onClientEndMission()` | Hook: closes the screen. | 191 |
| `C:onNodeReset()` | Closes the screen and resets the outputs to false. | 304 |
| `C:onResetGameplay()` | Hook: sets retry to true and closes the screen if Retry is enabled. | 173 |
| `C:openDialogue()` | Builds the button list and the mission data, then navigates to 'scenario.end'. | 195 |
| `C:postInit()` | Creates the option pins. | 38 |
| `C:updateButtons()` | Recreates the pins (text, active, output) per option, restoring the links. | 85 |
| `C:workOnce()` | Opens the end screen. | 311 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua`.*
