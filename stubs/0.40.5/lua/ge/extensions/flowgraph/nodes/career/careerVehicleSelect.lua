---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_careerVehicleSelect_C
local flowgraph_nodes_career_careerVehicleSelect_C = {}

--- When the graph starts: sets all outputs to false and _active to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:53
function flowgraph_nodes_career_careerVehicleSelect_C:_executionStarted() end

--- Closes the window if it is open then reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:72
function flowgraph_nodes_career_careerVehicleSelect_C:_executionStopped() end

--- Called by the UI: sets to true only the output pin bearing the action's name (test1, pick2...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:85
---@param action string pin name (testN or pickN)
function flowgraph_nodes_career_careerVehicleSelect_C:buttonPushed(action) end

--- Marks the window as closed and inactive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:95
function flowgraph_nodes_career_careerVehicleSelect_C:closeDialogue() end

--- Marks the choice as finished (done) and inactive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:126
function flowgraph_nodes_career_careerVehicleSelect_C:closed() end

--- Builds the Lua command that the UI button will run to call buttonPushed back on this node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:91
---@param action string name of the pin to activate
---@return string  Lua code to run on the GE side
function flowgraph_nodes_career_careerVehicleSelect_C:getCmd(action) end

--- Sets open and done to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:48
function flowgraph_nodes_career_careerVehicleSelect_C:init() end

--- Hook: sets open and _active back to false at the client-side end of mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:139
function flowgraph_nodes_career_careerVehicleSelect_C:onClientEndMission() end

--- Builds the data of the 3 vehicles (image, brand, name, description, button codes, testDisabled) and navigates to 'menu.careerVehicleSelect'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:100
function flowgraph_nodes_career_careerVehicleSelect_C:openDialogue() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:62
function flowgraph_nodes_career_careerVehicleSelect_C:postInit() end

--- Sets done, open and _active back to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:79
function flowgraph_nodes_career_careerVehicleSelect_C:reset() end

--- Closes the window, sets the output flow pin to true and done to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:132
function flowgraph_nodes_career_careerVehicleSelect_C:started() end

--- If reset is active: closes, resets and sets the outputs to false. Otherwise, opens the window once when flow is active and it is not already done.
---Source: lua/ge/extensions/flowgraph/nodes/career/careerVehicleSelect.lua:144
function flowgraph_nodes_career_careerVehicleSelect_C:work() end

