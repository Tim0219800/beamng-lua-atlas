# `flowgraph_nodes_gameplay_timers_createTimer`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/timers/createTimer")` (file under extensions/ but not a regular extension)

Flowgraph node "Create Timer" (category once_instant). Creates a timer via the flowgraph timer module. Inputs: duration (default 5 s), ref (hidden; dtSim simulation time, dtReal real time, dtRaw raw time). Output: timerId, to be passed to Get Timer / Set Timer Property.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 18 |
| `C:postInit()` | Defines the preset values of the ref pin (dtSim, dtReal, dtRaw). | 22 |
| `C:workOnce()` | Calls self.mgr.modules.timer:addTimer({duration, mode=ref}) and publishes the id on timerId. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/createTimer.lua`.*
