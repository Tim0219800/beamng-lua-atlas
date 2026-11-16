# `flowgraph_nodes_vehicle_fire_fire`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua` · VM: Game Engine (GE) · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/fire/fire")` (file under extensions/ but not a regular extension)

Node "Fire" (category `once_p_duration`, tags destroy/damage/funstuff). Calls a fire action on a vehicle via `core_vehicleBridge.executeAction(veh,'interactFire', function)`. The function is chosen in the editor: `igniteVehicle`, `extinguishVehicle`, `explodeVehicle`, `igniteRandomNode`, `igniteRandomNodeMinimal`, `extinguishVehicleSlowly`. Input pin: `vehId` (required).

## Notes

- No fallback to the player vehicle: without `vehId`, nothing happens.
- `_executionStarted` sets `self.done = false` but `done` is not used anywhere.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets `done = false` (unused field). | 52 |
| `C:_onDeserialized(nodeData)` | Called when the project loads; restores the node's settings from `nodeData`. | 77 |
| `C:_onSerialize(res)` | Called when the project is saved; copies the node's settings into the `res` table. | 73 |
| `C:drawCustomProperties()` | ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil. | 38 |
| `C:drawMiddle(builder, style)` | ImGui display in the center of the node in the flowgraph editor; purely visual. | 67 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 26 |
| `C:workOnce()` | Sends the `interactFire` action with the selected function to the vehicle `vehId`. | 56 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/fire/fire.lua`.*
