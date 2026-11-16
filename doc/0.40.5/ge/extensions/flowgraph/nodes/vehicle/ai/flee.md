# `flowgraph_nodes_vehicle_ai_flee`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/flee.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/flee")` (file under extensions/ but not a regular extension)

Node "AI Flee" (color ai, once_p_duration). Puts a vehicle in "flee" AI mode to flee from another vehicle. Inputs: aiVehId (no value = player vehicle), targetId (defaults to the player vehicle).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends ai.setMode("flee") then ai.setTargetObjectID(targetId) to the vehicle. | 21 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/flee.lua`.*
