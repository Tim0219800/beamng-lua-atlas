# `flowgraph_nodes_ui_updatedUI_endScreenWhole`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua` · VM: Game Engine (GE) · 402 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole")` (file under extensions/ but not a regular extension)

Node "EndScreen Whole" (color ui, singleActive). All-in-one version of the end screen of a scenario/mission: builds the buttons (next missions, Retry, Continue at start, Continue here, custom buttons) and, if data.autoBuild (true by default), also generates the header, the Results panel, the objectives and ratings then ends the UI building. Inputs: flow, reset, text, failed (hidden), change, progressKey, customBtnsFirst (hidden) and pins per button; outputs: flow, build, retry, contStart, contHere and one flow per button.

## Notes

- The node's todo field indicates that two simultaneous nodes of this type break everything.
- Auto-skip tests startingOptions.autoSkipStartScreen while EndScreen Begin tests autoSkipEndScreen (probable inconsistency).
- Unlike EndScreen Begin, openDialogue accesses self.mgr.activity.setupModules without checking that mgr.activity exists.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called after the node is triggered; empty body (commented-out code). | 167 |
| `C:_executionStarted()` | Called when the flowgraph project starts executing; resets the node state. | 51 |
| `C:_executionStopped()` | Called when the project stops; closes the dialogue. | 159 |
| `C:_onDeserialized(nodeData)` | Reloads the custom buttons then recreates the pins. | 154 |
| `C:_onSerialize(res)` | Saves the list of custom buttons (options). | 150 |
| `C:buttonPushed(action)` | Called when a button is clicked: sets the output pin with the same name as the action to true, then closes the dialogue (navigation to "play"). | 173 |
| `C:closeDialogue()` | If built, navigates to "play". | 195 |
| `C:drawCustomProperties()` | Draws the custom button list in the flowgraph editor (text field per button, "add" and "rem" buttons). Returns the reason for the change (string) or nil. | 60 |
| `C:getCmd(action)` | Returns the Lua command (string) that finds this node via core_flowgraphManager.getManagerGraphNode and calls buttonPushed(action); usable from the UI. | 183 |
| `C:init()` | Initializes open, options, data.includeRetryButton=true, data.autoBuild=true and auto-skip. | 36 |
| `C:onClientEndMission()` | Hook called at the end of the mission on the client side; closes the dialogue. | 163 |
| `C:onNodeReset()` | Called when the node is reset (reset pin or graph reset). | 359 |
| `C:onResetGameplay()` | Gameplay reset hook; if the screen is open and Retry is included, closes the dialogue and activates the retry pin. | 187 |
| `C:openDialogue()` | Builds the buttons (see EndScreen Begin) and, if autoBuild, fills the screen (header, Results textPanel, objectives, ratings) then calls finishUIBuilding. | 204 |
| `C:postInit()` | Called right after init, once the pins are created. | 46 |
| `C:updateButtons()` | Recreates the node's pins for each button name in self.options: string input pin (label), bool input pin "<name>_active" (hidden, true by default) and flow output pin. Reconnects the existing links when the name has not changed. | 95 |
| `C:work()` | Handles reset, builds the screen on the first frame of flow, activates build for one frame, and applies auto-skip (startingOptions.autoSkipStartScreen, 2 s) by stopping the mission. | 368 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onResetGameplay` — listened to by 5 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenWhole.lua`.*
