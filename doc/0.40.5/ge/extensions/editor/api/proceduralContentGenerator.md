# `editor_api_proceduralContentGenerator`

*File: `lua/ge/extensions/editor/api/proceduralContentGenerator.lua` · VM: Game Engine (GE) · 1049 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_proceduralContentGenerator`: `extensions.load("editor_api_proceduralContentGenerator")`, then the global `editor_api_proceduralContentGenerator`

Procedural content generator (PCG) for the editor: you build a graph of nodes (point generators, transforms, spawners) then run it to create objects in the level (TSStatic, prefabs, objects of any class, DecalRoad). The data flowing between nodes are "points" (pos, rot, scale, bounds, color, spawnRandomness) or "segments" (roads). Named graphs are cached; each graph keeps the ids of the objects it created in order to delete them on re-execution. The API is exposed as M.* and, after initialize(editor), as editor.pcg and editor.proceduralContentGenerator.

## Example

```lua
local pcg = extensions.editor_api_proceduralContentGenerator
local g = pcg.graph('arbres', {seed = 42})
g:scatterDisk({center = vec3(0,0,0), radius = 50, count = 30})
  :snapTerrain({offset = 0})
  :randomTransform({yaw = {0, 360}, scale = {0.8, 1.2}})
  :spawnStatic({paths = {'/art/shapes/trees/tree1.dae'}, group = 'PCG_Arbres'})
g:run()
```

## Notes

- Node types (nodes table / M.nodes): scatterBox, scatterGrid, scatterDisk, scatterAlongSpline, fromPoints, fromSegments (generators); randomTransform, setSpawnRandomness, snapTerrain, offset, filterBounds (transforms); spawnStatic, spawnPrefab, spawnClass, spawnDecalRoads (spawners).
- Each node parameter can be given in params or arrive through a connected pin (resolvePin: incoming link takes priority over params).
- The random generator is a deterministic LCG (seed = opts.seed of run, otherwise graph.seed, default 1): same seed, same result.
- Graph:run(opts): opts.replace ~= false (default) first deletes the previously created objects and empties the tracked SimGroups (spawnGroups): all the group's content, even if added by hand, is deleted. Nodes are executed in topological order; a cycle is logged (log E 'pcg') and the nodes of the cycle are not executed.
- Spawners create the objects in a SimGroup (default 'PCG_Generated', created under MissionGroup if absent).
- For fromSegments, segments accept {nodes = {{pos,width}}}, {path = {pos...}} or {a, b, width}. spawnDecalRoads ignores segments with fewer than 2 nodes; snapTerrain is true by default, default material 'road_asphalt_2lane', width 8.
- Pipe:spawnStatic/spawnPrefab/spawnClass/spawnDecalRoads return the Graph (not a Pipe): the chain stops there.
- Graph:rebuild() only empties the node list (spawned objects remain); Graph:fromSegments returns a Pipe whose pin is 'segments'.
- scatterAlongSpline modes: 'equal' (spacing, startOffset), 'count', 'random' (count, minSpacing), 'fixed' (distances); alignToTangent is true by default.
- M.graphs is the shared cache table (name -> Graph).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects)` | Calls removeGraph on all cached graphs, with the same deleteOwnedObjects semantics. | 1002 |
| `editor_api_proceduralContentGenerator.getGraph(name)` | Returns the cached graph of that name or nil. | 982 |
| `editor_api_proceduralContentGenerator.graph(nameOrOpts, opts)` | graph('name') / graph('name', opts) returns a cached graph (creates it if needed; opts.seed updates the seed of an existing graph). graph(opts) or graph() creates an anonymous graph that is not cached. | 956 |
| `editor_api_proceduralContentGenerator.initialize(editorInstance)` | Remembers the editor object and exposes the API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) under editor.pcg and editor.proceduralContentGenerator. Called when the editor API is loaded. *(internal)* | 1021 |
| `editor_api_proceduralContentGenerator.listGraphs()` | Sorted list of cached graph names. | 973 |
| `editor_api_proceduralContentGenerator.newPoint(opts)` | Creates a normalized PCG point: pos (vec3, default 0), rot (quat, identity), scale (vec3, default 1), bounds (vec3, default 1), color ({r,g,b,a} default white), spawnRandomness (0..1, default 0). The vec3/quat can be given as {x,y,z} or {1,2,3} tables; a single number becomes a uniform vec3. | 51 |
| `editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects)` | Removes a graph from the cache. By default also deletes the scene objects it created; with false, forgets them without deleting. | 989 |

