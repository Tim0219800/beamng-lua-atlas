---@meta
-- tim19Atlas stub generated from lua/vehicle/mapmgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the vehicle and the game's road map (navgraph). It receives the map from the game Lua (GE) through a mailbox, decodes it into a graph (graphpath) and a spatial tree (kd-tree of edges), and provides to the AI and the extensions: nearest road search (findClosestRoad, findBestRoad), point-to-point path (getPointToPointPath), surface normal (surfaceNormalBelow), nearby objects (getObjects) and traffic signals. It also sends the vehicle state to the GE every frame (map.objectData: seated player, damage, horn, lights, collisions) via sendTracking.
--- Access: global `mapmgr`
---@class mapmgr
---@field objectCollisionIds table Ids of the objects colliding with this vehicle, refreshed at each sendTracking.
---@field objects table Nearby objects decoded from the 'objUpdate' mailbox (filled by getObjects; reset to {} by reset).
---@field sendTracking function nop until tracking is enabled (enableTracking), then the function that sends the state to the GE. Called every frame by main.lua.
mapmgr = {}

--- Removes the custom map if it was active (mapData set back to nil).
---Source: lua/vehicle/mapmgr.lua:79
function mapmgr.clearCustomMap() end

--- Disables sending the state (sendTracking = nop) if forceDisable or if no player is seated.
---Source: lua/vehicle/mapmgr.lua:163
---@param forceDisable boolean|nil true to disable even if a player is seated.
function mapmgr.disableTracking(forceDisable) end

--- Enables sending the state to the GE: associates an object name with the id (map.setNameForId) and installs sendTracking.
---Source: lua/vehicle/mapmgr.lua:158
---@param name string|nil Vehicle name in the map; the vehicle id if nil.
function mapmgr.enableTracking(name) end

--- Finds the most relevant road edge according to position AND direction (alignment, one-way, gates), falling back to findClosestRoad.
---Source: lua/vehicle/mapmgr.lua:271
---@param pos vec3|nil Position; the vehicle's if nil.
---@param dir vec3|nil Direction; the vehicle's if nil.
---@param wZ number|nil Weight of the height difference.
---@return any  First node of the edge.
---@return any  Second node of the edge.
---@return number  Distance in meters.
function mapmgr.findBestRoad(pos, dir, wZ) end

--- Finds the road edge closest to a position (distance to the segment with wZ height bias). Requires the map to be loaded.
---Source: lua/vehicle/mapmgr.lua:241
---@param pos vec3|nil Position; the vehicle's if nil.
---@param wZ number|nil Weight of the height difference (1.85 by default).
---@return any  Identifier of the first node of the edge (nil if nothing found within 200 m).
---@return any  Identifier of the second node of the edge.
---@return number  Distance to the edge in meters.
function mapmgr.findClosestRoad(pos, wZ) end

--- Returns the table of nearby objects (mailbox 'objUpdate'), decoded at most once per simulation instant.
---Source: lua/vehicle/mapmgr.lua:179
---@return table  M.objects (shared, do not keep between frames).
function mapmgr.getObjects() end

--- Computes a path on the navgraph between two positions (the start point and the target are attached to nearby edges). Returns {} if the map is not loaded.
---Source: lua/vehicle/mapmgr.lua:379
---@param startPos vec3 Start position.
---@param targetPos vec3 Target position.
---@param cutOffDrivability number|nil Roads of lower or equal drivability are penalized.
---@param dirMult number|nil Penalty if the path does not respect legal directions (> 1, typically >= 1e4); nil or 1 = none.
---@param penaltyAboveCutoff number|nil Cost multiplier above the drivability threshold.
---@param penaltyBelowCutoff number|nil Cost multiplier below the threshold.
---@param wZ number|nil Height bias (4 by default) to choose the arrival node.
---@return table  List of path nodes (graphpath format), {} if impossible.
function mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Enables tracking to the GE if the vehicle has wheels or general.enableTracking. Called by main.lua (initSystems, last step).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:173
function mapmgr.init() end

--- Asks the GE to send the map (map.request(id, serial of the current map)).
---Source: lua/vehicle/mapmgr.lua:68
function mapmgr.requestMap() end

--- Empties the M.objects list on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:169
function mapmgr.reset() end

--- Replaces the map with a provided graph (tool/scenario) and forgets the build number.
---Source: lua/vehicle/mapmgr.lua:72
---@param map table Graph in graphpath format.
function mapmgr.setCustomMap(map) end

--- Loads the map from the 'mapData' mailbox: builds the graph, the edge kd-tree, the rules and aliases, applies the drivabilities then notifies the GE via the onVehicleMapmgrUpdate hook. Does nothing if the build number is already the loaded one or if the data is incomplete.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:45
---@param newbuildSerial number|nil Build number of the announced map; ignored if identical to the one already loaded.
function mapmgr.setMap(newbuildSerial) end

--- Sets the table of traffic signals (M.signalsData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:87
---@param data table Signals indexed [group][?][?] with an action field.
function mapmgr.setSignals(data) end

--- Computes the surface normal under a point by sampling the ground height at 3 points of a triangle of radius r around p (obj:getSurfaceHeightBelow). Accurate up to about 50° of slope; returns (0,0,1) if the terrain is too low/irregular. Writes the result into v without allocation.
---Source: lua/vehicle/mapmgr.lua:194
---@param v vec3 Output vector (modified; also used as a temporary sample point).
---@param p vec3 Point above the surface.
---@param r number|nil Sampling radius in meters (2 by default).
function mapmgr.setSurfaceNormalBelow(v, p, r) end

--- Allocating version of setSurfaceNormalBelow: returns a new vec3.
---Source: lua/vehicle/mapmgr.lua:226
---@param p vec3 Point above the surface.
---@param r number|nil Sampling radius (2 by default).
---@return vec3  Unit normal of the surface.
function mapmgr.surfaceNormalBelow(p, r) end

--- Applies to the graph the drivability changes received through the 'updateDrivabilities' mailbox; does nothing if the mailbox is empty or there is no graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:21
function mapmgr.updateDrivabilities() end

--- Updates the signals' action from a batch {key1, key2, key3, action, …} (in groups of 4).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/mapmgr.lua:91
---@param data table|nil Flat list of updates.
function mapmgr.updateSignals(data) end

