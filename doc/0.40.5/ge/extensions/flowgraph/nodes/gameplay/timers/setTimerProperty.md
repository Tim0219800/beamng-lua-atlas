# `flowgraph_nodes_gameplay_timers_setTimerProperty`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/setTimerProperty.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/timers/setTimerProperty")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Timer Property" (category repeat_instant). Modifies an existing timer: progress (elapsed time in s), pause, duration, ref (mode). Only properties whose pin is not nil are changed.

## Notes

- duration and ref have default values (5, dtSim): with no connected pin they are therefore rewritten every frame.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Defines the preset values of the ref pin. | 20 |
| `C:work()` | Applies progress, pause, duration and ref to the timer via the timer module. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/setTimerProperty.lua`.*
