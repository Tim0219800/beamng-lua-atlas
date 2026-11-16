# `career_modules_delivery_general`

*File: `lua/ge/extensions/career/modules/delivery/general.lua` · VM: Game Engine (GE) · 1159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_general`: `extensions.load("career_modules_delivery_general")`, then the global `career_modules_delivery_general`

Core of the career delivery (logistics) system: delivery game clock, saving/loading of logisticsDatabase.json (parcels, vehicle offers, facilities, settings, progress), delivery mode (start/exit, cargo abandonment penalty), settings (automatic route, detailed drop-off), list of the cargo containers of nearby vehicles and update of their weight in the vehicle VM. Also contributes to the big map POIs and to the delivery mode permissions.

## Example

```lua
if career_modules_delivery_general.isDeliveryModeActive() then
  local pen = career_modules_delivery_general.getDeliveryModePenalty()
  print('Money penalty if abandoned:', pen.money)
end
```

## Notes

- Depends on core_vehicleBridge. The save format version (moduleVersion) is 42: an older save is ignored.
- On load, if the save is more than one hour old (os.time), the parcels and generator timers of the facilities are cleared.
- Delivery time (time()) advances by dtSim on each onUpdate unless setDeliveryTimePaused(true).
- Abandonment penalty: money -= rewards.money * (0.1 + sum of the modifiers' abandonMultiplier), plus the organization's reputation and the vehicle tasks' fine; ignored for a parcel in transient move.
- Detection radius for nearby vehicles: 25 m (comparison with the square 625).
- 'passenger' containers alone are ignored by getNearbyVehicleCargoContainers.
- Probable bug: in defaultDelayCallback, step.startStepSequence(sequence, callback) uses 'callback', a variable not defined in this scope (nil).
- The delivery modules are referenced in onCareerActivated; do not use them before.

**Dependencies (loaded first):** `core_vehicleBridge`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_general.checkExitDeliveryMode()` | Leaves delivery mode if there is neither cargo in vehicles nor a vehicle task left. | 990 |
| `career_modules_delivery_general.exitDeliveryMode()` | Leaves delivery mode: cancels the transient moves, deletes the cargos in vehicles (changeCargoLocation 'deleted'), applies the abandonment penalty (money/reputation, toast, sound), abandons the vehicle tasks, clears the big map focus, schedules the weight update, clears the tasklist and fires onDeliveryModeStopped. | 957 |
| `career_modules_delivery_general.getDeliveryAbandonPenaltyFactor()` | Returns the base factor of the cargo abandonment penalty (0.1). | 29 |
| `career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys)` | Computes the penalty if the player abandons the cargos in vehicles: table of negative attributes (money and <organization>Reputation). Adds the vehicle tasks' fine unless onlyVehIdsAsKeys is provided. | 1046 |
| `career_modules_delivery_general.getMostRecentCargoContainerData()` | Last container list computed by getNearbyVehicleCargoContainers (refreshed about every second in onUpdate). | 295 |
| `career_modules_delivery_general.getNearbyVehicleCargoContainers(callback)` | Queries (asynchronous, 'getCargoContainers') the vehicles within 25 m of the player (excluding unicycle and unusable vehicles) and calls callback with the list, sorted (vehId then containerId), of the delivery containers: location, name, cargo types, total/used/transient/free slots, attachment status ('attached', 'nearby' or 'lost'), parcels present. Calls callback({}) if there is no vehicle. | 192 |
| `career_modules_delivery_general.getSettings()` | Returns the delivery settings table. | 1030 |
| `career_modules_delivery_general.getVehicleName(vehId)` | Translated name of a vehicle via the career inventory, or a fallback label containing the id. | 171 |
| `career_modules_delivery_general.isAutomaticRouteEnabled()` | Returns the 'automaticRoute' setting (automatic route to the next destination). | 998 |
| `career_modules_delivery_general.isDeliveryModeActive()` | Indicates whether delivery mode is active. | 1044 |
| `career_modules_delivery_general.loadSaveData()` | Loads logisticsDatabase.json from the current profile (ignored if info.json is older than moduleVersion), initializes progress and parcelModProgress, settings (automaticRoute is true by default) and delivery time; clears the parcels if the save is more than one hour old. *(internal)* | 37 |
| `career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData)` | Hook: for a 'logisticsOffice' element, adds the activity prompt info (facility title, properties, 'inspect cargo' button). *(internal)* *(hook)* | 642 |
| `career_modules_delivery_general.onAnyMissionChanged(change)` | Hook: leaves delivery mode when a mission starts (change == 'started'). *(internal)* *(hook)* | 1111 |
| `career_modules_delivery_general.onCareerActivated()` | Hook: stores the other delivery modules (parcelManager, cargoScreen, generator, progress, vehicleTasks, tasklist, parcelMods, vehicleOfferManager, tutorial) and util_stepHandler. *(internal)* *(hook)* | 10 |
| `career_modules_delivery_general.onCareerActive(active)` | Hook: on career activation, loads the data, ensures the map (map.assureLoad) and launches dGenerator.setup. *(internal)* *(hook)* | 155 |
| `career_modules_delivery_general.onCareerPaintingStarted()` | Hook: leaves delivery mode if painting starts. *(internal)* *(hook)* | 1090 |
| `career_modules_delivery_general.onCareerTuningStarted()` | Hook: leaves delivery mode if tuning starts. *(internal)* *(hook)* | 1097 |
| `career_modules_delivery_general.onCheckPermission(tags, permissions)` | Hook: in delivery mode, if a requested tag is in the restricted activities table (e.g. mission interaction, towing to garage, vehicle purchase), adds a permission with a label explaining the penalty. *(internal)* *(hook)* | 939 |
| `career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI list hook: adds the visible (or targeted) delivery facilities with their interactive access points. *(internal)* *(hook)* | 505 |
| `career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId)` | Hook: before the vehicle object is removed from the inventory, deletes its cargos (with penalty) and checks for leaving delivery mode. *(internal)* *(hook)* | 1152 |
| `career_modules_delivery_general.onPartShoppingStarted()` | Hook: leaves delivery mode if parts shopping starts. *(internal)* *(hook)* | 1083 |
| `career_modules_delivery_general.onRepairInGarage(invVehId)` | Hook: a vehicle repaired at the garage: deletes its cargos (with penalty) and checks for leaving delivery mode. *(internal)* *(hook)* | 1147 |
| `career_modules_delivery_general.onSaveCurrentProfile(currentSavePath)` | Save hook: writes logisticsDatabase.json (time, penalty, progress, non-expired parcels in facilities, non-expired vehicle offers, facility data, settings). *(internal)* *(hook)* | 75 |
| `career_modules_delivery_general.onSetBigmapNavFocus()` | Hook: a manual waypoint placed on the big map disables the automatic route in delivery mode. *(internal)* *(hook)* | 1020 |
| `career_modules_delivery_general.onTeleportedToGarage(garageId, veh)` | Hook: leaves delivery mode if the player is towed to the garage. *(internal)* *(hook)* | 1104 |
| `career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: advances the delivery time, applies the penalty coming from a previous save (toast + addAttributes), refreshes the nearby containers every second and updates the weights. *(internal)* *(hook)* | 420 |
| `career_modules_delivery_general.requestUpdateContainerWeights()` | Schedules a container weight update; executed in onUpdate when the simulation is not paused. | 333 |
| `career_modules_delivery_general.setAutomaticRoute(enabled)` | Enables/disables the automatic route: when enabled, calls cargoScreen.setBestRoute; when disabled, clears the path of the ground markers and the big map. Notifies the UI (guihooks 'automaticRouteSet'). | 1003 |
| `career_modules_delivery_general.setDeliveryTimePaused(paused)` | Pauses or resumes the delivery clock. | 419 |
| `career_modules_delivery_general.setDetailedDropOff(enabled)` | Sets the detailedDropOff setting and notifies the UI (guihooks 'detailedDropOffSet'). | 1014 |
| `career_modules_delivery_general.setSetting(key, value)` | Writes a delivery setting (saved in logisticsDatabase.json). | 1026 |
| `career_modules_delivery_general.startDeliveryMode()` | Enables delivery mode (no effect if already active), clears the POIs and fires the onDeliveryModeStarted hook. | 949 |
| `career_modules_delivery_general.time()` | Current delivery time (cumulated simulation seconds, saved). | 165 |
| `career_modules_delivery_general.updateContainerWeights(delayCallback)` | If an update is scheduled, computes for each vehicle/container the volume (weight of parcels, volume of fluids and bulk) and the density, sends them to the vehicle (setCargoContainers), freezes the vehicle (setFreeze), reads the loading delay, then calls delayCallback with the delay per vehicle. *(internal)* | 334 |

