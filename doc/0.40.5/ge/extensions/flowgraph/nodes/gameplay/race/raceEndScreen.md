# `flowgraph_nodes_gameplay_race_raceEndScreen`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua` · VM: Game Engine (GE) · 330 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceEndScreen")` (file under extensions/ but not a regular extension)

Flowgraph node "Race End Screen" (no category defined). Displays the end-of-race screen (UI route scenario.quickrace.end) with customizable buttons. Inputs: flow, reset (pulse), title, text (string or table), vehId (vehicle whose detailed stats are shown), stats ('endStats' table), plus one string pin per button defined in the editor (the label; empty = button omitted). Outputs: one flow pin per button, true for the clicked one. The first non-retry button is active by default. The detailed times come from core_hotlapping.getTimeInfo() and the best scores from state.raceComepleteHighscores.

## Notes

- Data options: includeRetryButton (true, triggers extensions.hook('onResetGameplay')) and includeScenarioButton (false, adds the 'openScenarios' button).
- By default a single 'cont' button is created, with the label "Continue".
- The state name "raceComepleteHighscores" (typo) is the one used throughout the highscore nodes' code.
- The code contains a leftover comment closed by "]]" in openDialogue (poorly cleaned commented-out code).
- A button click runs a Lua command that finds the node again via core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Empty. | 154 |
| `C:_executionStarted()` | Sets all outputs to false and resets open/done to false. | 47 |
| `C:_executionStopped()` | Closes the dialog if it is open and resets the state. | 147 |
| `C:_onDeserialized(nodeData)` | Rereads options then calls updateButtons. | 142 |
| `C:_onSerialize(res)` | Saves the options list. | 138 |
| `C:buttonPushed(action)` | Called by a button click: sets the button's output to true, closes the dialog and marks done. | 165 |
| `C:closeDialogue()` | Navigates to the UI route 'play' and marks the screen closed. | 184 |
| `C:closed()` | Sets done = true (closing signaled by the UI). | 306 |
| `C:drawCustomProperties()` | Editor panel: rename, delete, add ("add") or remove ("rem") buttons. | 56 |
| `C:getCmd(action)` | Builds the Lua command string executed by the UI to call buttonPushed(action). | 173 |
| `C:init()` | Initializes the state (open, done, options) and the data options. | 31 |
| `C:onClientEndMission()` | Mission end hook: sets open = false. | 194 |
| `C:onResetGameplay()` | Hook: if the screen is open with the Retry button, closes it and marks done (info log). | 177 |
| `C:openDialogue()` | Builds the buttons and the stats (title, detailed times, highscores) then navigates to scenario.quickrace.end. | 212 |
| `C:postInit()` | Creates the default 'cont' button with the label "Continue". | 40 |
| `C:reset()` | Resets done and open to false. | 160 |
| `C:updateButtons()` | Recreates the string input pins and flow output pins for each button of self.options while preserving existing links. | 91 |
| `C:work()` | Handles reset and opens the dialog on first flow as long as done is false. | 311 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua`.*
