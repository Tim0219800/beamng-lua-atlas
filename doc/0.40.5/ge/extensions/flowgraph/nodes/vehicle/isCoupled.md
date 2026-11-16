# `flowgraph_nodes_vehicle_isCoupled`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/isCoupled.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/isCoupled")` (file under extensions/ but not a regular extension)

Node "Is Coupled" (category `repeat_instant`, tags event/attach/detach). Tests whether two vehicles are coupled (`mgr.modules.vehicle:isCoupledTo(vehA, vehB)`). Input pins: `vehA`, `vehB`. Outputs: flow `coupled`, flow `decoupled`, bool `isCoupled`.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Fills `coupled`, `decoupled` and `isCoupled` from the result of `isCoupledTo`. Parameter `args` unused. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/isCoupled.lua`.*
