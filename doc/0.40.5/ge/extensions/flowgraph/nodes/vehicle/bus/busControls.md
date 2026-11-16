# `flowgraph_nodes_vehicle_bus_busControls`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/bus/busControls")` (file under extensions/ but not a regular extension)

Node "Bus Controls Detection" (category `repeat_instant`, bus icon). Reads the state of a bus: outputs `isKneeling` (bool, bus kneeling) and `doorsOpen` (bool, doors open), with an output flow `flow`. Input pins: `flow`, `vehId` (default 0). To be used with the "Register Bus Data" node called after the bus spawns. Reads `mgr.modules.vehicle:isBusKneel/isBusDoorOpen`.

## Notes

- Without a prior call to Register Bus Data, the values stay false.
- The "player vehicle" fallback announced in the pin description depends on the vehicle module (`isBusKneel(nil)`), not verified here.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:executionStarted()` | Resets both outputs to false at start (note: name without underscore, so never called by the manager, which calls `_executionStarted`). | 32 |
| `C:init()` | Constructor; sets `isKneeling` and `doorsOpen` to false. | 21 |
| `C:work()` | Updates `isKneeling`, `doorsOpen` from the manager's `vehicle` module and activates the output flow. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/busControls.lua`.*
