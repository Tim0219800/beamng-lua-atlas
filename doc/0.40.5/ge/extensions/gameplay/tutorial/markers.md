# `gameplay_tutorial_markers`

*File: `lua/ge/extensions/gameplay/tutorial/markers.lua` · VM: Game Engine (GE) · 312 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_tutorial_markers`: `extensions.load("gameplay_tutorial_markers")`, then the global `gameplay_tutorial_markers`

Manages the career tutorial's visual markers: attention markers above a vehicle or at a position, direction markers on a parking spot, and ground decals of parking spots whose color indicates whether the vehicle is properly parked (white: not parked, yellow: parked but badly oriented, green: parked and well oriented). Also provides the parking tests used to validate a parking objective.

## Example

```lua
local id = gameplay_tutorial_markers.createMarkerAboveVehicle(getPlayerVehicle(0))
-- later
gameplay_tutorial_markers.removeMarker(id)
```

## Notes

- Parking tolerance 0.8; "stationary" speed < 0.1 m/s; orientation correct if dot product with the spot's front >= 0.7.
- Markers grow with distance from the camera: factor 1 up to 30 m, up to 3.5 at 250 m.
- Parking decals are only drawn within a 300 m radius (fade between 250 and 300 m) and use the texture art/shapes/interface/parkDecalStripes.png.
- Markers are identified by an increasing integer returned on creation.
- update must be called every frame by the calling code (the file does not define an onUpdate hook).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot)` | Registers a ground decal for a parking spot (displayed by update). | 139 |
| `gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state)` | Validates a parking objective: parked, properly oriented and motionless for the requested duration. The timer state is kept in the state table. | 193 |
| `gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot)` | Tests whether a vehicle is parked in a spot, properly oriented and stationary. | 167 |
| `gameplay_tutorial_markers.cleanup()` | Removes all markers and clears the decals and associated vehicles. | 303 |
| `gameplay_tutorial_markers.clearAllMarkers()` | Removes all markers. | 131 |
| `gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale)` | Creates a direction marker placed 1.75 m above a parking spot, oriented according to the spot's rotation. | 82 |
| `gameplay_tutorial_markers.createMarker(pos, rot, scale)` | Creates an attention marker (scenario/raceMarkers/attention) at a position, 1.75 m above for the visible part, and displays it. | 39 |
| `gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale)` | Creates an attention marker 2 m above a vehicle (scale 1.5 by default). | 75 |
| `gameplay_tutorial_markers.removeMarker(markerId)` | Removes a marker by its id. | 118 |
| `gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName)` | Removes a spot's decal and the vehicle that was associated with it. | 157 |
| `gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter)` | Sets the function that provides the vehicle to test for the parking decals' color, when no vehicle is associated with the spot. | 30 |
| `gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle)` | Associates a vehicle with a spot to determine its decal's color. | 163 |
| `gameplay_tutorial_markers.update(dt, dtSim)` | Updates the markers (scale according to camera distance, update of each marker) then computes and sends the nearby parking decals to Engine.Render.DynamicDecalMgr. | 231 |

### Parameter details

#### `gameplay_tutorial_markers.addParkingSpotDecal(parkingSpot)`

Registers a ground decal for a parking spot (displayed by update).

- `parkingSpot` (*table*) : Spot with name, pos, rot, scl.

#### `gameplay_tutorial_markers.checkParkGoalWithStationaryTime(vehicle, parkingSpot, dtReal, requiredSeconds, state)`

Validates a parking objective: parked, properly oriented and motionless for the requested duration. The timer state is kept in the state table.

- `vehicle` (*table*) : Vehicle object.
- `parkingSpot` (*table*) : Parking spot.
- `dtReal` (*number*) : Real time delta (s).
- `requiredSeconds` (*number|nil*) : Required stationary duration (1 s by default).
- `state` (*table|nil*) : State table {stationaryTimer, wasStationary}, to reuse from one call to the next.
- **returns**: boolean true when the objective is reached.

#### `gameplay_tutorial_markers.checkVehicleInParkingSpot(vehicle, parkingSpot)`

Tests whether a vehicle is parked in a spot, properly oriented and stationary.

- `vehicle` (*table*) : Vehicle object.
- `parkingSpot` (*table*) : Parking spot (checkParking method, rot).
- **returns**: boolean isParked: parked in the spot (tolerance 0.8).
- **returns**: boolean isFacingCorrect: compatible orientation (dot product >= 0.7).
- **returns**: boolean isStationary: speed < 0.1 m/s.

#### `gameplay_tutorial_markers.createDirectionMarkerFromParkingSpot(parkingSpot, scale)`

Creates a direction marker placed 1.75 m above a parking spot, oriented according to the spot's rotation.

- `parkingSpot` (*table*) : Parking spot with pos, rot (and name).
- `scale` (*vec3|nil*) : Scale; x is used as the radius (2 by default).
- **returns**: integer|nil Marker id, or nil if the spot is invalid or loading fails.

#### `gameplay_tutorial_markers.createMarker(pos, rot, scale)`

Creates an attention marker (scenario/raceMarkers/attention) at a position, 1.75 m above for the visible part, and displays it.

- `pos` (*vec3*) : Marker position.
- `rot` (*quat|nil*) : Optional rotation.
- `scale` (*vec3|nil*) : Scale (1,1,1 by default).
- **returns**: integer|nil Marker id, or nil on failure.

#### `gameplay_tutorial_markers.createMarkerAboveVehicle(vehicle, scale)`

Creates an attention marker 2 m above a vehicle (scale 1.5 by default).

- `vehicle` (*table*) : Vehicle object (getPosition).
- `scale` (*vec3|nil*) : Marker scale.
- **returns**: integer|nil Marker id, or nil.

#### `gameplay_tutorial_markers.removeMarker(markerId)`

Removes a marker by its id.

- `markerId` (*integer*) : Id returned on creation.
- **returns**: boolean true if removed, false if not found.

#### `gameplay_tutorial_markers.removeParkingSpotDecal(parkingSpotName)`

Removes a spot's decal and the vehicle that was associated with it.

- `parkingSpotName` (*string*) : Spot name.

#### `gameplay_tutorial_markers.setDefaultParkingSpotVehicleGetter(getter)`

Sets the function that provides the vehicle to test for the parking decals' color, when no vehicle is associated with the spot.

- `getter` (*function|nil*) : Function with no argument returning a vehicle (object) or nil.

#### `gameplay_tutorial_markers.setParkingSpotVehicle(parkingSpotName, vehicle)`

Associates a vehicle with a spot to determine its decal's color.

- `parkingSpotName` (*string*) : Spot name.
- `vehicle` (*table|nil*) : Vehicle object.

#### `gameplay_tutorial_markers.update(dt, dtSim)`

Updates the markers (scale according to camera distance, update of each marker) then computes and sends the nearby parking decals to Engine.Render.DynamicDecalMgr.

- `dt` (*number*) : Real-time delta.
- `dtSim` (*number*) : Simulation time delta.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/tutorial/markers.lua`.*
