# `ui_router_routes_taxi`

*File: `lua/ge/extensions/ui/router/routes/taxi.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_taxi`: `extensions.load("ui_router_routes_taxi")`, then the global `ui_router_routes_taxi`

Taxi mode route (Vue): "taxi" screen, onEnter hook gameplay_taxi.onTaxiViewEnter, bars and uiApps hidden. No children.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Empty table. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "taxi", onEnter = "gameplay_taxi.onTaxiViewEnter", Vue only, infoBar/topBar/uiApps hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/taxi.lua`.*
