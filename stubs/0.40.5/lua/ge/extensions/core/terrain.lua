---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/terrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simplified access to the first TerrainBlock of the scene: terrain height and normal at a point. A modder uses it to place objects on the ground or orient an element along the slope. The block found is cached by its id.
--- Access: extension `core_terrain`: `extensions.load("core_terrain")`, then the global `core_terrain`
---@class core_terrain
core_terrain = {}

--- Returns the TerrainBlock object (cached by id, otherwise the first result of scenetree.findClassObjects("TerrainBlock")).
---Source: lua/ge/extensions/core/terrain.lua:9
---@return userdata|nil  TerrainBlock object or nil.
function core_terrain.getTerrain() end

--- Returns the terrain height at the given point (terrain:getHeight).
---Source: lua/ge/extensions/core/terrain.lua:21
---@param point vec3 World position; only x and y matter (inferred from code).
---@return number|nil  Altitude, nil without terrain.
function core_terrain.getTerrainHeight(point) end

--- Returns the terrain normal at the point (terrain:getNormal(point, true, true)).
---Source: lua/ge/extensions/core/terrain.lua:28
---@param point vec3 World position.
---@return vec3|nil  Normal, nil without terrain.
function core_terrain.getTerrainNormal(point) end

--- Returns the smoothed terrain normal at the point (terrain:getSmoothNormal(point, true, true)).
---Source: lua/ge/extensions/core/terrain.lua:35
---@param point vec3 World position.
---@return vec3|nil  Smoothed normal, nil without terrain.
function core_terrain.getTerrainSmoothNormal(point) end

