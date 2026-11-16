# `flowgraph_nodes_vehicle_trailerRespawn`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/trailerRespawn.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/trailerRespawn")` (file under extensions/ but not a regular extension)

"Trailer Respawn Control" node (category `once_instant`, depends on `core_trailerRespawn`). Enables or disables automatic respawn of trailers along with their vehicles (`core_trailerRespawn.setEnabled(enabled)`). Pins: `enabled` (bool, default false, hardcoded), `flow` as input and output.

**Dependencies (loaded first):** `core_trailerRespawn`

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Constructor; `self.enabled = true` (field not used afterwards). | 22 |
| `C:work()` | If the input flow is active, calls `setEnabled` and propagates the flow. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/trailerRespawn.lua`.*
