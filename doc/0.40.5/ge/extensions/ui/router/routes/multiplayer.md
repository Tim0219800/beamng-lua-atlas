# `ui_router_routes_multiplayer`

*File: `lua/ge/extensions/ui/router/routes/multiplayer.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_multiplayer`: `extensions.load("ui_router_routes_multiplayer")`, then the global `ui_router_routes_multiplayer`

Multiplayer routes: host-options, settings and playerList (pause screens with ui_pause_routeLifecycleCallbacks hooks) and spectator (Vue, hooks multiplayer_gamemodes_utils_spectator.onSpectatorViewEnter/Leave). Included by menu.lua and pause.lua.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | host-options (screenId multiplayer.host-options), settings (screenId pause.multiplayer.settings), playerList (pause.multiplayer.playerList), spectator (uiApps visible, bars hidden). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {} (empty root) |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/multiplayer.lua`.*
