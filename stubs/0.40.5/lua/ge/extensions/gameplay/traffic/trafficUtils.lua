---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/trafficUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic system toolbox: creating groups of traffic or police vehicles (via core_multiSpawn), loading *.vehGroup.json files, finding spawn points on a road, a line or a circle around a position, placing AI traffic vehicles and finding the closest traffic vehicle. A modder uses it to spawn traffic realistically from a position and a direction (by default the camera's).
--- Access: extension `gameplay_traffic_trafficUtils`: `extensions.load("gameplay_traffic_trafficUtils")`, then the global `gameplay_traffic_trafficUtils`
---@class gameplay_traffic_trafficUtils
---@field debugMode boolean If true, writes the parameters and results of spawn point searches to the log. false by default.
gameplay_traffic_trafficUtils = {}

--- Checks that a point is usable: between minDist and maxDist from the origin, outside intersections, and without conflict with the other active vehicles.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:293
---@param pos vec3 Point to test.
---@param origPos vec3|nil Origin of the distances (camera by default).
---@param minDist number|nil Minimum distance (80 m by default).
---@param maxDist number|nil Maximum distance (unlimited by default).
---@param minVehDist number|nil Minimum distance to other vehicles (15 m by default).
---@param n1 string|nil First road node (to exclude intersections).
---@param n2 string|nil Second road node.
---@return boolean  true if the point is valid.
function gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2) end

--- Creates a group of police vehicles ('police' type configs), favoring the level's country, according to the trafficAllowMods setting.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:85
---@param amount integer Number of vehicles.
---@param allMods boolean Ignored: overwritten by the trafficAllowMods setting.
---@return table  Group returned by core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods) end

--- Creates a group of traffic vehicles according to the player's settings (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections): without police vehicles, or only 'proptraffic' vehicles in simple mode.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:58
---@param amount integer Number of vehicles in the group.
---@param allMods boolean Ignored: overwritten by the trafficAllowMods setting.
---@param allConfigs boolean Ignored: forced to true.
---@param simpleVehs boolean Ignored: overwritten by the trafficSimpleVehicles setting.
---@return table  Group returned by core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs) end

--- Snaps a point onto a road lane (position and direction), taking into account the traffic direction (right- or left-hand driving), one-way roads and the estimated number of lanes. If no road is found within 30 m, returns the input values.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:297
---@param pos vec3 Position to adjust.
---@param dir vec3|nil Direction; if nil, takes the road direction (legalDirection = true).
---@param mapNode1 string|nil First node of the road (searched if absent).
---@param mapNode2 string|nil Second node of the road.
---@param options table|nil legalDirection (legal direction), minLane/maxLane (allowed lanes), roadDir (±1, toward/away from the player), roadLateralXnorm (direct lateral offset from -1 to 1).
---@return vec3  New position.
---@return vec3  New direction.
function gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options) end

