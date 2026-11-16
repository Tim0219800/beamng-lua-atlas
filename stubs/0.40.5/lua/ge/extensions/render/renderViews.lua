---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/renderViews.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Takes screenshots from an independent virtual camera (RenderView): you give position, rotation, resolution, FOV and object masks, the module creates a named render view, waits a short time, saves the image to disk (PNG, optionally downscaled) then destroys the view. Useful for thumbnails, vehicle previews or masks. During the capture it hides CEF, imgui and gameplay markers. Global: render_renderViews.
--- Access: extension `render_renderViews`: `extensions.load("render_renderViews")`, then the global `render_renderViews`
---@class render_renderViews
render_renderViews = {}

--- Creates a RenderView according to the options, schedules a job that hides the UI, saves the image to options.filename, destroys the view, restores the UI and AA, then calls the callback.
---Source: lua/ge/extensions/render/renderViews.lua:78
---@param options table {pos: vec3, rot: quat, filename: string, resolution?: vec3 (px), downscaleFactor?: number, fov?: number°, nearPlane?: number m, farClip?: number m, renderViewName?: string, renderViewMaskBit?: integer, usePostEffects?: boolean, clearColor?: ColorF (inferred from code), objectTypeWhitelistMask?/objectTypeBlacklistMask?/shadowCasterObjectTypeWhitelistMask?/shadowCasterObjectTypeBlacklistMask?: integer, focusObjects?: object[], manualEV?: number, currentExposure?: number, copyMainViewExposure?: boolean, allowAntialiasing?: boolean, screenshotDelay?: number s}
---@param callback function|nil function(success: boolean) called at the end.
function render_renderViews.takeScreenshot(options, callback) end

