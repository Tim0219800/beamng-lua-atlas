# `flowgraph_nodes_ui_startScreen`

*File: `lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua` · VM: Game Engine (GE) · 183 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/startScreen")` (file under extensions/ but not a regular extension)

Flowgraph node "Start Screen" (default category, once + singleActive): displays the start screen of a scenario (UI navigation 'scenario.start'). Inputs: flow, "reset", "layout" (portrait, htmlOnly, popup), "title", "text" (string or multiTranslationObject), "buttonText" (default 'ui.scenarios.start.start'), "portraitImg", "showProgress" (mission progress), "progressKey". Output: flow set to true when the player starts.

## Notes

- Showing two of these at the same time will break everything (todo from the code).
- _executionStarted is defined twice (the second definition replaces the first, without open/done).
- Old format: _onDeserialized converts hardcodedPins.portraitMode into a portrait/htmlOnly layout.

**Dependencies (loaded first):** `core_input_bindings`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Outputs to false, _active = false. | 34 |
| `C:_executionStopped()` | Closes and resets. | 58 |
| `C:_onDeserialized(data)` | Converts the old portraitMode format into a layout. | 174 |
| `C:buttonPushed(action)` | Sets the button's output to true; the others to false. | 71 |
| `C:closeDialogue()` | Marks the screen as closed. | 81 |
| `C:closed()` | done = true, _active = false. | 136 |
| `C:getCmd(action)` | Returns the Lua command that calls buttonPushed(action) back. | 77 |
| `C:init()` | open = false, done = false. | 29 |
| `C:onClientEndMission()` | Hook: closes the screen. | 152 |
| `C:onFilteredInputChanged(devName, action, value)` | Filtered input hook; empty body. | 141 |
| `C:onScenarioUIReady(state)` | Hook: the UI is ready; sends the stored data back via 'ScenarioChange' if the screen is active. | 130 |
| `C:openDialogue()` | Prepares the data and navigates to 'scenario.start'. | 90 |
| `C:postInit()` | Layout templates. | 43 |
| `C:reset()` | Resets done, open and _active to false. | 65 |
| `C:started()` | Closes the screen and sets the output flow to true. | 145 |
| `C:work()` | Handles reset; opens the screen when the input flow is active. | 156 |

**UI events (guihooks.trigger):** `ScenarioChange`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua`.*
