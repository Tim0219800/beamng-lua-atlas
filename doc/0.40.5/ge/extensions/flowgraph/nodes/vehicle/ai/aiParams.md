# `flowgraph_nodes_vehicle_ai_aiParams`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/aiParams")` (file under extensions/ but not a regular extension)

Node "AI Parameters" (color ai, repeat_p_duration). Sets various AI parameters of a vehicle by sending ai.* commands via queueLuaCommand. Inputs: vehId (no value = player vehicle), risk (0.3; clamped to 0.1-2.0: ai.setAggression), routeSpeed (m/s: ai.setSpeed), routeMode (off, set, limit: ai.setSpeedMode), drivabilityCO (hidden: ai.setCutOffDrivability), inLane (ai.driveInLane), avoidCars (ai.setAvoidCars), forceRisk (ai.setAggressionMode off/rubberBand), activateNitrous (jatoInput and nitrousOxideInjection controller). Legacy pin: vehID became vehId.

## Notes

- The commands are resent every frame while the node receives flow.
- forceRisk=true sends ai.setAggressionMode('off'), otherwise 'rubberBand'.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Configures the risk slider (0.1 to 2.0) and the templates of the routeMode pin (off, set, limit). | 33 |
| `C:work()` | Finds the vehicle (getObjectByID or getPlayerVehicle(0)) and sends the ai.* commands matching the filled pins every frame; handles nitro activation/deactivation (toggles the nitrousOxideInjection controller only if its armed state differs). | 48 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua`.*
