# `flowgraph_nodes_vehicle_special_wheelDistance`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/special/wheelDistance")` (file under extensions/ but not a regular extension)

Node "Wheel Distance" (category `repeat_p_duration`). Gives the distance, projected onto the vehicle's direction, between a `position` point (vec3) and the middle of the two closest wheels (by default only the front wheels, `data.onlyUseFrontWheels = true`). Input pins: `vehId`, `position`. Output: `distance` (number, sign: positive when the point is in front of the wheels). `data.debug` enables drawing.

## Notes

- Leaves debug `print`s: `print(tostring(distanceFromStart))` every frame and `print("ERROR1")` if the vehicle or the position is missing.
- The `wheels` array is shared: `wheelNodePos` is a single vec3 reused for each wheel, so all entries point to the same value (last wheel) — the average of the two closest wheels is wrong.

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:calculateDistanceFromStart(vehicle, target)` | Computes the signed distance between `target` and the closest wheels of the vehicle `vehicle`. | 64 |
| `C:drawMiddle(builder, style)` | Empty central display. | 135 |
| `C:init()` | Constructor; `data.debug = false`, `data.onlyUseFrontWheels = true`. | 32 |
| `C:work()` | Reads the vehicle and the position then writes `distance`. | 122 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua`.*
