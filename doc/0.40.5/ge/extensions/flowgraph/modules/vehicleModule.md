# `flowgraph_modules_vehicleModule`

*File: `lua/ge/extensions/flowgraph/modules/vehicleModule.lua` · VM: Game Engine (GE) · 295 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/vehicleModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder -150) that tracks the vehicles used by a graph: those it spawns or those declared to it with addForeignVehicle. It waits for each vehicle to be ready, retrieves the offsets of its couplers (tow_hitch, fifthwheel...), tracks couplings between vehicles, manages bus data (kneeling, doors, stops) and deletes the vehicles when the graph stops except those marked dontDelete. Depends on gameplay_walk and core_vehicleBridge.

## Example

```lua
local vm = mgr.modules.vehicle
local id = vm:getVehicleIdByInternalName('mon_vehicule')
if vm:isBus(id) then vm:registerBusChangeNotification(id) end
```

## Notes

- Hooks listened to: onCouplerAttached, onCouplerDetached, onBusUpdate, onVehicleResetted (onBusUpdate has no method in this file).
- Tracked vehicles have veh.canSave = false.
- getVehicle returns an empty table (never nil) if the id is unknown.
- Possible bug: onCouplerAttached/onCouplerDetached crash if one of the two ids is not tracked (self.couplings[id] is nil).
- requestBusData is empty (its content is commented out); the function does nothing.
- Coupler priority order for the couplerOffset sort: tow_hitch, fifthwheel, gooseneck_hitch, fifthwheel_v2, pintle. More than one coupler on a vehicle generates an I log.
- executionStopped: deletes non-dontDelete vehicles, restores the stored fuel of the others, restores the gameplay_walk blacklist and the core_trailerRespawn state.

**Dependencies (loaded first):** `gameplay_walk`, `core_vehicleBridge`

## Class `C`

Vehicle module instance (mgr.modules.vehicle). Internal tables: vehicles (id -> data: id, ready, internalName, couplerOffset, couplerTags, dontDelete, storedEnergyStorage...), sortedIds (sorted ids), couplings (id -> {otherId = true}).

| Method | Description | Line |
|---|---|---|
| `C:addCouplerOffset(id, off, tag)` | Records the received coupler offsets (vec3, name, tag) for a vehicle and sorts them by tag priority then by name. | 135 |
| `C:addForeignVehicle(veh, moreData)` | Declares a vehicle not created by the flowgraph but to be tracked; it is marked dontDelete (not deleted on stop). | 27 |
| `C:addVehicle(veh, moreData)` | Starts tracking a vehicle (ignored if already tracked). If the vehicle is ready, calls readyUpVehicle. | 33 |
| `C:clear()` | Clears vehicles, sortedIds and couplings. | 16 |
| `C:executionStarted()` | Stores the gameplay_walk blacklist and the core_trailerRespawn state to restore them on stop. | 150 |
| `C:executionStopped()` | Called when the graph stops: deletes non-dontDelete vehicles, restores the energy of the others, the walking blacklist and core_trailerRespawn, then clear(). | 195 |
| `C:getSpawnedVehicles()` | Deep copy of the sorted list of tracked vehicle ids. | 22 |
| `C:getVehicle(id)` | Returns a vehicle's tracked data, or an empty table. | 58 |
| `C:getVehicleIdByInternalName(name)` | Looks up a vehicle's id by its exact internal name. | 62 |
| `C:getVehiclesIdByInternalNameMatch(name)` | Returns the ids whose internal name matches the pattern (string.find, so a Lua pattern). | 71 |
| `C:init()` | Creates the internal tables then calls clear(). | 8 |
| `C:isBus(id)` | Indicates whether the vehicle's model has the "Bus" Body Style. | 281 |
| `C:isBusDoorOpen(id)` | Indicates whether the bus door is open (cached value 'dooropen' == 1). | 272 |
| `C:isBusKneel(id)` | Indicates whether the bus is kneeling (cached value 'kneel' == 1). | 271 |
| `C:isCoupled(id)` | Indicates whether the vehicle is coupled to at least one other. | 243 |
| `C:isCoupledTo(id, other)` | Indicates whether the vehicle is coupled to the vehicle other. | 244 |
| `C:onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook: records the coupling between two vehicles (in both directions). | 234 |
| `C:onCouplerDetached(objId1, objId2, nodeId, obj2nodeId)` | Hook: removes the coupling between two vehicles. | 238 |
| `C:onUpdate()` | Called every frame: detects vehicles that have become ready and calls readyUpVehicle. | 81 |
| `C:onVehicleResetted(id)` | Hook called when a vehicle is reset; relays to activity:onVehicleReset(id) if the activity exists. | 289 |
| `C:readyUpVehicle(id)` | Marks the vehicle ready; unless ignoreReadyUp, enables mapmgr tracking (via the level module, possibly deferred) and requests the coupler offsets for each tag. | 105 |
| `C:registerBusChangeNotification(id)` | Asks core_vehicleBridge to be notified of changes to the vehicle's "kneel" and "dooropen". | 263 |
| `C:requestBusData(id)` | Does nothing: the body (sending bus_onTriggerTick) is commented out. | 247 |
| `C:requestBusStop(id, data)` | Sends the bus the bus_onSetStopRequest event (stop request). | 274 |
| `C:setKeepVehicle(id, keep)` | Sets dontDelete for a tracked vehicle; if it is in a prefab, asks the prefab module to unpack it before deletion. | 170 |
| `C:storeFuelAmount(id)` | Requests and stores the energy of the vehicle's tanks, to restore it on stop (if it is not deleted). W log if the vehicle is not tracked. | 155 |
| `C:updateBusDisplayData(id, data)` | Sends the vehicle the bus_onRouteChange event with the route display data. | 255 |

## Calls into the engine (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/vehicleModule.lua`.*
