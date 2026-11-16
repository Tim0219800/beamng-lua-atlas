# `flowgraph_nodes_vehicle_removeVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/removeVehicle.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/removeVehicle")` (file under extensions/ but not a regular extension)

Node "Remove Vehicle" (category `repeat_instant`, tags gameplay/utils). Deletes a vehicle: informs the editor (`editor.onRemoveSceneTreeObjects`) if present, then `source:delete()`. Input pin: `vehId`.

## Notes

- Called every frame while the flow is active; once deleted, `scenetree.findObjectById` returns nil.
- `vehId` nil or 0: no deletion; the output flow is set to true.
- The output flow is set to true only in the "no id" case.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Looks for the vehicle and removes it from the scene. | 21 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/removeVehicle.lua`.*
