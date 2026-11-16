# `ui_router_routes_scenario`

*File: `lua/ge/extensions/ui/router/routes/scenario.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_scenario`: `extensions.load("ui_router_routes_scenario")`, then the global `ui_router_routes_scenario`

Scenario end and start routes (Vue, abstract module): start, end, quickrace.end and chapter.end. Each screen has an action scopeTree with backTarget to the root; conditional blocks (settings, progress, vehicle, rewards, stats, mission) are `optional = true` for the scope validator. Default back to pause.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | start, end, quickrace (abstract > end), chapter (abstract > end); screenId scenario.start / scenario.end / scenario.quickrace.end / scenario.chapter.end, all Vue with backTarget = "pause". |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {abstract = true, ui = filter only, infoBar and topBar hidden, uiApps visible} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/scenario.lua`.*
