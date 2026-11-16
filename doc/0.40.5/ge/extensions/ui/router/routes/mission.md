# `ui_router_routes_mission`

*File: `lua/ge/extensions/ui/router/routes/mission.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_mission`: `extensions.load("ui_router_routes_mission")`, then the global `ui_router_routes_mission`

Mission routes (Vue, abstract): details (back via missionDetailsExitHandler), mission control (back pause; grid vehicle selector with gridSelector backendName vehicleSelector), grid, drag history and rules, AI competitors leaderboard.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | details, control (> vehicleSelector with hooks ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter/Mount/Leave and meta.gridSelector {backendName, routePath = "/mission-vehicle-selector", defaultPath}), grid, dragHistory, dragRules, aiCompetitorsLeaderboardTable. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "mission", abstract = true, ui = Vue only, default infoBar, topBar hidden, default uiApps} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/mission.lua`.*
