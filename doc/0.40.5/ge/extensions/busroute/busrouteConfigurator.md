# `busroute_busrouteConfigurator`

*File: `lua/ge/extensions/busroute/busrouteConfigurator.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `busroute_busrouteConfigurator`: `extensions.load("busroute_busrouteConfigurator")`, then the global `busroute_busrouteConfigurator`

Backend of the "preview / options" step of the Bus Route View wizard. It describes the "busRoute" mode (descriptor) and passes it to oneshotRaceCore.createConfigurator, whose result is the exported module. Here the "middle" choice is a full scenario file (scenario_scenariosLoader.getLevels("bus")); the vehicle choice is limited to public transport buses (vehicleRestrictionMode = "busRoute"). The settings are: strictStop (strict stop, true by default) and traffic (traffic, false by default). Nothing is saved (in memory only).

## Notes

- On launch (start), the scenario is copied (deepcopy), busdriver.strictStop/traffic and userSelectedVehicle {model, config} are written into it, then scenario_scenariosLoader.start(routeFile) is called.
- The highscore key is always configKey = "busRoute": the original Angular code computed a real key then ignored it; the comment says it is kept as is.
- The descriptor functions (defaultSettings, onSelectMiddle, buildLevelSummary, buildMiddleSummary, getHighscoreKey, start) are local and called by oneshotRaceCore; they are not exported.
- A level's size is displayed in the form "%d m x %d m" from levelInfo.size.

**Dependencies (loaded first):** `scenario_scenariosLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_busRouteSelector_general`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded beforehand: scenario_scenariosLoader, core_highscores, ui_vehicleSelector_general, ui_busRouteSelector_general. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/busroute/busrouteConfigurator.lua`.*
