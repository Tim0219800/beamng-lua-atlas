# `flowgraph_nodes_vehicle_ai_chase`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/chase.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/chase")` (file under extensions/ but not a regular extension)

Node "AI Chase" (color ai, once_p_duration). Puts a vehicle in "chase" AI mode to pursue another vehicle, with intentional contact. Inputs: aiVehId (no value = player vehicle), targetId (defaults to the player vehicle).

## Notes

- If aiVehId is not provided, the player vehicle is both the chaser and the target by default.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends ai.setMode("chase") then ai.setTargetObjectID(targetId) to the vehicle. | 22 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/chase.lua`.*
