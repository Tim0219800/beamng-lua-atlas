# `ui_router_routes_radial`

*File: `lua/ge/extensions/ui/router/routes/radial.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_radial`: `extensions.load("ui_router_routes_radial")`, then the global `ui_router_routes_radial`

Radial menu routes (Vue). The "radial" root calls core_quickAccess.endRouteHandoff on entry (ends the current route handoff, shows the menu again) and has a back handled by `radialBackHandler`. Child: mirrors (mirror adjustment, back to radial).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | mirrors (screenId radial.mirrors, title ui.mirrors.name, backTarget radial). |
| `Root` | table | {screenId = "radial", onEnter = "core_quickAccess.endRouteHandoff", back = handler radialBackHandler, ui = Vue, default infoBar, topBar hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/radial.lua`.*
