---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/route.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Draws the navigation route (core_groundMarkers.routePlanner.path) and the destination pointer on the minimap. The route is a blue stroke on a white outline that gets lighter near the current position (blend over 75 m). Other extensions can replace the route via the hook onMinimapRouteOverride. Utility module of the minimap, loaded by require.
--- Access: extension `ui_apps_minimap_route`: `extensions.load("ui_apps_minimap_route")`, then the global `ui_apps_minimap_route`
---@class ui_apps_minimap_route
ui_apps_minimap_route = {}

--- Draws the route: the replacement routes if an extension supplies any via onMinimapRouteOverride, otherwise the routePlanner's path.
---Source: lua/ge/extensions/ui/apps/minimap/route.lua:67
---@param td table Minimap drawing object (lineRoundEndWithBackground).
---@param dpi number|nil Screen scale factor, 1 by default.
---@param camPos vec3|nil Camera position for culling.
---@param cullRadius number|nil Half-side of the culling square, in meters; without it, no culling.
function ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius) end

--- Draws a circular pointer on the last point of the route (the destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer; does nothing if there is no route.
---Source: lua/ge/extensions/ui/apps/minimap/route.lua:83
---@param td table Drawing object (not used directly).
function ui_apps_minimap_route.drawRoutePointer(td) end

