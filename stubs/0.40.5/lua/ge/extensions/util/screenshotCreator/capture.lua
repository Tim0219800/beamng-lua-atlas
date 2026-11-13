---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_capture` : `extensions.load("util_screenshotCreator_capture")`, puis la globale `util_screenshotCreator_capture`
---@class util_screenshotCreator_capture
---@field dependencies table
util_screenshotCreator_capture = {}

--- Offscreen thumbnail, must be called from a coroutine.
---  Nothing on screen is touched, the render view hides the UI and markersS.
---Source : lua/ge/extensions/util/screenshotCreator/capture.lua:16
---@param filepath any
---@param camera any
---@param options any
function util_screenshotCreator_capture.captureFramedThumbnail(filepath, camera, options) end

---Source : lua/ge/extensions/util/screenshotCreator/capture.lua:33
---@param filepath any
---@param camera any
---@param callback any
---@param uniqueId any
---@param options any
function util_screenshotCreator_capture.takeThumbnailScreenshot(filepath, camera, callback, uniqueId, options) end

