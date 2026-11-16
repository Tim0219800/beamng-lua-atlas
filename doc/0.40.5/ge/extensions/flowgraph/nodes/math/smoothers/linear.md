# `flowgraph_nodes_math_smoothers_linear`

*File: `lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/smoothers/linear")` (file under extensions/ but not a regular extension)

Flowgraph node 'Linear Smoother' (simple category). Linear smoothing of a signal with newTemporalSmoothing: 'value' toward the internal state at speed upRate (rising) or downRate (falling), with time step 'dt'. 'set' forces the state. Output 'value'. The pin descriptions are 'TODO' in the code.

## Notes

- The smoother only exists after _executionStarted.
- init writes C.oldSet (class) instead of self.oldSet: shared between instances.
- The C.todo field in the code says 'Requires testing and should have flow pins'.
- dt is nil if the pin is not connected.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Creates the smoother (newTemporalSmoothing). | 31 |
| `C:checkSetValue()` | If 'set' changed, forces the smoother state to that value. | 36 |
| `C:drawMiddle(builder, style)` | Displays the smoother state. | 63 |
| `C:init()` | Sets C.oldSet=0 (at class level). | 26 |
| `C:work()` | With no input, outputs the current state; otherwise chooses the rate (upRate/downRate, default 1) and outputs smoother:getWithRateUncapped(sample, dt, rate). | 44 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua`.*
