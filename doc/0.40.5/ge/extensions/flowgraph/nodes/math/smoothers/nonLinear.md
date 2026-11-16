# `flowgraph_nodes_math_smoothers_nonLinear`

*File: `lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/smoothers/nonLinear")` (file under extensions/ but not a regular extension)

Flowgraph node 'Nonlinear Smoother' (simple category). Nonlinear smoothing with newTemporalSmoothingNonLinear: upRate/downRate depending on direction, time step 'dt', 'set' to force the state. Output 'value'. Pin descriptions are 'TODO' in the code.

## Notes

- init writes C.oldSet (class) instead of self.oldSet.
- The smoother is created in init, so it is not reset when the graph restarts (unlike the Linear Smoother).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:checkSetValue()` | If 'set' changed, forces the smoother state. | 32 |
| `C:drawMiddle(builder, style)` | Displays the smoother state. | 59 |
| `C:init()` | Sets C.oldSet=0 (class) and creates the nonlinear smoother. | 26 |
| `C:work()` | With no input, outputs the state; otherwise outputs smoother:getWithRate(sample, dt, rate) with rate = upRate/downRate (default 1). | 40 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/smoothers/nonLinear.lua`.*
