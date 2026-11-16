---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/flash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode flash settings. Keeps the flash state in memory (enabled, fire on capture, intensity, angle, hue, saturation) and passes it to the util/photomodeFlash extension, which it loads on demand. Acts as a facade for the photo mode UI panel and for the capture module (ui_photomode_capture) which triggers captures with flash.
--- Access: extension `ui_photomode_flash`: `extensions.load("ui_photomode_flash")`, then the global `ui_photomode_flash`
---@class ui_photomode_flash
ui_photomode_flash = {}

--- Applies a preset state (merge then applyRuntimeSettings). Does nothing if the argument is not a table.
---Source: lua/ge/extensions/ui/photomode/flash.lua:95
---@param flashState table Flash state from a preset
---@return boolean  success
---@return string|nil  failure reason
function ui_photomode_flash.applyPresetState(flashState) end

--- If the flash is disabled, turns off util/photomodeFlash (enable(false)). Otherwise loads this extension and calls applyFromUi with the current settings.
---Source: lua/ge/extensions/ui/photomode/flash.lua:103
---@return boolean  success
---@return string|nil  failure reason (flash_unavailable, flash_apply_failed...)
function ui_photomode_flash.applyRuntimeSettings() end

--- Merges into the state the fields present in partialState (enabled and fireOnCapture converted to booleans). Does not act on the render engine.
---Source: lua/ge/extensions/ui/photomode/flash.lua:82
---@param partialState table Fields to change; any other type is ignored
---@return boolean  always true
function ui_photomode_flash.applyStatePatch(partialState) end

--- Returns a copy of the flash state: enabled, fireOnCapture, intensity, outerAngle, hue, saturation.
---Source: lua/ge/extensions/ui/photomode/flash.lua:63
---@return table  Serializable flash state
function ui_photomode_flash.buildState() end

--- Returns a flash state with default values, without modifying the current state.
---Source: lua/ge/extensions/ui/photomode/flash.lua:78
---@return table  Default values
function ui_photomode_flash.captureDefaultPresetState() end

--- Flash state to save in a preset (same as buildState).
---Source: lua/ge/extensions/ui/photomode/flash.lua:74
---@return table  Current state
function ui_photomode_flash.capturePresetState() end

--- Number of frames during which to keep the UI hidden/frozen during a capture with flash: 5 if flash enabled and fireOnCapture, otherwise 0.
---Source: lua/ge/extensions/ui/photomode/flash.lua:147
---@return integer  0 or 5
function ui_photomode_flash.getCaptureUiHoldFrames() end

--- Turns off the flash on the engine side then resets the Lua settings to default values.
---Source: lua/ge/extensions/ui/photomode/flash.lua:154
function ui_photomode_flash.resetSettings() end

--- Turns off the flash on the engine side (util/photomodeFlash.enable(false)) if it is loaded, without touching the Lua settings.
---Source: lua/ge/extensions/ui/photomode/flash.lua:159
function ui_photomode_flash.restoreRuntimeState() end

--- Delegates a capture to util/photomodeFlash.runCapture(kind, ...) with the call protected by pcall.
---Source: lua/ge/extensions/ui/photomode/flash.lua:130
---@param kind any Capture type passed as is to util/photomodeFlash (inferred from code)
---@param ... any Additional arguments passed as is
---@return boolean  true if the capture was requested
---@return string|nil  failure reason (screenshot_request_failed by default)
function ui_photomode_flash.runCapture(kind, ...) end

