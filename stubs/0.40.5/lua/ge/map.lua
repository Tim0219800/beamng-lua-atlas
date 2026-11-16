---@meta
-- tim19Atlas stub generated from lua/ge/map.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road graph (navgraph) of the level on the Game Engine side. It builds the graph of nodes and edges from the decal roads (DecalRoad), the scene waypoints and the level's map.json file, merges nearby nodes, computes the speed limits, then sends the graph to the vehicle VMs (mailbox "mapData", read by mapmgr.lua). A modder uses it to find the closest road (findClosestRoad), compute a path (getPath, getPointToPointPath), read the graph structure (getMap) and read the state of the tracked vehicles (getTrackedObjects). It also receives the vehicle data (objectData) every frame and redistributes it.
--- Access: global `map`
---@class map
---@field drawNavGraphState string 'off' or 'on' depending on whether the navgraph debug drawing is active (toggleDrawNavGraph).
---@field objectNames table<string, integer> Name -> object id association, filled by setNameForId. getState() copies the name into objects[id].name.
---@field objects table<integer, table> Vehicles tracked this frame (key = object id). Filled by objectData/tempObjectData, cleared when no more data arrives. Same table as getTrackedObjects().
map = {}

--- Loads the road map if it is not loaded yet (loadMap), then sets loadedMap back to false so that a next map.load() reloads.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3667
function map.assureLoad() end

--- Empties the list of traffic exclusion zones (table.clear). Does not rebuild the graph: map.reset() must be called for it to take effect.
---Source: lua/ge/map.lua:3955
function map.clearTrafficExclusionZones() end

--- Computes the set of excluded nodes from the given zones (nodes within each radius, then expansion along dead-end roads), marks the internal edges as type 'private' and the boundary edges as 'gated' (cost +10000). Called by loadMap with the registered zones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:2370
---@param trafficExlusionZones table<integer, {pos: vec3, radius: number}> List of circular zones.
function map.createTrafficExclusionArea(trafficExlusionZones) end

--- Enables (given trajectory) or disables (nil) the debug drawing of a trajectory coming from optimizePath (spheres, normals, forces, cylinders).
---Source: lua/ge/map.lua:3430
---@param trajectory table|nil Result of map.optimizePath, or nil to stop drawing.
function map.debugDrawTrajectory(trajectory) end

