---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/layers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Numeric constants for the minimap's drawing layers. Layers are rendered from the lowest (0) to the highest: background, grid, roads, route, gameplay markers, vehicles, round/square mask, compass, pointers, debug. This is not a loadable extension: the minimap modules read it with require("ui/apps/minimap/layers").
--- Access: extension `ui_apps_minimap_layers`: `extensions.load("ui_apps_minimap_layers")`, then the global `ui_apps_minimap_layers`
---@class ui_apps_minimap_layers
---@field BACKGROUND integer 0: background (very bottom).
---@field BG_GRID integer 10: background grid.
---@field COMPASS integer 120: compass.
---@field DEBUG integer 150: debug layer (very top).
---@field GAMEPLAY_MARKERS integer 60: gameplay markers.
---@field GAMEPLAY_POINTER integer 140: gameplay pointer.
---@field ROADS_BG integer 20: road outline.
---@field ROADS_FG integer 30: road stroke.
---@field ROUND_OR_SQUARE_MASK integer 110: occlusion mask (round or square frame).
---@field ROUTE_BG integer 40: route outline.
---@field ROUTE_FG integer 50: route stroke.
---@field ROUTE_POINTER integer 130: pointer to the destination.
---@field VEHICLES_OTHER integer 70: other vehicles.
---@field VEHICLES_POLICE integer 80: police vehicles.
---@field VEHICLES_USABLE integer 90: usable vehicles.
---@field VEHICLE_PLAYER integer 100: player vehicle.
ui_apps_minimap_layers = {}

