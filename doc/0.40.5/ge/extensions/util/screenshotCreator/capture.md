# `util_screenshotCreator_capture`

*File: `lua/ge/extensions/util/screenshotCreator/capture.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_capture`: `extensions.load("util_screenshotCreator_capture")`, then the global `util_screenshotCreator_capture`

Capture submodule of the screenshotCreator tool: takes an off-screen capture of a vehicle from a given camera, via a dedicated render view (render_renderViews, "thumbnailScreenshot" view). The UI and markers are not displayed; the render view takes the main view's exposure and waits 1 s by default for post-processing effects to converge. The capture is rendered at resolution × supersampling then downscaled.

## Notes

- captureFramedThumbnail must be called from a coroutine: it waits with coroutine.yield until the capture is finished or the maximum delay is reached.
- Default resolution 500x281, default supersampling 4, default field of view 20 degrees, default near plane 0.1.
- The existing file is deleted before the capture. The "Saved screenshot" message is logged before the capture is finished.
- The render view mask (bit 63) is that of the reflection map.

**Dependencies (loaded first):** `render_renderViews`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options)` | Captures an off-screen thumbnail and waits for it to finish (coroutine). Uses the main view's far plane distance so that depth-based effects (depth blur) stay consistent. | 16 |
| `util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options)` | Starts the capture via render_renderViews.takeScreenshot without waiting (asynchronous). Warns and calls the callback with no argument if filepath or camera (pos and rot) are invalid. | 33 |

### Parameter details

#### `util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options)`

Captures an off-screen thumbnail and waits for it to finish (coroutine). Uses the main view's far plane distance so that depth-based effects (depth blur) stay consistent.

- `filepath` (*string*) : Output image file
- `camera` (*table*) : Camera {pos, rot, ...}
- `options` (*table*) : resolution {width, height}, supersampling, fov, nearPlane, captureTimeout (seconds, default 5, minimum 0.1)
- **returns**: boolean true if the capture succeeded and the file exists with a non-zero size

#### `util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options)`

Starts the capture via render_renderViews.takeScreenshot without waiting (asynchronous). Warns and calls the callback with no argument if filepath or camera (pos and rot) are invalid.

- `filepath` (*string*) : Output image file
- `camera` (*table*) : Camera {pos, rot, fov?, nearPlane?, screenshotDelay?}
- `callback` (*function|nil*) : Called at the end with the capture result
- `uniqueId` (*any*) : Not used in this function
- `options` (*table|nil*) : resolution, supersampling, fov, nearPlane, farClip

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Calls into the engine (C++)

- `FS:` `fileExists`, `fileSize`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/capture.lua`.*