--- Finds the road best suited to a position and a direction: among the edges within 20 m whose position falls within the road width, picks the one whose axis is most aligned with dir. Falls back to findClosestRoad if there is no candidate.
---Source: lua/ge/map.lua:2732
---@param pos vec3 Position to project (m).
---@param dir vec3 Normalized direction (e.g. the vehicle's direction).
---@return string|nil  Id of the first node of the edge.
---@return string|nil  Id of the second node.
---@return number|nil  Distance from pos to the segment (m).
function map.findBestRoad(pos, dir) end

--- Finds the edge (road segment) closest to pos and returns its two nodes and the distance. The search starts from a radius min(maxRadius, searchRadiusLim) and doubles it until an edge is found or searchRadiusLim is exceeded. The distance is computed to the center segment, ignoring the width.
---Source: lua/ge/map.lua:2706
---@param pos vec3 Position (m). Only x and y are used for the kd-tree search, the distance is 3D.
---@param searchRadiusLim number|nil Maximum search radius in m (200 by default).
---@return string|nil  Id of node 1 of the edge (nil if nothing found or graph not built).
---@return string|nil  Id of node 2.
---@return number  Distance to the edge in m (meaningless value if no node is found).
function map.findClosestRoad(pos, searchRadiusLim) end

--- Returns the internal Graphpath object (gp): bidirectional graph with gp.graph[a][b] (edges), gp.positions, gp.radius and the shortest-path methods. nil before loading.
---Source: lua/ge/map.lua:3816
---@return table|nil  Graphpath instance.
function map.getGraphpath() end

--- Returns the table of manual waypoints (BeamNGWaypoint of the scene): name -> {pos, radius, ...}, with the value 1 for the entries already processed after loading.
---Source: lua/ge/map.lua:3820
---@return table  Table of manual waypoints.
function map.getManualWaypoints() end

--- Returns the road graph table: {nodes = ..., nodeAliases = ..., buildSerial = ...}. See the notes for the detail of nodes and edges. Do not modify: the table is shared.
---Source: lua/ge/map.lua:3812
---@return table  Map table (nodes, nodeAliases, buildSerial).
function map.getMap() end

--- Number of edges linked to a node in the bidirectional graph.
---Source: lua/ge/map.lua:2150
---@param nId string Node id.
---@return integer  Number of links, or -1 if the graph does not exist or the node is unknown.
function map.getNodeLinkCount(nId) end

--- Walks along a path over a given distance (sum of the distances between consecutive nodes) and returns the segment reached and the relative position within this segment.
---Source: lua/ge/map.lua:2801
---@param path string[] Path (list of node ids), at least 2 nodes.
---@param dist number|nil Distance to travel in m; nil = to the end.
---@return string|nil  Start node of the segment (nil if the path is invalid).
---@return string|nil  End node of the segment.
---@return number|nil  xnorm between 0 and 1: position along the segment. Is 1 if dist exceeds the path length.
function map.getNodesFromPathDist(path, dist) end

--- Returns the ids of the graph nodes located within the radius of at least one of the given zones (a node can appear several times if it is in several zones).
---Source: lua/ge/map.lua:2353
---@param trafficExlusionZones table<integer, {pos: vec3, radius: number}> List of circular zones.
---@return string[]  Node ids.
function map.getNodesNearPositions(trafficExlusionZones) end

--- Shortest path between two nodes (Dijkstra on Graphpath:getFilteredPath). The cost of an edge = len x direction penalty x drivability penalty.
---Source: lua/ge/map.lua:2774
---@param start string Id of the start node.
---@param target string Id of the end node.
---@param cutOffDrivability number|nil Drivability threshold (0 by default): edges with drivability <= threshold are penalized by penaltyBelowCutoff.
---@param dirMult number|nil Cost multiplier for a one-way edge taken against the direction (1 or nil = no penalty; reasonable values 1e3 to 1e4).
---@param penaltyAboveCutoff number|nil Multiplier for roads above the threshold (1 by default).
---@param penaltyBelowCutoff number|nil Multiplier for roads below the threshold (10000 by default).
---@return string[]  List of node ids from start to end; {} if the graph or one of the nodes does not exist.
function map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff) end

--- Total length of a path (sum of the 3D distances between the node positions).
---Source: lua/ge/map.lua:2824
---@param path string[] List of node ids.
---@return number  Length in m (0 if the path or the map is missing).
function map.getPathLen(path) end

--- Shortest path between a free point and a node (or vice versa). One of the two arguments must be a node name, the other a vec3.
---Source: lua/ge/map.lua:2787
---@param start string|vec3 Start: node id or position.
---@param target string|vec3 End: node id or position.
---@param cutOffDrivability number|nil See getPath.
---@param dirMult number|nil See getPath.
---@param penaltyAboveCutoff number|nil See getPath.
---@param penaltyBelowCutoff number|nil See getPath.
---@param wZ number|nil Weight of the height in the distance; above 1, minimizes the z difference more than x/y.
---@return string[]  Path as node ids; {} if the graph is not loaded.
function map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Shortest path between two free positions: the function links each position to nearby edges (startPosLinks iterator, up to 2000 m) then launches the search.
---Source: lua/ge/map.lua:2909
---@param startPos vec3 Start position.
---@param targetPos vec3 End position.
---@param cutOffDrivability number|nil See getPath.
---@param dirMult number|nil See getPath (typically >= 10e4).
---@param penaltyAboveCutoff number|nil See getPath.
---@param penaltyBelowCutoff number|nil See getPath.
---@param wD any Obsolete, ignored (kept for compatibility).
---@param wZ number|nil Weight of the height difference (4 by default).
---@return table  Path; {} if the graph is not loaded.
function map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Same as getPointToPointPath but runs in a coroutine job (allows yielding between steps).
---Source: lua/ge/map.lua:2926
---@param job table Current job object (job system coroutine).
---@param startPos vec3 Start position.
---@param targetPos vec3 End position.
---@param cutOffDrivability number|nil See getPath.
---@param dirMult number|nil See getPath.
---@param penaltyAboveCutoff number|nil See getPath.
---@param penaltyBelowCutoff number|nil See getPath.
---@param wD any Obsolete, ignored.
---@param wZ number|nil Weight of the height difference (4 by default).
---@return table  Path; {} if the graph is not loaded.
function map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Returns the level's driving rules: {rightHandDrive = false, turnOnRed = false} merged with the roadRules field of the level's info file. Returns {} until the map has been loaded.
---Source: lua/ge/map.lua:157
---@return table  Rules (rightHandDrive, turnOnRed, ...).
function map.getRoadRules() end

