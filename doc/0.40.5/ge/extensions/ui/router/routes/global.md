# `ui_router_routes_global`

*File: `lua/ge/extensions/ui/router/routes/global.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_global`: `extensions.load("ui_router_routes_global")`, then the global `ui_router_routes_global`

Single-segment global routes (outside a module): onboarding, buttonLayout, play, /mainmenu. For a single-segment name, routeManager looks here first (global module designated by routes.lua: Global.include). "play" and "/mainmenu" have `back = {mode = "rootExit"}`.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- No M.Root in this file; routeManager therefore uses `mod.Root or {}`.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | onboarding (backTarget menu), buttonLayout (default infoBar), play (screenId play, Vue, uiNav = false, uiApps visible), /mainmenu (screenId menu, uiApps hidden). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/global.lua`.*
