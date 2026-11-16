# `flowgraph_nodes_environment_setBulletTime`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setBulletTime")` (file under extensions/ but not a regular extension)

Flowgraph node "Bullet Time" (category repeat_instant). Slows down or pauses simulation time via simTimeAuthority. Input pins: instant (bool, hidden: applies the speed immediately instead of approaching it gradually) and value (number, 0 = game pause, slider 0 to 1). Runs every frame while the input flow is active; when the graph stops, resets the speed to 1.

## Notes

- If value is 0, simTimeAuthority.pause(true) is called; otherwise the speed is set and then the pause is lifted.
- If value is nil, speed 1 is used (but the value == 0 test is done first).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Called when the graph stops: resets simTimeAuthority.set(1). | 21 |
| `C:postInit()` | Configures the value pin as a float slider from 0 to 1. | 25 |
| `C:work()` | If the flow is active: pauses if value == 0, otherwise sets the speed (setInstant if instant, otherwise set) and lifts the pause. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua`.*
