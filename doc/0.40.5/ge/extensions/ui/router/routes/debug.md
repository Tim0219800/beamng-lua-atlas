# `ui_router_routes_debug`

*File: `lua/ge/extensions/ui/router/routes/debug.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_debug`: `extensions.load("ui_router_routes_debug")`, then the global `ui_router_routes_debug`

UI debug routes (Vue, bars hidden, abstract module): demo components, UI apps test, bulk async loader, tutorial highlight (see ui_tutorialHighlight).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | components (scopeTree root > demo), ui-apps-test, asyncBulkLoader, tutorialHighlight. |
| `Root` | table | {abstract = true, ui = Vue, infoBar and topBar hidden, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/debug.lua`.*