--- Always returns a spawn point (forced teleport). Tries the road ahead first, then a nearby radial search (200-1000 m), a less strict wide search (200-2000 m, drivability 0.5) and finally very far (10,000-12,000 m, z = 1).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:648
---@param startPos vec3|nil Origin.
---@param startDir vec3|nil Travel direction.
---@param minDist number|nil Minimum distance of the first search.
---@param maxDist number|nil Maximum distance of the first search.
---@param targetDist number|nil Ideal distance of the first search.
---@param options table|nil Same options as findSpawnPointOnRoute (modified: minDrivability becomes 0.5 in the fallback searches).
---@return table  {pos, dir, ...}, never nil.
---@return boolean  true if a method found a valid point.
function gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Alias of findSpawnPointOnRoute (same function, same parameters and returns).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos vec3|nil Origin.
---@param startDir vec3|nil Travel direction.
---@param minDist number|nil Minimum distance.
---@param maxDist number|nil Maximum distance.
---@param targetDist number|nil Ideal distance.
---@param options table|nil See findSpawnPointOnRoute.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true if valid.
function gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Looks for a spawn point along a straight line starting from the origin in the direction startDir, in steps of options.gap (50 m by default).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:452
---@param startPos vec3|nil Origin (camera by default).
---@param startDir vec3|nil Direction of the line (camera forward by default).
---@param minDist number|nil Minimum distance (20 m).
---@param maxDist number|nil Maximum distance (2000 m).
---@param targetDist number|nil Ideal distance for the visibility test.
---@param options table|nil gap, usePrivateRoads, minDrivability, minRadius.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true if a valid point was found.
function gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Generates a path on the road ahead of the origin (random with branches, or options.route) and tests points of this path between minDist and maxDist. The steps can be modulated by the section's speed limit (gapVehCoef, gapSpeedCoef, bounded to 20-50 m). Also exported under the name findSpawnPoint.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos vec3|nil Origin (camera by default).
---@param startDir vec3|nil Travel direction (camera forward by default).
---@param minDist number|nil Minimum distance (20 m).
---@param maxDist number|nil Maximum distance (2000 m).
---@param targetDist number|nil Ideal distance for the visibility test.
---@param options table|nil gap (20 m), usePrivateRoads, minDrivability, minRadius, pathRandomization (0.5), route (supplied path), gapVehCoef, gapSpeedCoef.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true if a valid point was found.
function gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Looks for a spawn point by testing random directions around the origin, from minDist to maxDist in steps of options.gap (50 m by default), until a valid road is found.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:384
---@param startPos vec3|nil Origin (camera by default).
---@param startDir vec3|nil Start direction (not used by the radial method, reset to z = 0).
---@param minDist number|nil Minimum distance (20 m).
---@param maxDist number|nil Maximum distance (2000 m).
---@param targetDist number|nil Ideal distance; below it, the point must be hidden from the camera (static raycast).
---@param options table|nil gap, usePrivateRoads, minDrivability, minRadius.
---@return table  {pos, dir, n1, n2} (n1/n2 only if valid).
---@return boolean  true if a valid point was found.
function gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Returns a position located ahead of pos, in the direction dir, at distance scale. Used to compare distances between vehicles cheaply.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:161
---@param pos vec3 Start position.
---@param dir vec3 Direction.
---@param scale number Distance in meters; if 0, returns pos as is.
---@param useZ0 boolean|nil If true, flattens the direction to horizontal (z = 0) before normalizing it.
---@return vec3  Cached vector (copy if kept); or pos if scale == 0.
function gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0) end

--- Builds the base parameters of a vehicle group (car/truck type filter, level country, minPop 50; region filter if the trafficSmartSelections setting is active).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:49
---@return table  Parameters to pass to core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.getBaseGroupParams() end

--- Returns the table of threshold values shared by the traffic modules (direct reference).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:45
---@return table  {minDrivability, minRadius, lowDamage, highDamage, lowSpeed}.
function gameplay_traffic_trafficUtils.getBaseValues() end

--- Reads the current level's info file and returns its country (converted to an English name from a restricted list, otherwise 'default') and its region.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:26
---@return table  {country = string, region = string|nil}.
function gameplay_traffic_trafficUtils.getLevelInfo() end

--- Returns the id of the AI traffic vehicle closest to a position, with optional filters on the traffic vehicle's properties.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:678
---@param pos vec3|nil Reference position (camera by default).
---@param filters table|nil Property = value pairs; a vehicle is excluded if the property exists with a different value.
---@return integer|nil  Id of the closest vehicle.
---@return number  Distance in meters (math.huge if no vehicle).
function gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters) end

--- Returns the constructor of a traffic role (module under traffic/roles/), cached. If the role does not exist, a warning is written and the 'standard' role is used.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:150
---@param roleName string Role name (e.g. 'standard', 'police', 'suspect', 'empty').
---@return function  Role constructor.
function gameplay_traffic_trafficUtils.getRoleConstructor(roleName) end

--- Returns the data of a vehicle group file (*.vehGroup.json), chosen at random among those of the level (or /vehicleGroups/).
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:107
---@param options table|nil options.name = filter on the file name (substring, lowercase); options.useCustom = true to force /vehicleGroups/.
---@return table|nil  Group data (data field of the file if present).
---@return string|nil  Path of the chosen file.
function gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options) end

--- Teleports all AI traffic vehicles to the given position and aligns them (core_multiSpawn.placeGroup), by default in 'roadAhead' mode with a 15 m gap.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:669
---@param pos vec3|nil Position (camera by default).
---@param dir vec3|nil Direction (camera forward by default).
---@param options table|nil placeGroup options; mode ('roadAhead' by default) and gap (15 by default).
function gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options) end

--- Converts a speed entered in the Traffic app (km/h, mph or auto) to m/s and applies it as the traffic speed limit (setTrafficVars({speedLimit})). 'auto' mode sends -1.
---Source: lua/ge/extensions/gameplay/traffic/trafficUtils.lua:707
---@param speed number|nil Speed in the mode's unit (0 by default).
---@param mode string|nil 'km/h', 'mph' or 'auto' (default); other value = m/s.
---@return number  Applied speed in m/s (-1 in auto mode).
function gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode) end

