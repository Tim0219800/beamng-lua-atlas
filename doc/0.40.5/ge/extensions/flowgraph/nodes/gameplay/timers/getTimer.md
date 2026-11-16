# `flowgraph_nodes_gameplay_timers_getTimer`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/timers/getTimer")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Timer". Reads the state of a timer (timerId). Outputs: flow, complete, completed (single pulse), incomplete, elapsed, remaining, duration, elapsedPercent (0 to 1). If capTime is true, elapsed/remaining/elapsedPercent are clamped once the timer is complete. Input reset: resets the completion detection.

## Notes

- elapsedPercent divides by the duration: a duration of 0 gives inf/NaN.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 26 |
| `C:work()` | If the timer exists, fills the outputs and fires completed only once at the end; otherwise flow stays false. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/getTimer.lua`.*