### Parameter details

#### `career_modules_delivery_general.getDeliveryAbandonPenaltyFactor()`

Returns the base factor of the cargo abandonment penalty (0.1).

- **returns**: number Factor applied to the money reward of the abandoned cargo.

#### `career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys)`

Computes the penalty if the player abandons the cargos in vehicles: table of negative attributes (money and <organization>Reputation). Adds the vehicle tasks' fine unless onlyVehIdsAsKeys is provided.

- `onlyVehIdsAsKeys` (*table<integer, boolean>|nil*) : Limits the computation to the listed vehicles.
- **returns**: table<string, number> Penalty per attribute (values <= 0).

#### `career_modules_delivery_general.getMostRecentCargoContainerData()`

Last container list computed by getNearbyVehicleCargoContainers (refreshed about every second in onUpdate).

- **returns**: table[] Cargo containers.

#### `career_modules_delivery_general.getNearbyVehicleCargoContainers(callback)`

Queries (asynchronous, 'getCargoContainers') the vehicles within 25 m of the player (excluding unicycle and unusable vehicles) and calls callback with the list, sorted (vehId then containerId), of the delivery containers: location, name, cargo types, total/used/transient/free slots, attachment status ('attached', 'nearby' or 'lost'), parcels present. Calls callback({}) if there is no vehicle.

