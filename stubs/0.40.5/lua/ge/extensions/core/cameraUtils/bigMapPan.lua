---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraUtils/bigMapPan.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared helper for smooth movement and zoom for the big map camera modes (bigMap / bigMapOrtho). Placed outside cameraModes/ because the files in that folder are automatically loaded as camera constructors. The functions directly modify the fields of the camera mode passed as a parameter (cam).
--- Access: extension `core_cameraUtils_bigMapPan`: `extensions.load("core_cameraUtils_bigMapPan")`, then the global `core_cameraUtils_bigMapPan`
---@class core_cameraUtils_bigMapPan
core_cameraUtils_bigMapPan = {}

--- Sets cam.panTarget to center the view on worldPos: x,y = worldPos minus the offset; z = that of cam.bigMapCamPosition (otherwise that of worldPos). Does nothing if worldPos is nil.
---Source: lua/ge/extensions/core/cameraUtils/bigMapPan.lua:11
---@param cam table calling camera mode
---@param worldPos vec3|nil world point to center on
---@param lookAtOffset vec3|nil camera -> aimed point vector (camToLookAtPoint) of the calling mode; (0,0,0) by default
function core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset) end

--- To call every frame: moves manualzoom.fov toward zoomTarget and bigMapCamPosition (x,y) toward panTarget, and cancels the targets if the user moves or zooms.
---Source: lua/ge/extensions/core/cameraUtils/bigMapPan.lua:25
---@param cam table calling camera mode
---@param dt number frame duration in seconds
---@param userMoving boolean true if the user is moving the camera (cancels the targets)
function core_cameraUtils_bigMapPan.update(cam, dt, userMoving) end

--- Sets cam.zoomTarget by interpolation between fovMax (factor 0, zoomed out) and fovMin (factor 1, zoomed in).
---Source: lua/ge/extensions/core/cameraUtils/bigMapPan.lua:19
---@param cam table calling camera mode
---@param factor number 0 = zoomed out (fovMax), 1 = zoomed in (fovMin); clamped to [0,1], non-numeric = 0
function core_cameraUtils_bigMapPan.zoomToFactor(cam, factor) end

