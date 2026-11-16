# `ui_router_routes_freeroamLevels`

*File: `lua/ge/extensions/ui/router/routes/freeroamLevels.lua` · VM: Game Engine (GE) · 119 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_freeroamLevels`: `extensions.load("ui_router_routes_freeroamLevels")`, then the global `ui_router_routes_freeroamLevels`

Vue wizard to choose level/vehicle/options for freeroam mode, "level grid" root version. The hooks call freeroam_freeroamConfigurator.onWizard*. Children: level (detail, minor sub-route), vehicles (> vehicle, options > multiplayer).

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- `isMinorRoute = true` marks detail sub-routes (they do not count as a main step, inferred from the name).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (dynamic title via resolveSelectedLevelTitle), vehicles (> vehicle with dynamic title resolveSelectedVehicleTitle, > options > multiplayer). |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "freeroamLevels", title = "ui.menu.freeroamSelector.wizard.location", onEnter onWizardLevelsRouteEnter, onMount onWizardLevelsRouteMount, scopeTree root > (grid, auxillary), targetScope grid, ui Vue, default infoBar, uiApps hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/freeroamLevels.lua`.*
