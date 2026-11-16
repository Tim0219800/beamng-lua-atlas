# `util_screenshotCreator_framing_legacy`

*File: `lua/ge/extensions/util/screenshotCreator/framing/legacy.lua` · VM: Game Engine (GE) · 359 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_framing_legacy`: `extensions.load("util_screenshotCreator_framing_legacy")`, then the global `util_screenshotCreator_framing_legacy`

"Legacy (pre-r186184)" framing mode of the screenshot creator: computes the camera position and orientation so that a vehicle fits in the image, with the old method (fixed 20° FOV). It registers with util_screenshotCreator_framingManager via the onScreenshotCreatorCollectFramingModes hook (id "legacy", order 50). It keeps the vehicle's nodes (excluding antennas, flags, non-collidable nodes and nodes below the ground), searches by bisection for the minimum camera distance that keeps all extreme points within the margins, then raises the camera if it goes below 0.75 m above the lowest point.

## Example

```lua
local res, err = util_screenshotCreator_framing_legacy.resolve({vehicle = be:getPlayerVehicle(0), resolution = {500, 281}})
if res then core_camera.setPosRot(0, res.pos.x, res.pos.y, res.pos.z, res.rot.x, res.rot.y, res.rot.z, res.rot.w) end
```

## Notes

- Fixed FOV at 20° (fov field of the result); context.fov is ignored by this mode.
- Default resolution {500, 281}, default near plane 0.1.
- Margins are applied only if context.useFramingMargins (or context.useMargins) is true. Without context.margin, they are read from the settings only for the default resolution 500x281, otherwise the margin is zero.
- Minimum camera height: 0.75 m above the lowest node; if needed the elevation is increased (up to 85°), unless context.fixedRotation is provided.
- The boundBy field of framingData indicates the side (left/right/top/bottom) that limits the framing, or "fallback".

**Dependencies (loaded first):** `core_vehicle_manager`, `util_screenshotCreator_settings`, `util_screenshotCreator_thumbnailConfig`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_framing_legacy.frame(context)` | Alias of resolve (same function). | 276 |
| `util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName)` | Builds the geometric framing data of a vehicle: bounding box oriented along the reference axes, center, half-extents, look-at point, camera direction and extreme points (up to 100 nodes max and 100 min per axis). Does not compute the camera distance. | 45 |
| `util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes)` | Hook called by framingManager when collecting modes. Adds the mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve} to the list. *(internal)* *(hook)* | 342 |
| `util_screenshotCreator_framing_legacy.resolve(context)` | Computes the legacy framing camera for context.vehicle. Returns a table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, or nil and an error message if context.vehicle is missing. | 276 |

### Parameter details

#### `util_screenshotCreator_framing_legacy.frame(context)`

Alias of resolve (same function).

- `context` (*table*) : See resolve.
- **returns**: table|nil See resolve.
- **returns**: string|nil Error message.

#### `util_screenshotCreator_framing_legacy.getVehicleFramingData(vehicle, fixedRotation, configName)`

Builds the geometric framing data of a vehicle: bounding box oriented along the reference axes, center, half-extents, look-at point, camera direction and extreme points (up to 100 nodes max and 100 min per axis). Does not compute the camera distance.

- `vehicle` (*table*) : Vehicle object.
- `fixedRotation` (*quat|nil*) : Imposed camera orientation; otherwise computed from the direction (-0.75, -0.66, 0.07) in the vehicle's frame.
- `configName` (*string|nil*) : Configuration name passed to thumbnailConfig.getReferenceAxes to choose the reference axes.
- **returns**: table framingData (bb, center, axis0..2, halfExtents, floorZ, lookAtPoint, camRot, camRight/Forward/Up, framingPoints…).

#### `util_screenshotCreator_framing_legacy.onScreenshotCreatorCollectFramingModes(modes)`

Hook called by framingManager when collecting modes. Adds the mode {id = "legacy", label = "Legacy (pre-r186184)", order = 50, fixedFov = 20, supportsFixedRotation = true, resolve} to the list.

- `modes` (*table[]*) : List to fill.

#### `util_screenshotCreator_framing_legacy.resolve(context)`

Computes the legacy framing camera for context.vehicle. Returns a table {pos, rot, fov = 20, name = "legacy camera", debugData, framingData}, or nil and an error message if context.vehicle is missing.

- `context` (*table*) : Framing context: vehicle (required), resolution ({width, height}), aspectRatio, nearPlane, fixedRotation (imposed quat), configName, useFramingMargins/useMargins (boolean), margin ({left,right,top,bottom,extraBottom}).
- **returns**: table|nil Framing result (pos: vec3, rot: quat, fov, name, debugData, framingData).
- **returns**: string|nil Error message.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: core_vehicle_manager, util_screenshotCreator_settings, util_screenshotCreator_thumbnailConfig. |

## Calls into the engine (C++)

- `be:` `getSurfaceHeightBelow`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/framing/legacy.lua`.*
