# `util_screenshotCreator_framing_isometric`

*File: `lua/ge/extensions/util/screenshotCreator/framing/isometric.lua` · VM: Game Engine (GE) · 147 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_framing_isometric`: `extensions.load("util_screenshotCreator_framing_isometric")`, then the global `util_screenshotCreator_framing_isometric`

"Fixed isometric" framing mode of screenshotCreator: places the camera at a fixed distance (15 m) from the vehicle's center, in the local direction (-1, -1, 0.75) normalized along the vehicle's reference axes, looking at the center. The position is then recentered orthogonally (up to 8 iterations) so that the projection of the framing points is centered in the usable area of the image, taking any margins into account. It registers via onScreenshotCreatorCollectFramingModes (id "fixedIsometric", order 150).

## Notes

- Default resolution 500x281 and default field of view 20 degrees when the context provides none.
- Margins are used only if useFramingMargins (or useMargins) is true.
- The result contains framingData.boundBy = 'fixed distance' and framingData.fit (distance, offsets, position, rotation). frame is an alias of resolve.
- The mode declares supportsFixedRotation = false and fixedDistance = 15.

**Dependencies (loaded first):** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framing_procedural`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_framing_isometric.frame(context)` | Alias of resolve. | 81 |
| `util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes)` | Framing mode collection hook: adds the mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve} to the list. *(internal)* *(hook)* | 131 |
| `util_screenshotCreator_framing_isometric.resolve(context)` | Computes the fixed isometric camera for the context's vehicle. | 81 |

### Parameter details

#### `util_screenshotCreator_framing_isometric.frame(context)`

Alias of resolve.

- `context` (*table*) : See resolve
- **returns**: table|nil See resolve
- **returns**: string|nil Error message

#### `util_screenshotCreator_framing_isometric.onScreenshotCreatorCollectFramingModes(modes)`

Framing mode collection hook: adds the mode {id = 'fixedIsometric', label = 'Fixed isometric', order = 150, fixedDistance, supportsFixedRotation = false, resolve} to the list.

- `modes` (*table[]*) : List of modes to complete

#### `util_screenshotCreator_framing_isometric.resolve(context)`

Computes the fixed isometric camera for the context's vehicle.

- `context` (*table*) : Context: vehicle (required), configName, resolution, fov/fieldOfView, margin, useFramingMargins
- **returns**: table|nil {pos, rot, name = 'fixed isometric camera', debugData, framingData} or nil on error
- **returns**: string|nil Error message if context.vehicle is missing

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/framing/isometric.lua`.*
