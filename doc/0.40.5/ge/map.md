# `map`

*File: `lua/ge/map.lua` · VM: Game Engine (GE) · 4033 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `map`

Road graph (navgraph) of the level on the Game Engine side. It builds the graph of nodes and edges from the decal roads (DecalRoad), the scene waypoints and the level's map.json file, merges nearby nodes, computes the speed limits, then sends the graph to the vehicle VMs (mailbox "mapData", read by mapmgr.lua). A modder uses it to find the closest road (findClosestRoad), compute a path (getPath, getPointToPointPath), read the graph structure (getMap) and read the state of the tracked vehicles (getTrackedObjects). It also receives the vehicle data (objectData) every frame and redistributes it.

## Example

```lua
local mapData = map.getMap()
local n1, n2, dist = map.findClosestRoad(veh:getPosition())
if n1 and dist < 10 then
  local path = map.getPath(n1, 'autre_noeud', 0.5, 1e4)
  print(map.getPathLen(path))
end
```

## Notes

- Structure of map.getMap(): table {nodes = {...}, nodeAliases = {...}, buildSerial = n}. map.nodes is a dictionary nodeId (string) -> node.
- Node (map.nodes[id]): pos (vec3), radius (number, road half-width in m), links (table<string, edge>), normal (vec3, ground normal computed by surfaceNormal), noMerge (boolean|nil), endNode (boolean|nil, end of a road). The manual field is removed after loading.
- The map.nodes graph is "single-sided": an edge is stored only in the links of the OUT node (outNode), keyed by the id of the IN node. So map.nodes[a].links[b] can be nil while map.nodes[b].links[a] exists. To test an edge, you must look at both directions (see spawn.teleportToLastRoadCallback). The full bidirectional graph is in map.getGraphpath().graph.
- Edge (map.nodes[a].links[b]): drivability (number 0..1, passability), hiddenInNavi (boolean|nil), oneWay (boolean), lanes (string, '+' lane in the inNode->outNode direction, '-' reverse lane, e.g. '--++'), speedLimit (number, m/s, computed automatically if absent), inNode / outNode (string, legal direction for a one-way road), type (string|nil, e.g. 'private' after an exclusion zone), inPos / outPos (vec3), inRadius / outRadius (number), noMerge (boolean|nil), gated (boolean|nil, barrier road), originalType and originalGatedRoad (old values saved by createTrafficExclusionArea).
- The Graphpath edges (getGraphpath().graph[a][b]) are different tables: len (travel cost = distance / effective drivability, + 10000 if barrier road), drivability, inNode, outNode, speedLimit, lanes, oneWay, gated (number 0 or 10000), inPos/inRadius/outPos/outRadius (only if different from the node's position/radius), eId (edge number). Here gated is a number, whereas in map.nodes it is a boolean (type inconsistency between the two structures).
- Paths (getPath, getPointToPointPath…) are arrays of node names (strings). getPath returns {} if the graph is not loaded or if start/target do not exist.
- The graph is built only by map.reset()/map.load() (launched when the level loads); map.getMap().nodes is empty before. After a reload, map.buildSerial increases by 1 and the extension receives the onNavgraphReloaded hook.
- The drawNavGraphState field is 'off' or 'on' (changed by toggleDrawNavGraph). objects and objectNames are recreated empty on each loadMap.
- M.objects (map.getTrackedObjects()): table objId -> {id, active, damage, states, uiState, objectCollisions, pos (vec3), vel (vec3), dirVec (vec3), dirVecUp (vec3), isParked, view, name, licensePlate}. It is cleared as soon as a frame arrives without an update (objectsCount == 0), so do not cache it from one frame to the next.
- Obsolete access: map.map returns map.getMap() with an error log 'map.map API is deprecated' (metatable at the end of the file).
- Probable bug (line 2617): the loadMap function tests 'mapNodes[outNodeId].radius ~= data.ouRadius' (typo, ouRadius is always nil). Result: outRadius is always passed to bidiEdge, never nil.
- Name inconsistency: map.onSerialize/map.onDeserialize use 'onDeserialize' whereas the rest of the game (e.g. simTimeAuthority) uses the 'onDeserialized' hook; the restore hook may not be called under this name.
- Typo kept in the API: map.getTrafficExlucsionZones (without the expected 'x'). The internal function is named getTrafficExclusionZones.
- map.findClosestRoad depends on maxRadius, nil until loadMap has run; in practice the function returns nil if the graph is not built (edgeKdTree nil).
- map.safeTeleport does not expose the player and unlimitedSafeSpawnRange parameters of spawn.safeTeleport.

## Functions

| Function | Description | Line |
|---|---|---|
| `map.assureLoad()` | Loads the road map if it is not loaded yet (loadMap), then sets loadedMap back to false so that a next map.load() reloads. *(internal)* | 3667 |
| `map.clearTrafficExclusionZones()` | Empties the list of traffic exclusion zones (table.clear). Does not rebuild the graph: map.reset() must be called for it to take effect. | 3955 |
| `map.createTrafficExclusionArea(trafficExlusionZones)` | Computes the set of excluded nodes from the given zones (nodes within each radius, then expansion along dead-end roads), marks the internal edges as type 'private' and the boundary edges as 'gated' (cost +10000). Called by loadMap with the registered zones. *(internal)* | 2370 |
| `map.debugDrawTrajectory(trajectory)` | Enables (given trajectory) or disables (nil) the debug drawing of a trajectory coming from optimizePath (spheres, normals, forces, cylinders). | 3430 |
| `map.findBestRoad(pos, dir)` | Finds the road best suited to a position and a direction: among the edges within 20 m whose position falls within the road width, picks the one whose axis is most aligned with dir. Falls back to findClosestRoad if there is no candidate. | 2732 |
| `map.findClosestRoad(pos, searchRadiusLim)` | Finds the edge (road segment) closest to pos and returns its two nodes and the distance. The search starts from a radius min(maxRadius, searchRadiusLim) and doubles it until an edge is found or searchRadiusLim is exceeded. The distance is computed to the center segment, ignoring the width. | 2706 |
| `map.getGraphpath()` | Returns the internal Graphpath object (gp): bidirectional graph with gp.graph[a][b] (edges), gp.positions, gp.radius and the shortest-path methods. nil before loading. | 3816 |
| `map.getManualWaypoints()` | Returns the table of manual waypoints (BeamNGWaypoint of the scene): name -> {pos, radius, ...}, with the value 1 for the entries already processed after loading. | 3820 |
| `map.getMap()` | Returns the road graph table: {nodes = ..., nodeAliases = ..., buildSerial = ...}. See the notes for the detail of nodes and edges. Do not modify: the table is shared. | 3812 |
| `map.getNodeLinkCount(nId)` | Number of edges linked to a node in the bidirectional graph. | 2150 |
| `map.getNodesFromPathDist(path, dist)` | Walks along a path over a given distance (sum of the distances between consecutive nodes) and returns the segment reached and the relative position within this segment. | 2801 |
| `map.getNodesNearPositions(trafficExlusionZones)` | Returns the ids of the graph nodes located within the radius of at least one of the given zones (a node can appear several times if it is in several zones). | 2353 |
| `map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)` | Shortest path between two nodes (Dijkstra on Graphpath:getFilteredPath). The cost of an edge = len x direction penalty x drivability penalty. | 2774 |
| `map.getPathLen(path)` | Total length of a path (sum of the 3D distances between the node positions). | 2824 |
| `map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)` | Shortest path between a free point and a node (or vice versa). One of the two arguments must be a node name, the other a vec3. | 2787 |
| `map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Shortest path between two free positions: the function links each position to nearby edges (startPosLinks iterator, up to 2000 m) then launches the search. | 2909 |
| `map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)` | Same as getPointToPointPath but runs in a coroutine job (allows yielding between steps). | 2926 |
| `map.getRoadRules()` | Returns the level's driving rules: {rightHandDrive = false, turnOnRed = false} merged with the roadRules field of the level's info file. Returns {} until the map has been loaded. | 157 |
| `map.getState()` | Updates the name and plate (licensePlate) of each tracked object then returns the whole module M (objects, names, etc.). Used for state transfer. | 3796 |
| `map.getTrackedObjects()` | Returns map.objects: the vehicles whose data arrived this frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}). | 3824 |
| `map.getTrafficExlucsionZones()` | Returns the current list of traffic exclusion zones (typo in the name kept). | 3950 |
| `map.isCrashAvoidable(objectID, pos, radius)` | Estimates whether a moving object can stop before reaching a position (braking distance computed with gravity, a friction of 0.5 and the slope). Used to decide whether something can be spawned at that spot. | 3913 |
| `map.load()` | Loads the map only once (loadedMap guard) by calling loadMap(). *(internal)* | 3661 |
| `map.logGraphHashes()` | Writes the SHA256 hashes of the nodes and edges to the log (debugging the determinism of the graph build). | 501 |
| `map.nameNode(prefix, idx)` | Makes a unique node name: prefix..idx, or prefix..idx.._N if this name already exists in map.nodes. | 135 |
| `map.objectData(objId, isactive, damage, states, objectCollisions)` | Receives a vehicle's data every frame (sent by the vehicle VM) and records it in map.objects with position, speed and direction read from the object. Ignored if the object is already recorded this frame. *(internal)* | 3829 |
| `map.onAddWaypoint(wp)` | Hook called when a waypoint is added to the scene. If the editor is active (setEditorState), reloads the map after 0.5 s. *(internal)* *(hook)* | 3708 |
| `map.onDeserialize(s)` | Restores isEditorEnabled and buildSerial after a GE Lua reload (see the note on the hook name). *(internal)* *(hook)* | 3783 |
| `map.onFilesChanged(files)` | Hook called when files change on disk. If the map's map.json file is concerned, reloads the graph. *(internal)* *(hook)* | 3729 |
| `map.onMissionLoaded()` | Hook called when a level is loaded: sets loadedMap back to false to allow the next map.load(). *(internal)* *(hook)* | 3674 |
| `map.onModifiedWaypoint(wp)` | Hook called when a waypoint is modified. If the editor is active, reloads the map after 0.5 s. *(internal)* *(hook)* | 3722 |
| `map.onRemoveWaypoint(wp)` | Hook called when a waypoint is removed. If the editor is active, reloads the map after 0.5 s. *(internal)* *(hook)* | 3715 |
| `map.onSerialize()` | Returns {isEditorEnabled, buildSerial} to save the state before a GE Lua reload. *(internal)* *(hook)* | 3779 |
| `map.onWaypoint(args)` | Hook called when a vehicle triggers a waypoint. The body is entirely commented out: does nothing. *(internal)* *(hook)* | 3678 |
| `map.optimizePath(path, s, useRawPos)` | Smooths a path to obtain a smoother trajectory: each point is moved by iterations of "curvature flow" (reduction of the curvature energy) while staying within the road width. Returns the trajectory or nil if the path has fewer than 2 points. | 3309 |
| `map.request(objId, objbuildSerial)` | Called by a vehicle VM to request the graph: if its version number (buildSerial) differs, sends it mapmgr.setMap(buildSerial) and the state of the signals (mapmgr.setSignals) if there are any. *(internal)* | 3739 |
| `map.reset(customMapNodes)` | Fully rebuilds the road graph (loadMap): reads the roads and waypoints, merges, computes speed limits and drivability, builds the search trees, sends the graph to the vehicles and emits onNavgraphReloaded. Can be slow. | 2511 |
| `map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle)` | Wrapper around spawn.safeTeleport to call it from a vehicle VM with plain numbers: teleports a vehicle to a collision-free spot. | 3941 |
| `map.saveSVG(filename, includeLinks, includeNodes)` | Exports the road graph in SVG format (edges and, optionally, nodes), with coordinates relative to the terrain position. | 2933 |
| `map.setEditorState(enabled)` | Indicates whether the editor is active; allows automatic reloading of the map when a waypoint changes. | 3788 |
| `map.setNameForId(name, id)` | Associates a name with an object id in map.objectNames. | 3909 |
| `map.setState(newState)` | Merges a table into the module (tableMerge(M, newState)). Used to restore the state. *(internal)* | 3792 |
| `map.setTrafficExclusionZones(zones)` | Replaces the traffic exclusion zones with the given table (error logged if it is not a table). The graph is not rebuilt here: the effect applies at the next map.reset(). | 3960 |
| `map.surfaceNormal(p, r)` | Estimates the ground normal at point p by casting three vertical rays (be:getSurfaceHeightBelow) around p at a distance r; reliable up to about 50 degrees of slope. | 506 |
| `map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions)` | Version of objectData where the caller supplies position, speed and directions itself (virtual object or without a VM). Records the object in map.objects. | 3868 |
| `map.toggleDrawExcludeSet()` | Enables/disables the debug drawing (red spheres) of the nodes excluded from traffic. | 2483 |
| `map.toggleDrawInitialExcludeSet()` | Enables/disables the debug drawing (white spheres) of the initial nodes of the exclusion zones. | 2502 |
| `map.toggleDrawNavGraph()` | Enables/disables the on-screen debug drawing of the road graph and updates drawNavGraphState. | 3632 |
| `map.toggleShuffledPairs(mode)` | Debug of the graph build determinism: replaces pairs with shuffledPairs (random iteration order) or the reverse. | 48 |
| `map.updateDrivabilities(changeSet)` | Dynamically changes the drivability of edges: recomputes the cost (len) of each edge, then sends the change to the vehicle VMs (mailbox updateDrivabilities and mapmgr.updateDrivabilities()). Does nothing if the size is not a multiple of 3. | 3752 |
| `map.updateGFX(dtReal, dtSim)` | Called every frame by the main loop: if simulation time advances, sends the objects table to the vehicle VMs (mailbox objUpdate), handles the deferred reload (editor) and draws the debug overlays. *(internal)* | 3645 |

### Parameter details

#### `map.createTrafficExclusionArea(trafficExlusionZones)`

Computes the set of excluded nodes from the given zones (nodes within each radius, then expansion along dead-end roads), marks the internal edges as type 'private' and the boundary edges as 'gated' (cost +10000). Called by loadMap with the registered zones.

- `trafficExlusionZones` (*table<integer, {pos: vec3, radius: number}>*) : List of circular zones.

#### `map.debugDrawTrajectory(trajectory)`

Enables (given trajectory) or disables (nil) the debug drawing of a trajectory coming from optimizePath (spheres, normals, forces, cylinders).

- `trajectory` (*table|nil*) : Result of map.optimizePath, or nil to stop drawing.

#### `map.findBestRoad(pos, dir)`

Finds the road best suited to a position and a direction: among the edges within 20 m whose position falls within the road width, picks the one whose axis is most aligned with dir. Falls back to findClosestRoad if there is no candidate.

- `pos` (*vec3*) : Position to project (m).
- `dir` (*vec3*) : Normalized direction (e.g. the vehicle's direction).
- **returns**: string|nil Id of the first node of the edge.
- **returns**: string|nil Id of the second node.
- **returns**: number|nil Distance from pos to the segment (m).

#### `map.findClosestRoad(pos, searchRadiusLim)`

Finds the edge (road segment) closest to pos and returns its two nodes and the distance. The search starts from a radius min(maxRadius, searchRadiusLim) and doubles it until an edge is found or searchRadiusLim is exceeded. The distance is computed to the center segment, ignoring the width.

- `pos` (*vec3*) : Position (m). Only x and y are used for the kd-tree search, the distance is 3D.
- `searchRadiusLim` (*number|nil*) : Maximum search radius in m (200 by default).
- **returns**: string|nil Id of node 1 of the edge (nil if nothing found or graph not built).
- **returns**: string|nil Id of node 2.
- **returns**: number Distance to the edge in m (meaningless value if no node is found).

#### `map.getGraphpath()`

Returns the internal Graphpath object (gp): bidirectional graph with gp.graph[a][b] (edges), gp.positions, gp.radius and the shortest-path methods. nil before loading.

- **returns**: table|nil Graphpath instance.

#### `map.getManualWaypoints()`

Returns the table of manual waypoints (BeamNGWaypoint of the scene): name -> {pos, radius, ...}, with the value 1 for the entries already processed after loading.

- **returns**: table Table of manual waypoints.

#### `map.getMap()`

Returns the road graph table: {nodes = ..., nodeAliases = ..., buildSerial = ...}. See the notes for the detail of nodes and edges. Do not modify: the table is shared.

- **returns**: table Map table (nodes, nodeAliases, buildSerial).

#### `map.getNodeLinkCount(nId)`

Number of edges linked to a node in the bidirectional graph.

- `nId` (*string*) : Node id.
- **returns**: integer Number of links, or -1 if the graph does not exist or the node is unknown.

#### `map.getNodesFromPathDist(path, dist)`

Walks along a path over a given distance (sum of the distances between consecutive nodes) and returns the segment reached and the relative position within this segment.

- `path` (*string[]*) : Path (list of node ids), at least 2 nodes.
- `dist` (*number|nil*) : Distance to travel in m; nil = to the end.
- **returns**: string|nil Start node of the segment (nil if the path is invalid).
- **returns**: string|nil End node of the segment.
- **returns**: number|nil xnorm between 0 and 1: position along the segment. Is 1 if dist exceeds the path length.

#### `map.getNodesNearPositions(trafficExlusionZones)`

Returns the ids of the graph nodes located within the radius of at least one of the given zones (a node can appear several times if it is in several zones).

- `trafficExlusionZones` (*table<integer, {pos: vec3, radius: number}>*) : List of circular zones.
- **returns**: string[] Node ids.

#### `map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff)`

Shortest path between two nodes (Dijkstra on Graphpath:getFilteredPath). The cost of an edge = len x direction penalty x drivability penalty.

- `start` (*string*) : Id of the start node.
- `target` (*string*) : Id of the end node.
- `cutOffDrivability` (*number|nil*) : Drivability threshold (0 by default): edges with drivability <= threshold are penalized by penaltyBelowCutoff.
- `dirMult` (*number|nil*) : Cost multiplier for a one-way edge taken against the direction (1 or nil = no penalty; reasonable values 1e3 to 1e4).
- `penaltyAboveCutoff` (*number|nil*) : Multiplier for roads above the threshold (1 by default).
- `penaltyBelowCutoff` (*number|nil*) : Multiplier for roads below the threshold (10000 by default).
- **returns**: string[] List of node ids from start to end; {} if the graph or one of the nodes does not exist.

#### `map.getPathLen(path)`

Total length of a path (sum of the 3D distances between the node positions).

- `path` (*string[]*) : List of node ids.
- **returns**: number Length in m (0 if the path or the map is missing).

#### `map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ)`

Shortest path between a free point and a node (or vice versa). One of the two arguments must be a node name, the other a vec3.

- `start` (*string|vec3*) : Start: node id or position.
- `target` (*string|vec3*) : End: node id or position.
- `cutOffDrivability` (*number|nil*) : See getPath.
- `dirMult` (*number|nil*) : See getPath.
- `penaltyAboveCutoff` (*number|nil*) : See getPath.
- `penaltyBelowCutoff` (*number|nil*) : See getPath.
- `wZ` (*number|nil*) : Weight of the height in the distance; above 1, minimizes the z difference more than x/y.
- **returns**: string[] Path as node ids; {} if the graph is not loaded.

#### `map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)`

Shortest path between two free positions: the function links each position to nearby edges (startPosLinks iterator, up to 2000 m) then launches the search.

- `startPos` (*vec3*) : Start position.
- `targetPos` (*vec3*) : End position.
- `cutOffDrivability` (*number|nil*) : See getPath.
- `dirMult` (*number|nil*) : See getPath (typically >= 10e4).
- `penaltyAboveCutoff` (*number|nil*) : See getPath.
- `penaltyBelowCutoff` (*number|nil*) : See getPath.
- `wD` (*any*) : Obsolete, ignored (kept for compatibility).
- `wZ` (*number|nil*) : Weight of the height difference (4 by default).
- **returns**: table Path; {} if the graph is not loaded.

#### `map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ)`

Same as getPointToPointPath but runs in a coroutine job (allows yielding between steps).

- `job` (*table*) : Current job object (job system coroutine).
- `startPos` (*vec3*) : Start position.
- `targetPos` (*vec3*) : End position.
- `cutOffDrivability` (*number|nil*) : See getPath.
- `dirMult` (*number|nil*) : See getPath.
- `penaltyAboveCutoff` (*number|nil*) : See getPath.
- `penaltyBelowCutoff` (*number|nil*) : See getPath.
- `wD` (*any*) : Obsolete, ignored.
- `wZ` (*number|nil*) : Weight of the height difference (4 by default).
- **returns**: table Path; {} if the graph is not loaded.

#### `map.getRoadRules()`

Returns the level's driving rules: {rightHandDrive = false, turnOnRed = false} merged with the roadRules field of the level's info file. Returns {} until the map has been loaded.

- **returns**: table Rules (rightHandDrive, turnOnRed, ...).

#### `map.getState()`

Updates the name and plate (licensePlate) of each tracked object then returns the whole module M (objects, names, etc.). Used for state transfer.

- **returns**: table The map module itself.

#### `map.getTrackedObjects()`

Returns map.objects: the vehicles whose data arrived this frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}).

- **returns**: table<integer, table> Tracked objects.

#### `map.getTrafficExlucsionZones()`

Returns the current list of traffic exclusion zones (typo in the name kept).

- **returns**: table List of {pos, radius}.

#### `map.isCrashAvoidable(objectID, pos, radius)`

Estimates whether a moving object can stop before reaching a position (braking distance computed with gravity, a friction of 0.5 and the slope). Used to decide whether something can be spawned at that spot.

- `objectID` (*integer*) : Id of the moving vehicle.
- `pos` (*vec3*) : Position of the point to protect.
- `radius` (*number|nil*) : Safety radius in m (7.5 by default).
- **returns**: boolean true if safe (object not found, more than 150 m away, or enough distance to brake).

#### `map.nameNode(prefix, idx)`

Makes a unique node name: prefix..idx, or prefix..idx.._N if this name already exists in map.nodes.

- `prefix` (*string*) : Name prefix.
- `idx` (*integer*) : Number.
- **returns**: string Free name.

#### `map.objectData(objId, isactive, damage, states, objectCollisions)`

Receives a vehicle's data every frame (sent by the vehicle VM) and records it in map.objects with position, speed and direction read from the object. Ignored if the object is already recorded this frame.

- `objId` (*integer*) : Vehicle id.
- `isactive` (*boolean*) : Active vehicle.
- `damage` (*number*) : Damage level.
- `states` (*table|nil*) : Vehicle states (shared empty table if nil).
- `objectCollisions` (*table|nil*) : Collisions with other objects.

#### `map.onAddWaypoint(wp)`

Hook called when a waypoint is added to the scene. If the editor is active (setEditorState), reloads the map after 0.5 s.

- `wp` (*any*) : Waypoint added (unused).

#### `map.onDeserialize(s)`

Restores isEditorEnabled and buildSerial after a GE Lua reload (see the note on the hook name).

- `s` (*table*) : Table produced by onSerialize: {isEditorEnabled, buildSerial}.

#### `map.onFilesChanged(files)`

Hook called when files change on disk. If the map's map.json file is concerned, reloads the graph.

- `files` (*table[]*) : List of entries with a filename field.

#### `map.onModifiedWaypoint(wp)`

Hook called when a waypoint is modified. If the editor is active, reloads the map after 0.5 s.

- `wp` (*any*) : Waypoint modified (unused).

#### `map.onRemoveWaypoint(wp)`

Hook called when a waypoint is removed. If the editor is active, reloads the map after 0.5 s.

- `wp` (*any*) : Waypoint removed (unused).

#### `map.onSerialize()`

Returns {isEditorEnabled, buildSerial} to save the state before a GE Lua reload.

- **returns**: table Array {isEditorEnabled, buildSerial}.

#### `map.onWaypoint(args)`

Hook called when a vehicle triggers a waypoint. The body is entirely commented out: does nothing.

- `args` (*table*) : Trigger data (subjectName, triggerName, event, mode); unused.

#### `map.optimizePath(path, s, useRawPos)`

Smooths a path to obtain a smoother trajectory: each point is moved by iterations of "curvature flow" (reduction of the curvature energy) while staying within the road width. Returns the trajectory or nil if the path has fewer than 2 points.

- `path` (*string[]|table[]*) : List of node ids, or (with useRawPos) list of {pos = vec3, radius = number}.
- `s` (*table*) : Settings: segDistSplitLim, fixPathNodes, fixEndpoints, evolvePathNormals, evolveMidNormals, evolveEndNormals, hta (0.1 m per iteration by default), fRange (1), forceMag ('angle' by default or 'curvature'), forceScale, forceMultiplier (2), iterations (120), distFromEdge (1 m), dispLimFromCenterAbs, dispLimFromCenterRel, logData, logTrajectory, tolFactor (0).
- `useRawPos` (*boolean|nil*) : true if path contains {pos, radius} instead of node ids.
- **returns**: table|nil Trajectory: list of points with pos, posOrig, normal, halfWidth, force… and trajectory.converged / trajectory.energy.

#### `map.request(objId, objbuildSerial)`

Called by a vehicle VM to request the graph: if its version number (buildSerial) differs, sends it mapmgr.setMap(buildSerial) and the state of the signals (mapmgr.setSignals) if there are any.

- `objId` (*integer*) : Id of the requesting vehicle.
- `objbuildSerial` (*integer*) : Graph version number known to the vehicle.

#### `map.reset(customMapNodes)`

Fully rebuilds the road graph (loadMap): reads the roads and waypoints, merges, computes speed limits and drivability, builds the search trees, sends the graph to the vehicles and emits onNavgraphReloaded. Can be slow.

- `customMapNodes` (*table|nil*) : Ready-to-use table of nodes (same format as map.nodes, double-sided) that replaces reading the scene's roads.

#### `map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle)`

Wrapper around spawn.safeTeleport to call it from a vehicle VM with plain numbers: teleports a vehicle to a collision-free spot.

- `vehId` (*integer|string*) : Vehicle id or name (passed to scenetree.findObject).
- `posX` (*number*) : Position x (m).
- `posY` (*number*) : Position y (m).
- `posZ` (*number*) : Position z (m).
- `rotX` (*number*) : Quaternion x.
- `rotY` (*number*) : Quaternion y.
- `rotZ` (*number*) : Quaternion z.
- `rotW` (*number*) : Quaternion w.
- `checkOnlyStatics_` (*boolean|nil*) : Test only static objects (ignore other vehicles).
- `visibilityPoint_` (*vec3|nil*) : Point from which the spot found must not be visible.
- `removeTraffic_` (*boolean|nil*) : Move traffic vehicles out of the area.
- `centeredPosition` (*boolean|nil*) : true if pos is the center of the vehicle's box and not its reference node.
- `resetVehicle` (*boolean|nil*) : Reset the vehicle (true by default in spawn.safeTeleport).

#### `map.saveSVG(filename, includeLinks, includeNodes)`

Exports the road graph in SVG format (edges and, optionally, nodes), with coordinates relative to the terrain position.

- `filename` (*string*) : SVG file path.
- `includeLinks` (*boolean|nil*) : Draw the edges (true by default).
- `includeNodes` (*boolean|nil*) : Draw the nodes (false by default).

#### `map.setEditorState(enabled)`

Indicates whether the editor is active; allows automatic reloading of the map when a waypoint changes.

- `enabled` (*boolean*) : true if the editor is open.

#### `map.setNameForId(name, id)`

Associates a name with an object id in map.objectNames.

- `name` (*string*) : Name.
- `id` (*integer*) : Object id.

#### `map.setState(newState)`

Merges a table into the module (tableMerge(M, newState)). Used to restore the state.

- `newState` (*table*) : Fields to copy into map.

#### `map.setTrafficExclusionZones(zones)`

Replaces the traffic exclusion zones with the given table (error logged if it is not a table). The graph is not rebuilt here: the effect applies at the next map.reset().

- `zones` (*table<integer, {pos: vec3, radius: number}>*) : List of circular zones.

#### `map.surfaceNormal(p, r)`

Estimates the ground normal at point p by casting three vertical rays (be:getSurfaceHeightBelow) around p at a distance r; reliable up to about 50 degrees of slope.

- `p` (*vec3*) : Point (m).
- `r` (*number|nil*) : Sampling radius in m (2 by default).
- **returns**: vec3 Unit normal.

#### `map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions)`

Version of objectData where the caller supplies position, speed and directions itself (virtual object or without a VM). Records the object in map.objects.

- `objId` (*integer*) : Object id.
- `isactive` (*boolean*) : Active object.
- `pos` (*vec3*) : Position.
- `vel` (*vec3*) : Speed.
- `dirVec` (*vec3*) : Forward direction.
- `dirVecUp` (*vec3*) : Up direction.
- `damage` (*number*) : Damage.
- `objectCollisions` (*table|nil*) : Collisions.

#### `map.toggleShuffledPairs(mode)`

Debug of the graph build determinism: replaces pairs with shuffledPairs (random iteration order) or the reverse.

- `mode` (*string|nil*) : 'shuffledPairs' or 'pairs'; nil = toggle.

#### `map.updateDrivabilities(changeSet)`

Dynamically changes the drivability of edges: recomputes the cost (len) of each edge, then sends the change to the vehicle VMs (mailbox updateDrivabilities and mapmgr.updateDrivabilities()). Does nothing if the size is not a multiple of 3.

- `changeSet` (*table*) : Flat list {nodeA1, nodeB1, drivability1, nodeA2, nodeB2, drivability2, ...}. The edge is looked up in the nodeA -> nodeB direction of the bidirectional graph. Drivability is clamped to a minimum of 1e-30.

#### `map.updateGFX(dtReal, dtSim)`

Called every frame by the main loop: if simulation time advances, sends the objects table to the vehicle VMs (mailbox objUpdate), handles the deferred reload (editor) and draws the debug overlays.

- `dtReal` (*number*) : Real frame time (s).
- `dtSim` (*number*) : Simulated duration of the frame (s); 0 when paused.

## Fields

| Field | Type | Description |
|---|---|---|
| `drawNavGraphState` | string | 'off' or 'on' depending on whether the navgraph debug drawing is active (toggleDrawNavGraph). |
| `objectNames` | table<string, integer> | Name -> object id association, filled by setNameForId. getState() copies the name into objects[id].name. |
| `objects` | table<integer, table> | Vehicles tracked this frame (key = object id). Filled by objectData/tempObjectData, cleared when no more data arrives. Same table as getTrackedObjects(). |

## Class `singleEventTimer`

Internal one-shot timer (not exported, delayedLoad is its instance) used to reload the map 0.5 s after a waypoint change in the editor.

| Method | Description | Line |
|---|---|---|
| `singleEventTimer:callAfter(dt, eventFun, ...)` | Schedules the call of eventFun(...) after dt seconds. NB: the automatic page says (eventFun, ...) but the actual signature is (dt, eventFun, ...). | 122 |
| `singleEventTimer:update(dt)` | Counts down the delay; at zero calls eventFun once. Called every frame by updateGFX with dtReal. | 113 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onNavgraphReloaded` — listened to by 3 module(s)

**UI events (guihooks.trigger):** `NavigationMapChanged`

## Calls into the engine (C++)

- `be:` `getSurfaceHeightBelow`, `getTerrainDrivability`, `queueObjectLua`, `sendToMailbox`
- `core_environment.` `getGravity`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawSquarePrism`, `drawText`
- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getInitialLength`, `getSpawnWorldOOBB`, `getVelocity`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/map.lua`.*
