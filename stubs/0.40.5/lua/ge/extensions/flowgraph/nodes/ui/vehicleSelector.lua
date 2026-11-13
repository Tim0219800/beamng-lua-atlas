---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua
---@class flowgraph_nodes_ui_vehicleSelector_C
local flowgraph_nodes_ui_vehicleSelector_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:129
function flowgraph_nodes_ui_vehicleSelector_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:140
function flowgraph_nodes_ui_vehicleSelector_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:257
function flowgraph_nodes_ui_vehicleSelector_C:abandonFromUi() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:185
function flowgraph_nodes_ui_vehicleSelector_C:buildScreen() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:163
function flowgraph_nodes_ui_vehicleSelector_C:closeDialogue() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:177
function flowgraph_nodes_ui_vehicleSelector_C:getDefaultVehicle() end

--- The last selection is stored on the flowgraph manager so it is shared across every
---  Vehicle Selector node in the project and survives restarts (used when saveSelection is on).
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:119
function flowgraph_nodes_ui_vehicleSelector_C:getSavedVehData() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:172
function flowgraph_nodes_ui_vehicleSelector_C:getSelectedVehicleDisplayData() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:109
function flowgraph_nodes_ui_vehicleSelector_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:149
function flowgraph_nodes_ui_vehicleSelector_C:onClientEndMission() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:234
function flowgraph_nodes_ui_vehicleSelector_C:requestChangeOpponent() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:153
function flowgraph_nodes_ui_vehicleSelector_C:reset() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:123
---@param vehData any
function flowgraph_nodes_ui_vehicleSelector_C:setSavedVehData(vehData) end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:252
function flowgraph_nodes_ui_vehicleSelector_C:startFromUi() end

---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:262
function flowgraph_nodes_ui_vehicleSelector_C:work() end

