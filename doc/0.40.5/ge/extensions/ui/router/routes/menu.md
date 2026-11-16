# `ui_router_routes_menu`

*File: `lua/ge/extensions/ui/router/routes/menu.lua` · VM: Game Engine (GE) · 791 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_menu`: `extensions.load("ui_router_routes_menu")`, then the global `ui_router_routes_menu`

Main menu routes (Vue): game selectors (freeroam, quickrace, lightrunner, bus, scenarios, experiences, rally), levels, vehicles and configuration (vehicleconfig, partpacks), options (audio, camera, controls, display, gameplay, graphics, language, others, interface), mods, discover, replay, credits, version info, UI sounds. Several subtrees are mounted via `include` (mods, freeroamLevels, quickraceWizard, lightrunnerWizard, busRouteWizard, multiplayer). The root's back goes through `mainmenuExitHandler`.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- `replayBackTarget` is computed when the file loads: "menu" if Engine.UI.isSimpleMenu(), otherwise "menu.others" (replays are in "More" outside the simple menu).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | Among others: bigmapMenu, campaigns, dragRaceOverview, careerPause, freeroamconfigurator, freeroamselector, quickraceWizard, lightrunnerWizard, busRouteWizard, environment, discover (> details, multiseat), gameplay, rallySelector, experiencesSelector, photomode, rally, levels, levelDetails, others, credits, modsDetails (Angular), options (abstract), release-info, replay, scenarios, threeElementSelect, uiSounds, vehicleconfig, vehicles, vehiclesdetails, vehiclesnew. |
| `Root` | table | {screenId = "menu", title = "ui.common.menu", scopeTree root, back = handler mainmenuExitHandler, ui = Vue only} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/menu.lua`.*
