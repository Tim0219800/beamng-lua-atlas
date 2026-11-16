# `flowgraph_nodes_logic_timedTrigger`

*File: `lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua` · VM: Game Engine (GE) · 93 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/timedTrigger")` (file under extensions/ but not a regular extension)

Flowgraph node 'Timed Trigger' (logic category, behaviour once+duration). Flow must be held on 'charge' for data.duration seconds (3 by default) to trigger; if 'charge' is cut for more than data.resetTimer seconds (1 by default), the charge is reset to zero. Outputs: flow (while the charge is complete) and impulse 'complete' only once.

## Notes

- Only data.duration is saved; resetTimer falls back to 1 on load (init value).
- The input pin 'flow' is not read in work.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets all counters to zero. | 35 |
| `C:_onDeserialized(res)` | Reads data.duration back. | 47 |
| `C:_onSerialize(res)` | Saves data.duration. | 43 |
| `C:drawMiddle(builder, style)` | Two progress bars (charge and reset) with remaining time. | 70 |
| `C:init(mgr, ...)` | Initializes resetTimer=1, duration=3 and the internal state. | 25 |
| `C:updateCharge()` | Increments timer (dtSim) when charge is active, fires completeTrigger at the duration; otherwise increments reset and resets the timer to zero after resetTimer. | 50 |
| `C:work(args)` | Calls updateCharge, flow = (timer >= duration), complete = impulse only once (completeReady). | 80 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua`.*
