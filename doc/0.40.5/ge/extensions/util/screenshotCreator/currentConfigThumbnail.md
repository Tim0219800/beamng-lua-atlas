# `util_screenshotCreator_currentConfigThumbnail`

*File: `lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua` · VM: Game Engine (GE) · 75 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_currentConfigThumbnail`: `extensions.load("util_screenshotCreator_currentConfigThumbnail")`, then the global `util_screenshotCreator_currentConfigThumbnail`

Submodule of screenshotCreator that generates the thumbnail of a vehicle's current configuration. start() prepares an asynchronous capture: every frame (onPreRender), a coroutine resolves the framing according to the selected mode (framingManager), captures the thumbnail off-screen (5 s maximum delay) then calls the callback with the result. Only one capture can be active at a time.

## Notes

- If the framing cannot be resolved, the callback is called with success = false and the error message as the fourth argument.
- The model name is read from vehicle.jbeam or vehicle.JBeam.

**Dependencies (loaded first):** `util_screenshotCreator_settings`, `util_screenshotCreator_capture`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_procedural`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_currentConfigThumbnail.onExtensionUnloaded()` | Hook called on unload: abandons the capture in progress without calling its callback. *(internal)* *(hook)* | 70 |
| `util_screenshotCreator_currentConfigThumbnail.onPreRender()` | Hook called every frame before rendering: advances the capture coroutine. On a Lua error, logs the error, releases the capture and calls the callback with success = false. *(internal)* *(hook)* | 57 |
| `util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token)` | Starts the thumbnail capture of a vehicle. Refuses (false, "busy") if a capture is already in progress. | 43 |

### Parameter details

#### `util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token)`

Starts the thumbnail capture of a vehicle. Refuses (false, "busy") if a capture is already in progress.

- `vehicle` (*userdata*) : Vehicle to photograph
- `configName` (*string*) : Configuration name
- `outputPath` (*string*) : Path of the image file to produce
- `callback` (*function*) : callback(success, outputPath, token, errorMessage?) called at the end
- `token` (*any*) : Value returned as is to the callback
- **returns**: boolean true if the capture is started, false if busy
- **returns**: string|nil "busy" on refusal

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua`.*
