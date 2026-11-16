# `flowgraph_nodes_events_onUpdate`

*File: `lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/onUpdate")` (file under extensions/ but not a regular extension)

Flowgraph node "on Update" (category logic, event). Emits flow every frame. Output pins: enterState (pulse on entering the project state), flow (every frame), exitState (pulse on leaving the state), dtReal, dtSim, dtRaw (delta times, hidden). Also updates mgr.dtReal/dtSim/dtRaw.

## Notes

- On state events (start and end) the three delta times are reset to 0.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty. | 28 |
| `C:onStateStartedTrigger()` | Called when the project enters the state: enterState true, delta times at 0. | 44 |
| `C:onStateStoppedTrigger()` | Called when the project leaves the state: exitState true, delta times at 0. | 58 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: sets flow to true, copies the delta times to mgr and the pins, triggers the node. | 31 |
| `C:work(args)` | Empty. | 72 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua`.*
