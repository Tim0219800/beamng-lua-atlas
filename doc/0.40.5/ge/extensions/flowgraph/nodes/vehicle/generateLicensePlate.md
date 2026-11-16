# `flowgraph_nodes_vehicle_generateLicensePlate`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/generateLicensePlate.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/generateLicensePlate")` (file under extensions/ but not a regular extension)

Node "Generate License Plate" (category `once_instant`, tags plate/license). Generates a random license plate for a vehicle: `core_vehicles.regenerateVehicleLicenseText(veh)` then `core_vehicles.setPlateText(text, vehId)`. Input pin: `vehId` (default: player).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Generates a random plate text and applies it to the vehicle. | 21 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/generateLicensePlate.lua`.*
