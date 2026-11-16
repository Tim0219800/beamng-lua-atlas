# `flowgraph_nodes_gameplay_race_raceNodeReached`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceNodeReached.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/raceNodeReached")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Pathnode Reached" (category logic, tag scenario). Lets flow through when a vehicle reaches a pathnode of the race (events.pathnodeReached). Fixed outputs: flow and nodeName (name of the reached pathnode). The modder can add string or number output pins: their value is read from the pathnode's customFields (same name and same type).

## Notes

- When no pathnode is reached, flow is false and nodeName and the custom pins are nil.
- work() indexes race.states[vehId] without a check: a vehicle absent from the race causes an error.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty. | 41 |
| `C:init(mgr, ...)` | Enables allowCustomOutPins and savePins, data.detailed = false. | 35 |
| `C:work(args)` | Reads the vehicle's events and fills flow, nodeName and the custom pins. | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceNodeReached.lua`.*
