---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/rimPullControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary "rim pull" controller (rim traction command, e.g. rail vehicles/tractors): an input axis input.rimPull (0..1) progressively reduces the torque converter's turbine clutch (from 1 to 0.2 between 0 and 0.5) then adds braking (from 0 to 1 between 0.5 and 1). It runs before vehicleController (defaultOrder 40) to modify input.brake before it is used.
--- Access: controller `powertrainControl/rimPullControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_powertrainControl_rimPullControl
---@field defaultOrder number Execution order (40).
---@field type string "auxiliary".
local controller_powertrainControl_rimPullControl = {}

--- Gets the torque converter (jbeam torqueConverterName).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/rimPullControl.lua:34
---@param jbeamData table Controller jbeam data.
function controller_powertrainControl_rimPullControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/rimPullControl.lua:31
---@param jbeamData table Jbeam data.
function controller_powertrainControl_rimPullControl.reset(jbeamData) end

--- Every frame: converts input.rimPull into a turbine clutch target and additional braking.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/rimPullControl.lua:16
---@param dt number Time step in seconds.
function controller_powertrainControl_rimPullControl.updateGFX(dt) end

return controller_powertrainControl_rimPullControl
