---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/planet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class, with the planet generation functions.
---@class flowgraph_nodes_environment_planet_C
local flowgraph_nodes_environment_planet_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:37
function flowgraph_nodes_environment_planet_C:_executionStopped() end

--- Builds the mesh data (vertices, UVs, smoothed normals, faces, material) from a grid of points with a border.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:163
---@param heightmap table 2D grid of points {x,y,z,origX,origY}
---@param uvScale number|nil UV scale (1 by default)
---@param material string|nil material name
---@return table  mesh {verts, uvs, normals, faces, material}
function flowgraph_nodes_environment_planet_C:createheightmapMesh(heightmap, uvScale, material) end

--- Editor: debug drawing and surface gravity (G*mass/radius²).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:123
---@param builder table node constructor
---@param style table style
function flowgraph_nodes_environment_planet_C:drawMiddle(builder, style) end

--- Extracts from the cross map the requested cube face (f, r, b, l, u, d), with a one-point border copied from the neighboring faces (blLookup table), and scales the x/y coordinates to the dimensions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:378
---@param grid table cube-cross height grid
---@param size integer size of one face
---@param identifier string face: f, r, b, l, u or d
---@param dimensions number desired side length
---@return table  (size+2)² face with border
function flowgraph_nodes_environment_planet_C:getSquare(grid, size, identifier, dimensions) end

--- Loads a PNG (GBitmap) and returns a grid of vec3(x, y, z) where z = average brightness 0-1 (sign inverted by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:323
---@param path string path of the PNG
---@param scale any unused
---@param invertColors boolean|nil if true, positive z instead of negative
---@return table  height grid
function flowgraph_nodes_environment_planet_C:heightmapFromPNG(path, scale, invertColors) end

--- Enables showDebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:32
function flowgraph_nodes_environment_planet_C:init() end

--- Normal (positive z) of triangle p1, p3, p2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:289
---@param p1 table center point
---@param p3 table second neighbor
---@param p2 table first neighbor
---@return vec3  normalized normal
function flowgraph_nodes_environment_planet_C:normalFromPoints(p1, p3, p2) end

--- Removes the vehicle's planets (obj:setPlanets({})) and deletes the created ProceduralMesh objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:41
function flowgraph_nodes_environment_planet_C:onNodeReset() end

--- Creates an unsaved ProceduralMesh in MissionGroup with the given mesh, position and rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:301
---@param name string|nil object name
---@param mesh table mesh
---@param pos vec3|nil position
---@param rot quat|nil rotation
---@return userdata  ProceduralMesh object
function flowgraph_nodes_environment_planet_C:placeObject(name, mesh, pos, rot) end

--- Deforms a flat grid into a spherical cap (angular method, unused by workOnce).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:247
---@param sphereRadius number radius
---@param heightmap table grid of points
---@param surfaceHeight number unused
---@return table  deformed grid
function flowgraph_nodes_environment_planet_C:warpSphere(sphereRadius, heightmap, surfaceHeight) end

--- Projects a cube face onto a sphere of given radius, with relief = z * surfaceHeight.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:264
---@param sphereRadius number radius
---@param heightmap table cube face with border
---@param cLength number recomputed in the function
---@param surfaceHeight number relief scale
---@return table  projected points with r
function flowgraph_nodes_environment_planet_C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight) end

--- Applies planetary gravity to the vehicle, creates the material, loads the height map, generates the six faces of the planet and reloads collisions (be:reloadCollision).
---Source: lua/ge/extensions/flowgraph/nodes/environment/planet.lua:57
function flowgraph_nodes_environment_planet_C:workOnce() end

