# `ui_uiNavi`

*File: `lua/ge/extensions/ui/uiNavi.lua` · VM: Game Engine (GE) · 484 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_uiNavi`: `extensions.load("ui_uiNavi")`, then the global `ui_uiNavi`

Lua back-end of the interface navigation map (minimap, GPS). It sends the UI the positions of tracked vehicles, points of interest, missions and road nodes of the map, and handles a simple route (ground markers via core_groundMarkers). It also feeds the JS texture of a vehicle dashboard with the map.

## Notes

- onGuiUpdate sends 'NavigationMapUpdate' every GUI frame (the code notes "TODO: convert into stream"). When no tracked vehicle is controlled (or in free camera), the camera position is used instead.
- The map object tables are reused from one frame to the next (pool): do not keep the received data.
- Bug: getSpawnpoints assigns the global variable `info` (no `local`).
- Bug: getPointsOfInterest returns nothing (nil) when the PointOfInterestSet set does not exist; requestPoi will then send nil to the UI, and requestUIDashboardMap ignores the result in that case.
- Bug: requestVehicleDashboardMap reads a global variable `minimapImage` (nil in this file), so the field is always absent from the table sent.
- Non-exported local functions: route_update (exported under the name route_requestStatus), getNodesMinified (unused).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_uiNavi.findClosestRoad(x, y, z)` | Returns the result of map.findClosestRoad for the point (x, y, z): information about the closest road segment. | 9 |
| `ui_uiNavi.getBusStops()` | Lists the bus stops (BeamNGTrigger of type 'busstop'). Stops less than 70 m apart (on either side of the road) are merged into one point in the middle. | 183 |
| `ui_uiNavi.getMissions()` | Returns the currently stored missions table (empty at start; the examples are commented out in the code). | 119 |
| `ui_uiNavi.getPointsOfInterest()` | Returns the objects of the scene's PointOfInterestSet as a list of {name, pos, desc, title, type}. | 44 |
| `ui_uiNavi.getSpawnpoints()` | Lists the SpawnSphere objects of the scene with their position ({x,y,z} as a table). If the level's mission file exists and contains `spawnPoints`, the additional information (keyed by objectname) is merged into each entry. | 13 |
| `ui_uiNavi.onExtensionLoaded()` | Hook called when the extension loads: sends an empty 'RouteUpdate' to the UI. *(internal)* *(hook)* | 453 |
| `ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook called every GUI frame. Gathers the objects tracked by the map (uiState ~= 0) with position, heading in degrees, speed and state, then sends 'NavigationMapUpdate' ({controlID, objects}) to the UI. *(internal)* *(hook)* | 228 |
| `ui_uiNavi.onVehicleSwitched(oid, nid)` | Hook called when the controlled vehicle changes. The body is entirely commented out: does nothing. *(internal)* *(hook)* | 437 |
| `ui_uiNavi.planRoute(posX, posY)` | Development tool: computes the path between two positions via map.getPath and sends it to the UI via 'RoutePlanned'. | 172 |
| `ui_uiNavi.requestMissions()` | Sends the current mission list to the UI via the 'MapMissions' event. | 123 |
| `ui_uiNavi.requestPoi()` | Sends the points of interest to the UI via the 'MapPointsOfInterest' event. | 60 |
| `ui_uiNavi.requestUIDashboardMap()` | Builds the map data (terrain tiles of the current level, points of interest, road nodes) and sends it to the UI via 'NavigationMap'. If the level has no minimap, it is generated from the TerrainBlock. Also fills the legacy fields (terrainSize, minimapImage, squareSize, terrainOffset) for old-format mods. | 386 |
| `ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId)` | Sends the map to the JS texture of a vehicle dashboard (queueJSUITexture) by calling the JS function `initmap` with the data as JSON (nodes, time HH:MM, terrain tiles). Does nothing in headless mode, with no level loaded or without `dashboard`. | 411 |
| `ui_uiNavi.route_end()` | Ends the route: clears the destination, removes the ground path and sends 'RouteUpdate' (empty table) then 'RouteEnded' to the UI. | 145 |
| `ui_uiNavi.route_requestStatus(oldPos, newPos)` | Updates the current route (local function route_update). With no route, does nothing. If the position moved by more than 0.1 m, recomputes the path, sends 'RouteUpdate'; within 50 m of the destination, sends 'RouteReachedDestination' and ends the route. | 158 |
| `ui_uiNavi.route_start(wp, pos)` | Starts a route: calls core_groundMarkers.setPath(wp) and stores the destination and its position. The code notes that multiseat renders the path only for the last player. | 139 |
| `ui_uiNavi.setMissions(m)` | Replaces the mission list and immediately sends it to the UI via 'MapMissions'. | 127 |

### Parameter details

#### `ui_uiNavi.findClosestRoad(x, y, z)`

Returns the result of map.findClosestRoad for the point (x, y, z): information about the closest road segment.

- `x` (*number*) : World X coordinate.
- `y` (*number*) : World Y coordinate.
- `z` (*number*) : World Z coordinate.
- **returns**: any Result of map.findClosestRoad (inferred from code).

#### `ui_uiNavi.getBusStops()`

Lists the bus stops (BeamNGTrigger of type 'busstop'). Stops less than 70 m apart (on either side of the road) are merged into one point in the middle.

- **returns**: table[] List of {pos = {x,y,z}}.

#### `ui_uiNavi.getMissions()`

Returns the currently stored missions table (empty at start; the examples are commented out in the code).

- **returns**: table List of missions (pos, desc, title, state, new, objectives, type).

#### `ui_uiNavi.getPointsOfInterest()`

Returns the objects of the scene's PointOfInterestSet as a list of {name, pos, desc, title, type}.

- **returns**: table[]|nil nil if the PointOfInterestSet set does not exist.

#### `ui_uiNavi.getSpawnpoints()`

Lists the SpawnSphere objects of the scene with their position ({x,y,z} as a table). If the level's mission file exists and contains `spawnPoints`, the additional information (keyed by objectname) is merged into each entry.

- **returns**: table[] List of entries containing at least `pos`.

#### `ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook called every GUI frame. Gathers the objects tracked by the map (uiState ~= 0) with position, heading in degrees, speed and state, then sends 'NavigationMapUpdate' ({controlID, objects}) to the UI.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated frame time (s).
- `dtRaw` (*number*) : Raw frame time (s).

