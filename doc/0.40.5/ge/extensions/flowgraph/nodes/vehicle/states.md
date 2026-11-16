# `flowgraph_nodes_vehicle_states`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/states.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/states")` (file under extensions/ but not a regular extension)

Node "Vehicle States" (category `repeat_instant`). Reads from `map.objects[vehId].states` the state of the horn (`horn`) and the lightbar (`lightbar`). Outputs: flow `horn`, flow `lightbar`, bool `hornb`, bool `lightbarb` (hidden). Input pin: `vehId`.

## Notes

- If `map.objects[vehId]` does not exist, `horn` and `lightbar` are false but `hornb`/`lightbarb` keep their old value.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Updates the horn and lightbar outputs from the `map.objects` table. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/states.lua`.*
