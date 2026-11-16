# `flowgraph_nodes_gameplay_race_raceDisqualify`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceDisqualify.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceDisqualify")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Disqualify" (category repeat_instant, tag scenario). Disqualifies a vehicle from a race by calling raceData:abortRace(vehId). Inputs: raceData and vehId.

## Notes

- work() has no guard: an empty raceData pin causes a Lua error.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 22 |
| `C:work()` | Calls abortRace(vehId) on the received race. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceDisqualify.lua`.*
