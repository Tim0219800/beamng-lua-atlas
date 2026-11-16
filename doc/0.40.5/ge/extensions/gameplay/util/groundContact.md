# `gameplay_util_groundContact`

*File: `lua/ge/extensions/gameplay/util/groundContact.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_util_groundContact`: `extensions.load("gameplay_util_groundContact")`, then the global `gameplay_util_groundContact`

Minimal utility to know whether a vehicle is resting on its wheels. It casts a static ray downward from the bottom of the vehicle's bounding box (raised by 0.3 m) and compares the distance to the ground against a 1.1 m threshold.

## Notes

- The ray is 1.5 m long; the method does not look at the vehicle's orientation, only at whether there is ground under the center of the box: an overturned vehicle close to the ground can therefore be judged "on its wheels".
- If the ray hits nothing, castRayStatic returns a distance greater than or equal to the ray length, so the function returns false.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_util_groundContact.isOnWheels(vehId)` | Tests proximity of the ground under the vehicle's center using a static ray cast downward. | 20 |

### Parameter details

#### `gameplay_util_groundContact.isOnWheels(vehId)`

Tests proximity of the ground under the vehicle's center using a static ray cast downward.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean true if the ground is 1.1 m away or less; false if the vehicle is missing from map.objects.

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/groundContact.lua`.*
