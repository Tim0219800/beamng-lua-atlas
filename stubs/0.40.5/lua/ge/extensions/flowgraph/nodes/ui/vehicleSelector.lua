---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_vehicleSelector_C
local flowgraph_nodes_ui_vehicleSelector_C = {}

--- Resets the output pins to false and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:129
function flowgraph_nodes_ui_vehicleSelector_C:_executionStarted() end

--- Closes the dialogue and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:140
function flowgraph_nodes_ui_vehicleSelector_C:_executionStopped() end

--- Sets exited=true and closes the dialogue.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:257
function flowgraph_nodes_ui_vehicleSelector_C:abandonFromUi() end

--- Builds the start screen via the ui module (header, Start button, panels, Change Opponent / Abandon buttons) then finishUIBuilding. Logs an error if the ui module is missing.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:185
function flowgraph_nodes_ui_vehicleSelector_C:buildScreen() end

--- If the screen is built, navigates to "play" and clears modules.ui.uiLayout.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:163
function flowgraph_nodes_ui_vehicleSelector_C:closeDialogue() end

--- Returns {model, config} of the player's current vehicle (core_vehicles.getCurrentVehicleDetails) or nil.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:177
function flowgraph_nodes_ui_vehicleSelector_C:getDefaultVehicle() end

--- Returns the selection stored on the flowgraph manager (mgr._vehicleSelectorSavedVeh), shared by all Vehicle Selector nodes of the project.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:119
function flowgraph_nodes_ui_vehicleSelector_C:getSavedVehData() end

--- Returns the display data (name, thumbnail, stats) of the selected vehicle, or nil.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:172
function flowgraph_nodes_ui_vehicleSelector_C:getSelectedVehicleDisplayData() end

--- Initializes built/done/exited/_needsRebuild and the selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:109
function flowgraph_nodes_ui_vehicleSelector_C:init() end

--- End-of-mission hook on the client side; closes the dialogue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:149
function flowgraph_nodes_ui_vehicleSelector_C:onClientEndMission() end

--- Opens the game's vehicle selector (ui_vehicleSelector_general.openVehicleSelectorForChallenge, loaded if needed). On return, stores the choice and requests a rebuild of the screen.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:234
function flowgraph_nodes_ui_vehicleSelector_C:requestChangeOpponent() end

--- Resets built/done/exited and resets the output pins to false (called via the reset pin).
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:153
function flowgraph_nodes_ui_vehicleSelector_C:reset() end

--- Stores the selection on the flowgraph manager.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:123
---@param vehData table {model, config, additionalData}.
function flowgraph_nodes_ui_vehicleSelector_C:setSavedVehData(vehData) end

--- Marks the choice as confirmed (done=true) and closes the dialogue.
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:252
function flowgraph_nodes_ui_vehicleSelector_C:startFromUi() end

--- Handles reset; on the first frame chooses the vehicle (saved if saveSelection, otherwise default) and builds the screen; rebuilds if requested; publishes model, config, color, dial, flow (done) and exit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:262
function flowgraph_nodes_ui_vehicleSelector_C:work() end

