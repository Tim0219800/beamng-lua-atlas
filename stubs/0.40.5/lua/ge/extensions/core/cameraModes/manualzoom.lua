---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/manualzoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zoom filter. Fields: fov (current), fovDefault, fovMin, fovMax, uiTxt.
---@class core_cameraModes_manualzoom
local core_cameraModes_manualzoom = {}

--- Initializes the limits and resets the FOV to fovDefault.
---Source: lua/ge/extensions/core/cameraModes/manualzoom.lua:8
---@param fovDefault number|nil initial FOV in degrees (80)
---@param fovMin number|nil minimum FOV (10)
---@param fovMax number|nil maximum FOV (120)
---@param uiTxt string|nil message translation key (ui.camera.fov)
function core_cameraModes_manualzoom:init(fovDefault, fovMin, fovMax, uiTxt) end

--- Resets fov to fovDefault.
---Source: lua/ge/extensions/core/cameraModes/manualzoom.lua:18
function core_cameraModes_manualzoom:reset() end

--- Applies the input zoom and writes data.res.fov.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/manualzoom.lua:22
---@param data table camData
---@return boolean  true if the FOV changed by at least 0.1 degree (message displayed); false in OpenXR
function core_cameraModes_manualzoom:update(data) end

