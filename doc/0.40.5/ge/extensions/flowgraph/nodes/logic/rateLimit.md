# `flowgraph_nodes_logic_rateLimit`

*File: `lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/rateLimit")` (file under extensions/ but not a regular extension)

Flowgraph node 'Flow Interval' (logic category, file rateLimit). Lets a flow impulse through at regular intervals as long as the input flow is active. 'input' is a frequency (Hz) or, if asDuration is true, a duration (s); 'reverseHit' decides whether the impulse falls at the end or start of the cycle. Optional dt, otherwise mgr.dtSim.

## Notes

- legacyPins renames fps and interval to 'frequency', a pin that does not exist in the schema (the pin is called 'input').
- fps = |input|: a value of 0 would cause a division by zero (1/fps) in frequency mode.
- work crashes if input is nil (math.abs(nil)).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets time and prevFps to their initial value. | 39 |
| `C:drawMiddle(builder, style)` | Cycle progress bar. | 44 |
| `C:init()` | time=0, prevFps=-1. | 34 |
| `C:work()` | Resets the timer on reset or when input changes; with flow, decrements time by dt; when time <= 0, adds 1/fps (or input in duration mode) and emits flow=true this frame, otherwise false. | 51 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua`.*
