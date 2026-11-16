---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/roads.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Draws the roads of the navigation graph (map.getMap()) on the minimap. On the first call, it builds an array of segments (positions, color according to drivability) and a 2D kd-tree (kdtreebox2d); on later calls it queries the kd-tree around the camera and draws the visible segments with td:lineRoundEndWithBackground on the ROADS_BG/ROADS_FG layers. Utility module of the minimap, loaded by require, not an extension to call directly.
--- Access: extension `ui_apps_minimap_roads`: `extensions.load("ui_apps_minimap_roads")`, then the global `ui_apps_minimap_roads`
---@class ui_apps_minimap_roads
ui_apps_minimap_roads = {}

--- Builds the roads cache on the first call, then draws the roads visible in the square of side 2*radius centered on the camera.
---Source: lua/ge/extensions/ui/apps/minimap/roads.lua:15
---@param p table|nil Optional profiler (add method).
---@param radius number Half-side of the queried area, in world meters.
---@param td table Minimap drawing object (must provide lineRoundEndWithBackground).
---@param debugSettings table Debug settings; only drawGrid is read.
---@param camPos vec3 Camera position (x, y used).
---@param scale number Map scale; the line width is 2 / scale * dpi.
---@param dpi number|nil Screen scale factor, 1 by default.
function ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi) end

--- Clears the cache (kd-tree and hasRoads flag); it will be rebuilt at the next drawRoads.
---Source: lua/ge/extensions/ui/apps/minimap/roads.lua:95
function ui_apps_minimap_roads.reset() end

