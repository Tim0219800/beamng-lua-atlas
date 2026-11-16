# `gameplay_parking`

*File: `lua/ge/extensions/gameplay/parking.lua` · VM: Game Engine (GE) · 1126 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_parking`: `extensions.load("gameplay_parking")`, then the global `gameplay_parking`

Parked vehicles and parking tracking system. On one hand it spawns parked cars on the spots of the level's sites file (city.sites.json via gameplay_city) and teleports them to new spots in front of the player when they move away, relying on an activation pool (core_vehicleActivePooling). On the other hand it tracks a driven vehicle (enableTracking) to detect that it enters, exits or parks correctly in a spot and emits onVehicleParkingStatus. A modder uses it to populate an area with parked cars or for parking missions.

## Example

```lua
gameplay_parking.setupVehicles(10)  -- spawns 10 parked cars
gameplay_parking.setParkingVars({precision = 0.9, neatness = 0.5})
gameplay_parking.enableTracking(be:getPlayerVehicleID(0), true)
-- hook: function M.onVehicleParkingStatus(vehId, data) if data.event == 'valid' then ... end end
```

## Notes

- Default variables (vars): precision 0.8 (precision required to validate parking), neatness 0 (neatness of the generated parked cars), radiusCoef 1 (active radius coefficient, clamped to 0.25..1000 by setParkingVars), baseProbability 0.75, activeAmount math.huge, enableRespawn true.
- Internal constants: target radius 50 m, search radius 200 m, search point 200 m ahead, keep-active radius 50 m, radius to keep clear 120 m.
- Tracking events (data.event): 'enter', 'exit', 'valid' (valid parking held for 0.5 s), 'invalid', 'none'.
- Spot tags (customFields.tags) used: street (enables mapmgr.enableTracking), forwards, backwards, perfect, banned, dayTime, nightTime; probability field. Dynamic vehicle field trafficClearRadius: prevents parked car respawns nearby.
- A vehicle with the ignoreParking flag is ignored by insertVehicle.
- Inserted vehicles get playerUsable = false, ignoreTraffic and isParked, and are added to the walking mode blacklist.
- processVehicles is an alias of activate; getParkingAmount is an alias of getParkedCarsAmount.
- onClientStartMission is an empty function.
- Emitted hooks: onParkingVehiclesActivated(parkedVehIds), onParkingVehiclesDeactivated(), onVehicleParkingStatus(vehId, data).
- Outside onUpdate, the logic does not run if the system is inactive, has no sites, has physics off or is in big map mode.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_parking.activate(vehIds)` | Activates a group of vehicles as parked cars (inserts them), then emits onParkingVehiclesActivated. Disables the system if there are no sites, no vehicles or none inserted. Alias: processVehicles. | 660 |
| `gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist)` | Indicates whether a spot is usable for a parked vehicle: existing, within the focus distance window, free (no vehicle, not banned, no vehicle on it), outside the trafficClearRadius radii, suitable size (neither too small nor too large: ratio >= 0.5). | 155 |
| `gameplay_parking.deactivate()` | Disables the system: clears the lists, deletes the pool and emits onParkingVehiclesDeactivated. | 682 |
| `gameplay_parking.deleteVehicles(amount)` | Deletes the last parked cars from the world (all by default). | 647 |
| `gameplay_parking.disableTracking(vehId)` | Stops the parking tracking of a vehicle. | 394 |
| `gameplay_parking.enableTracking(vehId, autoDisable)` | Enables parking tracking for a driven vehicle (also enables the system). Creates the tracking data: inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized... | 374 |
| `gameplay_parking.filterParkingSpots(psList, filters)` | Filters in place a list coming from findParkingSpots: removes banned spots, then depending on filters: standardSize (width <= 3, length <= 8), checkVehicles (no vehicle on it), useProbability (spot probability × baseProbability × day/night coefficient according to the time and the dayTime/nightTime tags). Default: {useProbability = true}. | 226 |
| `gameplay_parking.findParkingSpots(pos, minRadius, maxRadius)` | Finds the spots in a ring around a position, sorted from nearest to farthest. | 197 |
| `gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist)` | Forces a parked car to teleport to a new random free spot nearby. Without a valid spot, sends it off the map via gameplay_traffic.forceTeleport. Has no effect if enableRespawn is false or if the car has ignoreForceTeleport. | 335 |
| `gameplay_parking.getCurrentParkingSpot(vehId)` | Id of the spot where a vehicle is correctly parked. With active tracking, returns parkingSpotId if preParked; without tracking, searches for the nearest spot (15 m) that contains the vehicle with the precision vars.precision. | 403 |
| `gameplay_parking.getParkedCarsAmount(activeOnly)` | Number of parked cars managed; with activeOnly, capped by activeAmount. Alias: getParkingAmount. | 462 |
| `gameplay_parking.getParkedCarsData()` | Data per parked car: parkingSpotId, activeRadius, randomPaint, searchFlag... | 470 |
| `gameplay_parking.getParkedCarsList()` | List of the ids of the managed parked cars. | 466 |
| `gameplay_parking.getParkingAmount(activeOnly)` | Alias of getParkedCarsAmount. | 462 |
| `gameplay_parking.getParkingSpots()` | Returns the collection of parking spots (sites.parkingSpots: sorted, objects...), loading the sites if necessary. | 74 |
| `gameplay_parking.getParkingVars()` | Current parking variables. | 458 |
| `gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters)` | Returns a sorted list of valid spots with a random bias in favor of those closest to the origin position. Widens the radius until there are enough spots or maxDist is reached. | 295 |
| `gameplay_parking.getState()` | Indicates whether the system is active. | 70 |
| `gameplay_parking.getTrackingData()` | Tracking data of all tracked vehicles, by id. | 399 |
| `gameplay_parking.insertVehicle(vehId)` | Adds a vehicle to the managed parked cars: creates the 'autoParking' pool if needed, makes it unusable by the player, associates it with its current spot if any and enables mapmgr tracking. Ignored if obj.ignoreParking. | 604 |
| `gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision)` | Places a parked vehicle on a spot: chooses the direction (forwards/backwards tags, otherwise using neatness), adds a random offset and rotation unless the perfect tag, turns the ignition off, frees the old spot, may change the paint, and updates the mapmgr tracking. | 95 |
| `gameplay_parking.onClientEndMission()` | Level end hook: calls resetAll. *(internal)* *(hook)* | 1004 |
| `gameplay_parking.onClientStartMission()` | Level start hook; does nothing. *(internal)* *(hook)* | 1001 |
| `gameplay_parking.onDeserialized(data, options)` | Hook after Lua reload: respawns the stored cars if options.respawnVehicles, reactivates the parked cars, restores the tracking, the variables and the state. *(internal)* *(hook)* | 1049 |
| `gameplay_parking.onSerialize(options)` | Hook before Lua reload: returns the state (active, parked cars, tracking, variables). With options.despawnVehicles, also captures the cars' spawn data (except options.exceptVehicleId) then deletes them. *(internal)* *(hook)* | 1008 |
| `gameplay_parking.onUpdate(dt, dtSim)` | Called every frame. Updates the parking tracking (enter/exit/valid/invalid events), periodically searches for spots in front of the player and recycles one parked car per frame to a new spot out of the player's range. *(internal)* *(hook)* | 822 |
| `gameplay_parking.onVehicleActiveChanged(vehId, active)` | Activation pool hook: marks a deactivated parked car for teleport; on its reactivation, teleports it if another vehicle (100 m from a player, 20 m otherwise) is nearby. *(internal)* *(hook)* | 800 |
| `gameplay_parking.onVehicleDestroyed(vehId)` | Hook: removes the vehicle from the parked car and tracking lists, and frees its spot. *(internal)* *(hook)* | 787 |
| `gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName)` | core_multiSpawn hook: activates the group when it is named 'autoParking'. *(internal)* *(hook)* | 772 |
| `gameplay_parking.onVehicleResetted(vehId)` | Hook: when the player vehicle is reset/teleported, forces a search for spots near the player (near respawn mode). *(internal)* *(hook)* | 778 |
| `gameplay_parking.processVehicles(vehIds)` | Alias of activate. | 660 |
| `gameplay_parking.removeVehicle(vehId)` | Removes a vehicle from the managed parked cars (does not delete it from the world). | 640 |
| `gameplay_parking.resetAll()` | Resets everything: disables, forgets the sites, clears lists and tracking, deletes the pool and restores the default variables. | 758 |
| `gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist)` | Teleports all parked cars (or those provided) to random spots; falls back to forceTeleport when no spot is suitable. | 362 |
| `gameplay_parking.setActiveAmount(amount)` | Sets the maximum number of active (visible) parked cars; nil = unlimited. | 453 |
| `gameplay_parking.setParkingVars(data, reset)` | Merges parking variables (resets first if reset). A radiusCoef resets the active radii; an activeAmount updates the vehicle pool. | 434 |
| `gameplay_parking.setSites(data)` | Sets the site data (parking spots) used, replacing those of the level. Accepts a file path, or a valid sites table (with parkingSpots); otherwise resets to nil. | 45 |
| `gameplay_parking.setState(val)` | Enables or disables the parking system. On activation, loads the default sites if needed and initializes the focus point (gameplay_traffic.getFocus()). | 58 |
| `gameplay_parking.setupVehicles(amount, options)` | Spawns parked vehicles on random spots (vehicle group of type propparked, or options.vehGroup). First deletes the current parked cars unless keepCurrent. When the group has spawned, onVehicleGroupSpawned calls activate. | 693 |

