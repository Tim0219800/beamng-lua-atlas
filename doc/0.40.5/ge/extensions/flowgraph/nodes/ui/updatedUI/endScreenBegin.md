# `flowgraph_nodes_ui_updatedUI_endScreenBegin`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua` · VM: Game Engine (GE) · 375 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin")` (file under extensions/ but not a regular extension)

Node "EndScreen Begin" (default category, color ui). Starts building the end screen of a mission: on the first frame with flow active, it calls modules.ui:startUIBuilding('endScreen'), builds the buttons (Retry, Continue at start, Continue here, custom buttons, next missions) then activates the build pin. The "EndScreen ..." nodes chained afterwards add the panels, and a "Screen Finish" node ends the building. Pins: inputs flow, reset (pulse), change (table, result of an attempt), customBtnsFirst (hidden), contStartActive / contHereActive (hidden, true) and one string pin + one bool "_active" pin per custom button; outputs flow, build (chainFlow), retry, contStart, contHere and one flow per custom button. Runs while flow is active.

## Notes

- The output flow pin is always reset to false at the end of work; only build (one frame) is used to chain the panels.
- The "Continue here" button exists in career only if the player uses their own vehicle; in the career tutorial only this button remains.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project starts executing; resets the node state. | 46 |
| `C:_executionStopped()` | Called when the project stops; closes the dialogue. | 54 |
| `C:_onDeserialized(nodeData)` | Reloads the custom buttons then recreates the pins. | 156 |
| `C:_onSerialize(res)` | Saves the list of custom buttons (options). | 152 |
| `C:buttonPushed(action)` | Called when a button is clicked: sets the output pin with the same name as the action to true, then closes the dialogue (navigation to "play"). | 161 |
| `C:closeDialogue()` | If the screen was built, navigates to the "play" screen to close the end screen. | 325 |
| `C:drawCustomProperties()` | Draws the custom button list in the flowgraph editor (text field per button, "add" and "rem" buttons). Returns the reason for the change (string) or nil. | 62 |
| `C:init()` | Initializes open=false, the list of custom buttons, data.includeRetryButton=true and the auto-skip timer. | 33 |
| `C:onClientEndMission()` | Hook called at the end of the mission on the client side; closes the dialogue. | 58 |
| `C:onNodeReset()` | Resets the output pins to false and resets open/built. | 331 |
| `C:onResetGameplay()` | Hook called on a gameplay reset; if the screen is open and the Retry button is included, navigates to "play" and activates the retry pin. | 171 |
| `C:openDialogue()` | Emits the onEndScreenUIOpened hook and builds the button list: Retry (with career entry fee, disabled if the player cannot pay), Continue at start (or return to scenarios if launched as a scenario), Continue here (outside career, or career with the player's vehicle), tutorial restriction, custom buttons, then "Start Next Mission" buttons. The order is reversed and the first button gets the focus. | 179 |
| `C:postInit()` | Called right after init, once the pins are created. | 41 |
| `C:updateButtons()` | Recreates the node's pins for each button name in self.options: string input pin (label), bool input pin "<name>_active" (hidden, true by default) and flow output pin. Reconnects the existing links when the name has not changed. | 97 |
| `C:work()` | If reset is active, resets the node. When flow is active and the screen is not yet built, starts the UI building and opens the dialogue. Handles auto-skip: if startingOptions.autoSkipEndScreen is set, stops the mission after 2 s of real time. | 342 |
| `C:workOnce()` | Variant executed only once by the flowgraph engine (empty body here). | 339 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEndScreenUIOpened` — listened to by 1 module(s)
- `onResetGameplay` — listened to by 5 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenBegin.lua`.*
