# `ui_router_routes_busRouteWizard`

*File: `lua/ge/extensions/ui/router/routes/busRouteWizard.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_busRouteWizard`: `extensions.load("ui_router_routes_busRouteWizard")`, then the global `ui_router_routes_busRouteWizard`

Vue wizard for configuring a bus route (port of the old Angular busRoute module, kept next to "menu.busRoutes" behind a feature flag). Same structure as quickraceWizard; shares the oneshotRaceCore.lua backend and differs only by the Lua configurator (busroute_busrouteConfigurator). Root = welcome screen, children = choice of level (with "middle" sub-step = choice of the route) and of vehicle.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- The onEnter hooks are "extension.function" strings called by the router on entering the route.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Children: level (onEnter onWizardLevelRouteEnter, minor sub-route level.middle -> onWizardMiddleRouteEnter) and vehicle (onWizardVehicleRouteEnter). They use a grid selector scopeTree (grid-selector-grid / grid-selector-details with back to the grid). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "busRouteWizard", title = "ui.playmodes.bus", onEnter = "busroute_busrouteConfigurator.onWizardRouteEnter", root scopeTree, Vue only, infoBar and topBar hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/busRouteWizard.lua`.*
