# `gameplay_traffic_trafficUtils`

*File: `lua/ge/extensions/gameplay/traffic/trafficUtils.lua` · VM: Game Engine (GE) · 741 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_traffic_trafficUtils`: `extensions.load("gameplay_traffic_trafficUtils")`, then the global `gameplay_traffic_trafficUtils`

Traffic system toolbox: creating groups of traffic or police vehicles (via core_multiSpawn), loading *.vehGroup.json files, finding spawn points on a road, a line or a circle around a position, placing AI traffic vehicles and finding the closest traffic vehicle. A modder uses it to spawn traffic realistically from a position and a direction (by default the camera's).

## Example

```lua
local data, valid = gameplay_traffic_trafficUtils.findSafeSpawnPoint(pos, dir, 80, 400, 200)
if valid then --[[ data.pos, data.dir, data.n1, data.n2 ]] end
```

## Notes

- baseValues: minDrivability 0.5; minRadius 1.2 m; lowDamage 1000; highDamage 30000; lowSpeed 2.5 m/s.
- findSpawnPoint is an alias of findSpawnPointOnRoute; findSafeSpawnPoint corresponds to the internal function findSpawnPointActual.
- The findSpawnPoint* functions return (spawnData, valid) where spawnData = {pos, dir, n1?, n2?}; n1 and n2 are absent if valid is false.
- The search arguments are all optional: startPos/startDir = camera, minDist = 20 m, maxDist = 2000 m, targetDist = 0 (ideal distance up to which visibility is tested by raycast).
- getTrafficGroupFromFile: first looks for *.vehGroup.json in the level's folder, otherwise in /vehicleGroups/; picks a file at random.
- In createTrafficGroup, the parameters allMods, allConfigs and simpleVehs are overwritten at the start of the function (values of the settings trafficAllowMods and trafficSimpleVehicles, allConfigs forced to true): the arguments passed are ignored.
- In getBaseGroupParams, maxYear/minPop and country depend on the level; only USA, Germany, Italy, France, Japan are recognized (otherwise 'default').
- getAheadPos returns a cached vector: copy it if it must be kept.
- findSafeSpawnPoint never returns nil: as a last resort it teleports far away (10,000 to 12,000 m) with pos.z = 1; its second return value valid may then remain false.
- The functions checkRoad, checkRayCast, checkUsability, checkVehicles and getDefaultSpawnParams are local and not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2)` | Checks that a point is usable: between minDist and maxDist from the origin, outside intersections, and without conflict with the other active vehicles. | 293 |
| `gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods)` | Creates a group of police vehicles ('police' type configs), favoring the level's country, according to the trafficAllowMods setting. | 85 |
| `gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs)` | Creates a group of traffic vehicles according to the player's settings (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections): without police vehicles, or only 'proptraffic' vehicles in simple mode. | 58 |
| `gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options)` | Snaps a point onto a road lane (position and direction), taking into account the traffic direction (right- or left-hand driving), one-way roads and the estimated number of lanes. If no road is found within 30 m, returns the input values. | 297 |
| `gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` | Always returns a spawn point (forced teleport). Tries the road ahead first, then a nearby radial search (200-1000 m), a less strict wide search (200-2000 m, drivability 0.5) and finally very far (10,000-12,000 m, z = 1). | 648 |
| `gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` | Alias of findSpawnPointOnRoute (same function, same parameters and returns). | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options)` | Looks for a spawn point along a straight line starting from the origin in the direction startDir, in steps of options.gap (50 m by default). | 452 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options)` | Generates a path on the road ahead of the origin (random with branches, or options.route) and tests points of this path between minDist and maxDist. The steps can be modulated by the section's speed limit (gapVehCoef, gapSpeedCoef, bounded to 20-50 m). Also exported under the name findSpawnPoint. | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options)` | Looks for a spawn point by testing random directions around the origin, from minDist to maxDist in steps of options.gap (50 m by default), until a valid road is found. | 384 |
| `gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0)` | Returns a position located ahead of pos, in the direction dir, at distance scale. Used to compare distances between vehicles cheaply. | 161 |
| `gameplay_traffic_trafficUtils.getBaseGroupParams()` | Builds the base parameters of a vehicle group (car/truck type filter, level country, minPop 50; region filter if the trafficSmartSelections setting is active). | 49 |
| `gameplay_traffic_trafficUtils.getBaseValues()` | Returns the table of threshold values shared by the traffic modules (direct reference). | 45 |
| `gameplay_traffic_trafficUtils.getLevelInfo()` | Reads the current level's info file and returns its country (converted to an English name from a restricted list, otherwise 'default') and its region. | 26 |
| `gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters)` | Returns the id of the AI traffic vehicle closest to a position, with optional filters on the traffic vehicle's properties. | 678 |
| `gameplay_traffic_trafficUtils.getRoleConstructor(roleName)` | Returns the constructor of a traffic role (module under traffic/roles/), cached. If the role does not exist, a warning is written and the 'standard' role is used. | 150 |
| `gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options)` | Returns the data of a vehicle group file (*.vehGroup.json), chosen at random among those of the level (or /vehicleGroups/). | 107 |
| `gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options)` | Teleports all AI traffic vehicles to the given position and aligns them (core_multiSpawn.placeGroup), by default in 'roadAhead' mode with a 15 m gap. | 669 |
| `gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode)` | Converts a speed entered in the Traffic app (km/h, mph or auto) to m/s and applies it as the traffic speed limit (setTrafficVars({speedLimit})). 'auto' mode sends -1. | 707 |