### Parameter details

#### `editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects)`

Calls removeGraph on all cached graphs, with the same deleteOwnedObjects semantics.

- `deleteOwnedObjects` (*boolean|nil*) : Default true.

#### `editor_api_proceduralContentGenerator.getGraph(name)`

Returns the cached graph of that name or nil.

- `name` (*string*) : Graph name.
- **returns**: table|nil Graph.

#### `editor_api_proceduralContentGenerator.graph(nameOrOpts, opts)`

graph('name') / graph('name', opts) returns a cached graph (creates it if needed; opts.seed updates the seed of an existing graph). graph(opts) or graph() creates an anonymous graph that is not cached.

- `nameOrOpts` (*string|table|nil*) : Graph name, or options table for an anonymous graph.
- `opts` (*table|nil*) : {seed = number} (default seed 1).
- **returns**: table Graph.

#### `editor_api_proceduralContentGenerator.initialize(editorInstance)`

Remembers the editor object and exposes the API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) under editor.pcg and editor.proceduralContentGenerator. Called when the editor API is loaded.

- `editorInstance` (*table*) : Global editor object.

#### `editor_api_proceduralContentGenerator.listGraphs()`

Sorted list of cached graph names.

- **returns**: string[] Names.

#### `editor_api_proceduralContentGenerator.newPoint(opts)`

Creates a normalized PCG point: pos (vec3, default 0), rot (quat, identity), scale (vec3, default 1), bounds (vec3, default 1), color ({r,g,b,a} default white), spawnRandomness (0..1, default 0). The vec3/quat can be given as {x,y,z} or {1,2,3} tables; a single number becomes a uniform vec3.

- `opts` (*table|nil*) : {pos, rot, scale, bounds, color, spawnRandomness}.
- **returns**: table Point.

#### `editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects)`

Removes a graph from the cache. By default also deletes the scene objects it created; with false, forgets them without deleting.

- `name` (*string*) : Graph name.
- `deleteOwnedObjects` (*boolean|nil*) : Default true; false to keep the objects.
- **returns**: boolean false if the graph does not exist.

## Fields

| Field | Type | Description |
|---|---|---|
| `graphs` | table<string, table> | Cache of named graphs (name -> Graph). |
| `nodes` | table<string, function> | Node factories by name (scatterBox, spawnStatic...); each takes a params table and returns a raw node. |

## Class `Graph`

Node graph (fields: name, seed, nodes, spawnedIds, spawnGroups). The factory methods return a Pipe for chaining.

| Method | Description | Line |
|---|---|---|
| `Graph:_addNode(node)` | Adds a raw node to the graph, gives it an id and returns the node. | 146 |
| `Graph:add(kindOrNode, params)` | Adds a node by factory name (string) or a custom node (table with execute(node, ctx, get)). Unknown name: log E and returns nil. | 912 |
| `Graph:clear()` | Alias of clearSpawned. | 203 |
| `Graph:clearSpawned()` | Deletes the objects created by the graph (via editor.deleteObject) and empties the SimGroups tracked by name. | 165 |
| `Graph:connect(fromNode, fromPin, toNode, toPin)` | Connects the fromPin output of fromNode to the toPin input of toNode. Also accepts the form connect(pipe, toNode, toPin). | 153 |
| `Graph:destroy(deleteOwnedObjects)` | Destroys the graph: removes it from the cache if it is there and deletes its objects (unless deleteOwnedObjects == false). | 1009 |
| `Graph:fromPoints(params)` | Source node copying a given list of points (params.points). | 906 |
| `Graph:fromSegments(params)` | Source node of road segments (params.segments). | 907 |
| `Graph:rebuild()` | Empties the node list to rebuild the graph (does not delete the created objects). | 938 |
| `Graph:run(opts)` | Runs the graph in topological order. By default first deletes the previous objects. Marks the editor as modified. | 270 |
| `Graph:scatterAlongSpline(params)` | Node placing points along a polyline path. Params: path, closed, mode, count, spacing, minSpacing, distances, startOffset, lateralJitter, upJitter, alignToTangent. | 905 |
| `Graph:scatterBox(params)` | Node generating count random points in a box. Params: center, extent (default 10,10,0), count. | 902 |
| `Graph:scatterDisk(params)` | Node generating count points uniformly distributed in a disk/ring. Params: center, radius (default 10), innerRadius, count. | 904 |
| `Graph:scatterGrid(params)` | Node generating a grid of points. Params: center, extent, spacing (default 2), jitter. | 903 |

