---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for a trailer's hydraulic landing legs (type "auxiliary"). It stores the cylinder position when the trailer is attached and detached (by manual adjustment) and automatically brings the legs back to the right position on coupling or uncoupling, by writing the cylinder direction into electrics (the cylinder's directionElectricsName).
--- Access: controller `hydraulics/hydraulicTrailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_hydraulicTrailerFeet
---@field type string "auxiliary".
local controller_hydraulics_hydraulicTrailerFeet = {}

--- Returns the state (stored positions, manual input, coupling state).
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:95
---@return table  State table (reused).
function controller_hydraulics_hydraulicTrailerFeet.getState() end

--- Finds the cylinder and initializes the positions and states.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:73
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_hydraulicTrailerFeet.init(jbeamData) end

--- Manual command of the legs: -1 to 1 (the direction is written into electrics). Interrupts an ongoing automatic movement.
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:27
---@param input number Direction input -1..1.
function controller_hydraulics_hydraulicTrailerFeet.moveFeet(input) end

--- Hook called by the engine when a coupler of the vehicle attaches; starts the movement toward the "attached" position if the other object is another vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:61
---@param nodeId integer This vehicle's node.
---@param obj2id integer Partner vehicle id.
---@param obj2nodeId integer Partner's node.
function controller_hydraulics_hydraulicTrailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook called when a coupler detaches; starts the movement toward the "detached" position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:67
---@param nodeId integer This vehicle's node.
---@param obj2id integer Partner vehicle id.
---@param obj2nodeId integer Partner's node.
---@param breakForce number Breaking force (unused).
function controller_hydraulics_hydraulicTrailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Restores the state returned by getState.
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:103
---@param data table|nil State table.
function controller_hydraulics_hydraulicTrailerFeet.setState(data) end

--- Writes the cylinder direction (manual or automatic toward the stored position).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/hydraulicTrailerFeet.lua:36
---@param dt number Time step (s).
function controller_hydraulics_hydraulicTrailerFeet.updateGFX(dt) end

return controller_hydraulics_hydraulicTrailerFeet