--- Updates the name and plate (licensePlate) of each tracked object then returns the whole module M (objects, names, etc.). Used for state transfer.
---Source: lua/ge/map.lua:3796
---@return table  The map module itself.
function map.getState() end

--- Returns map.objects: the vehicles whose data arrived this frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}).
---Source: lua/ge/map.lua:3824
---@return table<integer, table>  Tracked objects.
function map.getTrackedObjects() end

--- Returns the current list of traffic exclusion zones (typo in the name kept).
---Source: lua/ge/map.lua:3950
---@return table  List of {pos, radius}.
function map.getTrafficExlucsionZones() end

--- Estimates whether a moving object can stop before reaching a position (braking distance computed with gravity, a friction of 0.5 and the slope). Used to decide whether something can be spawned at that spot.
---Source: lua/ge/map.lua:3913
---@param objectID integer Id of the moving vehicle.
---@param pos vec3 Position of the point to protect.
---@param radius number|nil Safety radius in m (7.5 by default).
---@return boolean  true if safe (object not found, more than 150 m away, or enough distance to brake).
function map.isCrashAvoidable(objectID, pos, radius) end

--- Loads the map only once (loadedMap guard) by calling loadMap().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3661
function map.load() end

--- Writes the SHA256 hashes of the nodes and edges to the log (debugging the determinism of the graph build).
---Source: lua/ge/map.lua:501
function map.logGraphHashes() end

--- Makes a unique node name: prefix..idx, or prefix..idx.._N if this name already exists in map.nodes.
---Source: lua/ge/map.lua:135
---@param prefix string Name prefix.
---@param idx integer Number.
---@return string  Free name.
function map.nameNode(prefix, idx) end

--- Receives a vehicle's data every frame (sent by the vehicle VM) and records it in map.objects with position, speed and direction read from the object. Ignored if the object is already recorded this frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3829
---@param objId integer Vehicle id.
---@param isactive boolean Active vehicle.
---@param damage number Damage level.
---@param states table|nil Vehicle states (shared empty table if nil).
---@param objectCollisions table|nil Collisions with other objects.
function map.objectData(objId, isactive, damage, states, objectCollisions) end

--- Hook called when a waypoint is added to the scene. If the editor is active (setEditorState), reloads the map after 0.5 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3708
---@param wp any Waypoint added (unused).
function map.onAddWaypoint(wp) end

