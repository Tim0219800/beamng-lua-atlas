# `flowgraph_nodes_vehicle_hasCouplerTag`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/hasCouplerTag.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/hasCouplerTag")` (file under extensions/ but not a regular extension)

Node "Has Coupler Tag" (category `repeat_instant`, tags event/attach/detach). Indicates whether a vehicle has couplers carrying certain tags: `tow_hitch`, `fifthwheel`, `gooseneck_hitch`, `fifthwheel_v2`, `pintle` (list in the file). Input pin: `vehA`. One bool output per tag (pins created dynamically from the list).

## Notes

- Crashes if `vehA` matches no vehicle known to the vehicle module (`getVehicle` returns nil): no test.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets all tag outputs to false. | 32 |
| `C:work(args)` | Reads the vehicle's `couplerTags` in the manager's vehicle module and fills each output. | 38 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/hasCouplerTag.lua`.*
