# `flowgraph_nodes_math_smoothers_spring`

*File: `lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/smoothers/spring")` (file under extensions/ but not a regular extension)

Flowgraph node 'Spring Smoother' (simple category). Should smooth a signal with a damped spring (upSpring/downSpring, upDamp/downDamp depending on direction; 'set' forces the state). Output 'value'.

## Notes

- BUG: the node creates a sigmoid smoother (newTemporalSigmoidSmoothing) whereas getWithSpringDamp only exists on temporalSpring (newTemporalSpring in common/filters.lua): calling the node with a value raises an 'attempt to call a nil value' error.
- The smoother is shared between instances (C.smoother).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:checkSetValue()` | If 'set' changed, forces the smoother state. | 34 |
| `C:drawMiddle(builder, style)` | Displays the smoother state. | 64 |
| `C:init()` | Sets C.oldSet=0 and C.smoother (class) via newTemporalSigmoidSmoothing(). | 28 |
| `C:work()` | With no input, outputs the state; otherwise calls smoother:getWithSpringDamp(sample, dt, spring, damp). | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua`.*
