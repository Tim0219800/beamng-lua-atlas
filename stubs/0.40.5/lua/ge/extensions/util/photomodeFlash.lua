---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomodeFlash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode flash: creates a spotlight (SpotLight, with shadows, not saved in the level) attached to the camera during photo mode, aimed at the target point (raycast from the camera, otherwise the DOF focus distance). Two modes: "always" (continuously on) and "pulse" (on only during the capture). In pulse mode, runCapture waits 2 warm-up frames, triggers the capture via the screenshot module, then turns the flash off on receiving onScreenshotAllDone (or after 60 fallback frames). The photo mode UI calls applyFromUi.
--- Access: extension `util_photomodeFlash`: `extensions.load("util_photomodeFlash")`, then the global `util_photomodeFlash`
---@class util_photomodeFlash
---@field capturePulseActive boolean true during a flash pulse tied to a capture
---@field enabled boolean true if the flash is active (the spotlight exists)
---@field hue integer Color hue in degrees, 0 to 360 (default 0)
---@field intensity number Spotlight intensity (default 25000, from 0 to 1,000,000)
---@field mode string "always" (continuous) or "pulse" (only during a capture)
---@field outerAngle integer Outer cone angle in degrees (default 55, from 1 to 179)
---@field saturation integer Saturation in percent, 0 to 100 (default 0: white light)
util_photomodeFlash = {}

--- Applies the settings coming from the photo mode UI: clamps the values then enables the flash (or disables it if enabled is not true).
---Source: lua/ge/extensions/util/photomodeFlash.lua:330
---@param enabled boolean Enables the flash (disables otherwise)
---@param fireOnCapture boolean true for pulse mode, otherwise always
---@param intensity number Intensity (0 to 1,000,000)
---@param outerAngle number Outer angle in degrees (1 to 179)
---@param hue number Hue in degrees (0 to 360)
---@param saturation number Saturation in percent (0 to 100)
function util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation) end

--- Enables or disables the flash: on activation creates the SpotLight in MissionGroup and aims it; on deactivation removes it. Cancels any pending pulse.
---Source: lua/ge/extensions/util/photomodeFlash.lua:268
---@param en boolean true to enable (any other value disables)
function util_photomodeFlash.enable(en) end

--- Hook called on unload: disables the flash and removes the spotlight.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/photomodeFlash.lua:402
function util_photomodeFlash.onExtensionUnloaded() end

--- Hook called every frame before rendering: repositions the spotlight on the camera and advances the pulse state machine (warm-up, capture, cleanup, fallback delay).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/photomodeFlash.lua:346
---@param dtReal number Real-time delta (unused)
---@param dtSim number Simulation time delta (unused)
---@param dtRaw number Raw time delta (unused)
function util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook called when all in-progress screenshots are done: starts the cleanup (turning the flash off) of a pending pulse. Ignored if photo mode is not open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/photomodeFlash.lua:394
function util_photomodeFlash.onScreenshotAllDone() end

--- Triggers a screenshot taking the flash into account: direct if the flash is inactive or in always mode, with a light pulse in pulse mode.
---Source: lua/ge/extensions/util/photomodeFlash.lua:291
---@param kind string Capture type (see notes)
---@param ... any Arguments passed to the corresponding screenshot module function _anon(up to 6 depending on the type)
---@return boolean  true if the capture is started or scheduled
---@return string|nil  Error code: "capture_busy" or "screenshot_request_failed"
function util_photomodeFlash.runCapture(kind, ...) end

