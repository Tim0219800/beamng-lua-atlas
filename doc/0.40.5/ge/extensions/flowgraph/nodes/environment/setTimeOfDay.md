# `flowgraph_nodes_environment_setTimeOfDay`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setTimeOfDay")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Time of Day" (category dynamic_instant). Sets the time of day via core_environment.setTimeOfDay. Input pins: flow, time (0 to 1; 0 = midday, 0.25 evening, 0.5 midnight, 0.75 morning), play (bool, play or pause the cycle), dayLength (hidden, duration of a full cycle in real seconds).

## Notes

- time is wrapped with % 1.
- Sets mgr.modules.mission.todChanged = true so that the mission module knows the time has been changed.
- data.restoreTod = true is defined but _executionStarted/_executionStopped are empty: nothing is restored by this node.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 43 |
| `C:_executionStopped()` | Empty. | 46 |
| `C:init(mgr)` | Sets data.restoreTod = true. | 23 |
| `C:postInit()` | Configures the time pin (0 to 1 slider, Midday/Evening/Midnight/Morning templates). | 27 |
| `C:setTimeOfDay()` | Marks todChanged then calls core_environment.setTimeOfDay({time, play, dayLength}). | 63 |
| `C:work()` | In repeat mode, applies the time every frame. | 57 |
| `C:workOnce()` | Applies the time once. | 53 |

## Calls into the engine (C++)

- `core_environment.` `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setTimeOfDay.lua`.*
