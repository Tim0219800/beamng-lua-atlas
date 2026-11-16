# `freeroam_facilities`

*File: `lua/ge/extensions/freeroam/facilities.lua` · VM: Game Engine (GE) · 584 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_facilities`: `extensions.load("freeroam_facilities")`, then the global `freeroam_facilities`

Registry of a level's "facilities": garages, gas stations, dealerships, computers, private sellers, delivery providers and dragstrips. Reads the section of these lists in `<level>/info.json` and in `<level>/facilities/*.facilities.json`, normalizes each entry (id, preview, sites file), then gives access to positions (doors, parking spots, zones), garage teleportation and POI generation (big map / gameplay markers). Global: freeroam_facilities.

## Example

```lua
local garage = freeroam_facilities.getGarage('mongarage')
local spots = freeroam_facilities.getParkingSpotsForFacility(garage)
for _, g in ipairs(freeroam_facilities.getFacilitiesByType('gasStation')) do print(g.id) end
```

## Notes

- Types -> lists: garage/garages, gasStation/gasStations, dealership/dealerships, computer/computers, privateSeller/privateSellers, deliveryProvider/deliveryProviders, dragstrip/dragstrips.
- Facilities are cached per level (facilitiesByLevel) and are therefore only read once per session.
- Normalization: default id = "<folder><file>-<type>-<index>"; default preview 'defaultFacility.jpg' (looked up next to the file then in the level folder, otherwise /ui/images/noPreview.jpg); default sitesFile 'facilities.sites.json' (string or list); zoneNames and parkingSpotNames default to {}.
- BUG: formatFacilityToRawPoi calls M[<clusterType>..'FormatFacility'](f, elements) and expects an element in return, but the functions zoneMarkerFormatFacility, walkingMarkerFormatFacility and vehicleTriggerFormatFacility return nothing (they insert directly into `elements`): `e` is always nil, so the defaults of facilityPoiDefaults are never applied through this path. For clusterType 'gasStationMarker' the function M.gasStationMarkerFormatFacility does not exist in this file (call error on nil).
- BUG: in zoneMarkerFormatFacility, the error message uses `data.id` while `data` is not defined (nil global variable -> runtime error on failure).
- Minor BUG: in getZonesForFacility, the "Missing Spot..." log message uses `v`, an undefined variable (prints nil) instead of zoneName.
- Outside career (career_career.isActive() false), onGetRawPoiListForLevel only publishes dragstrips; dealerships and computers only in career. The dragstrip tutorial is looked up hardcoded on the 'west_coast_usa' level.
- doors: list of pairs {sceneObjectName, ?, radius}; the default radius used is 6 m.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_facilities.formatFacilityToRawPoi(f, elements)` | Tries to format a facility according to its default clusterType and to apply the facilityPoiDefaults defaults to it (clusterInBigMap, interactableInPlayMode, quickTravelAvailable...). See the bug in the notes. | 445 |
| `freeroam_facilities.getAverageDoorPositionForFacility(facility)` | Average of the positions of the scene objects listed in facility.doors; zero vec3 with an error log if there are none. | 135 |
| `freeroam_facilities.getClosestDoorPositionForFacility(facility)` | Position of the door closest to the camera (core_camera.getPosition). | 156 |
| `freeroam_facilities.getDealership(id)` | Shortcut for getFacility('dealership', id). | 132 |
| `freeroam_facilities.getFacilities(levelName)` | Loads (cache) and returns all the facilities of a level, as a table of lists (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips). | 78 |
| `freeroam_facilities.getFacilitiesByType(type, levelName)` | List of the facilities of a type for a level (current level by default). | 117 |
| `freeroam_facilities.getFacility(type, id)` | Looks up a facility by type and id in the current level; error log if the type is invalid or the id not found. | 101 |
| `freeroam_facilities.getGarage(id)` | Shortcut for getFacility('garage', id). | 130 |
| `freeroam_facilities.getGaragePosRot(poi, veh)` | Best parking spot (for the vehicle) of the garage whose id is poi.id. | 248 |
| `freeroam_facilities.getGasStation(id)` | Shortcut for getFacility('gasStation', id). | 131 |
| `freeroam_facilities.getParkingSpotsForFacility(facility)` | Loads the facility's sites files (gameplay_sites_sitesManager.loadSites) and returns the parking spots whose names are in facility.parkingSpotNames. | 179 |
| `freeroam_facilities.getZonesForFacility(facility)` | Same for the zones listed in facility.zoneNames. | 214 |
| `freeroam_facilities.onActivityAcceptGatherData(elemData, activityData)` | Hook collecting the activities offered by a POI: card (icon, title, props, button) for garage (gameplay_garageMode.start), dealership (career_modules_vehicleShopping.openShop), computer (career_modules_computer.openMenu), dragstrip (rules or history screen via gameplay_drag_dragBridge). Stations are handled in gasStations.lua. *(internal)* *(hook)* | 493 |
| `freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook collecting a level's POIs: dealerships (except remotePurchaseOnly) and computers in career, dragstrips always. *(internal)* *(hook)* | 461 |
| `freeroam_facilities.onGetRawPoiListForTutorial(elements)` | Hook collecting the tutorial POIs: dragstrips with isTutorialForDragstrip on the west_coast_usa level. *(internal)* *(hook)* | 482 |
| `freeroam_facilities.teleportToGarage(garageId, veh, resetVeh)` | Teleports a vehicle to the garage (spawn.safeTeleport), resets the camera, emits onTeleportedToGarage(garageId, veh) and reframes the big map navigation if a route is active. | 260 |
| `freeroam_facilities.vehicleTriggerFormatFacility(f, elements)` | Same as walkingMarkerFormatFacility but with a vehicleTrigger-type marker (dragstrips). | 409 |
| `freeroam_facilities.walkingMarkerFormatFacility(f, elements)` | Adds to `elements` a POI with a pedestrian marker (center of the doors, radius = max distance + door radius) and a big map marker. | 372 |
| `freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon)` | Adds to `elements` a POI with a zone marker (zones, center = middle of the bounding box placed on the terrain, radius) and a big map marker with teleportation to the garage. | 353 |

### Parameter details

#### `freeroam_facilities.formatFacilityToRawPoi(f, elements)`

Tries to format a facility according to its default clusterType and to apply the facilityPoiDefaults defaults to it (clusterInBigMap, interactableInPlayMode, quickTravelAvailable...). See the bug in the notes.

- `f` (*table|nil*) : Facility.
- `elements` (*table[]*) : List of POIs.

#### `freeroam_facilities.getAverageDoorPositionForFacility(facility)`

Average of the positions of the scene objects listed in facility.doors; zero vec3 with an error log if there are none.

- `facility` (*table*) : Facility with `doors`.
- **returns**: vec3 Average position.

#### `freeroam_facilities.getClosestDoorPositionForFacility(facility)`

Position of the door closest to the camera (core_camera.getPosition).

- `facility` (*table*) : Facility with `doors`.
- **returns**: vec3|nil Position or nil.

#### `freeroam_facilities.getDealership(id)`

Shortcut for getFacility('dealership', id).

- `id` (*string*) : Dealership id.
- **returns**: table|nil Dealership.

#### `freeroam_facilities.getFacilities(levelName)`

Loads (cache) and returns all the facilities of a level, as a table of lists (garages, gasStations, dealerships, computers, privateSellers, deliveryProviders, dragstrips).

- `levelName` (*string*) : Level name.
- **returns**: table<string, table[]> Lists by type.

#### `freeroam_facilities.getFacilitiesByType(type, levelName)`

List of the facilities of a type for a level (current level by default).

- `type` (*string*) : Facility type.
- `levelName` (*string|nil*) : Level (default getCurrentLevelIdentifier()).
- **returns**: table[]|nil List, nil without a level.

#### `freeroam_facilities.getFacility(type, id)`

Looks up a facility by type and id in the current level; error log if the type is invalid or the id not found.

- `type` (*string*) : garage, gasStation, dealership, computer, privateSeller, deliveryProvider or dragstrip.
- `id` (*string*) : Facility id.
- **returns**: table|nil Facility.

#### `freeroam_facilities.getGarage(id)`

Shortcut for getFacility('garage', id).

- `id` (*string*) : Garage id.
- **returns**: table|nil Garage.

#### `freeroam_facilities.getGaragePosRot(poi, veh)`

Best parking spot (for the vehicle) of the garage whose id is poi.id.

- `poi` (*table*) : {id = garageId}
- `veh` (*userdata|nil*) : Vehicle (default player 0).
- **returns**: vec3|nil Position.
- **returns**: quat|nil Rotation.

#### `freeroam_facilities.getGasStation(id)`

Shortcut for getFacility('gasStation', id).

- `id` (*string*) : Station id.
- **returns**: table|nil Station.

#### `freeroam_facilities.getParkingSpotsForFacility(facility)`

Loads the facility's sites files (gameplay_sites_sitesManager.loadSites) and returns the parking spots whose names are in facility.parkingSpotNames.

- `facility` (*table*) : Facility.
- **returns**: table[] Parking spots found (not missing).

#### `freeroam_facilities.getZonesForFacility(facility)`

Same for the zones listed in facility.zoneNames.

- `facility` (*table*) : Facility.
- **returns**: table[] Zones found.

#### `freeroam_facilities.onActivityAcceptGatherData(elemData, activityData)`

Hook collecting the activities offered by a POI: card (icon, title, props, button) for garage (gameplay_garageMode.start), dealership (career_modules_vehicleShopping.openShop), computer (career_modules_computer.openMenu), dragstrip (rules or history screen via gameplay_drag_dragBridge). Stations are handled in gasStations.lua.

- `elemData` (*table[]*) : POI elements.
- `activityData` (*table[]*) : List to fill.

#### `freeroam_facilities.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook collecting a level's POIs: dealerships (except remotePurchaseOnly) and computers in career, dragstrips always.

- `levelIdentifier` (*string*) : Level.
- `elements` (*table[]*) : List to fill.

#### `freeroam_facilities.onGetRawPoiListForTutorial(elements)`

Hook collecting the tutorial POIs: dragstrips with isTutorialForDragstrip on the west_coast_usa level.

- `elements` (*table[]*) : List to fill.

#### `freeroam_facilities.teleportToGarage(garageId, veh, resetVeh)`

Teleports a vehicle to the garage (spawn.safeTeleport), resets the camera, emits onTeleportedToGarage(garageId, veh) and reframes the big map navigation if a route is active.

- `garageId` (*string*) : Garage id.
- `veh` (*userdata*) : Vehicle.
- `resetVeh` (*boolean|nil*) : Repair/reset the vehicle.

#### `freeroam_facilities.vehicleTriggerFormatFacility(f, elements)`

Same as walkingMarkerFormatFacility but with a vehicleTrigger-type marker (dragstrips).

- `f` (*table*) : Facility with `doors`.
- `elements` (*table[]*) : List to fill.

#### `freeroam_facilities.walkingMarkerFormatFacility(f, elements)`

Adds to `elements` a POI with a pedestrian marker (center of the doors, radius = max distance + door radius) and a big map marker.

- `f` (*table*) : Facility with `doors`.
- `elements` (*table[]*) : List to fill.

#### `freeroam_facilities.zoneMarkerFormatFacility(f, elements, bigMapIcon)`

Adds to `elements` a POI with a zone marker (zones, center = middle of the bounding box placed on the terrain, radius) and a big map marker with teleportation to the garage.

- `f` (*table*) : Facility.
- `elements` (*table[]*) : POI list to complete.
- `bigMapIcon` (*string|nil*) : Not used.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTeleportedToGarage` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/facilities.lua`.*
