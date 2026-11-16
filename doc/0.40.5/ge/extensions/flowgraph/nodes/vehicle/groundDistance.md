# `flowgraph_nodes_vehicle_groundDistance`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/groundDistance.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/groundDistance")` (file under extensions/ but not a regular extension)

Node "Distance From Ground" (category `repeat_instant`, tags gameplay/utils). Measures the distance between the lowest point of the vehicle's oriented bounding box (`getSpawnWorldOOBB`, 8 corners) and the terrain below (`be:getSurfaceHeightBelow`). Input pins: `vehId`, `zOffset` (hidden, default 10: starting height of the ray). Output: `lowestDistance` (number, meters). Option `data.drawDebug` to display the values.

## Notes

- If no ray hits the ground, `lowestDistance` is `math.huge`.
- `vehId` is required (no fallback to the player).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Constructor; `data.drawDebug = false`. | 25 |
| `C:work()` | Casts a ray downward from each corner of the OOBB and puts the smallest distance to the ground in `lowestDistance`. | 29 |

## Calls into the engine (C++)

- `be:` `getSurfaceHeightBelow`
- `debugDrawer:` `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/groundDistance.lua`.*
