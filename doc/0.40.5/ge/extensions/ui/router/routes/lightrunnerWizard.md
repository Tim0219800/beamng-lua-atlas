# `ui_router_routes_lightrunnerWizard`

*File: `lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_lightrunnerWizard`: `extensions.load("ui_router_routes_lightrunnerWizard")`, then the global `ui_router_routes_lightrunnerWizard`

Vue wizard for configuring LightRunner mode (port of the old Angular lightrunner module). Same structure as quickraceWizard, oneshotRaceCore.lua backend, configurator lightrunner_lightrunnerConfigurator. Children: level (> middle, title "ui.quickrace.quickraceTracks"), vehicle.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- The title of level reuses the key "ui.busRoute.levelSelect" to avoid a new localization entry (code comment).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (onWizardLevelRouteEnter; minor sub-route middle -> onWizardMiddleRouteEnter), vehicle (onWizardVehicleRouteEnter); grid selector scopeTree. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "lightrunnerWizard", title = "ui.playmodes.lightRunner", onEnter = "lightrunner_lightrunnerConfigurator.onWizardRouteEnter", Vue only, bars hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua`.*
