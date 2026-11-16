# `util_screenshotCreator_framing_procedural`

*File: `lua/ge/extensions/util/screenshotCreator/framing/procedural.lua` · VM: Game Engine (GE) · 539 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_framing_procedural`: `extensions.load("util_screenshotCreator_framing_procedural")`, then the global `util_screenshotCreator_framing_procedural`

"Procedural" framing mode (default mode) of the screenshot creator. From the vehicle's nodes, it computes the camera that makes the vehicle fit in the image with given margins: nodes disabled by the nodeOutpaint module are ignored, those below the ground and automatic mirrors are handled separately, then a bisection search finds the minimum distance along a camera rail. If there is no solution, a fallback position and an optimized rotation are used. Registers via the onScreenshotCreatorCollectFramingModes hook (id "procedural", order 100).

## Example

```lua
local res, err = util_screenshotCreator_framing_procedural.resolve({vehicle = veh, resolution = {1280, 720}, fov = 20, useFramingMargins = true})
if not res then log('E', 'framing', err) end
```

## Notes

- Default values: fov 20°, nearPlane 0.1, resolution {500, 281}, camera height 1.6 m above the ground, axis offset of 0.10 m downward.
- Errors returned: non-positive resolution, fov outside ]0,180[, negative nearPlane or non-positive aspectRatio, no framing point above ground.
- Zero margins unless context.useFramingMargins (or useMargins) is true; then context.margin or settings.getFramingMargin(resolution) is used. Mirrors have a fixed margin of 2 pixels.
- A selfCheck() (assertions) runs only once at the first resolve; a failed assertion would raise a Lua error.

**Dependencies (loaded first):** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_framing_procedural.frame(context)` | Alias of resolve (same function). | 438 |
| `util_screenshotCreator_framing_procedural.getVehicleFramingData(context)` | Prepares the framing data: classifies the vehicle's nodes (enabled, disabled, below ground, mirrors), computes the bounding box, the look-at point, the camera rail and the extreme points used for framing and rotation. Falls back to the corners of the vehicle's box if no node is enabled. | 135 |
| `util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes)` | Hook called by framingManager when collecting modes. Adds {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}. *(internal)* *(hook)* | 522 |
| `util_screenshotCreator_framing_procedural.resolve(context)` | Computes the procedural framing camera for context.vehicle. Returns {pos, rot, name = "procedural camera", debugData, framingData}, or nil and an error message. | 438 |
| `util_screenshotCreator_framing_procedural.selfCheck()` | Internal assertion-based test on the selection of rotation nodes (below-ground nodes and mirrors kept, disabled nodes excluded, fallback to backup points). Returns true. *(internal)* | 107 |

### Parameter details

#### `util_screenshotCreator_framing_procedural.frame(context)`

Alias of resolve (same function).

- `context` (*table*) : See resolve.
- **returns**: table|nil See resolve.
- **returns**: string|nil Error message.

#### `util_screenshotCreator_framing_procedural.getVehicleFramingData(context)`

Prepares the framing data: classifies the vehicle's nodes (enabled, disabled, below ground, mirrors), computes the bounding box, the look-at point, the camera rail and the extreme points used for framing and rotation. Falls back to the corners of the vehicle's box if no node is enabled.

- `context` (*table*) : Same context as resolve (vehicle, configName, cameraHeight, cameraAxisDownOffset).
- **returns**: table|nil framingData.
- **returns**: string|nil "No above-ground framing points" if nothing is usable.

#### `util_screenshotCreator_framing_procedural.onScreenshotCreatorCollectFramingModes(modes)`

Hook called by framingManager when collecting modes. Adds {id = "procedural", label = "Procedural", order = 100, supportsFixedRotation = true, resolve}.

- `modes` (*table[]*) : List to fill.

#### `util_screenshotCreator_framing_procedural.resolve(context)`

Computes the procedural framing camera for context.vehicle. Returns {pos, rot, name = "procedural camera", debugData, framingData}, or nil and an error message.

- `context` (*table*) : vehicle (required), resolution, fov/fieldOfView, nearPlane, aspectRatio, fixedRotation (quat), configName, cameraHeight, cameraAxisDownOffset, useFramingMargins/useMargins, margin ({left,right,top,bottom}).
- **returns**: table|nil Framing result (pos: vec3, rot: quat, name, debugData, framingData).
- **returns**: string|nil Error message.

#### `util_screenshotCreator_framing_procedural.selfCheck()`

Internal assertion-based test on the selection of rotation nodes (below-ground nodes and mirrors kept, disabled nodes excluded, fallback to backup points). Returns true.

- **returns**: boolean Always true (otherwise an assertion fails).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: thumbnailConfig, nodeOutpaint, settings, vehicleSetup (prefix util_screenshotCreator_). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/framing/procedural.lua`.*
