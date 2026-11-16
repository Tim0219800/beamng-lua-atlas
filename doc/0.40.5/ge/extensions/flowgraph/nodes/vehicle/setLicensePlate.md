# `flowgraph_nodes_vehicle_setLicensePlate`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua` · VM: Game Engine (GE) · 58 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/setLicensePlate")` (file under extensions/ but not a regular extension)

Node "Set License Plate" (`once` behavior). Changes a vehicle's plate text with `core_vehicles.setPlateText(text, vehId)`. Input pins: `flow`, `reset` (pulses), `vehId` (default: player), `text` (string). Output: `flow` (pulse). Runs only once until a `reset`.

## Notes

- An empty text (`''`) changes nothing, but the output flow is still emitted.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets `ready = true`. | 28 |
| `C:init(mgr, ...)` | Constructor; `ready = true` (parameters `mgr, ...` ignored). | 24 |
| `C:work()` | Handles `reset`, then, if `ready` and `flow`, applies the text and emits the output flow only once. | 32 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/setLicensePlate.lua`.*