### Parameter details

#### `gameplay_parking.activate(vehIds)`

Activates a group of vehicles as parked cars (inserts them), then emits onParkingVehiclesActivated. Disables the system if there are no sites, no vehicles or none inserted. Alias: processVehicles.

- `vehIds` (*integer[]*) : Vehicle ids.

#### `gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist)`

Indicates whether a spot is usable for a parked vehicle: existing, within the focus distance window, free (no vehicle, not banned, no vehicle on it), outside the trafficClearRadius radii, suitable size (neither too small nor too large: ratio >= 0.5).

- `vehId` (*integer*) : Vehicle to park.
- `parkingSpot` (*table*) : Spot to test.
- `minDist` (*number|nil*) : Minimum distance to the focus (m, default 0).
- `maxDist` (*number|nil*) : Maximum distance to the focus (m, default 1e12).
- **returns**: boolean true if the spot is suitable.

#### `gameplay_parking.deleteVehicles(amount)`

Deletes the last parked cars from the world (all by default).

- `amount` (*integer|nil*) : Number to delete, starting from the end of the list.

#### `gameplay_parking.disableTracking(vehId)`

Stops the parking tracking of a vehicle.

- `vehId` (*integer|nil*) : Vehicle (default player 0).

#### `gameplay_parking.enableTracking(vehId, autoDisable)`

