# `ui_apps_minimap_route`

*File: `lua/ge/extensions/ui/apps/minimap/route.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_route`: `extensions.load("ui_apps_minimap_route")`, then the global `ui_apps_minimap_route`

Draws the navigation route (core_groundMarkers.routePlanner.path) and the destination pointer on the minimap. The route is a blue stroke on a white outline that gets lighter near the current position (blend over 75 m). Other extensions can replace the route via the hook onMinimapRouteOverride. Utility module of the minimap, loaded by require.

## Notes

- The route is truncated to 3000 points (routeMaxLength).
- onMinimapRouteOverride(routes): each extension can add routes (lists of points with pos and distToTarget) to the supplied table; if it is not empty, it replaces the normal route.
- Segments outside the square camPos ± cullRadius are ignored.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius)` | Draws the route: the replacement routes if an extension supplies any via onMinimapRouteOverride, otherwise the routePlanner's path. | 67 |
| `ui_apps_minimap_route.drawRoutePointer(td)` | Draws a circular pointer on the last point of the route (the destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer; does nothing if there is no route. | 83 |

### Parameter details

#### `ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius)`

Draws the route: the replacement routes if an extension supplies any via onMinimapRouteOverride, otherwise the routePlanner's path.

- `td` (*table*) : Minimap drawing object (lineRoundEndWithBackground).
- `dpi` (*number|nil*) : Screen scale factor, 1 by default.
- `camPos` (*vec3|nil*) : Camera position for culling.
- `cullRadius` (*number|nil*) : Half-side of the culling square, in meters; without it, no culling.

#### `ui_apps_minimap_route.drawRoutePointer(td)`

Draws a circular pointer on the last point of the route (the destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer; does nothing if there is no route.

- `td` (*table*) : Drawing object (not used directly).

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMinimapRouteOverride`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/route.lua`.*
