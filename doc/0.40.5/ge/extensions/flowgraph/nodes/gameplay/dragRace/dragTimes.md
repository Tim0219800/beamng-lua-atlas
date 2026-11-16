# `flowgraph_nodes_gameplay_dragRace_dragTimes`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/dragTimes")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Drag Race Times" (category repeat_instant). Gives in real time the timers of a vehicle (vehId pin) from gameplay_drag_dragBridge.getTimers. postInit dynamically creates, for each timer (reactionTime, dial, time_60, time_330, time_1_8, time_1000, time_1_4, velAt_1_8, velAt_1_4), a number output pin and a flow_<id> pin (pulse when the timer is recorded). Fixed output: timer.

## Notes

- The timer distances are in meters (60 ft = 18.288, 1/4 mile = 402.336).
- The "timer" pin is declared in pinSchema, but only the bridge timers with isSet true and type different from 'timer' feed the flow_/value pins.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 42 |
| `C:postInit()` | Creates the flow_<id> and number <id> pins for each timer. | 34 |
| `C:updateInfos()` | Gets the vehicle's timers via the bridge; reports a node error if vehId is missing or unknown. | 45 |
| `C:work()` | Calls updateInfos and copies the set timers to the pins. | 70 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua`.*
