---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capture submodule of the screenshotCreator tool: takes an off-screen capture of a vehicle from a given camera, via a dedicated render view (render_renderViews, "thumbnailScreenshot" view). The UI and markers are not displayed; the render view takes the main view's exposure and waits 1 s by default for post-processing effects to converge. The capture is rendered at resolution × supersampling then downscaled.
--- Access: extension `util_screenshotCreator_capture`: `extensions.load("util_screenshotCreator_capture")`, then the global `util_screenshotCreator_capture`
---@class util_screenshotCreator_capture
---@field dependencies table
util_screenshotCreator_capture = {}

--- Captures an off-screen thumbnail and waits for it to finish (coroutine). Uses the main view's far plane distance so that depth-based effects (depth blur) stay consistent.
---Source: lua/ge/extensions/util/screenshotCreator/capture.lua:16
---@param filepath string Output image file
---@param camera table Camera {pos, rot, ...}
---@param options table resolution {width, height}, supersampling, fov, nearPlane, captureTimeout (seconds, default 5, minimum 0.1)
---@return boolean  true if the capture succeeded and the file exists with a non-zero size
function util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options) end

--- Starts the capture via render_renderViews.takeScreenshot without waiting (asynchronous). Warns and calls the callback with no argument if filepath or camera (pos and rot) are invalid.
---Source: lua/ge/extensions/util/screenshotCreator/capture.lua:33
---@param filepath string Output image file
---@param camera table Camera {pos, rot, fov?, nearPlane?, screenshotDelay?}
---@param callback function|nil Called at the end with the capture result
---@param uniqueId any Not used in this function
---@param options table|nil resolution, supersampling, fov, nearPlane, farClip
function util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options) end

