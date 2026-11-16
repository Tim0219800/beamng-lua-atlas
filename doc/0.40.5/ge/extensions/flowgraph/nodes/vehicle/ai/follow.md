# `flowgraph_nodes_vehicle_ai_follow`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/follow.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/follow")` (file under extensions/ but not a regular extension)

Node "AI Follow" (color ai, once_p_duration). Puts a vehicle in "follow" AI mode to follow another vehicle, without intentional contact. Inputs: aiVehId (no value = player vehicle), targetId (defaults to the player vehicle).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends ai.setMode("follow") then ai.setTargetObjectID(targetId) to the vehicle. | 22 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/follow.lua`.*