## Class `Pipe`

Chaining handle on a node's output pin (graph, node, pin). Each method adds a node connected to this pin and returns a new Pipe (except the spawners).

| Method | Description | Line |
|---|---|---|
| `Pipe:clear()` | Shortcut to Graph:clear. | 933 |
| `Pipe:connectTo(toNode, toPin)` | Connects the pin to toNode.toPin (default 'points') and returns a Pipe on that node. | 313 |
| `Pipe:filterBounds(params)` | Keeps only the points inside the min/max box or inside the center/radius sphere. | 927 |
| `Pipe:offset(params)` | Shifts each point by delta, plus a random offset of +-random per axis. | 926 |
| `Pipe:randomTransform(params)` | Adds a random rotation (yaw, pitch, roll in degrees, number or {min,max}) and/or a scale (number, {min,max} or {x,y,z} of ranges). | 923 |
| `Pipe:rebuild()` | Shortcut to Graph:rebuild. | 934 |
| `Pipe:run(opts)` | Shortcut to Graph:run. | 932 |
| `Pipe:setSpawnRandomness(params)` | Sets spawnRandomness (0..1) of each point: fixed value, drawn range, otherwise random. Used to choose the element in the paths/classes lists. | 924 |
| `Pipe:snapTerrain(params)` | Places each point at the terrain height (core_terrain.getTerrainHeight) + offset. Without a terrain, changes nothing. | 925 |
| `Pipe:spawnClass(params)` | Creates an object of any class per point (class chosen from classes) and applies the fields via setField. Params: classes, fields, group, namePrefix. | 930 |
| `Pipe:spawnDecalRoads(params)` | Creates a DecalRoad per segment. Params: segments, group, namePrefix, material, width, snapTerrain, overObjects, drivability, textureLength, improvedSpline. | 931 |
| `Pipe:spawnPrefab(params)` | Instantiates a prefab per point via spawnPrefab (path chosen from paths). Params: paths, group, namePrefix. | 929 |
| `Pipe:spawnStatic(params)` | Creates a TSStatic per point (shape chosen from paths according to spawnRandomness), 'Collision Mesh' collision, the point's instance color. Params: paths, group, namePrefix, collisionType, decalType. | 928 |

## Class `api`

Table exposed as editor.pcg / editor.proceduralContentGenerator: same functions as the module (graph, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint) and fields graphs, nodes.

Object `api` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `api.clearAllGraphs(deleteOwnedObjects)` | See the module's clearAllGraphs. | 1002 |
| `api.getGraph(name)` | See the module's getGraph. | 982 |
| `api.graph(nameOrOpts, opts)` | See the module's graph. | 956 |
| `api.listGraphs()` | See the module's listGraphs. | 973 |
| `api.newPoint(opts)` | See the module's newPoint. | 51 |
| `api.removeGraph(name, deleteOwnedObjects)` | See the module's removeGraph. | 989 |

## Calls into the engine (C++)

- `Sim.` `findObjectById`, `getUniqueName`
- `obj:` `delete`, `getID`, `getId`, `registerObject`, `setField`, `setPosRot`, `setPosition`, `setScale`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/proceduralContentGenerator.lua`.*