Enables parking tracking for a driven vehicle (also enables the system). Creates the tracking data: inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized...

- `vehId` (*integer|nil*) : Vehicle (default player 0).
- `autoDisable` (*boolean|nil*) : If true, tracking stops at the first parking validation.

#### `gameplay_parking.filterParkingSpots(psList, filters)`

Filters in place a list coming from findParkingSpots: removes banned spots, then depending on filters: standardSize (width <= 3, length <= 8), checkVehicles (no vehicle on it), useProbability (spot probability × baseProbability × day/night coefficient according to the time and the dayTime/nightTime tags). Default: {useProbability = true}.

- `psList` (*table[]*) : List {ps, squaredDistance}.
- `filters` (*table|nil*) : useProbability, standardSize, checkVehicles.
- **returns**: table[] The same filtered list.

#### `gameplay_parking.findParkingSpots(pos, minRadius, maxRadius)`

Finds the spots in a ring around a position, sorted from nearest to farthest.

- `pos` (*vec3|nil*) : Center (default camera position).
- `minRadius` (*number|nil*) : Minimum radius (default 0).
- `maxRadius` (*number|nil*) : Maximum radius (default 200 m).
- **returns**: table[] List {ps = spot, squaredDistance = number}.

#### `gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist)`

Forces a parked car to teleport to a new random free spot nearby. Without a valid spot, sends it off the map via gameplay_traffic.forceTeleport. Has no effect if enableRespawn is false or if the car has ignoreForceTeleport.

- `vehId` (*integer*) : Parked car.
- `pos` (*vec3|nil*) : Reference position (default camera).
- `minDist` (*number|nil*) : Minimum distance.
- `maxDist` (*number|nil*) : Maximum distance.

