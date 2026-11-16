# `ui_router_routes_liveries`

*File: `lua/ge/extensions/ui/router/routes/liveries.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_liveries`: `extensions.load("ui_router_routes_liveries")`, then the global `ui_router_routes_liveries`

Livery editor routes (Vue): list (liveries), edit (liveries.edit), paint (liveries.edit.paint) and decals (includes the decals module). Hooks: ui_liveries_routeLifecycleCallbacks.onLiveriesEnter / onLiveriesEditEnter / onLiveriesPaintEnter / onLiveriesLeave / onLiveriesRootLeave.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | edit (backTarget liveries; children paint and decals = include of the decals module). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "liveries", title = "ui.liveries.title", Vue only, default infoBar, topBar hidden, onEnter onLiveriesEnter, onLeave onLiveriesRootLeave} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/liveries.lua`.*
