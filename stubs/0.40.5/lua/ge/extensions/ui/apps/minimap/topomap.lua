---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/topomap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Topographic map of the minimap. Computes the level bounds from the navgraph nodes (`map.getMap()`), samples the terrain height on a grid (one measurement every 5 m, via `core_terrain.getTerrainHeight`), generates contour lines with the marching squares algorithm, stores them in a spatial tree (`kdtreebox2d`) and can draw them onto the minimap texture. The data is cleared at the start and end of a mission.
--- Access: extension `ui_apps_minimap_topomap`: `extensions.load("ui_apps_minimap_topomap")`, then the global `ui_apps_minimap_topomap`
---@class ui_apps_minimap_topomap
ui_apps_minimap_topomap = {}

--- Draws the contour lines near the camera onto the minimap texture, in the BACKGROUND layer. Gray, lighter the higher the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:385
---@param td table Texture drawing object (TextureDrawPrimitive) of the minimap.
---@param width number Minimap width (unused here).
---@param height number Minimap height (unused here).
---@param scale number Minimap scale in px/m; the query radius is 200 * scale.
---@param camPos vec3 Camera position in the world.
---@param worldToMapXYZ function Unused (the transform is reread from ui_apps_minimap_utils).
function ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ) end

--- Returns the `kdtreebox2d` spatial tree indexing the contour segments, or nil if not generated.
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:415
---@return table|nil  Spatial tree of the segments.
function ui_apps_minimap_topomap.getContourQuadtree() end

--- Returns the list of contour line segments. Each segment is `{level, x1, y1, x2, y2}` (inferred from drawContours).
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:414
---@return table<integer, table>  Contour segments.
function ui_apps_minimap_topomap.getContourSegments() end

--- Returns the heightmap's world bounds.
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:413
---@return table  `{minX, maxX, minY, maxY}` in meters (all 0 before loading).
function ui_apps_minimap_topomap.getHeightmapBounds() end

--- Returns the height grid table (fields `data`, `gridWidth`, `gridHeight` used by the code; empty before loading).
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:412
---@return table  Heightmap data.
function ui_apps_minimap_topomap.getHeightmapData() end

--- Indicates whether the topographic map is loaded.
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:411
---@return boolean  true once loadTopoMap has succeeded, reset to false at each mission start/end.
function ui_apps_minimap_topomap.isLoaded() end

--- Loads the topographic map: navgraph bounds, terrain height grid, then contour lines and spatial tree. No effect (returns true) if already loaded.
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:357
---@return boolean  true if the map is loaded, false if a step failed.
function ui_apps_minimap_topomap.loadTopoMap() end

--- Hook called at the end of a mission/level. Resets the heightmap, the bounds and the contours and marks the map as not loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:418
function ui_apps_minimap_topomap.onClientEndMission() end

--- Hook called at the start of a mission/level. Same reset as onClientEndMission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/topomap.lua:426
function ui_apps_minimap_topomap.onClientStartMission() end