#### `gameplay_parking.getCurrentParkingSpot(vehId)`

Id of the spot where a vehicle is correctly parked. With active tracking, returns parkingSpotId if preParked; without tracking, searches for the nearest spot (15 m) that contains the vehicle with the precision vars.precision.

- `vehId` (*integer|nil*) : Vehicle (default player 0).
- **returns**: integer|nil Spot id, or nil.

#### `gameplay_parking.getParkedCarsAmount(activeOnly)`

Number of parked cars managed; with activeOnly, capped by activeAmount. Alias: getParkingAmount.

- `activeOnly` (*boolean|nil*) : true to count at most activeAmount.
- **returns**: integer Number.

#### `gameplay_parking.getParkedCarsData()`

Data per parked car: parkingSpotId, activeRadius, randomPaint, searchFlag...

- **returns**: table<integer, table> Data (direct reference).

#### `gameplay_parking.getParkedCarsList()`

List of the ids of the managed parked cars.

- **returns**: integer[] Ids (direct reference).

#### `gameplay_parking.getParkingAmount(activeOnly)`

Alias of getParkedCarsAmount.

- `activeOnly` (*boolean|nil*) : See getParkedCarsAmount.
- **returns**: integer Number.

#### `gameplay_parking.getParkingSpots()`

Returns the collection of parking spots (sites.parkingSpots: sorted, objects...), loading the sites if necessary.

- **returns**: table|nil Collection of spots, nil without sites.

#### `gameplay_parking.getParkingVars()`

Current parking variables.

- **returns**: table Variables (direct reference).

#### `gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters)`

Returns a sorted list of valid spots with a random bias in favor of those closest to the origin position. Widens the radius until there are enough spots or maxDist is reached.

- `originPos` (*vec3|nil*) : Origin (default camera).
- `minDist` (*number|nil*) : Minimum distance (default 0).
- `maxDist` (*number|nil*) : Maximum distance (default 10000).
- `targetCount` (*integer|nil*) : Number of spots wanted; nil or <= 0 = maxDist radius and automatic minimum.
- `filters` (*table|nil*) : Filters of filterParkingSpots.
- **returns**: table[] List {ps, squaredDistance} (empty if nothing found).

#### `gameplay_parking.getState()`

Indicates whether the system is active.

- **returns**: boolean true if active.

#### `gameplay_parking.getTrackingData()`

Tracking data of all tracked vehicles, by id.

- **returns**: table<integer, table> Data (inside, parked, event, parkingSpotId, lastParkingSpotId...).

#### `gameplay_parking.insertVehicle(vehId)`

Adds a vehicle to the managed parked cars: creates the 'autoParking' pool if needed, makes it unusable by the player, associates it with its current spot if any and enables mapmgr tracking. Ignored if obj.ignoreParking.

- `vehId` (*integer*) : Vehicle.

#### `gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision)`

Places a parked vehicle on a spot: chooses the direction (forwards/backwards tags, otherwise using neatness), adds a random offset and rotation unless the perfect tag, turns the ignition off, frees the old spot, may change the paint, and updates the mapmgr tracking.

- `vehId` (*integer*) : Vehicle to move.
- `parkingSpot` (*table*) : Parking spot object.
- `lowPrecision` (*boolean|nil*) : Passed to moveResetVehicleTo (used when the vehicle is not ready).

#### `gameplay_parking.onDeserialized(data, options)`

Hook after Lua reload: respawns the stored cars if options.respawnVehicles, reactivates the parked cars, restores the tracking, the variables and the state.

- `data` (*table*) : Result of onSerialize.
- `options` (*table|nil*) : respawnVehicles, debugVehicleStashing.

#### `gameplay_parking.onSerialize(options)`

Hook before Lua reload: returns the state (active, parked cars, tracking, variables). With options.despawnVehicles, also captures the cars' spawn data (except options.exceptVehicleId) then deletes them.

- `options` (*table|nil*) : despawnVehicles, exceptVehicleId, debugVehicleStashing.
- **returns**: table Data to restore.

#### `gameplay_parking.onUpdate(dt, dtSim)`

