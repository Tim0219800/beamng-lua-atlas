# `flowgraph_nodes_util_timedSequence`

*File: `lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/timedSequence")` (file under extensions/ but not a regular extension)

Node "Timed Sequence" (once_f_duration, timer icon). Chains N timed parts (adjustable in the inspector, minimum 1). For each part i: input pin duration_i (s, 5 by default) and output pins start_i (pulse at the start), active_i (during the part), complete_i (pulse at the end). Time advances with the simulated time (mgr.dtSim). Legacy pin: allComplete became complete.

## Notes

- Bug: _executionStarted is defined twice; the second definition replaces the first (identical).
- In updatePins, the removal of links tests lnk.sourcePin against input pins (pinInLocal); these links are therefore probably never removed.
- The mode field is saved but never used.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets index, endTime, time and current to zero (the function is defined twice in the file, identically). | 35 |
| `C:_onDeserialized(res)` | Restores mode ("loop" by default) and count then recreates the pins. | 161 |
| `C:_onSerialize(res)` | Saves mode and count. | 156 |
| `C:drawCustomProperties()` | Draws the "Count" field; changing it calls updatePins. Returns the reason for the change. | 48 |
| `C:drawMiddle(builder, style)` | Displays the elapsed time and the current section. | 145 |
| `C:init()` | Initializes count, index, endTime, time and current. | 23 |
| `C:onNodeReset()` | Resets the time to zero and the state to "inactive". | 98 |
| `C:postInit()` | Creates the pins of the first part (updatePins(0, 1)). | 31 |
| `C:updatePins(old, new)` | Adds or removes the duration_/start_/active_/complete_ pins to go from old to new parts and updates count. | 65 |
| `C:work()` | While the state is started, advances the time, activates start/active/complete according to the current part; when the total time has elapsed, goes to "finished" and activates complete of the last part. | 103 |
| `C:workOnce()` | Sets the duration state to "started". | 94 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua`.*
