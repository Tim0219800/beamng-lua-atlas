---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/planet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/environment/planet.lua
---@class flowgraph_nodes_environment_planet_C
local flowgraph_nodes_environment_planet_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:37
function flowgraph_nodes_environment_planet_C:_executionStopped() end

--- points: 2d array of points
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:163
---@param heightmap any
---@param uvScale any
---@param material any
function flowgraph_nodes_environment_planet_C:createheightmapMesh(heightmap, uvScale, material) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:123
---@param builder any
---@param style any
function flowgraph_nodes_environment_planet_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:378
---@param grid any
---@param size any
---@param identifier any
---@param dimensions any
function flowgraph_nodes_environment_planet_C:getSquare(grid, size, identifier, dimensions) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:323
---@param path any
---@param scale any
---@param invertColors any
function flowgraph_nodes_environment_planet_C:heightmapFromPNG(path, scale, invertColors) end

--- (m3,s-2,kg-1)
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:32
function flowgraph_nodes_environment_planet_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:289
---@param p1 any
---@param p3 any
---@param p2 any
function flowgraph_nodes_environment_planet_C:normalFromPoints(p1, p3, p2) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:41
function flowgraph_nodes_environment_planet_C:onNodeReset() end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:301
---@param name any
---@param mesh any
---@param pos any
---@param rot any
function flowgraph_nodes_environment_planet_C:placeObject(name, mesh, pos, rot) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:247
---@param sphereRadius any
---@param heightmap any
---@param surfaceHeight any
function flowgraph_nodes_environment_planet_C:warpSphere(sphereRadius, heightmap, surfaceHeight) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:264
---@param sphereRadius any
---@param heightmap any
---@param cLength any
---@param surfaceHeight any
function flowgraph_nodes_environment_planet_C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight) end

---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:57
function flowgraph_nodes_environment_planet_C:workOnce() end

