---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/proceduralContentGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_proceduralContentGenerator` : `extensions.load("editor_api_proceduralContentGenerator")`, puis la globale `editor_api_proceduralContentGenerator`
---@class editor_api_proceduralContentGenerator
---@field graphs table
---@field nodes table
editor_api_proceduralContentGenerator = {}

--- clearAllGraphs(deleteOwnedObjects) — same bool semantics as removeGraph.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects any
function editor_api_proceduralContentGenerator.clearAllGraphs(deleteOwnedObjects) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name any
function editor_api_proceduralContentGenerator.getGraph(name) end

--- graph("name") / graph("name", opts) returns a cached graph (spawnedIds preserved).
---  graph(opts) / graph() creates an anonymous uncached graph.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts any
---@param opts any
function editor_api_proceduralContentGenerator.graph(nameOrOpts, opts) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1021
---@param editorInstance any
function editor_api_proceduralContentGenerator.initialize(editorInstance) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
function editor_api_proceduralContentGenerator.listGraphs() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts any
function editor_api_proceduralContentGenerator.newPoint(opts) end

--- removeGraph(name, deleteOwnedObjects)
---  deleteOwnedObjects defaults to true: deletes spawned scene objects, then drops the cache entry.
---  Pass false to forget the graph but leave its objects in the scene.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name any
---@param deleteOwnedObjects any
function editor_api_proceduralContentGenerator.removeGraph(name, deleteOwnedObjects) end

--- Classe locale `Graph` de lua/ge/extensions/editor/api/proceduralContentGenerator.lua
---@class editor_api_proceduralContentGenerator_Graph
local editor_api_proceduralContentGenerator_Graph = {}

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:146
---@param node any
function editor_api_proceduralContentGenerator_Graph:_addNode(node) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:912
---@param kindOrNode any
---@param params any
function editor_api_proceduralContentGenerator_Graph:add(kindOrNode, params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:203
function editor_api_proceduralContentGenerator_Graph:clear() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:165
function editor_api_proceduralContentGenerator_Graph:clearSpawned() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:153
---@param fromNode any
---@param fromPin any
---@param toNode any
---@param toPin any
function editor_api_proceduralContentGenerator_Graph:connect(fromNode, fromPin, toNode, toPin) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1009
---@param deleteOwnedObjects any
function editor_api_proceduralContentGenerator_Graph:destroy(deleteOwnedObjects) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:906
---@param params any
function editor_api_proceduralContentGenerator_Graph:fromPoints(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:907
---@param params any
function editor_api_proceduralContentGenerator_Graph:fromSegments(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:938
function editor_api_proceduralContentGenerator_Graph:rebuild() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:270
---@param opts any
function editor_api_proceduralContentGenerator_Graph:run(opts) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:905
---@param params any
function editor_api_proceduralContentGenerator_Graph:scatterAlongSpline(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:902
---@param params any
function editor_api_proceduralContentGenerator_Graph:scatterBox(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:904
---@param params any
function editor_api_proceduralContentGenerator_Graph:scatterDisk(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:903
---@param params any
function editor_api_proceduralContentGenerator_Graph:scatterGrid(params) end

--- Classe locale `Pipe` de lua/ge/extensions/editor/api/proceduralContentGenerator.lua
---@class editor_api_proceduralContentGenerator_Pipe
local editor_api_proceduralContentGenerator_Pipe = {}

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:933
function editor_api_proceduralContentGenerator_Pipe:clear() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:313
---@param toNode any
---@param toPin any
function editor_api_proceduralContentGenerator_Pipe:connectTo(toNode, toPin) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:927
---@param params any
function editor_api_proceduralContentGenerator_Pipe:filterBounds(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:926
---@param params any
function editor_api_proceduralContentGenerator_Pipe:offset(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:923
---@param params any
function editor_api_proceduralContentGenerator_Pipe:randomTransform(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:934
function editor_api_proceduralContentGenerator_Pipe:rebuild() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:932
---@param opts any
function editor_api_proceduralContentGenerator_Pipe:run(opts) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:924
---@param params any
function editor_api_proceduralContentGenerator_Pipe:setSpawnRandomness(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:925
---@param params any
function editor_api_proceduralContentGenerator_Pipe:snapTerrain(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:930
---@param params any
function editor_api_proceduralContentGenerator_Pipe:spawnClass(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:931
---@param params any
function editor_api_proceduralContentGenerator_Pipe:spawnDecalRoads(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:929
---@param params any
function editor_api_proceduralContentGenerator_Pipe:spawnPrefab(params) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:928
---@param params any
function editor_api_proceduralContentGenerator_Pipe:spawnStatic(params) end

--- Classe locale `api` de lua/ge/extensions/editor/api/proceduralContentGenerator.lua
---@class editor_api_proceduralContentGenerator_api
local editor_api_proceduralContentGenerator_api = {}

--- clearAllGraphs(deleteOwnedObjects) — same bool semantics as removeGraph.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:1002
---@param deleteOwnedObjects any
function editor_api_proceduralContentGenerator_api.clearAllGraphs(deleteOwnedObjects) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:982
---@param name any
function editor_api_proceduralContentGenerator_api.getGraph(name) end

--- graph("name") / graph("name", opts) returns a cached graph (spawnedIds preserved).
---  graph(opts) / graph() creates an anonymous uncached graph.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:956
---@param nameOrOpts any
---@param opts any
function editor_api_proceduralContentGenerator_api.graph(nameOrOpts, opts) end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:973
function editor_api_proceduralContentGenerator_api.listGraphs() end

---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:51
---@param opts any
function editor_api_proceduralContentGenerator_api.newPoint(opts) end

--- removeGraph(name, deleteOwnedObjects)
---  deleteOwnedObjects defaults to true: deletes spawned scene objects, then drops the cache entry.
---  Pass false to forget the graph but leave its objects in the scene.
---Source : lua/ge/extensions/editor/api/proceduralContentGenerator.lua:989
---@param name any
---@param deleteOwnedObjects any
function editor_api_proceduralContentGenerator_api.removeGraph(name, deleteOwnedObjects) end

