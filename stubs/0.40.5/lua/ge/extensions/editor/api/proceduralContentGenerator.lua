---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/proceduralContentGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedural content generator (PCG) for the editor: you build a graph of nodes (point generators, transforms, spawners) then run it to create objects in the level (TSStatic, prefabs, objects of any class, DecalRoad). The data flowing between nodes are "points" (pos, rot, scale, bounds, color, spawnRandomness) or "segments" (roads). Named graphs are cached; each graph keeps the ids of the objects it created in order to delete them on re-execution. The API is exposed as M.* and, after initialize(editor), as editor.pcg and editor.proceduralContentGenerator.
--- Access: extension `editor_api_proceduralContentGenerator`: `extensions.load("editor_api_proceduralContentGenerator")`, then the global `editor_api_proceduralContentGenerator`
---@class editor_api_proceduralContentGenerator
---@field graphs table<string, table> Cache of named graphs (name -> Graph).
---@field nodes table<string, function> Node factories by name (scatterBox, spawnStatic...); each takes a params table and returns a raw node.
editor_api_proceduralContentGenerator = {}

--- Calls removeGraph on all cached graphs, with the same deleteOwnedObjects semantics.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects boolean|nil Default true.
function editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects) end

--- Returns the cached graph of that name or nil.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name string Graph name.
---@return table|nil  Graph.
function editor_api_proceduralContentGenerator.getGraph(name) end

--- graph('name') / graph('name', opts) returns a cached graph (creates it if needed; opts.seed updates the seed of an existing graph). graph(opts) or graph() creates an anonymous graph that is not cached.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts string|table|nil Graph name, or options table for an anonymous graph.
---@param opts table|nil {seed = number} (default seed 1).
---@return table  Graph.
function editor_api_proceduralContentGenerator.graph(nameOrOpts, opts) end

--- Remembers the editor object and exposes the API (graph, graphs, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint, nodes) under editor.pcg and editor.proceduralContentGenerator. Called when the editor API is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1021
---@param editorInstance table Global editor object.
function editor_api_proceduralContentGenerator.initialize(editorInstance) end

--- Sorted list of cached graph names.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
---@return string[]  Names.
function editor_api_proceduralContentGenerator.listGraphs() end

--- Creates a normalized PCG point: pos (vec3, default 0), rot (quat, identity), scale (vec3, default 1), bounds (vec3, default 1), color ({r,g,b,a} default white), spawnRandomness (0..1, default 0). The vec3/quat can be given as {x,y,z} or {1,2,3} tables; a single number becomes a uniform vec3.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts table|nil {pos, rot, scale, bounds, color, spawnRandomness}.
---@return table  Point.
function editor_api_proceduralContentGenerator.newPoint(opts) end

--- Removes a graph from the cache. By default also deletes the scene objects it created; with false, forgets them without deleting.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name string Graph name.
---@param deleteOwnedObjects boolean|nil Default true; false to keep the objects.
---@return boolean  false if the graph does not exist.
function editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects) end

--- Node graph (fields: name, seed, nodes, spawnedIds, spawnGroups). The factory methods return a Pipe for chaining.
---@class editor_api_proceduralContentGenerator_Graph
local editor_api_proceduralContentGenerator_Graph = {}

--- Adds a raw node to the graph, gives it an id and returns the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:146
---@param node table Node.
---@return table  The node.
function editor_api_proceduralContentGenerator_Graph:_addNode(node) end

--- Adds a node by factory name (string) or a custom node (table with execute(node, ctx, get)). Unknown name: log E and returns nil.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:912
---@param kindOrNode string|table Node name or node.
---@param params table|nil Parameters.
---@return table|nil  Pipe.
function editor_api_proceduralContentGenerator_Graph:add(kindOrNode, params) end

--- Alias of clearSpawned.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:203
---@return table  The graph.
function editor_api_proceduralContentGenerator_Graph:clear() end

--- Deletes the objects created by the graph (via editor.deleteObject) and empties the SimGroups tracked by name.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:165
---@return table  The graph.
function editor_api_proceduralContentGenerator_Graph:clearSpawned() end

--- Connects the fromPin output of fromNode to the toPin input of toNode. Also accepts the form connect(pipe, toNode, toPin).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:153
---@param fromNode table Source node (or Pipe).
---@param fromPin string Output pin ('points', 'segments', 'objectIds').
---@param toNode table Target node.
---@param toPin string Input pin.
---@return table  The graph.
function editor_api_proceduralContentGenerator_Graph:connect(fromNode, fromPin, toNode, toPin) end

--- Destroys the graph: removes it from the cache if it is there and deletes its objects (unless deleteOwnedObjects == false).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1009
---@param deleteOwnedObjects boolean|nil Default true.
---@return boolean  true (or result of removeGraph).
function editor_api_proceduralContentGenerator_Graph:destroy(deleteOwnedObjects) end

--- Source node copying a given list of points (params.points).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:906
---@param params table {points}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:fromPoints(params) end

--- Source node of road segments (params.segments).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:907
---@param params table {segments}.
---@return table  Pipe on the 'segments' pin.
function editor_api_proceduralContentGenerator_Graph:fromSegments(params) end