Called every frame. Updates the parking tracking (enter/exit/valid/invalid events), periodically searches for spots in front of the player and recycles one parked car per frame to a new spot out of the player's range.

- `dt` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_parking.onVehicleActiveChanged(vehId, active)`

Activation pool hook: marks a deactivated parked car for teleport; on its reactivation, teleports it if another vehicle (100 m from a player, 20 m otherwise) is nearby.

- `vehId` (*integer*) : Vehicle.
- `active` (*boolean*) : New activity state.

#### `gameplay_parking.onVehicleDestroyed(vehId)`

Hook: removes the vehicle from the parked car and tracking lists, and frees its spot.

- `vehId` (*integer*) : Destroyed vehicle.

#### `gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName)`

core_multiSpawn hook: activates the group when it is named 'autoParking'.

- `vehList` (*integer[]*) : Vehicles spawned.
- `groupId` (*any*) : Group id (unused).
- `groupName` (*string*) : Group name.

#### `gameplay_parking.onVehicleResetted(vehId)`

Hook: when the player vehicle is reset/teleported, forces a search for spots near the player (near respawn mode).

- `vehId` (*integer*) : Vehicle reset.

#### `gameplay_parking.processVehicles(vehIds)`

Alias of activate.

- `vehIds` (*integer[]*) : Vehicle ids.

#### `gameplay_parking.removeVehicle(vehId)`

Removes a vehicle from the managed parked cars (does not delete it from the world).

- `vehId` (*integer*) : Vehicle.

#### `gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist)`

Teleports all parked cars (or those provided) to random spots; falls back to forceTeleport when no spot is suitable.

- `vehIds` (*integer[]|nil*) : Cars (default all parked cars).
- `minDist` (*number|nil*) : Minimum distance.
- `maxDist` (*number|nil*) : Maximum distance.

#### `gameplay_parking.setActiveAmount(amount)`

Sets the maximum number of active (visible) parked cars; nil = unlimited.

- `amount` (*number|nil*) : Maximum number.

#### `gameplay_parking.setParkingVars(data, reset)`

Merges parking variables (resets first if reset). A radiusCoef resets the active radii; an activeAmount updates the vehicle pool.

- `data` (*table*) : precision, neatness, radiusCoef, baseProbability, activeAmount, enableRespawn.
- `reset` (*boolean|nil*) : true to return to the default values before merging.

#### `gameplay_parking.setSites(data)`

Sets the site data (parking spots) used, replacing those of the level. Accepts a file path, or a valid sites table (with parkingSpots); otherwise resets to nil.

- `data` (*string|table|nil*) : Path of a .sites.json file or sites table.

#### `gameplay_parking.setState(val)`

Enables or disables the parking system. On activation, loads the default sites if needed and initializes the focus point (gameplay_traffic.getFocus()).

- `val` (*boolean*) : true to enable.

#### `gameplay_parking.setupVehicles(amount, options)`

Spawns parked vehicles on random spots (vehicle group of type propparked, or options.vehGroup). First deletes the current parked cars unless keepCurrent. When the group has spawned, onVehicleGroupSpawned calls activate.

- `amount` (*integer|nil*) : Number; -1 or nil = trafficParkingAmount setting (0 = auto between 4 and 16).
- `options` (*table|nil*) : keepCurrent, vehGroup, pos, bypassChecks.
- **returns**: boolean false if the number is zero, if the group is empty or if there are no spots (without bypassChecks).

## Fields

| Field | Type | Description |
|---|---|---|
| `debugLevel` | integer | Debug level: > 0 teleport and filtering logs; >= 1 draws the spots around the tracked vehicle; >= 2 draws the corners; >= 3 draws the search point and the circles. |
| `dependencies` | string[] | {'core_vehicleActivePooling'}, extension loaded beforehand. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onParkingVehiclesActivated` — listened to by 1 module(s)
- `onParkingVehiclesDeactivated`
- `onVehicleParkingStatus` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `getEnabled`, `getObjectActive`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectPositionXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`
- `obj:` `delete`, `getDirectionVector`, `getDirectionVectorUp`, `getDirectionVectorXYZ`, `getDynDataFieldbyName`, `getField`, `getMetallicPaintData`, `getPosition`, `setDynDataFieldbyName`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/parking.lua`.*
