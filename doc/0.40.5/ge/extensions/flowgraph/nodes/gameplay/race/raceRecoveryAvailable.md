# `flowgraph_nodes_gameplay_race_raceRecoveryAvailable`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Recovery Available" (category logic). Tests whether a vehicle has a recovery point (race:hasRecoveryPosition(vehId)). Flow outputs 'true' (recovery available) and 'false' (otherwise).

## Notes

- The code assigns C.tags twice; the second (empty table) overwrites {'scenario'}.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Updates the 'true' and 'false' outputs according to hasRecoveryPosition. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable.lua`.*
