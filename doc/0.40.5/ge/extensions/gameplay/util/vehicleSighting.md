# `gameplay_util_vehicleSighting`

*File: `lua/ge/extensions/gameplay/util/vehicleSighting.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_util_vehicleSighting`: `extensions.load("gameplay_util_vehicleSighting")`, then the global `gameplay_util_vehicleSighting`

Determines whether an observer (the player camera or a vehicle) can "see" a target vehicle. The range depends on the angle: maximum range (80 m) straight ahead, minimum range (5 m) outside the peripheral cone (90°), interpolated between the two. An optional ray checks for the absence of obstacles.

## Example

```lua
if gameplay_util_vehicleSighting.canPlayerSeeVehicle(vehId, {maxDistDirectSight = 120, needDirectVisualContact = false}) then ... end
```

## Notes

- Default parameters: maxDistDirectSight 80 (m), minDistPeriphSight 5 (m), periphSightAngle 90 (degrees), needDirectVisualContact true.
- If `params` is provided, only the keys present are read; missing keys fall back to the default values.
- The visibility test casts castRay between the two positions raised by 1 m; any obstacle found (static or dynamic) blocks the view.
- Two coincident positions (distance < 1e-6) return true with no further test.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params)` | Tests whether the player camera sees the target vehicle (position and direction from core_camera). | 46 |
| `gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params)` | Tests whether a vehicle sees another vehicle (observer's position and forward direction). | 59 |
| `gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params)` | Generic visibility test from positions: distance, angle relative to the viewing direction, then occlusion ray. | 12 |

### Parameter details

#### `gameplay_util_vehicleSighting.canPlayerSeeVehicle(targetVehId, params)`

Tests whether the player camera sees the target vehicle (position and direction from core_camera).

- `targetVehId` (*integer*) : Id of the target vehicle.
- `params` (*table|nil*) : Settings, see checkSighting.
- **returns**: boolean false if core_camera or the vehicle does not exist.

#### `gameplay_util_vehicleSighting.canVehicleSeeVehicle(observerVehId, targetVehId, params)`

Tests whether a vehicle sees another vehicle (observer's position and forward direction).

- `observerVehId` (*integer*) : Observer id.
- `targetVehId` (*integer*) : Target id.
- `params` (*table|nil*) : Settings, see checkSighting.
- **returns**: boolean false if either vehicle does not exist.

#### `gameplay_util_vehicleSighting.checkSighting(observerPos, observerDir, targetPos, params)`

Generic visibility test from positions: distance, angle relative to the viewing direction, then occlusion ray.

- `observerPos` (*vec3*) : Observer position.
- `observerDir` (*vec3*) : Normalized viewing direction.
- `targetPos` (*vec3*) : Target position.
- `params` (*table*) : maxDistDirectSight, minDistPeriphSight, periphSightAngle, needDirectVisualContact (table required).
- **returns**: boolean true if the target is visible.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/vehicleSighting.lua`.*
