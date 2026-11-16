# `gameplay_freeformDelivery_routes`

*File: `lua/ge/extensions/gameplay/freeformDelivery/routes.lua` · VM: Game Engine (GE) · 1189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_routes`: `extensions.load("gameplay_freeformDelivery_routes")`, then the global `gameplay_freeformDelivery_routes`

Management of freeform delivery routes. Builds guidance routes (core_groundMarkers.setPath) to a target area or to a vehicle, with waypoints from a race file or map node names, detects the player's arrival, automatically chooses the route when only one visible goal remains, reacts to couplings (couplerAttachedRoute) and feeds the big map (bigmap) with points of interest and groups.

## Notes

- A route (entry of delivery.routes) contains targetAreaId or vehicleId, bigmapGroups, an icon and a params array; params can contain raceFile, waypointNames, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ, penalty (alias of penaltyAboveCutoff). A params entry with targetAreaId is only used if the player is in that target area; otherwise the entry without targetAreaId serves as the default.
- The path is sent with step = 3 and clearPathOnReachingTarget = false.
- Arrival: for a route to a target area, the player's vehicle must be in the area; for a route to a vehicle, within 10 m. The guidance is then cleared.
- Automatic guidance: if exactly one visible unfinished goal remains (showInTasklist ~= false), the route is chosen according to its type (placement -> targetAreaId, playerInVehicle -> vehicleId, coupled -> trailerId), following if needed the single goal that depends on it (requires).
- Probable bug: setup() adds the otherLocations and otherVehicles groups to delivery.bigmapGroups (the delivery's table, modified in place) on every call without ever removing them; a second initialization on the same table creates duplicates.
- Probable bug: formatDeliveryToRawPoi reads targetArea.relevantGoals and vehicleData.relevantGoals without testing nil although findTargetArea/findVehicle can return nil (route to an unknown id).
- Depends on the globals gameplay_freeformDelivery_tasklist, _setup and _freeformDelivery, not declared in dependencies.

**Dependencies (loaded first):** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_markers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_routes.cleanup()` | Clears the guidance and forgets the delivery, the routes and the current route. *(internal)* | 587 |
| `gameplay_freeformDelivery_routes.clearRoute()` | Hides the route marker, clears the guidance (core_groundMarkers.resetAll) and updates the task list. | 487 |
| `gameplay_freeformDelivery_routes.getCurrentRoute()` | Active route. | 453 |
| `gameplay_freeformDelivery_routes.getRoute(index)` | Returns the route at the given index (starting at 1). | 440 |
| `gameplay_freeformDelivery_routes.getRouteCount()` | Number of available routes. | 458 |
| `gameplay_freeformDelivery_routes.getRouteName(route)` | Displayable name of a route: translated name of the target area or vehicle, otherwise the id, or the text "unknown route". | 422 |
| `gameplay_freeformDelivery_routes.getRoutes()` | Returns the list of the delivery's routes. | 448 |
| `gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId)` | Position of a target area: pos for a location or a spot, center (or average of the vertices snapped to the terrain) for a zone. | 475 |
| `gameplay_freeformDelivery_routes.getTargetAreas()` | Returns the target areas of the active delivery (useful for generating POIs). | 463 |
| `gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId)` | Cached position of a vehicle of the active delivery. | 481 |
| `gameplay_freeformDelivery_routes.getVehicles()` | Returns the vehicles of the active delivery (useful for generating POIs). | 469 |
| `gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures)` | Big map hook: adds the "delivery" group structure (delivery_relevant and the delivery's groups). *(internal)* *(hook)* | 1134 |
| `gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData)` | Big map hook: creates the delivery_relevant groups and those of bigmapGroups in groupData. *(internal)* *(hook)* | 1116 |
| `gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | Hook called when two vehicles couple; if one is the player's vehicle and the other has a couplerAttachedRoute, activates that route. *(internal)* *(hook)* | 1151 |
| `gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | Hook called on uncoupling; clears the current route if it matches the couplerAttachedRoute of the uncoupled vehicle. *(internal)* *(hook)* | 1165 |
| `gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI system hook: adds the delivery's POIs (target areas and vehicles, with description of the linked goals) when a delivery is active. *(internal)* *(hook)* | 1147 |
| `gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route)` | Builds and activates a guidance route to a target area of the delivery (location position, zone center or spot position). Places the route marker, with the zone or spot outline if applicable, and updates the task list message. | 366 |
| `gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route)` | Builds and activates a guidance route to the cached position of a delivery vehicle. | 404 |
| `gameplay_freeformDelivery_routes.setup(delivery)` | Initializes the module with the delivery: routes, big map groups, fallback groups otherLocations and otherVehicles for routes and vehicles without a group. *(internal)* | 505 |
| `gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler)` | Called every frame: checks arrival at the current route then updates the automatic route. *(internal)* | 582 |

### Parameter details

#### `gameplay_freeformDelivery_routes.clearRoute()`

Hides the route marker, clears the guidance (core_groundMarkers.resetAll) and updates the task list.

- **returns**: boolean false if core_groundMarkers is not available, otherwise true.

#### `gameplay_freeformDelivery_routes.getCurrentRoute()`

Active route.

- **returns**: table|nil {type = 'targetArea'|'vehicle', id, automaticGoalId?} or nil.

#### `gameplay_freeformDelivery_routes.getRoute(index)`

Returns the route at the given index (starting at 1).

- `index` (*integer*) : 1-based index.
- **returns**: table|nil Route or nil if out of bounds.

#### `gameplay_freeformDelivery_routes.getRouteCount()`

Number of available routes.

- **returns**: integer Number of routes.

#### `gameplay_freeformDelivery_routes.getRouteName(route)`

Displayable name of a route: translated name of the target area or vehicle, otherwise the id, or the text "unknown route".

- `route` (*table*) : Route entry.
- **returns**: string Name to display.

#### `gameplay_freeformDelivery_routes.getRoutes()`

Returns the list of the delivery's routes.

- **returns**: table[] Routes (delivery.routes).

#### `gameplay_freeformDelivery_routes.getTargetAreaPosition(targetAreaId)`

Position of a target area: pos for a location or a spot, center (or average of the vertices snapped to the terrain) for a zone.

- `targetAreaId` (*string*) : ID of the target area.
- **returns**: vec3|nil Position or nil.

#### `gameplay_freeformDelivery_routes.getTargetAreas()`

Returns the target areas of the active delivery (useful for generating POIs).

- **returns**: table[] targetAreas, or empty array without a delivery.

#### `gameplay_freeformDelivery_routes.getVehiclePosition(vehicleId)`

Cached position of a vehicle of the active delivery.

- `vehicleId` (*string*) : ID of the delivery vehicle.
- **returns**: vec3|nil Position or nil.

#### `gameplay_freeformDelivery_routes.getVehicles()`

Returns the vehicles of the active delivery (useful for generating POIs).

- **returns**: table[] vehicles, or empty array without a delivery.

#### `gameplay_freeformDelivery_routes.onBigmapBuildCustomGroupStructures(customGroupStructures)`

Big map hook: adds the "delivery" group structure (delivery_relevant and the delivery's groups).

- `customGroupStructures` (*table[]*) : List of structures, modified in place.

#### `gameplay_freeformDelivery_routes.onBigmapBuildGroupData(groupData)`

Big map hook: creates the delivery_relevant groups and those of bigmapGroups in groupData.

- `groupData` (*table*) : Table of groups, keyed by id, modified in place.

#### `gameplay_freeformDelivery_routes.onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)`

Hook called when two vehicles couple; if one is the player's vehicle and the other has a couplerAttachedRoute, activates that route.

- `objId1` (*integer*) : ID of the first vehicle.
- `objId2` (*integer*) : ID of the second vehicle.
- `nodeId` (*integer*) : Coupling node of the first vehicle (inferred from code).
- `obj2nodeId` (*integer*) : Coupling node of the second vehicle (inferred from code).

#### `gameplay_freeformDelivery_routes.onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)`

Hook called on uncoupling; clears the current route if it matches the couplerAttachedRoute of the uncoupled vehicle.

- `objId1` (*integer*) : ID of the first vehicle.
- `objId2` (*integer*) : ID of the second vehicle.
- `nodeId` (*integer*) : Coupling node of the first vehicle (inferred from code).
- `obj2nodeId` (*integer*) : Coupling node of the second vehicle (inferred from code).
- `breakForce` (*number*) : Breaking force (unused).

#### `gameplay_freeformDelivery_routes.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI system hook: adds the delivery's POIs (target areas and vehicles, with description of the linked goals) when a delivery is active.

