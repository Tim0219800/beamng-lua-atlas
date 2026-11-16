# `freeroam_gasStations`

*File: `lua/ge/extensions/freeroam/gasStations.lua` · VM: Game Engine (GE) · 177 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_gasStations`: `extensions.load("freeroam_gasStations")`, then the global `freeroam_gasStations`

Simple refueling management at gas stations (fuel or electric charging). Provides the stations' points of interest (POIs) for the big map and markers, the "refuel" action button and the filling of the vehicle's tanks; in career mode, delegates the transaction to career_modules_fuel. Global: freeroam_gasStations. Depends on gameplay_achievement.

## Notes

- Station POIs are only added if career_career.isActive() or if the enableGasStationsInFreeroam setting is true. onGetRawPoiListForLevel calls career_career.isActive() without a nil test.
- Energy types: gasoline, diesel, kerosine, n2o, any, unknown -> "refuel"; electricEnergy -> "recharge". The `air` type is ignored (ignoreFuelTypes).
- Outside career, refuelCar fills each compatible tank to tank.maxEnergy via the vehicle action setEnergyStorageEnergy; in career, at the first compatible tank, launches career_modules_fuel.startTransaction(gasStation) then stops (return in the callback).
- "VEHICLE_REFUELLED" achievement unlocked when at least one tank is filled; messages via guihooks 'Message' (refueling category).
- gasStationCenterRadius divides by count even if no pump was found (count = 0): the center then becomes NaN/inf.

**Dependencies (loaded first):** `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_gasStations.formatGasStationPoi(gasStation)` | Builds a station's POI element: id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round or poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Electric station if energyTypes contains electricEnergy. | 53 |
| `freeroam_gasStations.gasStationCenterRadius(f)` | Computes the center (average of the pump positions, scene objects named by pump[1]) and the radius (max distance to the center) of a station. | 30 |
| `freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData)` | Hook collecting a POI's activities: for each element of type gasStation, adds a card (icon, title, props per fuel type, "refuel/recharge/refuelMixed" button whose action calls refuelCar on player vehicle 0). *(internal)* *(hook)* | 80 |
| `freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook collecting a level's POIs: adds one POI per station of freeroam_facilities.getFacilities(levelIdentifier).gasStations (under conditions, see notes). *(internal)* *(hook)* | 69 |
| `freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh)` | Fills the vehicle: requests its tanks (core_vehicleBridge.requestValue 'energyStorage'), checks compatibility with fuelTypes, fills or launches the career transaction, displays the messages and plays the refueling sound. | 123 |

### Parameter details

#### `freeroam_gasStations.formatGasStationPoi(gasStation)`

Builds a station's POI element: id, data {type='gasStation', facility}, markerInfo {gasStationMarker {pumps, pos, radius, electric}, bigmapMarker {pos, icon (poi_fuel_round or poi_charge_round), name, description, thumbnail, previews, cardIcon}}. Electric station if energyTypes contains electricEnergy.

- `gasStation` (*table*) : Station facility.
- **returns**: table POI element.

#### `freeroam_gasStations.gasStationCenterRadius(f)`

Computes the center (average of the pump positions, scene objects named by pump[1]) and the radius (max distance to the center) of a station.

- `f` (*table*) : Station facility with `pumps`: list of pairs whose 1st element is the pump's object name.
- **returns**: vec3 Center.
- **returns**: number Radius (m).

#### `freeroam_gasStations.onActivityAcceptGatherData(elemData, activityData)`

Hook collecting a POI's activities: for each element of type gasStation, adds a card (icon, title, props per fuel type, "refuel/recharge/refuelMixed" button whose action calls refuelCar on player vehicle 0).

- `elemData` (*table[]*) : POI elements.
- `activityData` (*table[]*) : List to fill.

#### `freeroam_gasStations.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook collecting a level's POIs: adds one POI per station of freeroam_facilities.getFacilities(levelIdentifier).gasStations (under conditions, see notes).

- `levelIdentifier` (*string*) : Level name.
- `elements` (*table*) : List to fill.

#### `freeroam_gasStations.refuelCar(gasStation, fuelTypes, veh)`

Fills the vehicle: requests its tanks (core_vehicleBridge.requestValue 'energyStorage'), checks compatibility with fuelTypes, fills or launches the career transaction, displays the messages and plays the refueling sound.

- `gasStation` (*table*) : Station's POI element (also used as the argument of career_modules_fuel.startTransaction).
- `fuelTypes` (*table<string, boolean>*) : Energy types supplied (set).
- `veh` (*userdata*) : Vehicle object to refuel.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `obj:` `getPosition`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/gasStations.lua`.*
