# `ui_apps_minimap_layers`

*File: `lua/ge/extensions/ui/apps/minimap/layers.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_layers`: `extensions.load("ui_apps_minimap_layers")`, then the global `ui_apps_minimap_layers`

Numeric constants for the minimap's drawing layers. Layers are rendered from the lowest (0) to the highest: background, grid, roads, route, gameplay markers, vehicles, round/square mask, compass, pointers, debug. This is not a loadable extension: the minimap modules read it with require("ui/apps/minimap/layers").

## Fields

| Field | Type | Description |
|---|---|---|
| `BACKGROUND` | integer | 0: background (very bottom). |
| `BG_GRID` | integer | 10: background grid. |
| `COMPASS` | integer | 120: compass. |
| `DEBUG` | integer | 150: debug layer (very top). |
| `GAMEPLAY_MARKERS` | integer | 60: gameplay markers. |
| `GAMEPLAY_POINTER` | integer | 140: gameplay pointer. |
| `ROADS_BG` | integer | 20: road outline. |
| `ROADS_FG` | integer | 30: road stroke. |
| `ROUND_OR_SQUARE_MASK` | integer | 110: occlusion mask (round or square frame). |
| `ROUTE_BG` | integer | 40: route outline. |
| `ROUTE_FG` | integer | 50: route stroke. |
| `ROUTE_POINTER` | integer | 130: pointer to the destination. |
| `VEHICLES_OTHER` | integer | 70: other vehicles. |
| `VEHICLES_POLICE` | integer | 80: police vehicles. |
| `VEHICLES_USABLE` | integer | 90: usable vehicles. |
| `VEHICLE_PLAYER` | integer | 100: player vehicle. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/layers.lua`.*
