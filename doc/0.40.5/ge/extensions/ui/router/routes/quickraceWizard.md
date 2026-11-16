# `ui_router_routes_quickraceWizard`

*File: `lua/ge/extensions/ui/router/routes/quickraceWizard.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_quickraceWizard`: `extensions.load("ui_router_routes_quickraceWizard")`, then the global `ui_router_routes_quickraceWizard`

Vue wizard for quick race (port of the old Angular quickrace module, separate from "menu.quickrace" so both can coexist behind a flag). The root is the overview/options screen; level (> middle = track choice) and vehicle are steps that return to the root. Configurator: quickrace_quickraceConfigurator; shared backend oneshotRaceCore.lua.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | level (onWizardLevelRouteEnter, title ui.quickrace.quickraceLevels; minor sub-route middle -> onWizardMiddleRouteEnter, title ui.quickrace.quickraceTracks), vehicle (onWizardVehicleRouteEnter); grid selector scopeTree. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "quickraceWizard", title = "ui.playmodes.quickrace", onEnter = "quickrace_quickraceConfigurator.onWizardRouteEnter", Vue only, bars hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/quickraceWizard.lua`.*
