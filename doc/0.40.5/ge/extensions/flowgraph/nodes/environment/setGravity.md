# `flowgraph_nodes_environment_setGravity`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setGravity")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Gravity" (category dynamic_instant). Sets the global gravity (value pin, in m/s², 0 by default) via core_environment.setGravity. The original gravity is stored when the graph starts and restored on stop (data.restoreGravity).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Stores the current gravity. | 23 |
| `C:_executionStopped()` | Restores the stored gravity if data.restoreGravity is true. | 26 |
| `C:init(mgr)` | Sets data.restoreGravity = true. | 19 |
| `C:work()` | In repeat mode, reapplies the gravity every frame only if the value pin is used (connected). | 37 |
| `C:workOnce()` | Applies the gravity of the value pin once. | 33 |

## Calls into the engine (C++)

- `core_environment.` `getGravity`, `setGravity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua`.*
