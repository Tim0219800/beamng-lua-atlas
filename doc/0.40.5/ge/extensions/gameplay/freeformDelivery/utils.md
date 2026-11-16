# `gameplay_freeformDelivery_utils`

*File: `lua/ge/extensions/gameplay/freeformDelivery/utils.lua` · VM: Game Engine (GE) · 245 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_utils`: `extensions.load("gameplay_freeformDelivery_utils")`, then the global `gameplay_freeformDelivery_utils`

Utility functions shared by the freeform delivery submodules: vehicle position cache, site object lookup (locations, zones, parking spots), tests for a vehicle's presence in a target area, path resolution, time formatting and player access (vehicle or on foot).

## Notes

- The position cache is never invalidated automatically: getCachedVehiclePosition only recomputes if the entry does not exist; updateVehicleCache / updateVehicleCacheList must be called regularly to refresh it.
- The vec3 returned by getCachedVehiclePosition is the cache's vec3: do not modify it.
- checkParking is called with a tolerance of 0.8 (fixed value in the code).
- findSiteObject searches first by name (byName) then by numeric index (objects[tonumber(siteId)]); sites must contain locations, zones and parkingSpots.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType)` | Unified presence test: location (distance <= radius), zone (containsVehicle) or parking spot. | 114 |
| `gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot)` | Tests whether a vehicle is parked in a spot via parkingSpot:checkParking(vehId, 0.8). | 101 |
| `gameplay_freeformDelivery_utils.clearVehicleCache()` | Clears the entire position cache. | 63 |
| `gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId)` | Finds a site object (location, zone or parking spot) by type and identifier. | 81 |
| `gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId)` | Finds a target area by id in delivery.targetAreas. | 152 |
| `gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId)` | Finds a vehicle's definition by id in delivery.vehicles. | 163 |
| `gameplay_freeformDelivery_utils.formatTime(seconds)` | Formats a duration in seconds as H:MM:SS (if at least one hour) or M:SS. | 68 |
| `gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh)` | Returns a vehicle's cached position (computes it on the first call). | 46 |
| `gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot)` | Details a vehicle's parking in a spot: number of corners in the spot (0 to 4), validity and spot size. | 214 |
| `gameplay_freeformDelivery_utils.getPlayerPosition()` | Player position: cached position of their vehicle, otherwise the position of the character if walking (gameplay_walk). | 199 |
| `gameplay_freeformDelivery_utils.getPlayerVehicle()` | Returns player 0's vehicle (upcast). | 192 |
| `gameplay_freeformDelivery_utils.getVehicleIds(goal)` | Normalizes a goal: returns goal.vehicleIds, or {goal.vehicleId}, or an empty array. | 96 |
| `gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId)` | Converts a delivery vehicle ID into a vehicle object (via gameplay_freeformDelivery_setup.getVehicleId then Sim.upcast). | 174 |
| `gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId)` | Cached position of the vehicle designated by its delivery ID. | 185 |
| `gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath)` | Resolves a relative path against the folder of a base file. A path starting with '/' is returned as is. | 132 |
| `gameplay_freeformDelivery_utils.updateVehicleCache(veh)` | Updates a vehicle's cached position (without allocation) and marks it valid. | 22 |
| `gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles)` | Updates the cache for each vehicle of a list. | 37 |

### Parameter details

#### `gameplay_freeformDelivery_utils.checkVehicleInArea(veh, siteObj, areaType)`

Unified presence test: location (distance <= radius), zone (containsVehicle) or parking spot.

- `veh` (*table*) : Vehicle object.
- `siteObj` (*table*) : Site object.
- `areaType` (*string*) : "location", "zone" or "parkingSpot".
- **returns**: boolean true if the vehicle is in the area.

#### `gameplay_freeformDelivery_utils.checkVehicleInParkingSpot(veh, parkingSpot)`

Tests whether a vehicle is parked in a spot via parkingSpot:checkParking(vehId, 0.8).

- `veh` (*table*) : Vehicle object.
- `parkingSpot` (*table*) : Parking spot object.
- **returns**: boolean Result of checkParking, false if an argument is missing.

