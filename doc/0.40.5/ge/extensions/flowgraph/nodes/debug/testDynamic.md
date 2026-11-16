# `flowgraph_nodes_debug_testDynamic`

*File: `lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/testDynamic")` (file under extensions/ but not a regular extension)

Flowgraph node "Category Test" (category once_f_duration), a test node for this category: on flow, switches to the duration state "started", counts 5 seconds (mgr.dtReal) with a progress bar in the node, then switches to "finished". No custom pins.

## Notes

- Bug: in work(), `not self.durationState == 'started'` is evaluated as `(not self.durationState) == 'started'`, always false; the guard therefore protects nothing and the timer advances even outside the started state.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets on execution. | 18 |
| `C:drawMiddle(builder, style)` | Editor: progress bar timer/5. | 28 |
| `C:init(mgr, ...)` | Timer at 0 and state 'inactive'. | 13 |
| `C:onNodeReset()` | Resets the timer and the state. | 23 |
| `C:work(args)` | Advances the timer and switches to 'finished' at 5 s. | 38 |
| `C:workOnce()` | Timer at 0, state 'started'. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua`.*