--- Empties the node list to rebuild the graph (does not delete the created objects).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:938
---@return table  The graph.
function editor_api_proceduralContentGenerator_Graph:rebuild() end

--- Runs the graph in topological order. By default first deletes the previous objects. Marks the editor as modified.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:270
---@param opts table|nil {seed = number, replace = boolean (default true)}.
---@return table  {spawnedIds = integer[], nodes = integer}.
function editor_api_proceduralContentGenerator_Graph:run(opts) end

--- Node placing points along a polyline path. Params: path, closed, mode, count, spacing, minSpacing, distances, startOffset, lateralJitter, upJitter, alignToTangent.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:905
---@param params table See the notes.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterAlongSpline(params) end

--- Node generating count random points in a box. Params: center, extent (default 10,10,0), count.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:902
---@param params table {center, extent, count}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterBox(params) end

--- Node generating count points uniformly distributed in a disk/ring. Params: center, radius (default 10), innerRadius, count.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:904
---@param params table {center, radius, innerRadius, count}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterDisk(params) end

--- Node generating a grid of points. Params: center, extent, spacing (default 2), jitter.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:903
---@param params table {center, extent, spacing, jitter}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Graph:scatterGrid(params) end

--- Chaining handle on a node's output pin (graph, node, pin). Each method adds a node connected to this pin and returns a new Pipe (except the spawners).
---@class editor_api_proceduralContentGenerator_Pipe
local editor_api_proceduralContentGenerator_Pipe = {}

--- Shortcut to Graph:clear.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:933
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:clear() end

--- Connects the pin to toNode.toPin (default 'points') and returns a Pipe on that node.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:313
---@param toNode table Target node.
---@param toPin string|nil Input pin.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:connectTo(toNode, toPin) end

--- Keeps only the points inside the min/max box or inside the center/radius sphere.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:927
---@param params table {min, max} or {center, radius}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:filterBounds(params) end

--- Shifts each point by delta, plus a random offset of +-random per axis.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:926
---@param params table {delta, random}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:offset(params) end

--- Adds a random rotation (yaw, pitch, roll in degrees, number or {min,max}) and/or a scale (number, {min,max} or {x,y,z} of ranges).
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:923
---@param params table {yaw, pitch, roll, scale}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:randomTransform(params) end

--- Shortcut to Graph:rebuild.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:934
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:rebuild() end

--- Shortcut to Graph:run.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:932
---@param opts table|nil See Graph:run.
---@return table  Result of run.
function editor_api_proceduralContentGenerator_Pipe:run(opts) end

--- Sets spawnRandomness (0..1) of each point: fixed value, drawn range, otherwise random. Used to choose the element in the paths/classes lists.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:924
---@param params table {value} or {range}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:setSpawnRandomness(params) end

--- Places each point at the terrain height (core_terrain.getTerrainHeight) + offset. Without a terrain, changes nothing.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:925
---@param params table {offset}.
---@return table  Pipe.
function editor_api_proceduralContentGenerator_Pipe:snapTerrain(params) end

--- Creates an object of any class per point (class chosen from classes) and applies the fields via setField. Params: classes, fields, group, namePrefix.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:930
---@param params table See description.
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnClass(params) end

--- Creates a DecalRoad per segment. Params: segments, group, namePrefix, material, width, snapTerrain, overObjects, drivability, textureLength, improvedSpline.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:931
---@param params table See description.
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnDecalRoads(params) end

--- Instantiates a prefab per point via spawnPrefab (path chosen from paths). Params: paths, group, namePrefix.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:929
---@param params table See description.
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnPrefab(params) end

--- Creates a TSStatic per point (shape chosen from paths according to spawnRandomness), 'Collision Mesh' collision, the point's instance color. Params: paths, group, namePrefix, collisionType, decalType.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:928
---@param params table See description.
---@return table  The Graph.
function editor_api_proceduralContentGenerator_Pipe:spawnStatic(params) end

--- Table exposed as editor.pcg / editor.proceduralContentGenerator: same functions as the module (graph, listGraphs, getGraph, removeGraph, clearAllGraphs, newPoint) and fields graphs, nodes.
---@class editor_api_proceduralContentGenerator_api
local editor_api_proceduralContentGenerator_api = {}

--- See the module's clearAllGraphs.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects boolean|nil Default true.
function editor_api_proceduralContentGenerator_api.clearAllGraphs(deleteOwnedObjects) end

--- See the module's getGraph.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name string Name.
---@return table|nil  Graph.
function editor_api_proceduralContentGenerator_api.getGraph(name) end

--- See the module's graph.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts string|table|nil Name or options.
---@param opts table|nil Options.
---@return table  Graph.
function editor_api_proceduralContentGenerator_api.graph(nameOrOpts, opts) end

--- See the module's listGraphs.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
---@return string[]  Names.
function editor_api_proceduralContentGenerator_api.listGraphs() end

--- See the module's newPoint.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts table|nil Options.
---@return table  Point.
function editor_api_proceduralContentGenerator_api.newPoint(opts) end

--- See the module's removeGraph.
---Source: lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name string Name.
---@param deleteOwnedObjects boolean|nil Default true.
---@return boolean  Success.
function editor_api_proceduralContentGenerator_api.removeGraph(name, deleteOwnedObjects) end