- `levelIdentifier` (*string*) : Level identifier (unused).
- `elements` (*table[]*) : POI list completed in place.

#### `gameplay_freeformDelivery_routes.setRouteToTargetArea(targetAreaId, route)`

Builds and activates a guidance route to a target area of the delivery (location position, zone center or spot position). Places the route marker, with the zone or spot outline if applicable, and updates the task list message.

- `targetAreaId` (*string*) : ID of the target area in delivery.targetAreas.
- `route` (*table|nil*) : Route entry whose params provides waypoints and computation options.
- **returns**: boolean true if the route is placed; false if core_groundMarkers is missing or if the area, site or position cannot be found.

#### `gameplay_freeformDelivery_routes.setRouteToVehicle(vehicleId, route)`

Builds and activates a guidance route to the cached position of a delivery vehicle.

- `vehicleId` (*string*) : Vehicle ID in delivery.vehicles.
- `route` (*table|nil*) : Route entry (params).
- **returns**: boolean true if the route is placed.

#### `gameplay_freeformDelivery_routes.setup(delivery)`

Initializes the module with the delivery: routes, big map groups, fallback groups otherLocations and otherVehicles for routes and vehicles without a group.

- `delivery` (*table*) : Delivery data.

#### `gameplay_freeformDelivery_routes.update(dtReal, dtSim, dtRaw, profiler)`

Called every frame: checks arrival at the current route then updates the automatic route.

- `dtReal` (*number*) : Not used.
- `dtSim` (*number*) : Not used.
- `dtRaw` (*number*) : Not used.
- `profiler` (*table|nil*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, _goals and _markers. |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/routes.lua`.*
