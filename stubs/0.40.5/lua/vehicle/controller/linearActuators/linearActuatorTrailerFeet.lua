---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for the landing legs of a trailer with an electric linear actuator (type "auxiliary"). Same logic as hydraulics/hydraulicTrailerFeet: it stores the cylinder positions in the attached and detached states and automatically brings the legs back on coupling or uncoupling, by writing the motor command into electrics. The difference: the actuator is a powertrain device and one can filter on a specific coupler node.
--- Access: controller `linearActuators/linearActuatorTrailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_linearActuators_linearActuatorTrailerFeet
---@field type string "auxiliary".
local controller_linearActuators_linearActuatorTrailerFeet = {}

--- Returns the state (positions, manual input, coupling state).
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:110
---@return table  State table (reused).
function controller_linearActuators_linearActuatorTrailerFeet.getState() end

--- Finds the actuator and the command electrics name, initializes positions and states.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:74
---@param jbeamData table Controller jbeam data.
function controller_linearActuators_linearActuatorTrailerFeet.init(jbeamData) end

--- Manual command of the legs, -1 to 1; interrupts an automatic movement.
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:28
---@param input number Direction input -1..1.
function controller_linearActuators_linearActuatorTrailerFeet.moveFeet(input) end

--- Hook called by the engine on coupling; starts the movement toward the "attached" position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:62
---@param nodeId integer This vehicle's node.
---@param obj2id integer Partner vehicle id.
---@param obj2nodeId integer Partner's node.
function controller_linearActuators_linearActuatorTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook called on uncoupling; starts the movement toward the "detached" position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:68
---@param nodeId integer This vehicle's node.
---@param obj2id integer Partner vehicle id.
---@param obj2nodeId integer Partner's node.
---@param breakForce number Breaking force (unused).
function controller_linearActuators_linearActuatorTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Restores the state returned by getState.
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:118
---@param data table|nil State table.
function controller_linearActuators_linearActuatorTrailerFeet.setState(data) end

--- Writes the motor command (manual or automatic toward the stored position).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/linearActuators/linearActuatorTrailerFeet.lua:37
---@param dt number Time step (s).
function controller_linearActuators_linearActuatorTrailerFeet.updateGFX(dt) end

return controller_linearActuators_linearActuatorTrailerFeet