### Parameter details

#### `gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2)`

Checks that a point is usable: between minDist and maxDist from the origin, outside intersections, and without conflict with the other active vehicles.

- `pos` (*vec3*) : Point to test.
- `origPos` (*vec3|nil*) : Origin of the distances (camera by default).
- `minDist` (*number|nil*) : Minimum distance (80 m by default).
- `maxDist` (*number|nil*) : Maximum distance (unlimited by default).
- `minVehDist` (*number|nil*) : Minimum distance to other vehicles (15 m by default).
- `n1` (*string|nil*) : First road node (to exclude intersections).
- `n2` (*string|nil*) : Second road node.
- **returns**: boolean true if the point is valid.

#### `gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods)`

Creates a group of police vehicles ('police' type configs), favoring the level's country, according to the trafficAllowMods setting.

- `amount` (*integer*) : Number of vehicles.
- `allMods` (*boolean*) : Ignored: overwritten by the trafficAllowMods setting.
- **returns**: table Group returned by core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs)`

Creates a group of traffic vehicles according to the player's settings (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections): without police vehicles, or only 'proptraffic' vehicles in simple mode.

- `amount` (*integer*) : Number of vehicles in the group.
- `allMods` (*boolean*) : Ignored: overwritten by the trafficAllowMods setting.
- `allConfigs` (*boolean*) : Ignored: forced to true.
- `simpleVehs` (*boolean*) : Ignored: overwritten by the trafficSimpleVehicles setting.
- **returns**: table Group returned by core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options)`

Snaps a point onto a road lane (position and direction), taking into account the traffic direction (right- or left-hand driving), one-way roads and the estimated number of lanes. If no road is found within 30 m, returns the input values.

- `pos` (*vec3*) : Position to adjust.
- `dir` (*vec3|nil*) : Direction; if nil, takes the road direction (legalDirection = true).
- `mapNode1` (*string|nil*) : First node of the road (searched if absent).
- `mapNode2` (*string|nil*) : Second node of the road.
- `options` (*table|nil*) : legalDirection (legal direction), minLane/maxLane (allowed lanes), roadDir (±1, toward/away from the player), roadLateralXnorm (direct lateral offset from -1 to 1).
- **returns**: vec3 New position.
- **returns**: vec3 New direction.

#### `gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)`

Always returns a spawn point (forced teleport). Tries the road ahead first, then a nearby radial search (200-1000 m), a less strict wide search (200-2000 m, drivability 0.5) and finally very far (10,000-12,000 m, z = 1).

- `startPos` (*vec3|nil*) : Origin.
- `startDir` (*vec3|nil*) : Travel direction.
- `minDist` (*number|nil*) : Minimum distance of the first search.
- `maxDist` (*number|nil*) : Maximum distance of the first search.
- `targetDist` (*number|nil*) : Ideal distance of the first search.
- `options` (*table|nil*) : Same options as findSpawnPointOnRoute (modified: minDrivability becomes 0.5 in the fallback searches).
- **returns**: table {pos, dir, ...}, never nil.
- **returns**: boolean true if a method found a valid point.

#### `gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)`

Alias of findSpawnPointOnRoute (same function, same parameters and returns).

- `startPos` (*vec3|nil*) : Origin.
- `startDir` (*vec3|nil*) : Travel direction.
- `minDist` (*number|nil*) : Minimum distance.
- `maxDist` (*number|nil*) : Maximum distance.
- `targetDist` (*number|nil*) : Ideal distance.
- `options` (*table|nil*) : See findSpawnPointOnRoute.
- **returns**: table {pos, dir, n1, n2}.
- **returns**: boolean true if valid.

#### `gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options)`

Looks for a spawn point along a straight line starting from the origin in the direction startDir, in steps of options.gap (50 m by default).

- `startPos` (*vec3|nil*) : Origin (camera by default).
- `startDir` (*vec3|nil*) : Direction of the line (camera forward by default).
- `minDist` (*number|nil*) : Minimum distance (20 m).
- `maxDist` (*number|nil*) : Maximum distance (2000 m).
- `targetDist` (*number|nil*) : Ideal distance for the visibility test.
- `options` (*table|nil*) : gap, usePrivateRoads, minDrivability, minRadius.
- **returns**: table {pos, dir, n1, n2}.
- **returns**: boolean true if a valid point was found.

#### `gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options)`

Generates a path on the road ahead of the origin (random with branches, or options.route) and tests points of this path between minDist and maxDist. The steps can be modulated by the section's speed limit (gapVehCoef, gapSpeedCoef, bounded to 20-50 m). Also exported under the name findSpawnPoint.

