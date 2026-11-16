---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/trailerRespawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_trailerRespawn`: remembers which vehicles tow which trailer (registry `trailerReg`) from coupling events, and repositions the trailer behind the towing vehicle when the latter is reset or reactivated. Depends on core_vehicles (vehsCouplerOffset, vehsCouplerTags, couplerTagsOptions) and on spawn.placeTrailer. Useful to query the composition of a road train (getVehicleTrain, getVehicleTrainHead).
--- Access: extension `core_trailerRespawn`: `extensions.load("core_trailerRespawn")`, then the global `core_trailerRespawn`
---@class core_trailerRespawn
---@field debugEnabled boolean false by default; the debug display of coupling nodes (debugUpdate) is not hooked up (M.onPreRender is commented out).
---@field dependencies string[] {'core_vehicleBridge'}
core_trailerRespawn = {}

--- If the coupler tag is of type 'autoCouple' (core_vehicles.couplerTagsOptions), runs beamstate.activateAutoCoupling(tag) on the tow vehicle.
---Source: lua/ge/extensions/core/trailerRespawn.lua:187
---@param vehId integer tow vehicle
function core_trailerRespawn.coupleTrailer(vehId) end

--- Walks up the couplings to find the non-trailer vehicle that tows the chain containing vehId.
---Source: lua/ge/extensions/core/trailerRespawn.lua:103
---@param vehId integer starting vehicle
---@return integer|false  identifier of the first non-trailer vehicle, false if the chain only contains trailers
function core_trailerRespawn.getAttachedNonTrailer(vehId) end

--- Returns a vehicle's type ('Car', 'Trailer', 'Prop'...), from its config (aggregates.Type) or, failing that, its model's Type.
---Source: lua/ge/extensions/core/trailerRespawn.lua:88
---@param objId integer vehicle identifier
---@return string  type
function core_trailerRespawn.getConfigType(objId) end

--- Returns the module's `enabled` variable (see notes: not updated by setEnabled).
---Source: lua/ge/extensions/core/trailerRespawn.lua:251
---@return boolean  true as long as resetData/onDeserialized have not changed it
function core_trailerRespawn.getEnabled() end

--- Returns the vehicle that tows vehId (the one whose registered trailer is vehId).
---Source: lua/ge/extensions/core/trailerRespawn.lua:47
---@param vehId integer trailer identifier
---@return integer|nil  tow vehicle identifier, nil if there is none
function core_trailerRespawn.getPreviousAttachedVehicleId(vehId) end

--- Returns the internal registry trailerReg (not a copy).
---Source: lua/ge/extensions/core/trailerRespawn.lua:31
---@return table<integer, {trailerId: integer, trailerNode: integer, node: integer}>  [towVehicleId] = coupling info
function core_trailerRespawn.getTrailerData() end

--- Returns all vehicles connected to vehId, forward and backward.
---Source: lua/ge/extensions/core/trailerRespawn.lua:64
---@param vehId integer starting vehicle
---@param res table|nil accumulator table (internal use, leave nil)
---@param forward boolean|nil true: only toward the tow vehicle; false: only toward the trailers; nil: both
---@return table<integer, boolean>  set [vehId] = true
function core_trailerRespawn.getVehicleTrain(vehId, res, forward) end

--- Walks up the coupling chain to the first vehicle (head of the train).
---Source: lua/ge/extensions/core/trailerRespawn.lua:55
---@param vehId integer starting vehicle
---@return integer  train head identifier (vehId itself if it is not towed)
function core_trailerRespawn.getVehicleTrainHead(vehId) end

--- Indicates whether trailerId is part of the chain towed by vehId.
---Source: lua/ge/extensions/core/trailerRespawn.lua:243
---@param vehId integer tow vehicle
---@param trailerId integer trailer searched for
---@return boolean  true if connected (directly or through a chain)
function core_trailerRespawn.isVehicleCoupledToTrailer(vehId, trailerId) end

--- Hook: a coupling closes. Records the tow/trailer direction in trailerReg (the non-trailer tows), ignores Props and loops, then emits onTrailerAttached(objId1, objId2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:130
---@param objId1 integer first vehicle
---@param objId2 integer second vehicle
---@param nodeId integer node of the first
---@param obj2nodeId integer node of the second
function core_trailerRespawn.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Hook: a coupling opens. Only removes the record if breakForce is 0 (voluntary detachment), with a one-frame delay (job) so as not to prevent the trailer's reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:148
---@param objId1 integer first vehicle
---@param objId2 integer second vehicle
---@param nodeId integer node of the first
---@param obj2nodeId integer node of the second
---@param breakForce number|nil break force; ignored if nil or > 0
function core_trailerRespawn.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- Hook: restores the registry and reapplies setEnabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:19
---@param data table data from onSerialize
function core_trailerRespawn.onDeserialized(data) end

--- Hook: saves the registry and the enabled state before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:12
---@return table  {trailerReg, enabled}
function core_trailerRespawn.onSerialize() end

--- Hook: a vehicle is activated/deactivated. Aligns the active state of its trailer and, on activation, repositions it behind the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:158
---@param vehId integer vehicle
---@param active boolean new state
function core_trailerRespawn.onVehicleActiveChanged(vehId, active) end

--- Hook: a vehicle is destroyed; clears its coupling records.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:212
---@param vehId integer vehicle
function core_trailerRespawn.onVehicleDestroyed(vehId) end

--- Hook: a vehicle is reset; repositions its trailer behind it (disabled in multiplayer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:203
---@param vehId integer vehicle
function core_trailerRespawn.onVehicleResetted(vehId) end

--- Hook: a vehicle spawns; clears its old coupling records.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/trailerRespawn.lua:198
---@param vehId integer vehicle
function core_trailerRespawn.onVehicleSpawned(vehId) end

--- Repositions the registered trailer of vehId behind it (spawn.placeTrailer, from coupler offsets).
---Source: lua/ge/extensions/core/trailerRespawn.lua:178
---@param vehId integer tow vehicle
function core_trailerRespawn.placeTrailer(vehId) end

--- Clears the trailer registry and re-enables the system.
---Source: lua/ge/extensions/core/trailerRespawn.lua:25
function core_trailerRespawn.resetData() end

--- Enables or disables coupling recording (replaces onCouplerAttached/onCouplerDetached with the empty function nop if false).
---Source: lua/ge/extensions/core/trailerRespawn.lua:233
---@param enabled boolean desired state
function core_trailerRespawn.setEnabled(enabled) end

