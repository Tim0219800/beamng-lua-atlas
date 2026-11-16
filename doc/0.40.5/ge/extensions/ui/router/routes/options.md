# `ui_router_routes_options`

*File: `lua/ge/extensions/ui/router/routes/options.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_options`: `extensions.load("ui_router_routes_options")`, then the global `ui_router_routes_options`

Options routes (Vue): "options" root (fallback to menu via fallbackTarget) with infoBar without system info, and child category (screenId pause.options.category, topBar hidden). The detailed options screens are in menu.options.* and pause.options.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | category. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "options", title = "Options", fallbackTarget = "menu", ui = Vue only, infoBar visible without system info, topBar hidden, uiApps hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/options.lua`.*
