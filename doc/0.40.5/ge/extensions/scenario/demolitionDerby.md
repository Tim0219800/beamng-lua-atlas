# `scenario_demolitionDerby`

*File: `lua/ge/extensions/scenario/demolitionDerby.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_demolitionDerby`: `extensions.load("scenario_demolitionDerby")`, then the global `scenario_demolitionDerby`

Demolition-type scenario extension: it declares as winner the last vehicle still moving. Every second, it compares each scenario vehicle's position to its last known position; a vehicle that moves 1 m or less for more than 15 seconds is considered stopped.

## Notes

- Only one vehicle must be moving and all the others must have exceeded 15 stopped ticks for scenario_scenarios.finish to be called with the message '<name> WINS!!!' (hard-coded text, not translated).
- The movement test is done about once per second (dt accumulation in onPreRender), threshold distance 1 m.
- The extension does nothing if the scenario is not in the 'running' state. The vehicle list is rebuilt on every onScenarioChange when scenario.state == 'running'.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_demolitionDerby.onPreRender(dt)` | Hook called before rendering each frame. Every second, detects stationary vehicles and ends the scenario if only one vehicle is left moving. *(internal)* *(hook)* | 40 |
| `scenario_demolitionDerby.onScenarioChange(sc)` | Hook called by scenario_scenarios on every scenario state change. When the scenario goes to 'running', resets the tracking and registers each scenario.vehicles vehicle found in the scenetree. Without a scenario, resets everything to zero. *(internal)* *(hook)* | 21 |

### Parameter details

#### `scenario_demolitionDerby.onPreRender(dt)`

Hook called before rendering each frame. Every second, detects stationary vehicles and ends the scenario if only one vehicle is left moving.

- `dt` (*number*) : Frame duration in seconds.

#### `scenario_demolitionDerby.onScenarioChange(sc)`

Hook called by scenario_scenarios on every scenario state change. When the scenario goes to 'running', resets the tracking and registers each scenario.vehicles vehicle found in the scenetree. Without a scenario, resets everything to zero.

- `sc` (*any*) : Argument passed by the hook, unused (the scenario is re-read via scenario_scenarios.getScenario()).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/demolitionDerby.lua`.*