--- Restores isEditorEnabled and buildSerial after a GE Lua reload (see the note on the hook name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3783
---@param s table Table produced by onSerialize: {isEditorEnabled, buildSerial}.
function map.onDeserialize(s) end

--- Hook called when files change on disk. If the map's map.json file is concerned, reloads the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3729
---@param files table[] List of entries with a filename field.
function map.onFilesChanged(files) end

--- Hook called when a level is loaded: sets loadedMap back to false to allow the next map.load().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3674
function map.onMissionLoaded() end

--- Hook called when a waypoint is modified. If the editor is active, reloads the map after 0.5 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3722
---@param wp any Waypoint modified (unused).
function map.onModifiedWaypoint(wp) end

--- Hook called when a waypoint is removed. If the editor is active, reloads the map after 0.5 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3715
---@param wp any Waypoint removed (unused).
function map.onRemoveWaypoint(wp) end

--- Returns {isEditorEnabled, buildSerial} to save the state before a GE Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3779
---@return table  Array {isEditorEnabled, buildSerial}.
function map.onSerialize() end

--- Hook called when a vehicle triggers a waypoint. The body is entirely commented out: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3678
---@param args table Trigger data (subjectName, triggerName, event, mode); unused.
function map.onWaypoint(args) end

--- Smooths a path to obtain a smoother trajectory: each point is moved by iterations of "curvature flow" (reduction of the curvature energy) while staying within the road width. Returns the trajectory or nil if the path has fewer than 2 points.
---Source: lua/ge/map.lua:3309
---@param path string[]|table[] List of node ids, or (with useRawPos) list of {pos = vec3, radius = number}.
---@param s table Settings: segDistSplitLim, fixPathNodes, fixEndpoints, evolvePathNormals, evolveMidNormals, evolveEndNormals, hta (0.1 m per iteration by default), fRange (1), forceMag ('angle' by default or 'curvature'), forceScale, forceMultiplier (2), iterations (120), distFromEdge (1 m), dispLimFromCenterAbs, dispLimFromCenterRel, logData, logTrajectory, tolFactor (0).
---@param useRawPos boolean|nil true if path contains {pos, radius} instead of node ids.
---@return table|nil  Trajectory: list of points with pos, posOrig, normal, halfWidth, force… and trajectory.converged / trajectory.energy.
function map.optimizePath(path, s, useRawPos) end

--- Called by a vehicle VM to request the graph: if its version number (buildSerial) differs, sends it mapmgr.setMap(buildSerial) and the state of the signals (mapmgr.setSignals) if there are any.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3739
---@param objId integer Id of the requesting vehicle.
---@param objbuildSerial integer Graph version number known to the vehicle.
function map.request(objId, objbuildSerial) end

--- Fully rebuilds the road graph (loadMap): reads the roads and waypoints, merges, computes speed limits and drivability, builds the search trees, sends the graph to the vehicles and emits onNavgraphReloaded. Can be slow.
---Source: lua/ge/map.lua:2511
---@param customMapNodes table|nil Ready-to-use table of nodes (same format as map.nodes, double-sided) that replaces reading the scene's roads.
function map.reset(customMapNodes) end

--- Wrapper around spawn.safeTeleport to call it from a vehicle VM with plain numbers: teleports a vehicle to a collision-free spot.
---Source: lua/ge/map.lua:3941
---@param vehId integer|string Vehicle id or name (passed to scenetree.findObject).
---@param posX number Position x (m).
---@param posY number Position y (m).
---@param posZ number Position z (m).
---@param rotX number Quaternion x.
---@param rotY number Quaternion y.
---@param rotZ number Quaternion z.
---@param rotW number Quaternion w.
---@param checkOnlyStatics_ boolean|nil Test only static objects (ignore other vehicles).
---@param visibilityPoint_ vec3|nil Point from which the spot found must not be visible.
---@param removeTraffic_ boolean|nil Move traffic vehicles out of the area.
---@param centeredPosition boolean|nil true if pos is the center of the vehicle's box and not its reference node.
---@param resetVehicle boolean|nil Reset the vehicle (true by default in spawn.safeTeleport).
function map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle) end

--- Exports the road graph in SVG format (edges and, optionally, nodes), with coordinates relative to the terrain position.
---Source: lua/ge/map.lua:2933
---@param filename string SVG file path.
---@param includeLinks boolean|nil Draw the edges (true by default).
---@param includeNodes boolean|nil Draw the nodes (false by default).
function map.saveSVG(filename, includeLinks, includeNodes) end

--- Indicates whether the editor is active; allows automatic reloading of the map when a waypoint changes.
---Source: lua/ge/map.lua:3788
---@param enabled boolean true if the editor is open.
function map.setEditorState(enabled) end

