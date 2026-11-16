# `flowgraph_nodes_environment_getGravity`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getGravity.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getGravity")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Gravity" (category provider, tag environment). Outputs the current global gravity in m/s² (core_environment.getGravity) on the "gravity" pin.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, writes the gravity to the output pin. | 19 |

## Calls into the engine (C++)

- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getGravity.lua`.*
