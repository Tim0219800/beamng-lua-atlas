---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/trailerFeet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for trailer kickstands: writes an electric ("feet" by default) to an "attached" value when a coupler of this vehicle attaches to ANOTHER vehicle and to a "detached" value when it detaches. The electric is used to animate/retract the kickstands.
--- Access: controller `trailerFeet` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_trailerFeet
---@field type string "auxiliary".
local controller_trailerFeet = {}

--- Reads the configuration and initializes the electric to startValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/trailerFeet.lua:26
---@param jbeamData table Jbeam data.
function controller_trailerFeet.init(jbeamData) end

--- Hook called by the engine when a coupler attaches; if the other object is another vehicle, sets the electric to attachedValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/trailerFeet.lua:14
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
function controller_trailerFeet.onCouplerAttached(nodeId, obj2id, obj2nodeId) end

--- Hook called when a coupler detaches; if the other object is another vehicle, sets the electric to detachedValue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/trailerFeet.lua:20
---@param nodeId integer Coupler node of this vehicle.
---@param obj2id integer Id of the other vehicle.
---@param obj2nodeId integer Node of the other vehicle.
---@param breakForce number Breaking force (unused).
function controller_trailerFeet.onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

return controller_trailerFeet
