# `ui_router_routes_default`

*File: `lua/ge/extensions/ui/router/routes/default.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_default`: `extensions.load("ui_router_routes_default")`, then the global `ui_router_routes_default`

Default, abstract routes module that defines the `ui` configuration of base screens: mapview (Angular), options (Vue, default infoBar), play (Angular, visible uiApps) and radial (Vue).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | mapview, options, play, radial: each defines only its `ui` block (uiTypes, uiTypesFilter = only, infoBar, topBar, uiApps). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {abstract = true} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/default.lua`.*
