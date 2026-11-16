---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiNavi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua back-end of the interface navigation map (minimap, GPS). It sends the UI the positions of tracked vehicles, points of interest, missions and road nodes of the map, and handles a simple route (ground markers via core_groundMarkers). It also feeds the JS texture of a vehicle dashboard with the map.
--- Access: extension `ui_uiNavi`: `extensions.load("ui_uiNavi")`, then the global `ui_uiNavi`
---@class ui_uiNavi
ui_uiNavi = {}

--- Returns the result of map.findClosestRoad for the point (x, y, z): information about the closest road segment.
---Source: lua/ge/extensions/ui/uiNavi.lua:9
---@param x number World X coordinate.
---@param y number World Y coordinate.
---@param z number World Z coordinate.
---@return any  Result of map.findClosestRoad (inferred from code).
function ui_uiNavi.findClosestRoad(x, y, z) end

--- Lists the bus stops (BeamNGTrigger of type 'busstop'). Stops less than 70 m apart (on either side of the road) are merged into one point in the middle.
---Source: lua/ge/extensions/ui/uiNavi.lua:183
---@return table[]  List of {pos = {x,y,z}}.
function ui_uiNavi.getBusStops() end

--- Returns the currently stored missions table (empty at start; the examples are commented out in the code).
---Source: lua/ge/extensions/ui/uiNavi.lua:119
---@return table  List of missions (pos, desc, title, state, new, objectives, type).
function ui_uiNavi.getMissions() end

--- Returns the objects of the scene's PointOfInterestSet as a list of {name, pos, desc, title, type}.
---Source: lua/ge/extensions/ui/uiNavi.lua:44
---@return table[]|nil  nil if the PointOfInterestSet set does not exist.
function ui_uiNavi.getPointsOfInterest() end

--- Lists the SpawnSphere objects of the scene with their position ({x,y,z} as a table). If the level's mission file exists and contains `spawnPoints`, the additional information (keyed by objectname) is merged into each entry.
---Source: lua/ge/extensions/ui/uiNavi.lua:13
---@return table[]  List of entries containing at least `pos`.
function ui_uiNavi.getSpawnpoints() end

--- Hook called when the extension loads: sends an empty 'RouteUpdate' to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiNavi.lua:453
function ui_uiNavi.onExtensionLoaded() end

--- Hook called every GUI frame. Gathers the objects tracked by the map (uiState ~= 0) with position, heading in degrees, speed and state, then sends 'NavigationMapUpdate' ({controlID, objects}) to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiNavi.lua:228
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated frame time (s).
---@param dtRaw number Raw frame time (s).
function ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when the controlled vehicle changes. The body is entirely commented out: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiNavi.lua:437
---@param oid integer Old vehicle id.
---@param nid integer New vehicle id.
function ui_uiNavi.onVehicleSwitched(oid, nid) end

--- Development tool: computes the path between two positions via map.getPath and sends it to the UI via 'RoutePlanned'.
---Source: lua/ge/extensions/ui/uiNavi.lua:172
---@param posX number[] Start point {x, y, z}.
---@param posY number[] End point {x, y, z}.
function ui_uiNavi.planRoute(posX, posY) end

--- Sends the current mission list to the UI via the 'MapMissions' event.
---Source: lua/ge/extensions/ui/uiNavi.lua:123
function ui_uiNavi.requestMissions() end

--- Sends the points of interest to the UI via the 'MapPointsOfInterest' event.
---Source: lua/ge/extensions/ui/uiNavi.lua:60
function ui_uiNavi.requestPoi() end

--- Builds the map data (terrain tiles of the current level, points of interest, road nodes) and sends it to the UI via 'NavigationMap'. If the level has no minimap, it is generated from the TerrainBlock. Also fills the legacy fields (terrainSize, minimapImage, squareSize, terrainOffset) for old-format mods.
---Source: lua/ge/extensions/ui/uiNavi.lua:386
---@return table  The data sent (terrainTiles, poi, nodes, ...).
function ui_uiNavi.requestUIDashboardMap() end

--- Sends the map to the JS texture of a vehicle dashboard (queueJSUITexture) by calling the JS function `initmap` with the data as JSON (nodes, time HH:MM, terrain tiles). Does nothing in headless mode, with no level loaded or without `dashboard`.
---Source: lua/ge/extensions/ui/uiNavi.lua:411
---@param dashboard string Name of the target JS texture.
---@param initmap string|nil JS function to call, default 'map.setData'.
---@param vehId integer|nil Target vehicle id, otherwise the player 0 vehicle.
function ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId) end

--- Ends the route: clears the destination, removes the ground path and sends 'RouteUpdate' (empty table) then 'RouteEnded' to the UI.
---Source: lua/ge/extensions/ui/uiNavi.lua:145
function ui_uiNavi.route_end() end

--- Updates the current route (local function route_update). With no route, does nothing. If the position moved by more than 0.1 m, recomputes the path, sends 'RouteUpdate'; within 50 m of the destination, sends 'RouteReachedDestination' and ends the route.
---Source: lua/ge/extensions/ui/uiNavi.lua:158
---@param oldPos vec3 Previous player position.
---@param newPos vec3 Current player position.
function ui_uiNavi.route_requestStatus(oldPos, newPos) end

--- Starts a route: calls core_groundMarkers.setPath(wp) and stores the destination and its position. The code notes that multiseat renders the path only for the last player.
---Source: lua/ge/extensions/ui/uiNavi.lua:139
---@param wp any Destination (map waypoint name), passed to core_groundMarkers.setPath and map.getPath.
---@param pos number[] {x, y, z} position of the destination.
function ui_uiNavi.route_start(wp, pos) end

--- Replaces the mission list and immediately sends it to the UI via 'MapMissions'.
---Source: lua/ge/extensions/ui/uiNavi.lua:127
---@param m table New mission list.
function ui_uiNavi.setMissions(m) end

