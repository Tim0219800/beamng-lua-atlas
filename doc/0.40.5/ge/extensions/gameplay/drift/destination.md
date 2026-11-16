# `gameplay_drift_destination`

*File: `lua/ge/extensions/gameplay/drift/destination.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drift_destination`: `extensions.load("gameplay_drift_destination")`, then the global `gameplay_drift_destination`

Route tracking of drift mode ("A to B"). setRacePath loads a race path (gameplay/race/path) from a JSON file, optionally reversed, and extracts its points. Every frame, it computes the remaining distance along this path, the distance to the planned route, whether the vehicle is driving the wrong way, and accumulates the distance driven the wrong way: beyond a threshold (10 m by default) wrongWayFail becomes true. A drift mission modder reads these values to display progress or fail the mission.

## Example

```lua
gameplay_drift_destination.setRacePath({filePath = '/levels/west_coast_usa/race/driftRoute.race.json', reverse = false, maxWrongWayDist = 15})
local reste = gameplay_drift_destination.getRemainingDist()
```

## Notes

- The tracked vehicle is that of gameplay_drift_drift.getVehId() (a single car), unlike bounds.lua which handles several vehicles.
- setRacePath completes data in place: reverse = false, maxWrongWayDist = 10 (defaultMaxWrongWayDist), disableWrongWayAndDist = false. Without data.filePath, it logs a warning and does nothing.
- Wrong way: speed > 0.5 m/s and dot product (segment direction, velocity) <= 0; disabled if disableWrongWayAndDist. The onDriftWrongWay hook is emitted every frame as long as the vehicle is going the wrong way.
- wrongWayFail becomes true with a 0.2 s delay (asynchronous job) to give priority to the vehicle reset message; it goes back to false as soon as the vehicle is no longer going the wrong way.
- reset() sets remainingDist, the accumulated wrong-way distance and the last position back to zero but does not set wrongWayFail or goingWrongWay back to false.
- getRemainingDist, getGoingWrongWay and getWrongWayFail are nil as long as no path is loaded or computed.
- Distances are in meters.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drift_destination.getDisableWrongWayAndDist()` | Indicates whether wrong-way detection and distance computation are disabled (value passed to setRacePath). | 196 |
| `gameplay_drift_destination.getDistToIntendedRoad()` | Distance (m) of the vehicle to the nearest planned road segment. | 192 |
| `gameplay_drift_destination.getDriftDebugInfo()` | Debug configuration table of the extension: {default = false, canBeChanged = true}. | 184 |
| `gameplay_drift_destination.getGC()` | Lua garbage produced by the last frame measured by the profiler. | 188 |
| `gameplay_drift_destination.getGoingWrongWay()` | Indicates whether the vehicle is currently going the wrong way. | 176 |
| `gameplay_drift_destination.getPathData()` | Loaded race path object (gameplay/race/path). | 164 |
| `gameplay_drift_destination.getRemainingDist()` | Remaining distance (m) along the path to the last point. | 172 |
| `gameplay_drift_destination.getWaypoints()` | Positions of the path points (in travel order, reversed if reverse). | 168 |
| `gameplay_drift_destination.getWrongWayFail()` | True when the accumulated wrong-way distance exceeds maxWrongWayDist. | 180 |
| `gameplay_drift_destination.onUpdate()` | Per-frame hook: updates remaining distance, wrong way and wrong-way failure (nothing if gameplay_drift_drift has no vehicle position). *(internal)* *(hook)* | 147 |
| `gameplay_drift_destination.onVehicleResetted(vehicleId)` | Hook: vehicle reset; sets the last position back to zero so the reset jump is not counted as distance. *(internal)* *(hook)* | 206 |
| `gameplay_drift_destination.reset()` | Sets the remaining distance, the accumulated wrong-way distance and the last position back to zero (not wrongWayFail). | 200 |
| `gameplay_drift_destination.setRacePath(data)` | Loads the race path from data.filePath (JSON), reverses it if data.reverse, applies autoConfig and extracts the positions of the sorted waypoints. | 27 |

### Parameter details

#### `gameplay_drift_destination.getDisableWrongWayAndDist()`

Indicates whether wrong-way detection and distance computation are disabled (value passed to setRacePath).

- **returns**: boolean|nil disableWrongWayAndDist, nil before setRacePath.

#### `gameplay_drift_destination.getDistToIntendedRoad()`

Distance (m) of the vehicle to the nearest planned road segment.

- **returns**: number Distance, 0 by default.

#### `gameplay_drift_destination.getDriftDebugInfo()`

Debug configuration table of the extension: {default = false, canBeChanged = true}.

- **returns**: table Debug info.

#### `gameplay_drift_destination.getGC()`

Lua garbage produced by the last frame measured by the profiler.

- **returns**: number Garbage amount.

#### `gameplay_drift_destination.getGoingWrongWay()`

Indicates whether the vehicle is currently going the wrong way.

- **returns**: boolean|nil true if wrong way.

#### `gameplay_drift_destination.getPathData()`

Loaded race path object (gameplay/race/path).

- **returns**: table|nil Path, nil before setRacePath.

#### `gameplay_drift_destination.getRemainingDist()`

Remaining distance (m) along the path to the last point.

- **returns**: number|nil Remaining distance.

#### `gameplay_drift_destination.getWaypoints()`

Positions of the path points (in travel order, reversed if reverse).

- **returns**: vec3[]|nil List of positions.

#### `gameplay_drift_destination.getWrongWayFail()`

True when the accumulated wrong-way distance exceeds maxWrongWayDist.

- **returns**: boolean|nil Wrong-way failure.

#### `gameplay_drift_destination.onVehicleResetted(vehicleId)`

Hook: vehicle reset; sets the last position back to zero so the reset jump is not counted as distance.

- `vehicleId` (*integer*) : ID of the reset vehicle.

#### `gameplay_drift_destination.setRacePath(data)`

Loads the race path from data.filePath (JSON), reverses it if data.reverse, applies autoConfig and extracts the positions of the sorted waypoints.

- `data` (*table*) : {filePath = string, reverse = boolean|nil, maxWrongWayDist = number|nil (default 10), disableWrongWayAndDist = boolean|nil}.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDriftWrongWay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drift/destination.lua`.*
