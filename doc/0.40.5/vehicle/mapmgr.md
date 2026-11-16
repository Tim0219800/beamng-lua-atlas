# `mapmgr`

*File: `lua/vehicle/mapmgr.lua` · VM: Vehicle · 414 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `mapmgr`

Bridge between the vehicle and the game's road map (navgraph). It receives the map from the game Lua (GE) through a mailbox, decodes it into a graph (graphpath) and a spatial tree (kd-tree of edges), and provides to the AI and the extensions: nearest road search (findClosestRoad, findBestRoad), point-to-point path (getPointToPointPath), surface normal (surfaceNormalBelow), nearby objects (getObjects) and traffic signals. It also sends the vehicle state to the GE every frame (map.objectData: seated player, damage, horn, lights, collisions) via sendTracking.

## Example

```lua
local a, b, dist = mapmgr.findBestRoad(obj:getPosition(), obj:getDirectionVector())
local path = mapmgr.getPointToPointPath(obj:getPosition(), vec3(100, 200, 0), 0.5, 1e4, 1, 100)
local n = mapmgr.surfaceNormalBelow(obj:getPosition(), 2)
```

## Notes

- mapData (also M.mapData) is a graphpath imported from the map; M.nodeAliases, M.rules, M.signalsData and M.changeSet are also published. mapData stays nil until the map has been received (call requestMap or wait for the onVehicleMapmgrUpdate hook on the GE side): findClosestRoad / findBestRoad would crash if mapData or edgeKdTree is nil (no check), unlike getPointToPointPath which returns {}.
- sendTracking is a nop by default (dynamically assigned): enableTracking replaces it with the real function, disableTracking sets it back to nop. main.lua calls mapmgr.sendTracking() every frame (before ai.updateGFX). The field therefore appears as "undefined nop" in the extraction but nop is a global function defined elsewhere.
- init enables tracking if the vehicle has wheels (wheels.wheelCount > 0) or if v.data.general.enableTracking is true.
- sendTracking sends the GE a call `map.objectData(id, anyPlayerSeated, damage, states, collisions)`, where states = horn, lightbar, hazard_enabled, turnsignal (if non-zero) and ignitionLevel (if 0 or 1) read from electrics.values; collisions = ids of colliding objects (obj:getObjectCollisionIds). It also requests the map from the GE (map.request(id, -2)) when the traffic signals change version unexpectedly.
- Dynamic drivability: updateDrivabilities reads the 'updateDrivabilities' mailbox (flat list {nodeA, nodeB, drivability,…}) and modifies the length and drivability of the graph's edges.
- findClosestRoad doubles the search area until it finds an edge or exceeds 200 m; the returned distance is in meters, with a wZ bias (default 1.85) that penalizes height differences. The code comment notes that the same function exists in ge/map.lua.
- findBestRoad picks, among the edges whose radius covers the position, the one most aligned with the vehicle direction (absolute value if the edge is two-way), penalized by edge.gated; falls back to findClosestRoad.

## Functions

