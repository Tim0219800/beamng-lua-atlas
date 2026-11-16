# `flowgraph_nodes_vehicle_beamstate_beamstate`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/beamstate/beamstate")` (file under extensions/ but not a regular extension)

Node "Beamstate" (category `once_p_duration`, tags destroy/damage/funstuff). Calls a parameterless function of `beamstate` on the vehicle side, chosen in a dropdown list: `breakAllBreakgroups`, `breakHinges`, `deflateTires`. Input pin: `vehId` (number, required). Executed once.

## Notes

- Unlike other nodes, there is no fallback to the player vehicle: without a valid `vehId`, nothing happens.
- `drawCustomProperties` does not return `reason` (empty return): the function change is not reported to the editor.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Called when the project loads; restores the node's settings from `nodeData`. | 69 |
| `C:_onSerialize(res)` | Called when the project is saved; copies the node's settings into the `res` table. | 65 |
| `C:drawCustomProperties()` | ImGui display of the node's properties in the editor panel; returns a string describing the change made, or nil. | 34 |
| `C:drawMiddle(builder, style)` | ImGui display in the center of the node in the flowgraph editor; purely visual. | 59 |
| `C:init()` | Node constructor, called at its creation by the flowgraph editor/manager; initializes the internal state. | 25 |
| `C:workOnce()` | Sends `beamstate.<chosen function>()` to the vehicle `vehId` via `queueLuaCommand`. Does nothing if the vehicle does not exist. | 48 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/beamstate.lua`.*
