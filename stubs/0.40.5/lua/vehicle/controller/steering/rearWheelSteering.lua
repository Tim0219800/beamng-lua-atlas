---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/steering/rearWheelSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary rear wheel steering controller. In feedForward mode, it computes a rear steering output from a map (wheel speed, front steering) and publishes it in electrics.values.rws (configurable name) for a jbeam steering control to use. The closedLoop mode is not implemented.
--- Access: controller `steering/rearWheelSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_steering_rearWheelSteering
---@field type string "auxiliary".
---@field updateGFX function|nil Assigned in init depending on the mode.
local controller_steering_rearWheelSteering = {}

--- Chooses the update function depending on the mode and loads the feedForward map.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/steering/rearWheelSteering.lua:35
---@param jbeamData table Jbeam data.
function controller_steering_rearWheelSteering.init(jbeamData) end

--- Resets the output electric to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/steering/rearWheelSteering.lua:31
---@param jbeamData table Jbeam data.
function controller_steering_rearWheelSteering.reset(jbeamData) end

return controller_steering_rearWheelSteering
