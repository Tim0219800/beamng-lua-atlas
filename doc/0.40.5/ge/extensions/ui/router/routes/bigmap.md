# `ui_router_routes_bigmap`

*File: `lua/ge/extensions/ui/router/routes/bigmap.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_bigmap`: `extensions.load("ui_router_routes_bigmap")`, then the global `ui_router_routes_bigmap`

Big map routes (Vue): "bigmap" screen (title Map) with a bigmapMenu sub-route. Gamepad navigation scope tree: bigmap-layout contains bigmap-camera and bigmap-main, which contains bigmap-details. Included by other modules (e.g. pause.bigmap).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Child "bigmapMenu" (screenId bigmap.bigmapMenu, Vue). |
| `Root` | table | {screenId = "bigmap", title = "Map", targetScope = "bigmap-main", scopeTree = bigmap-layout > (bigmap-camera, bigmap-main > bigmap-details), ui = Vue only, default infoBar, hidden topBar, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/bigmap.lua`.*
