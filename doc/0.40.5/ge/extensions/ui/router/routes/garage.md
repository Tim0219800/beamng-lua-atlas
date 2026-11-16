# `ui_router_routes_garage`

*File: `lua/ge/extensions/ui/router/routes/garage.lua` · VM: Game Engine (GE) · 308 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_garage`: `extensions.load("ui_router_routes_garage")`, then the global `ui_router_routes_garage`

Garage routes (Vue): overview, vehicle (selector, tuning and mirrors, paint, parts, configuration save), vehicle list, "mycars", photo mode and overlay editing. Root hook: gameplay_garageMode.onGarageEnter. Dynamic vehicle titles via gameplay_garageMode.vehicleByIdOrActive.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- The vehicles/mycars routes use the same screenId "garage.vehicles"; their hooks are ui_vehicleSelector_general.onRootRoute* and ui_garage_routeLifecycleCallbacks.onPhotomode* for photo mode.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | vehicle (abstract; selector, tuning > mirrors, paint, parts, save), vehicles (> vehicle), mycars (> vehicle), photomode (exitGuards confirmPhotomodeExit; > overlay > edit > adjust). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "garage", title = "Garage", scopeTree garage-layout > garage-sidemenu, ui = Vue, infoBar visible without system info, topBar and uiApps hidden, onEnter = gameplay_garageMode.onGarageEnter} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/garage.lua`.*
