# `flowgraph_nodes_vehicle_bus_isBus`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/isBus.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/bus/isBus")` (file under extensions/ but not a regular extension)

Node "Is Bus" (category `repeat_instant`). Tests whether a vehicle is a bus via `mgr.modules.vehicle:isBus(vehId)`. Input pin: `vehId`. Outputs: flow `isBus`, flow `isNotBus`, bool `isBusBool`.

## Notes

- The description of the input pin says "Id of vehicle A" (copy-paste); it is indeed the tested vehicle.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Fills `isBus`, `isNotBus` and `isBusBool` according to the result of `isBus`. Parameter `args` unused. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/bus/isBus.lua`.*