--- Associates a name with an object id in map.objectNames.
---Source: lua/ge/map.lua:3909
---@param name string Name.
---@param id integer Object id.
function map.setNameForId(name, id) end

--- Merges a table into the module (tableMerge(M, newState)). Used to restore the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3792
---@param newState table Fields to copy into map.
function map.setState(newState) end

--- Replaces the traffic exclusion zones with the given table (error logged if it is not a table). The graph is not rebuilt here: the effect applies at the next map.reset().
---Source: lua/ge/map.lua:3960
---@param zones table<integer, {pos: vec3, radius: number}> List of circular zones.
function map.setTrafficExclusionZones(zones) end

--- Estimates the ground normal at point p by casting three vertical rays (be:getSurfaceHeightBelow) around p at a distance r; reliable up to about 50 degrees of slope.
---Source: lua/ge/map.lua:506
---@param p vec3 Point (m).
---@param r number|nil Sampling radius in m (2 by default).
---@return vec3  Unit normal.
function map.surfaceNormal(p, r) end

--- Version of objectData where the caller supplies position, speed and directions itself (virtual object or without a VM). Records the object in map.objects.
---Source: lua/ge/map.lua:3868
---@param objId integer Object id.
---@param isactive boolean Active object.
---@param pos vec3 Position.
---@param vel vec3 Speed.
---@param dirVec vec3 Forward direction.
---@param dirVecUp vec3 Up direction.
---@param damage number Damage.
---@param objectCollisions table|nil Collisions.
function map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions) end

--- Enables/disables the debug drawing (red spheres) of the nodes excluded from traffic.
---Source: lua/ge/map.lua:2483
function map.toggleDrawExcludeSet() end

--- Enables/disables the debug drawing (white spheres) of the initial nodes of the exclusion zones.
---Source: lua/ge/map.lua:2502
function map.toggleDrawInitialExcludeSet() end

--- Enables/disables the on-screen debug drawing of the road graph and updates drawNavGraphState.
---Source: lua/ge/map.lua:3632
function map.toggleDrawNavGraph() end

--- Debug of the graph build determinism: replaces pairs with shuffledPairs (random iteration order) or the reverse.
---Source: lua/ge/map.lua:48
---@param mode string|nil 'shuffledPairs' or 'pairs'; nil = toggle.
function map.toggleShuffledPairs(mode) end

--- Dynamically changes the drivability of edges: recomputes the cost (len) of each edge, then sends the change to the vehicle VMs (mailbox updateDrivabilities and mapmgr.updateDrivabilities()). Does nothing if the size is not a multiple of 3.
---Source: lua/ge/map.lua:3752
---@param changeSet table Flat list {nodeA1, nodeB1, drivability1, nodeA2, nodeB2, drivability2, ...}. The edge is looked up in the nodeA -> nodeB direction of the bidirectional graph. Drivability is clamped to a minimum of 1e-30.
function map.updateDrivabilities(changeSet) end

--- Called every frame by the main loop: if simulation time advances, sends the objects table to the vehicle VMs (mailbox objUpdate), handles the deferred reload (editor) and draws the debug overlays.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:3645
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated duration of the frame (s); 0 when paused.
function map.updateGFX(dtReal, dtSim) end

--- Internal one-shot timer (not exported, delayedLoad is its instance) used to reload the map 0.5 s after a waypoint change in the editor.
---@class map_singleEventTimer
local map_singleEventTimer = {}

--- Schedules the call of eventFun(...) after dt seconds. NB: the automatic page says (eventFun, ...) but the actual signature is (dt, eventFun, ...).
---Source: lua/ge/map.lua:122
---@param dt number Delay in s.
---@param eventFun function Function to call.
---@param ... any Arguments passed to eventFun.
function map_singleEventTimer:callAfter(dt, eventFun, ...) end

--- Counts down the delay; at zero calls eventFun once. Called every frame by updateGFX with dtReal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/map.lua:113
---@param dt number Elapsed real time (s).
function map_singleEventTimer:update(dt) end

