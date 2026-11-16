# `flowgraph_nodes_gameplay_race_raceAiParameters`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceAiParameters")` (file under extensions/ but not a regular extension)

Flowgraph node "Race AI Parameters" (category once_instant, tags ai and race, author BeamNG). Sets once the driving parameters of all AI vehicles (not controlled by a player) listed in raceData.states, via veh:queueLuaCommand to the vehicle's ai module: ai.setAggression, ai.setParameters (edgeDist, turnForceCoef, awarenessForceCoef), ai.setRacing(true), then, if the pins are set, ai.setAvoidCars, ai.setAggressionMode (rubberBand/off) and driveStyle (offRoad/default). Inputs: raceData (must be active with all vehicle states), aggression, racerSkill, randomizationScale, avoidCollisions, rubberband, offroad.

## Notes

- Default values: aggression 0.9 (clamped 0.25 to 2), racerSkill 1 (clamped 0 to 1), randomizationScale 0 (clamped 0 to 2). Random noise is added to each value according to randomizationScale.
- Formulas derived from racerSkill: edgeDist = 1.5 - 1.5*skill (m, clamped 0 to 1.5), turnForceCoef = 4*skill^1.5, awarenessForceCoef = 0.25*skill^1.5.
- state.baseAggression receives the computed aggression, for later use.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:getRandomNumber(scale)` | Returns a uniform random number in [-scale, scale]. | 27 |
| `C:workOnce()` | Applies the AI parameters to each AI vehicle of the race (only once, on first flow). | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua`.*