| Function | Description | Line |
|---|---|---|
| `mapmgr.clearCustomMap()` | Removes the custom map if it was active (mapData set back to nil). | 79 |
| `mapmgr.disableTracking(forceDisable)` | Disables sending the state (sendTracking = nop) if forceDisable or if no player is seated. | 163 |
| `mapmgr.enableTracking(name)` | Enables sending the state to the GE: associates an object name with the id (map.setNameForId) and installs sendTracking. | 158 |
| `mapmgr.findBestRoad(pos, dir, wZ)` | Finds the most relevant road edge according to position AND direction (alignment, one-way, gates), falling back to findClosestRoad. | 271 |
| `mapmgr.findClosestRoad(pos, wZ)` | Finds the road edge closest to a position (distance to the segment with wZ height bias). Requires the map to be loaded. | 241 |
| `mapmgr.getObjects()` | Returns the table of nearby objects (mailbox 'objUpdate'), decoded at most once per simulation instant. | 179 |
| `mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Computes a path on the navgraph between two positions (the start point and the target are attached to nearby edges). Returns {} if the map is not loaded. | 379 |
| `mapmgr.init()` | Enables tracking to the GE if the vehicle has wheels or general.enableTracking. Called by main.lua (initSystems, last step). *(internal)* | 173 |
| `mapmgr.requestMap()` | Asks the GE to send the map (map.request(id, serial of the current map)). | 68 |
| `mapmgr.reset()` | Empties the M.objects list on vehicle reset. *(internal)* | 169 |
| `mapmgr.setCustomMap(map)` | Replaces the map with a provided graph (tool/scenario) and forgets the build number. | 72 |
| `mapmgr.setMap(newbuildSerial)` | Loads the map from the 'mapData' mailbox: builds the graph, the edge kd-tree, the rules and aliases, applies the drivabilities then notifies the GE via the onVehicleMapmgrUpdate hook. Does nothing if the build number is already the loaded one or if the data is incomplete. *(internal)* | 45 |
| `mapmgr.setSignals(data)` | Sets the table of traffic signals (M.signalsData). *(internal)* | 87 |
| `mapmgr.setSurfaceNormalBelow(v, p, r)` | Computes the surface normal under a point by sampling the ground height at 3 points of a triangle of radius r around p (obj:getSurfaceHeightBelow). Accurate up to about 50° of slope; returns (0,0,1) if the terrain is too low/irregular. Writes the result into v without allocation. | 194 |
| `mapmgr.surfaceNormalBelow(p, r)` | Allocating version of setSurfaceNormalBelow: returns a new vec3. | 226 |
| `mapmgr.updateDrivabilities()` | Applies to the graph the drivability changes received through the 'updateDrivabilities' mailbox; does nothing if the mailbox is empty or there is no graph. *(internal)* | 21 |
| `mapmgr.updateSignals(data)` | Updates the signals' action from a batch {key1, key2, key3, action, …} (in groups of 4). *(internal)* | 91 |

### Parameter details

#### `mapmgr.disableTracking(forceDisable)`

Disables sending the state (sendTracking = nop) if forceDisable or if no player is seated.

- `forceDisable` (*boolean|nil*) : true to disable even if a player is seated.

#### `mapmgr.enableTracking(name)`

Enables sending the state to the GE: associates an object name with the id (map.setNameForId) and installs sendTracking.

- `name` (*string|nil*) : Vehicle name in the map; the vehicle id if nil.

#### `mapmgr.findBestRoad(pos, dir, wZ)`

Finds the most relevant road edge according to position AND direction (alignment, one-way, gates), falling back to findClosestRoad.

- `pos` (*vec3|nil*) : Position; the vehicle's if nil.
- `dir` (*vec3|nil*) : Direction; the vehicle's if nil.
- `wZ` (*number|nil*) : Weight of the height difference.
- **returns**: any First node of the edge.
- **returns**: any Second node of the edge.
- **returns**: number Distance in meters.

#### `mapmgr.findClosestRoad(pos, wZ)`

Finds the road edge closest to a position (distance to the segment with wZ height bias). Requires the map to be loaded.

- `pos` (*vec3|nil*) : Position; the vehicle's if nil.
- `wZ` (*number|nil*) : Weight of the height difference (1.85 by default).
- **returns**: any Identifier of the first node of the edge (nil if nothing found within 200 m).
- **returns**: any Identifier of the second node of the edge.
- **returns**: number Distance to the edge in meters.

#### `mapmgr.getObjects()`

Returns the table of nearby objects (mailbox 'objUpdate'), decoded at most once per simulation instant.

- **returns**: table M.objects (shared, do not keep between frames).

#### `mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)`

Computes a path on the navgraph between two positions (the start point and the target are attached to nearby edges). Returns {} if the map is not loaded.

- `startPos` (*vec3*) : Start position.
- `targetPos` (*vec3*) : Target position.
- `cutOffDrivability` (*number|nil*) : Roads of lower or equal drivability are penalized.
- `dirMult` (*number|nil*) : Penalty if the path does not respect legal directions (> 1, typically >= 1e4); nil or 1 = none.
- `penaltyAboveCutoff` (*number|nil*) : Cost multiplier above the drivability threshold.
- `penaltyBelowCutoff` (*number|nil*) : Cost multiplier below the threshold.
- `wZ` (*number|nil*) : Height bias (4 by default) to choose the arrival node.
- **returns**: table List of path nodes (graphpath format), {} if impossible.

#### `mapmgr.setCustomMap(map)`

Replaces the map with a provided graph (tool/scenario) and forgets the build number.

- `map` (*table*) : Graph in graphpath format.

#### `mapmgr.setMap(newbuildSerial)`

Loads the map from the 'mapData' mailbox: builds the graph, the edge kd-tree, the rules and aliases, applies the drivabilities then notifies the GE via the onVehicleMapmgrUpdate hook. Does nothing if the build number is already the loaded one or if the data is incomplete.

- `newbuildSerial` (*number|nil*) : Build number of the announced map; ignored if identical to the one already loaded.

#### `mapmgr.setSignals(data)`

Sets the table of traffic signals (M.signalsData).

- `data` (*table*) : Signals indexed [group][?][?] with an action field.

#### `mapmgr.setSurfaceNormalBelow(v, p, r)`

Computes the surface normal under a point by sampling the ground height at 3 points of a triangle of radius r around p (obj:getSurfaceHeightBelow). Accurate up to about 50° of slope; returns (0,0,1) if the terrain is too low/irregular. Writes the result into v without allocation.

- `v` (*vec3*) : Output vector (modified; also used as a temporary sample point).
- `p` (*vec3*) : Point above the surface.
- `r` (*number|nil*) : Sampling radius in meters (2 by default).

#### `mapmgr.surfaceNormalBelow(p, r)`

Allocating version of setSurfaceNormalBelow: returns a new vec3.

- `p` (*vec3*) : Point above the surface.
- `r` (*number|nil*) : Sampling radius (2 by default).
- **returns**: vec3 Unit normal of the surface.

#### `mapmgr.updateSignals(data)`

Updates the signals' action from a batch {key1, key2, key3, action, …} (in groups of 4).

- `data` (*table|nil*) : Flat list of updates.

## Fields

| Field | Type | Description |
|---|---|---|
| `objectCollisionIds` | table | Ids of the objects colliding with this vehicle, refreshed at each sendTracking. |
| `objects` | table | Nearby objects decoded from the 'objUpdate' mailbox (filled by getObjects; reset to {} by reset). |
| `sendTracking` | function | nop until tracking is enabled (enableTracking), then the function that sends the state to the GE. Called every frame by main.lua. |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getLastMailbox`, `getLastMailboxToBuffer`, `getLastMailboxVersion`, `getObjectCollisionIds`, `getPosition`, `getSimTime`, `getSurfaceHeightBelow`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/mapmgr.lua`.*
