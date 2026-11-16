# `ui_router_routes_freeroamWizard`

*File: `lua/ge/extensions/ui/router/routes/freeroamWizard.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_freeroamWizard`: `extensions.load("ui_router_routes_freeroamWizard")`, then the global `ui_router_routes_freeroamWizard`

"Wizard" variant of the freeroam wizard: same flow as freeroamLevels (levels > level, vehicles > vehicle, options, multiplayer) but under the freeroamWizard root (title ui.menu.freeroamSelector.title). The hooks call freeroam_freeroamConfigurator.onWizard*.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- No "freeroamWizard" module is listed in routes.lua: it is included only if another module includes it (the original freeroam entries are in menu.lua and pause.lua).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | levels (> level), vehicles (> vehicle), options, multiplayer; dynamic titles via resolveSelectedLevelTitle / resolveSelectedVehicleTitle. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {title = "ui.menu.freeroamSelector.title", ui = Vue only, default infoBar, topBar and uiApps hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/freeroamWizard.lua`.*
