# `flowgraph_nodes_gameplay_race_raceRecoveryUsed`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Recovery Used" (category logic, tag scenario). Signals when a vehicle has used a recovery in the race (events.recovered). Outputs: flow, impulse (pulse), recoveriesUsed (total number of recoveries of the vehicle) and recoveredTo (recovery point used, nil otherwise).

## Notes

- The flow pin is never reset to false by this node once it has become true (only impulse is reset to false every frame).
- work() indexes race.states[vehId] without an existence check.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Reads the vehicle's events and fills flow, impulse, recoveredTo and recoveriesUsed. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryUsed.lua`.*