#### `ui_uiNavi.onVehicleSwitched(oid, nid)`

Hook called when the controlled vehicle changes. The body is entirely commented out: does nothing.

- `oid` (*integer*) : Old vehicle id.
- `nid` (*integer*) : New vehicle id.

#### `ui_uiNavi.planRoute(posX, posY)`

Development tool: computes the path between two positions via map.getPath and sends it to the UI via 'RoutePlanned'.

- `posX` (*number[]*) : Start point {x, y, z}.
- `posY` (*number[]*) : End point {x, y, z}.

#### `ui_uiNavi.requestUIDashboardMap()`

Builds the map data (terrain tiles of the current level, points of interest, road nodes) and sends it to the UI via 'NavigationMap'. If the level has no minimap, it is generated from the TerrainBlock. Also fills the legacy fields (terrainSize, minimapImage, squareSize, terrainOffset) for old-format mods.

- **returns**: table The data sent (terrainTiles, poi, nodes, ...).

#### `ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId)`

Sends the map to the JS texture of a vehicle dashboard (queueJSUITexture) by calling the JS function `initmap` with the data as JSON (nodes, time HH:MM, terrain tiles). Does nothing in headless mode, with no level loaded or without `dashboard`.

- `dashboard` (*string*) : Name of the target JS texture.
- `initmap` (*string|nil*) : JS function to call, default 'map.setData'.
- `vehId` (*integer|nil*) : Target vehicle id, otherwise the player 0 vehicle.

#### `ui_uiNavi.route_requestStatus(oldPos, newPos)`

Updates the current route (local function route_update). With no route, does nothing. If the position moved by more than 0.1 m, recomputes the path, sends 'RouteUpdate'; within 50 m of the destination, sends 'RouteReachedDestination' and ends the route.

- `oldPos` (*vec3*) : Previous player position.
- `newPos` (*vec3*) : Current player position.

#### `ui_uiNavi.route_start(wp, pos)`

Starts a route: calls core_groundMarkers.setPath(wp) and stores the destination and its position. The code notes that multiseat renders the path only for the last player.

- `wp` (*any*) : Destination (map waypoint name), passed to core_groundMarkers.setPath and map.getPath.
- `pos` (*number[]*) : {x, y, z} position of the destination.

#### `ui_uiNavi.setMissions(m)`

Replaces the mission list and immediately sends it to the UI via 'MapMissions'.

- `m` (*table*) : New mission list.

**UI events (guihooks.trigger):** `MapMissions`, `MapPointsOfInterest`, `NavigationMap`, `NavigationMapUpdate`, `RouteEnded`, `RoutePlanned`, `RouteReachedDestination`, `RouteUpdate`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/uiNavi.lua`.*
