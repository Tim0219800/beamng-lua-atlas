# `flowgraph_nodes_ui_endScreen`

*File: `lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua` · VM: Game Engine (GE) · 335 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/endScreen")` (file under extensions/ but not a regular extension)

Flowgraph node "End Screen" (category once_instant, singleActive): displays the end screen of a scenario with customizable buttons (UI navigation 'scenario.end'). Inputs: "title", "text" (string or table), "progress", "timeStr" (text or seconds -> MM:SS.ss), "successString", "failString", "failed", "medal", "autoPoints", "points", "maxPoints", "portraitSuccess", "portraitFail", "stats" (endStats), "change", "attempt", "progressKey". Each button option (editable list, default "cont") creates a string input pin (label) and a flow output pin set to true on click. Buttons added automatically: Retry (data.includeRetryButton), Scenarios (data.includeScenarioButton) and "Start Next Mission" for each following mission of the activity.

## Notes

- Showing two of these at the same time will break everything (todo from the code).
- Bug: with autoPoints, 'points + v.points or 0' and 'max + v.maxPoints or 0' have wrong operator precedence (the 'or' applies to the sum), so a statistic without points causes an addition error with nil.
- If failed is true, the medal is forced to 'wood'.
- The missionData block (progress, leaderboard, stars) is built only if an activity is in progress and the "change" pin is connected.
- A commented-out block at the end of openDialogue references an undefined variable 'change'.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Empty. | 167 |
| `C:_executionStarted()` | Resets all output pins to false and open = false. | 63 |
| `C:_executionStopped()` | Closes the screen. | 163 |
| `C:_onDeserialized(nodeData)` | Restores the node's state from the saved data. | 158 |
| `C:_onSerialize(res)` | Writes the node's state to the save table. | 154 |
| `C:buttonPushed(action)` | Called by the UI when a button is clicked; sets the output pin named after the button to true (the others to false) and closes the dialogue. | 173 |
| `C:closeDialogue()` | If the screen is open, navigates to the UI state 'play' and open = false. | 193 |
| `C:drawCustomProperties()` | Button list editing (rename, delete if text is empty, add, rem). | 70 |
| `C:getCmd(action)` | Returns the Lua command that finds this node and calls buttonPushed(action). | 182 |
| `C:init()` | Initializes options, oldOptions, open = false and data.includeRetryButton = true. | 43 |
| `C:onClientEndMission()` | Hook: closes the screen at the end of the level. | 203 |
| `C:onNodeReset()` | Closes the screen and resets the outputs to false. | 323 |
| `C:onResetGameplay()` | Hook: closes the screen if the Retry button is active. | 186 |
| `C:openDialogue()` | Assembles buttons, text, time, medal, points, stats, portraits and mission data, then navigates to 'scenario.end'. | 207 |
| `C:postInit()` | Creates the "cont" (Continue) option, the corresponding pins and the templates of the medal pin. | 51 |
| `C:updateButtons()` | Recreates the button pins according to options, restoring the existing links. | 105 |
| `C:workOnce()` | Opens the end screen. | 330 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua`.*
