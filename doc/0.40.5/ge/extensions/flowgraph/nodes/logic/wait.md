# `flowgraph_nodes_logic_wait`

*File: `lua/ge/extensions/flowgraph/nodes/logic/wait.lua` · VM: Game Engine (GE) · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/wait")` (file under extensions/ but not a regular extension)

Flowgraph node 'Wait' (logic category, behaviour duration+once). When the flow arrives, waits 'duration' seconds (3 by default) before outputting flow; requires a continuous input flow. Pin 'reset' (impulse), 'useDtSim' (uses dtSim instead of dtReal). Outputs: flow (after the wait) and impulse 'impulse' only once.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets timer and running to zero. | 32 |
| `C:_onDeserialized(res)` | Migrates the old field 'duration' to the hard-coded pin 'duration'. | 37 |
| `C:drawMiddle(builder, style)` | Progress bar and Reset button. | 53 |
| `C:init(mgr, ...)` | timer=0, running=false. | 27 |
| `C:updateTimer()` | If running, adds dtSim or dtReal to the timer; at the end stops and emits the impulse. | 44 |
| `C:work(args)` | Handles flow/reset, calls updateTimer; flow = (timer >= duration) AND input flow. | 64 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/wait.lua`.*
