# `flowgraph_nodes_vehicle_bus_registerBusData`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/registerBusData.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/bus/registerBusData")` (file under extensions/ but not a regular extension)

Node "Register Bus Data" (category `once_instant`). Registers the callback for notification of bus value changes (kneeling, doors) via `mgr.modules.vehicle:registerBusChangeNotification(vehId)`. To be called after the bus spawns; required for "Bus Controls Detection". Pins: inputs `flow`, `vehId` (default 0); output `flow`.

## Notes

- The registration is deferred with `mgr.modules.level:delayOrInstantFunction` (waits until the level is ready).
- The found vehicle (`veh`) in the closure is not used.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Schedules (or runs right away) the registration of the bus notification, then activates the output flow. | 20 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/registerBusData.lua`.*
