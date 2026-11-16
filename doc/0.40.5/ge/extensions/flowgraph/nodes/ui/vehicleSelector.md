# `flowgraph_nodes_ui_vehicleSelector`

*File: `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua` · VM: Game Engine (GE) · 307 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/vehicleSelector")` (file under extensions/ but not a regular extension)

Node "Vehicle Selector" (color ui, singleActive, depends on core_input_bindings). Opens a start screen (via the ui module) with a vehicle selector for an opponent: text panel, vehicleSelector panel (name, thumbnail, Power/Weight/Top Speed stats), "Change Opponent" and "Abandon" buttons. Inputs: flow, reset (pulse), title, text, startButtonText (hidden), changeOpponentLabel, abandonLabel, saveSelection (keeps the last choice between restarts; otherwise returns to the player's vehicle). Outputs: flow (once Start is pressed), exit (Abandon pressed), model, config, color, dial (hidden, 1/4-mile time, 12 by default).

## Notes

- Local functions: getVehicleDial (core_vehicles config "Performance Data"/"Drag Times" .time_1_4, otherwise 12), getVehicleColor (default paint of the model/config), getVehicleDisplayData.
- The stats are obtained via ui_vehicleSelector_vehicleSpecifications.makeSpec, loaded on demand.

**Dependencies (loaded first):** `core_input_bindings`

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the output pins to false and resets the state. | 129 |
| `C:_executionStopped()` | Closes the dialogue and resets the state. | 140 |
| `C:abandonFromUi()` | Sets exited=true and closes the dialogue. | 257 |
| `C:buildScreen()` | Builds the start screen via the ui module (header, Start button, panels, Change Opponent / Abandon buttons) then finishUIBuilding. Logs an error if the ui module is missing. | 185 |
| `C:closeDialogue()` | If the screen is built, navigates to "play" and clears modules.ui.uiLayout. | 163 |
| `C:getDefaultVehicle()` | Returns {model, config} of the player's current vehicle (core_vehicles.getCurrentVehicleDetails) or nil. | 177 |
| `C:getSavedVehData()` | Returns the selection stored on the flowgraph manager (mgr._vehicleSelectorSavedVeh), shared by all Vehicle Selector nodes of the project. | 119 |
| `C:getSelectedVehicleDisplayData()` | Returns the display data (name, thumbnail, stats) of the selected vehicle, or nil. | 172 |
| `C:init()` | Initializes built/done/exited/_needsRebuild and the selection. | 109 |
| `C:onClientEndMission()` | End-of-mission hook on the client side; closes the dialogue. | 149 |
| `C:requestChangeOpponent()` | Opens the game's vehicle selector (ui_vehicleSelector_general.openVehicleSelectorForChallenge, loaded if needed). On return, stores the choice and requests a rebuild of the screen. | 234 |
| `C:reset()` | Resets built/done/exited and resets the output pins to false (called via the reset pin). | 153 |
| `C:setSavedVehData(vehData)` | Stores the selection on the flowgraph manager. | 123 |
| `C:startFromUi()` | Marks the choice as confirmed (done=true) and closes the dialogue. | 252 |
| `C:work()` | Handles reset; on the first frame chooses the vehicle (saved if saveSelection, otherwise default) and builds the screen; rebuilds if requested; publishes model, config, color, dial, flow (done) and exit. | 262 |

**Loads extensions:** `ui_vehicleSelector_general`, `ui_vehicleSelector_vehicleSpecifications`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua`.*