- `startPos` (*vec3|nil*) : Origin (camera by default).
- `startDir` (*vec3|nil*) : Travel direction (camera forward by default).
- `minDist` (*number|nil*) : Minimum distance (20 m).
- `maxDist` (*number|nil*) : Maximum distance (2000 m).
- `targetDist` (*number|nil*) : Ideal distance for the visibility test.
- `options` (*table|nil*) : gap (20 m), usePrivateRoads, minDrivability, minRadius, pathRandomization (0.5), route (supplied path), gapVehCoef, gapSpeedCoef.
- **returns**: table {pos, dir, n1, n2}.
- **returns**: boolean true if a valid point was found.

#### `gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options)`

Looks for a spawn point by testing random directions around the origin, from minDist to maxDist in steps of options.gap (50 m by default), until a valid road is found.

- `startPos` (*vec3|nil*) : Origin (camera by default).
- `startDir` (*vec3|nil*) : Start direction (not used by the radial method, reset to z = 0).
- `minDist` (*number|nil*) : Minimum distance (20 m).
- `maxDist` (*number|nil*) : Maximum distance (2000 m).
- `targetDist` (*number|nil*) : Ideal distance; below it, the point must be hidden from the camera (static raycast).
- `options` (*table|nil*) : gap, usePrivateRoads, minDrivability, minRadius.
- **returns**: table {pos, dir, n1, n2} (n1/n2 only if valid).
- **returns**: boolean true if a valid point was found.

#### `gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0)`

Returns a position located ahead of pos, in the direction dir, at distance scale. Used to compare distances between vehicles cheaply.

- `pos` (*vec3*) : Start position.
- `dir` (*vec3*) : Direction.
- `scale` (*number*) : Distance in meters; if 0, returns pos as is.
- `useZ0` (*boolean|nil*) : If true, flattens the direction to horizontal (z = 0) before normalizing it.
- **returns**: vec3 Cached vector (copy if kept); or pos if scale == 0.

#### `gameplay_traffic_trafficUtils.getBaseGroupParams()`

Builds the base parameters of a vehicle group (car/truck type filter, level country, minPop 50; region filter if the trafficSmartSelections setting is active).

- **returns**: table Parameters to pass to core_multiSpawn.createGroup.

#### `gameplay_traffic_trafficUtils.getBaseValues()`

Returns the table of threshold values shared by the traffic modules (direct reference).

- **returns**: table {minDrivability, minRadius, lowDamage, highDamage, lowSpeed}.

#### `gameplay_traffic_trafficUtils.getLevelInfo()`

Reads the current level's info file and returns its country (converted to an English name from a restricted list, otherwise 'default') and its region.

- **returns**: table {country = string, region = string|nil}.

#### `gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters)`

Returns the id of the AI traffic vehicle closest to a position, with optional filters on the traffic vehicle's properties.

- `pos` (*vec3|nil*) : Reference position (camera by default).
- `filters` (*table|nil*) : Property = value pairs; a vehicle is excluded if the property exists with a different value.
- **returns**: integer|nil Id of the closest vehicle.
- **returns**: number Distance in meters (math.huge if no vehicle).

#### `gameplay_traffic_trafficUtils.getRoleConstructor(roleName)`

Returns the constructor of a traffic role (module under traffic/roles/), cached. If the role does not exist, a warning is written and the 'standard' role is used.

- `roleName` (*string*) : Role name (e.g. 'standard', 'police', 'suspect', 'empty').
- **returns**: function Role constructor.

#### `gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options)`

Returns the data of a vehicle group file (*.vehGroup.json), chosen at random among those of the level (or /vehicleGroups/).

- `options` (*table|nil*) : options.name = filter on the file name (substring, lowercase); options.useCustom = true to force /vehicleGroups/.
- **returns**: table|nil Group data (data field of the file if present).
- **returns**: string|nil Path of the chosen file.

#### `gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options)`

Teleports all AI traffic vehicles to the given position and aligns them (core_multiSpawn.placeGroup), by default in 'roadAhead' mode with a 15 m gap.

- `pos` (*vec3|nil*) : Position (camera by default).
- `dir` (*vec3|nil*) : Direction (camera forward by default).
- `options` (*table|nil*) : placeGroup options; mode ('roadAhead' by default) and gap (15 by default).

#### `gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode)`

Converts a speed entered in the Traffic app (km/h, mph or auto) to m/s and applies it as the traffic speed limit (setTrafficVars({speedLimit})). 'auto' mode sends -1.

- `speed` (*number|nil*) : Speed in the mode's unit (0 by default).
- `mode` (*string|nil*) : 'km/h', 'mph' or 'auto' (default); other value = m/s.
- **returns**: number Applied speed in m/s (-1 in auto mode).

## Fields

| Field | Type | Description |
|---|---|---|
| `debugMode` | boolean | If true, writes the parameters and results of spawn point searches to the log. false by default. |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/trafficUtils.lua`.*
