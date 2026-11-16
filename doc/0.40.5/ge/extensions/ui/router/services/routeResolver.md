# `ui_router_services_routeResolver`

*File: `lua/ge/extensions/ui/router/services/routeResolver.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_services_routeResolver`: `extensions.load("ui_router_services_routeResolver")`, then the global `ui_router_services_routeResolver`

DEPRECATED UI router service: the main flow now builds NavigationEntries directly with ResolvedRoute.createEntry(). This module remains for possible external callers: it resolves a route name into a resolved table and compares two routes.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_services_routeResolver.isEqualRoutes(routeA, routeB)` | Compares two routes: same `name` and same `params` (value-by-value comparison, non-recursive). | 42 |
| `ui_router_services_routeResolver.resolve(routeName, params, currentRoute)` | Resolves a route name (possibly relative, resolved with utils.resolveRelativeRoute if a current route is provided) into a resolved route via routeManager.getRoute then ResolvedRoute.createResolved. Returns nil with a warning if the route is not found or creation fails. Deprecated. | 15 |

### Parameter details

#### `ui_router_services_routeResolver.isEqualRoutes(routeA, routeB)`

Compares two routes: same `name` and same `params` (value-by-value comparison, non-recursive).

- `routeA` (*table*) : First route.
- `routeB` (*table*) : Second route.
- **returns**: boolean true if identical; false if either is nil.

#### `ui_router_services_routeResolver.resolve(routeName, params, currentRoute)`

Resolves a route name (possibly relative, resolved with utils.resolveRelativeRoute if a current route is provided) into a resolved route via routeManager.getRoute then ResolvedRoute.createResolved. Returns nil with a warning if the route is not found or creation fails. Deprecated.

- `routeName` (*string*) : Name of the road.
- `params` (*table|nil*) : Query parameters.
- `currentRoute` (*table|nil*) : Current route (for relative names).
- **returns**: table|nil Resolved route.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/services/routeResolver.lua`.*
