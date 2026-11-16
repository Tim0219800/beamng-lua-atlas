# `ui_router_routes_trackBuilder`

*File: `lua/ge/extensions/ui/router/routes/trackBuilder.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_trackBuilder`: `extensions.load("ui_router_routes_trackBuilder")`, then the global `ui_router_routes_trackBuilder`

Track builder route (Vue): "trackBuilder" screen (title ui.playmodes.trackBuilder), exit via rootExit, UI navigation disabled, hooks trackbuilder_trackBuilder.onRouteEnter and onRouteLeave. No children.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Empty table. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "trackBuilder", back = rootExit, scopeTree track-builder-root, onEnter/onLeave trackbuilder_trackBuilder, ui = {uiNav = false, Vue only, bars hidden, uiApps hidden}} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/trackBuilder.lua`.*
