# `flowgraph_nodes_career_careerVehicleSelect`

*File: `lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/careerVehicleSelect")` (file under extensions/ but not a regular extension)

Flowgraph node "Career Vehicle Select" (behaviour once + singleActive, depends on core_input_bindings). Opens the career menu 'menu.careerVehicleSelect' where the player chooses among 3 vehicles, to test or pick them. Inputs: flow, reset (impulse), description (string or translation table), and for each vehicle i=1..3: vehNimage, vehNname, vehNbrand, vehNdesc, vehNtestDisabled. Flow outputs (only one is true depending on the button): test1, pick1, test2, pick2, test3, pick3. The UI buttons call the node back via a generated Lua command (getCmd).

## Notes

- _executionStarted is defined twice; the second definition overwrites the first and does not reset open/done.
- The functions closed() and started() exist but are not called in this file (they may be called from the UI).
- The output pin "flow" is used by started() whereas the schema declares no output pin named flow (apart from the implicit flow).

**Dependencies (loaded first):** `core_input_bindings`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | When the graph starts: sets all outputs to false and _active to false. | 53 |
| `C:_executionStopped()` | Closes the window if it is open then reset(). | 72 |
| `C:buttonPushed(action)` | Called by the UI: sets to true only the output pin bearing the action's name (test1, pick2...). | 85 |
| `C:closeDialogue()` | Marks the window as closed and inactive. | 95 |
| `C:closed()` | Marks the choice as finished (done) and inactive. | 126 |
| `C:getCmd(action)` | Builds the Lua command that the UI button will run to call buttonPushed back on this node. | 91 |
| `C:init()` | Sets open and done to false. | 48 |
| `C:onClientEndMission()` | Hook: sets open and _active back to false at the client-side end of mission. | 139 |
| `C:openDialogue()` | Builds the data of the 3 vehicles (image, brand, name, description, button codes, testDisabled) and navigates to 'menu.careerVehicleSelect'. | 100 |
| `C:postInit()` | Empty. | 62 |
| `C:reset()` | Sets done, open and _active back to false. | 79 |
| `C:started()` | Closes the window, sets the output flow pin to true and done to true. | 132 |
| `C:work()` | If reset is active: closes, resets and sets the outputs to false. Otherwise, opens the window once when flow is active and it is not already done. | 144 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua`.*
