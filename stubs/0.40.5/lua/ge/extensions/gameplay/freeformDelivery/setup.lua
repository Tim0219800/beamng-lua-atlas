---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/setup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Setup and teardown of a freeform delivery. Associates the vehicles already spawned by the loader (delivery._vehicleIndex, by internalName) with the delivery's IDs, applies their starting state (gearbox mode, gear, engine, ignition level), registers previews, schedules couplings (couplings) via util_stepHandler, places the player (in a vehicle, on foot or on a parking spot) and stores the initial positions for a reset.
--- Access: extension `gameplay_freeformDelivery_setup`: `extensions.load("gameplay_freeformDelivery_setup")`, then the global `gameplay_freeformDelivery_setup`
---@class gameplay_freeformDelivery_setup
gameplay_freeformDelivery_setup = {}

--- Tears down the delivery: if keepVehicles, extracts the vehicles from the prefabs (exploding the prefab) and puts them back in MissionGroup; removes the created prefabs (and reloads collision if needed); otherwise removes the vehicles. Then clears all state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:568
---@param delivery table|nil Delivery data (_prefabIds, _hasColliders).
---@param keepVehicles boolean|nil true to keep the vehicles (false by default).
function gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles) end

--- Freezes or unfreezes all vehicles of the delivery (setFreeze action via core_vehicleBridge).
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:557
---@param freeze boolean|nil true by default; false to unfreeze.
function gameplay_freeformDelivery_setup.freezeAllVehicles(freeze) end

--- Returns the list of couplings collected during the last setup.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:549
---@return table[]  Entries {vehId, nodeTag, targetVehId}.
function gameplay_freeformDelivery_setup.getAllCouplingSetup() end

--- List of vehicle IDs with a pending coupling.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:541
---@return integer[]  Object IDs.
function gameplay_freeformDelivery_setup.getPendingCouplings() end

--- Returns the vehicles keyed by object ID.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:553
---@return table<integer, table>  Entries {vehicleId, vehicle, deliveryVehicle}.
function gameplay_freeformDelivery_setup.getSpawnedVehicles() end

--- Converts a delivery vehicle ID into a game object ID.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:529
---@param deliveryVehicleId string Vehicle ID in the delivery definition.
---@return integer|nil  Object ID or nil.
function gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId) end

--- Returns whether the asynchronous setup is finished (all vehicles ready and no coupling pending). When so, sets setupInProgress back to false.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:466
---@return boolean  true if finished or not started.
function gameplay_freeformDelivery_setup.isSetupComplete() end

--- Returns the internal setup-in-progress flag.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:533
---@return boolean  true as long as setup/reset is not finished.
function gameplay_freeformDelivery_setup.isSetupInProgress() end

--- Puts each vehicle back at its initial position/rotation (physics reset, flexmesh repaired), reapplies the starting state then restarts the coupling sequence.
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:490
function gameplay_freeformDelivery_setup.restoreVehicleTransforms() end

--- Prepares the delivery: resolves the target area images, indexes the spawned vehicles, applies the starting state, blacklists non-enterable vehicles, collects and launches the couplings, places the player and stores the initial transforms.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:394
---@param delivery table Delivery data (vehicles, targetAreas, playerStart, _vehicleIndex, _basePath...).
---@return boolean  false if delivery is nil, otherwise true (asynchronous operations continue afterwards).
function gameplay_freeformDelivery_setup.setup(delivery) end

--- Places the player according to delivery.playerStart (vehicle, walking at a position, or walking on a parking spot).
---Source: lua/ge/extensions/gameplay/freeformDelivery/setup.lua:537
---@param delivery table Delivery data containing playerStart.
function gameplay_freeformDelivery_setup.setupPlayer(delivery) end

