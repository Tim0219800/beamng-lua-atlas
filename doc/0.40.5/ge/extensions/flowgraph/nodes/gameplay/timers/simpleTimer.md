# `flowgraph_nodes_gameplay_timers_simpleTimer`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/timers/simpleTimer")` (file under extensions/ but not a regular extension)

Flowgraph node "Simple Timer" (category once_f_duration). All-in-one timer: creates a timer (duration, ref dtSim/dtReal/dtRaw) on trigger, then publishes elapsed, remaining, duration, elapsedPercent (0 to 1) every frame; capTime clamps these values once finished. Goes to duration state 'started' then 'finished' when the timer is complete. Values cannot be modified after creation.

## Notes

- onNodeReset contains debug prints (message "setting timer back").
- elapsedPercent divides by the duration: a duration of 0 gives inf/NaN.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets the duration state to 'inactive'. | 25 |
| `C:onNodeReset()` | Resets the timer's elapsed time to 0 and the duration state to 'inactive'. | 33 |
| `C:postInit()` | Defines the preset values of the ref pin (dtSim, dtReal, dtRaw). | 29 |
| `C:work()` | Updates elapsed/remaining/duration/elapsedPercent, switches to 'finished' when the timer is complete. | 47 |
| `C:workOnce()` | Creates the timer via self.mgr.modules.timer:addTimer, publishes timerId and sets the duration state to 'started'. | 42 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/timers/simpleTimer.lua`.*
