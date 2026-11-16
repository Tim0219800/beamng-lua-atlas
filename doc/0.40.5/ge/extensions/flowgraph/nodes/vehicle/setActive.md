# `flowgraph_nodes_vehicle_setActive`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setActive.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setActive")` (file under extensions/ but not a regular extension)

Node "Set Vehicle Active" (category `once_instant`). Makes a vehicle visible or invisible (`obj:setActive(1 or 0)`). Input pins: `vehId` (default: player), `active` (bool).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Applies `setActive` to the vehicle according to the `active` pin. | 20 |

## Calls into the engine (C++)

- `obj:` `setActive`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setActive.lua`.*
