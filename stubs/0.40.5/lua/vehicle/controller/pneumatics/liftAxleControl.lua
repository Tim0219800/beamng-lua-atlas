---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/liftAxleControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary pneumatic axle lift controller (trailers/trucks). Two modes: "lift" (axle raised: lift airbags inflated, main airbags emptied) and "drop" (axle lowered: the opposite), driven via two actuator controllers (airbags). In drop mode, the maximum supply pressure of the main airbags can be changed dynamically (load carried by the axle). Publishes the relative average pressures and the mode in electrics.values.
--- Access: controller `pneumatics/liftAxleControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_liftAxleControl
---@field type string "auxiliary".
local controller_pneumatics_liftAxleControl = {}

--- Saveable state: mode, maximum supply pressure, rate of change (keys prefixed by the controller name).
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:115
---@return table  State table.
function controller_pneumatics_liftAxleControl.getState() end

--- Reads the jbeam keys, airbag group names and electrics names.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:77
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_liftAxleControl.init(jbeamData) end

--- Gets the two actuator controllers then switches to "lift" mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:95
---@param jbeamData table Jbeam data.
function controller_pneumatics_liftAxleControl.initLastStage(jbeamData) end

--- Sets the supply pressure change rate to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:73
---@param jbeamData table Jbeam data.
function controller_pneumatics_liftAxleControl.reset(jbeamData) end

--- Sets the maximum supply pressure of the main airbags (absolute Pa), applied in drop mode.
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:65
---@param maxSupplyPressure number Pressure in Pa.
function controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure) end

--- Sets the rate of change of this maximum pressure (Pa/s, signed).
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:69
---@param maxSupplyPressureChangeRate number Change in Pa/s.
function controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate) end

--- Chooses the "lift" or "drop" mode and opens/closes the valves of the two airbag groups accordingly.
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:46
---@param mode string "lift" or "drop".
function controller_pneumatics_liftAxleControl.setMode(mode) end

--- Restores pressure, rate and mode (NaN values ignored).
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:122
---@param data table|nil Table produced by getState.
function controller_pneumatics_liftAxleControl.setState(data) end

--- Toggles between drop and lift.
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:57
function controller_pneumatics_liftAxleControl.toggleMode() end

--- Every frame: applies the maximum supply pressure in drop mode, makes it evolve and updates the pressure and mode electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/liftAxleControl.lua:32
---@param dt number Time step in seconds.
function controller_pneumatics_liftAxleControl.updateGFX(dt) end

return controller_pneumatics_liftAxleControl
