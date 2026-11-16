# `scenario_raceDebug`

*File: `lua/ge/extensions/scenario/raceDebug.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_raceDebug`: `extensions.load("scenario_raceDebug")`, then the global `scenario_raceDebug`

Visual debugging aid for scenario races: computes the path between the lapConfig waypoints (map.getPath) and draws it with debugDrawer (red spheres at waypoints, green prisms along the road, red when the segment is direct). Only active if the editor is enabled and the BeamNGRaceDrawDebug setting is true.

## Notes

- In onScenarioChange, the variable lastwp is not declared local: it is a global shared between calls and never reset.
- The debugPath and debugNodes data are only used for drawing; the code comment forbids using them for anything else.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_raceDebug.onDrawDebug(focusPos)` | Debug draw hook called every frame: draws the waypoints (sphere of radius n.radius and label 'wp i/N') and the computed path. *(internal)* *(hook)* | 46 |
| `scenario_raceDebug.onScenarioChange(scenario)` | Hook called on every scenario state change. If the scenario is 'running' and has lapConfig, fills currentScenario.debugPath (road nodes) and currentScenario.debugNodes. *(internal)* *(hook)* | 7 |

### Parameter details

#### `scenario_raceDebug.onDrawDebug(focusPos)`

Debug draw hook called every frame: draws the waypoints (sphere of radius n.radius and label 'wp i/N') and the computed path.

- `focusPos` (*vec3*) : Camera focus position (unused).

#### `scenario_raceDebug.onScenarioChange(scenario)`

Hook called on every scenario state change. If the scenario is 'running' and has lapConfig, fills currentScenario.debugPath (road nodes) and currentScenario.debugNodes.

- `scenario` (*table*) : Scenario (unused, the current scenario is re-read).

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/raceDebug.lua`.*
