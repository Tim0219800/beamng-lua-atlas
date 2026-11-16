# `util_screenshotCreator_framing_configured`

*File: `lua/ge/extensions/util/screenshotCreator/framing/configured.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_framing_configured`: `extensions.load("util_screenshotCreator_framing_configured")`, then the global `util_screenshotCreator_framing_configured`

"Configured camera" framing mode of screenshotCreator: uses a custom camera saved in the vehicle's thumbnail configuration (per config, otherwise per model) and converts it to a world position/rotation from the stored offsets (rewindCameraOffsets). If no configured camera is usable, falls back to procedural framing. It registers itself in the mode list via the onScreenshotCreatorCollectFramingModes hook (id "configured", order 200).

## Notes

- Priority: config camera (configCamEnabled), then model camera (modelCamEnabled), then procedural framing.
- resolveOverride returns nil without error when no configured camera applies, and (nil, message) if context.vehicle is missing.
- frame is an alias of resolve.

**Dependencies (loaded first):** `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framing_procedural`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_framing_configured.frame(context)` | Alias of resolve. | 75 |
| `util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes)` | Framing mode collection hook: adds the mode {id = 'configured', label = 'Configured camera', order = 200, resolve} to the list. *(internal)* *(hook)* | 82 |
| `util_screenshotCreator_framing_configured.resolve(context)` | Resolves the camera for the context: tries the configured camera, otherwise delegates to util_screenshotCreator_framing_procedural.resolve. | 75 |
| `util_screenshotCreator_framing_configured.resolveOverride(context)` | Resolves only the user-configured camera (config then model) without procedural fallback. | 37 |

### Parameter details

#### `util_screenshotCreator_framing_configured.frame(context)`

Alias of resolve.

- `context` (*table*) : See resolve
- **returns**: table|nil See resolve
- **returns**: string|nil Error message

#### `util_screenshotCreator_framing_configured.onScreenshotCreatorCollectFramingModes(modes)`

Framing mode collection hook: adds the mode {id = 'configured', label = 'Configured camera', order = 200, resolve} to the list.

- `modes` (*table[]*) : List of modes to complete

#### `util_screenshotCreator_framing_configured.resolve(context)`

Resolves the camera for the context: tries the configured camera, otherwise delegates to util_screenshotCreator_framing_procedural.resolve.

- `context` (*table*) : Framing context: vehicle (required), configName, and the fields read by procedural framing
- **returns**: table|nil {pos, rot, name, debugData} or nil on error
- **returns**: string|nil Error message

#### `util_screenshotCreator_framing_configured.resolveOverride(context)`

Resolves only the user-configured camera (config then model) without procedural fallback.

- `context` (*table*) : Framing context with vehicle and configName
- **returns**: table|nil {pos, rot, name = 'config camera' or 'model camera', debugData} or nil if no configured camera
- **returns**: string|nil Error message if the context is invalid

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/framing/configured.lua`.*
