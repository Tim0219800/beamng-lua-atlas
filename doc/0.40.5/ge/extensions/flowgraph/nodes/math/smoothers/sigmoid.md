# `flowgraph_nodes_math_smoothers_sigmoid`

*File: `lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/smoothers/sigmoid")` (file under extensions/ but not a regular extension)

Flowgraph node 'Sigmoid Smoother' (simple category). Sigmoid smoothing with newTemporalSigmoidSmoothing: speed limits upRateLimit/downRateLimit and start/stop accelerations (up/down StartAccel and StopAccel) depending on direction; 'set' forces the state. Output 'value'.

## Notes

- BUG: the pin is declared 'downstopAccel' (lowercase s) but work reads self.pinIn.downStopAccel (nil): indexing .value on nil raises an error as soon as the input value is below the state (downward direction).
- init writes C.smoother (class): the smoother is shared between all instances of the node.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:checkSetValue()` | If 'set' changed, forces the smoother state. | 36 |
| `C:drawMiddle(builder, style)` | Displays the smoother state. | 69 |
| `C:init()` | Sets C.oldSet=0 and C.smoother (at class level). | 30 |
| `C:work()` | With no input, outputs the state; otherwise chooses limit/start/stop depending on direction (default 1) and outputs smoother:getWithRateAccel(sample, dt, limit, start, stop). | 44 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua`.*