#### `gameplay_freeformDelivery_utils.findSiteObject(sites, siteType, siteId)`

Finds a site object (location, zone or parking spot) by type and identifier.

- `sites` (*table|nil*) : Sites table with locations, zones, parkingSpots (each with byName and objects).
- `siteType` (*string*) : "location", "zone" or "parkingSpot".
- `siteId` (*string|integer*) : Name or index of the object.
- **returns**: table|nil Site object or nil.

#### `gameplay_freeformDelivery_utils.findTargetArea(delivery, areaId)`

Finds a target area by id in delivery.targetAreas.

- `delivery` (*table*) : Delivery data.
- `areaId` (*string*) : ID of the target area.
- **returns**: table|nil Target area or nil.

#### `gameplay_freeformDelivery_utils.findVehicle(delivery, vehicleId)`

Finds a vehicle's definition by id in delivery.vehicles.

- `delivery` (*table*) : Delivery data.
- `vehicleId` (*string*) : ID of the delivery vehicle.
- **returns**: table|nil Vehicle definition or nil.

#### `gameplay_freeformDelivery_utils.formatTime(seconds)`

Formats a duration in seconds as H:MM:SS (if at least one hour) or M:SS.

- `seconds` (*number*) : Duration in seconds.
- **returns**: string Formatted string.

#### `gameplay_freeformDelivery_utils.getCachedVehiclePosition(veh)`

Returns a vehicle's cached position (computes it on the first call).

- `veh` (*table*) : Vehicle object.
- **returns**: vec3|nil Shared position, do not modify; nil if veh is invalid.

#### `gameplay_freeformDelivery_utils.getParkingInfo(veh, parkingSpot)`

Details a vehicle's parking in a spot: number of corners in the spot (0 to 4), validity and spot size.

- `veh` (*table*) : Vehicle object.
- `parkingSpot` (*table*) : Parking spot object.
- **returns**: table|nil {valid, cornerCount, corners, spotSize={x,y,z}}; nil if no corner is in the spot.

#### `gameplay_freeformDelivery_utils.getPlayerPosition()`

Player position: cached position of their vehicle, otherwise the position of the character if walking (gameplay_walk).

- **returns**: vec3|nil Position or nil.

#### `gameplay_freeformDelivery_utils.getPlayerVehicle()`

Returns player 0's vehicle (upcast).

- **returns**: table|nil Vehicle object or nil.

#### `gameplay_freeformDelivery_utils.getVehicleIds(goal)`

Normalizes a goal: returns goal.vehicleIds, or {goal.vehicleId}, or an empty array.

- `goal` (*table*) : Delivery goal.
- **returns**: string[] List of delivery vehicle IDs.

#### `gameplay_freeformDelivery_utils.getVehicleObjectByDeliveryId(vehicleId)`

Converts a delivery vehicle ID into a vehicle object (via gameplay_freeformDelivery_setup.getVehicleId then Sim.upcast).

- `vehicleId` (*string*) : ID of the delivery vehicle.
- **returns**: table|nil Upcast vehicle object or nil.

#### `gameplay_freeformDelivery_utils.getVehiclePositionByDeliveryId(vehicleId)`

Cached position of the vehicle designated by its delivery ID.

- `vehicleId` (*string*) : ID of the delivery vehicle.
- **returns**: vec3|nil Cached position or nil.

#### `gameplay_freeformDelivery_utils.resolvePath(basePath, relativePath)`

Resolves a relative path against the folder of a base file. A path starting with '/' is returned as is.

- `basePath` (*string*) : Path of the reference file.
- `relativePath` (*string|nil*) : Path to resolve.
- **returns**: string|nil Resolved path, nil if relativePath is nil or folder not found.

#### `gameplay_freeformDelivery_utils.updateVehicleCache(veh)`

Updates a vehicle's cached position (without allocation) and marks it valid.

- `veh` (*table*) : Vehicle object (getID, getPositionXYZ).

#### `gameplay_freeformDelivery_utils.updateVehicleCacheList(vehicles)`

Updates the cache for each vehicle of a list.

- `vehicles` (*table[]*) : List of vehicle objects.

## Calls into the engine (C++)

- `Sim.` `upcast`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/utils.lua`.*
