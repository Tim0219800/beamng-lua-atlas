# `flowgraph_nodes_gameplay_race_raceData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceData.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceData")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Data" (category repeat_instant, tag scenario). Exposes race data for a vehicle (raceData.states[vehId]): formattedTime (time formatted via race:raceTime, computed only if the pin is used), recoveriesUsed, placement and isOnRoad (true as long as the vehicle is within the AI path limits; a single false tick is masked).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Every frame: reads the vehicle's state in the race and fills the four output pins. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceData.lua`.*