- `callback` (*function*) : Receives the containers table.
- **returns**: table|nil {} if core_vehicleBridge is missing.

#### `career_modules_delivery_general.getSettings()`

Returns the delivery settings table.

- **returns**: table Settings (automaticRoute, detailedDropOff…).

#### `career_modules_delivery_general.getVehicleName(vehId)`

Translated name of a vehicle via the career inventory, or a fallback label containing the id.

- `vehId` (*integer*) : Vehicle object id.
- **returns**: string Displayable name.

#### `career_modules_delivery_general.isAutomaticRouteEnabled()`

Returns the 'automaticRoute' setting (automatic route to the next destination).

- **returns**: boolean true if enabled.

#### `career_modules_delivery_general.isDeliveryModeActive()`

Indicates whether delivery mode is active.

- **returns**: boolean true if active.

#### `career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData)`

Hook: for a 'logisticsOffice' element, adds the activity prompt info (facility title, properties, 'inspect cargo' button).

- `elemData` (*table[]*) : POI elements.
- `activityData` (*table[]*) : Activity data to complete.

#### `career_modules_delivery_general.onAnyMissionChanged(change)`

Hook: leaves delivery mode when a mission starts (change == 'started').

- `change` (*string*) : Mission change type.

#### `career_modules_delivery_general.onCareerActive(active)`

Hook: on career activation, loads the data, ensures the map (map.assureLoad) and launches dGenerator.setup.

- `active` (*boolean*) : true on activation.

#### `career_modules_delivery_general.onCheckPermission(tags, permissions)`

Hook: in delivery mode, if a requested tag is in the restricted activities table (e.g. mission interaction, towing to garage, vehicle purchase), adds a permission with a label explaining the penalty.

- `tags` (*string[]*) : Activity tags tested.
- `permissions` (*table[]*) : List of permissions to complete.

#### `career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI list hook: adds the visible (or targeted) delivery facilities with their interactive access points.

- `levelIdentifier` (*string*) : Level id.
- `elements` (*table[]*) : POI list to complete.

#### `career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId)`

Hook: before the vehicle object is removed from the inventory, deletes its cargos (with penalty) and checks for leaving delivery mode.

- `inventoryId` (*integer*) : Inventory id.
- `vehId` (*integer*) : Vehicle object id.

#### `career_modules_delivery_general.onRepairInGarage(invVehId)`

Hook: a vehicle repaired at the garage: deletes its cargos (with penalty) and checks for leaving delivery mode.

- `invVehId` (*integer*) : Inventory id of the vehicle.

#### `career_modules_delivery_general.onSaveCurrentProfile(currentSavePath)`

Save hook: writes logisticsDatabase.json (time, penalty, progress, non-expired parcels in facilities, non-expired vehicle offers, facility data, settings).

- `currentSavePath` (*string*) : Folder of the profile being saved.

#### `career_modules_delivery_general.onTeleportedToGarage(garageId, veh)`

Hook: leaves delivery mode if the player is towed to the garage.

- `garageId` (*string*) : Garage id.
- `veh` (*any*) : Teleported vehicle (unused).

#### `career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: advances the delivery time, applies the penalty coming from a previous save (toast + addAttributes), refreshes the nearby containers every second and updates the weights.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `career_modules_delivery_general.setAutomaticRoute(enabled)`

Enables/disables the automatic route: when enabled, calls cargoScreen.setBestRoute; when disabled, clears the path of the ground markers and the big map. Notifies the UI (guihooks 'automaticRouteSet').

- `enabled` (*boolean*) : New state.

#### `career_modules_delivery_general.setDeliveryTimePaused(paused)`

Pauses or resumes the delivery clock.

- `paused` (*boolean*) : true to freeze time.

#### `career_modules_delivery_general.setDetailedDropOff(enabled)`

Sets the detailedDropOff setting and notifies the UI (guihooks 'detailedDropOffSet').

- `enabled` (*boolean*) : New state.

#### `career_modules_delivery_general.setSetting(key, value)`

Writes a delivery setting (saved in logisticsDatabase.json).

- `key` (*string*) : Setting name.
- `value` (*any*) : Value.

#### `career_modules_delivery_general.time()`

Current delivery time (cumulated simulation seconds, saved).

- **returns**: number Seconds.

#### `career_modules_delivery_general.updateContainerWeights(delayCallback)`

If an update is scheduled, computes for each vehicle/container the volume (weight of parcels, volume of fluids and bulk) and the density, sends them to the vehicle (setCargoContainers), freezes the vehicle (setFreeze), reads the loading delay, then calls delayCallback with the delay per vehicle.

- `delayCallback` (*function|nil*) : Receives {[vehId] = delay in seconds}; by default shows a loading popup and unfreezes the vehicles.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_vehicleBridge"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDeliveryModeStarted` — listened to by 2 module(s)
- `onDeliveryModeStopped` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `OpenSimpleDelayPopup`, `automaticRouteSet`, `detailedDropOffSet`, `toastrMsg`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/general.lua`.*
