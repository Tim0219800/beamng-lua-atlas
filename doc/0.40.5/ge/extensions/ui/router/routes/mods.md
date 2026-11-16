# `ui_router_routes_mods`

*File: `lua/ge/extensions/ui/router/routes/mods.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_mods`: `extensions.load("ui_router_routes_mods")`, then the global `ui_router_routes_mods`

Mod manager routes (legacy Angular interface): local, downloaded, scheduled, repository, automation, automationDetails, details, all with a "menu.mods.*" screenId. Abstract module included by menu.lua and pause.lua (pause adds the pause hooks there).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- The code comment explains that forcing uiTypes = angular prevents the router from waiting for a Vue mount acknowledgment that never comes (otherwise the transition expires and clears the back data).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | local, downloaded, scheduled, repository, automation, automationDetails, details. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "menu.mods", abstract = true, ui = Angular only} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/mods.lua`.*
