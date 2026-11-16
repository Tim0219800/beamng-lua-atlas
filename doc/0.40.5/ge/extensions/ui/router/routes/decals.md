# `ui_router_routes_decals`

*File: `lua/ge/extensions/ui/router/routes/decals.lua` · VM: Game Engine (GE) · 145 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_decals`: `extensions.load("ui_router_routes_decals")`, then the global `ui_router_routes_decals`

Route subtree of the livery decal editor (included by liveries.edit.decals). Add flow: decals -> camera (view choice) -> selector (decal grid) -> transform -> settings; separate branches for material, mirror and transform of an already selected decal. The hooks point to ui_liveries_routeLifecycleCallbacks.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- The screenId starts with "liveries.edit.decals" so that the preparation and cleanup of ui_liveries_decal remain valid across the whole branch (code comment).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | camera (> selector > transform > settings), material, mirror, transform (> settings), each with a backTarget to the previous level. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "liveries.edit.decals", title = "ui.liveries.edit.decals", backTarget = "liveries.edit", targetScope = "layers-manager", scopeTree (liveries-decals-hidden, layers-manager), onEnter onDecalsEnter, onMount onDecalsMount, onLeave onDecalsLeave} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/decals.lua`.*
