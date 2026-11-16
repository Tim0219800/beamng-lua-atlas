# `gameplay_freeformDelivery_setup`

*File: `lua/ge/extensions/gameplay/freeformDelivery/setup.lua` · VM: Game Engine (GE) · 689 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_setup`: `extensions.load("gameplay_freeformDelivery_setup")`, then the global `gameplay_freeformDelivery_setup`

Setup and teardown of a freeform delivery. Associates the vehicles already spawned by the loader (delivery._vehicleIndex, by internalName) with the delivery's IDs, applies their starting state (gearbox mode, gear, engine, ignition level), registers previews, schedules couplings (couplings) via util_stepHandler, places the player (in a vehicle, on foot or on a parking spot) and stores the initial positions for a reset.

## Notes

- Vehicles are not spawned here: setup() finds them via delivery._vehicleIndex[internalName]; a missing entry is logged as an error and ignored.
- startupCode accepts driveMode (setGearboxMode), gear (setGear on the transmission device), engineOn (startEngine/stopEngine); setIgnitionLevel goes through core_vehicleBridge.executeAction.
- playerStart.type: "vehicle" (vehicleId), "walking" (position {x,y,z}, optional rotation {x,y,z,w}) or "parkingSpot" (targetAreaId of a parkingSpot-type zone).
- Couplings: wait for vehicles to be ready (8 s max), activation via beamstate.activateAutoCoupling(nodeTag), then verification in core_trailerRespawn (8 s max). The timeouts are safeguards: on timeout the sequence continues without blocking.
- Check isSetupComplete() before starting: it stays false as long as a vehicle is not ready or a coupling is pending.
- A vehicle with enterable == false is added to the gameplay_walk blacklist.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles)` | Tears down the delivery: if keepVehicles, extracts the vehicles from the prefabs (exploding the prefab) and puts them back in MissionGroup; removes the created prefabs (and reloads collision if needed); otherwise removes the vehicles. Then clears all state. *(internal)* | 568 |
| `gameplay_freeformDelivery_setup.freezeAllVehicles(freeze)` | Freezes or unfreezes all vehicles of the delivery (setFreeze action via core_vehicleBridge). | 557 |
| `gameplay_freeformDelivery_setup.getAllCouplingSetup()` | Returns the list of couplings collected during the last setup. | 549 |
| `gameplay_freeformDelivery_setup.getPendingCouplings()` | List of vehicle IDs with a pending coupling. | 541 |
| `gameplay_freeformDelivery_setup.getSpawnedVehicles()` | Returns the vehicles keyed by object ID. | 553 |
| `gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId)` | Converts a delivery vehicle ID into a game object ID. | 529 |
| `gameplay_freeformDelivery_setup.isSetupComplete()` | Returns whether the asynchronous setup is finished (all vehicles ready and no coupling pending). When so, sets setupInProgress back to false. | 466 |
| `gameplay_freeformDelivery_setup.isSetupInProgress()` | Returns the internal setup-in-progress flag. | 533 |
| `gameplay_freeformDelivery_setup.restoreVehicleTransforms()` | Puts each vehicle back at its initial position/rotation (physics reset, flexmesh repaired), reapplies the starting state then restarts the coupling sequence. | 490 |
| `gameplay_freeformDelivery_setup.setup(delivery)` | Prepares the delivery: resolves the target area images, indexes the spawned vehicles, applies the starting state, blacklists non-enterable vehicles, collects and launches the couplings, places the player and stores the initial transforms. *(internal)* | 394 |
| `gameplay_freeformDelivery_setup.setupPlayer(delivery)` | Places the player according to delivery.playerStart (vehicle, walking at a position, or walking on a parking spot). | 537 |

### Parameter details

#### `gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles)`

Tears down the delivery: if keepVehicles, extracts the vehicles from the prefabs (exploding the prefab) and puts them back in MissionGroup; removes the created prefabs (and reloads collision if needed); otherwise removes the vehicles. Then clears all state.

- `delivery` (*table|nil*) : Delivery data (_prefabIds, _hasColliders).
- `keepVehicles` (*boolean|nil*) : true to keep the vehicles (false by default).

#### `gameplay_freeformDelivery_setup.freezeAllVehicles(freeze)`

Freezes or unfreezes all vehicles of the delivery (setFreeze action via core_vehicleBridge).

- `freeze` (*boolean|nil*) : true by default; false to unfreeze.

#### `gameplay_freeformDelivery_setup.getAllCouplingSetup()`

Returns the list of couplings collected during the last setup.

- **returns**: table[] Entries {vehId, nodeTag, targetVehId}.

#### `gameplay_freeformDelivery_setup.getPendingCouplings()`

List of vehicle IDs with a pending coupling.

- **returns**: integer[] Object IDs.

#### `gameplay_freeformDelivery_setup.getSpawnedVehicles()`

Returns the vehicles keyed by object ID.

- **returns**: table<integer, table> Entries {vehicleId, vehicle, deliveryVehicle}.

#### `gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId)`

Converts a delivery vehicle ID into a game object ID.

- `deliveryVehicleId` (*string*) : Vehicle ID in the delivery definition.
- **returns**: integer|nil Object ID or nil.

#### `gameplay_freeformDelivery_setup.isSetupComplete()`

Returns whether the asynchronous setup is finished (all vehicles ready and no coupling pending). When so, sets setupInProgress back to false.

- **returns**: boolean true if finished or not started.

#### `gameplay_freeformDelivery_setup.isSetupInProgress()`

Returns the internal setup-in-progress flag.

- **returns**: boolean true as long as setup/reset is not finished.

#### `gameplay_freeformDelivery_setup.setup(delivery)`

Prepares the delivery: resolves the target area images, indexes the spawned vehicles, applies the starting state, blacklists non-enterable vehicles, collects and launches the couplings, places the player and stores the initial transforms.

- `delivery` (*table*) : Delivery data (vehicles, targetAreas, playerStart, _vehicleIndex, _basePath...).
- **returns**: boolean false if delivery is nil, otherwise true (asynchronous operations continue afterwards).

#### `gameplay_freeformDelivery_setup.setupPlayer(delivery)`

Places the player according to delivery.playerStart (vehicle, walking at a position, or walking on a parking spot).

- `delivery` (*table*) : Delivery data containing playerStart.

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `be:` `exitVehicle`, `reloadCollision`
- `scenetree.` `findObjectById`

**Loads extensions:** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/setup.lua`.*
