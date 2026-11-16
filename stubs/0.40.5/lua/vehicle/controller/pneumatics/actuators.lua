---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/actuators.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller (type "auxiliary", defaultOrder 50) for pneumatic cylinders with simplified gas physics: an air tank (energyStorage) feeds, via valves, "virtual buffers" (cross-flow groups) then the pressurized beams of a group. The flows depend on pressure differences and passage cross-sections, the air's energy is conserved (PV = e) and the air consumption empties the tank. One valve per group (valveState -1..1) opens the intake (> 0) or the exhaust; it can be read from an electrics value. It also plays sounds according to the flow.
--- Access: controller `pneumatics/actuators` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_actuators
---@field defaultOrder number 50.
---@field type string "auxiliary".
local controller_pneumatics_actuators = {}

--- Returns the average flow to the beams of a group (m³/s; 0 if not found).
---Source: lua/vehicle/controller/pneumatics/actuators.lua:210
---@param groupName string Group name.
---@return number  Average flow.
function controller_pneumatics_actuators.getAverageFlowRate(groupName) end

--- Returns the average pressure of the beams of a group (absolute Pa; 0 if not found).
---Source: lua/vehicle/controller/pneumatics/actuators.lua:219
---@param groupName string Group name.
---@return number  Average pressure.
function controller_pneumatics_actuators.getAveragePressure(groupName) end

--- Returns the average of the average flows of several groups.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:228
---@param groupNames string[] Group names.
---@return number  Average flow (0 if the list is empty).
function controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames) end

--- Returns the valve state of a group (0 if not found).
---Source: lua/vehicle/controller/pneumatics/actuators.lua:201
---@param groupName string Group name.
---@return number  Valve state -1..1.
function controller_pneumatics_actuators.getValveState(groupName) end

--- Builds beam groups, virtual buffers and flow parameters from the jbeam and finds the air tank.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:528
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_actuators.init(jbeamData) end

--- Creates the flow increase/decrease sound sources for each group. Called by the controller manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:683
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_actuators.initSounds(jbeamData) end

--- Resets pressures, stored energies, valves and virtual buffers to their initial state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:500
function controller_pneumatics_actuators.reset() end

--- Cuts the sound volume and resets their state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:717
function controller_pneumatics_actuators.resetSounds() end

--- Changes the virtual buffer (cross-flow group) a group is connected to; resets the buffer if the group is the first to use it.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:169
---@param groupName string Group name.
---@param crossFlowTag string Virtual buffer name.
function controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag) end

--- Sets the maximum supply pressure of a group.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:154
---@param groupName string Group name.
---@param maxSupplyPressure number Maximum absolute pressure (Pa).
function controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure) end

--- Sets the valve state of a group.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:122
---@param groupName string Group name.
---@param valveState number -1..1; > 0 intake, <= 0 exhaust; the absolute value sets the opening.
function controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState) end

--- Same for several groups.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:163
---@param groupNames string[] Group names.
---@param maxSupplyPressure number Maximum absolute pressure (Pa).
function controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure) end

--- Same for several groups.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:131
---@param groupNames string[] Group names.
---@param valveState number -1..1.
function controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState) end

--- Toggles the valve between 1 (intake) and -1 (exhaust): if the current state is < 0 it goes to 1, otherwise to -1.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:137
---@param groupName string Group name.
function controller_pneumatics_actuators.toggleBeamGroupValveState(groupName) end

--- Same for several groups.
---Source: lua/vehicle/controller/pneumatics/actuators.lua:148
---@param groupNames string[] Group names.
function controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames) end

--- Every physics step: computes the tank -> buffers -> beams flows, updates the pressures and the tank's energy, applies the pressures to the beams.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:243
---@param dt number Time step (s).
function controller_pneumatics_actuators.updateFixedStep(dt) end

--- Every frame: handles the sounds according to the flow, resets the per-tick energies to zero, writes the average relative pressure into electrics and draws the debug graphs.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/actuators.lua:415
---@param dt number Time step (s).
function controller_pneumatics_actuators.updateGFX(dt) end

return controller_pneumatics_actuators
