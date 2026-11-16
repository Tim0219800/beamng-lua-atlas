---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/graphic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graphics settings: display mode (windowed, fullscreen, borderless), resolution, refresh rate, display driver, HDR, anti-aliasing, upscaling, quality groups (meshes, textures, lighting, shadows, terrain, clouds, dynamic reflections and mirrors, clustered lighting), post-processing (DOF, motion blur, SSAO, SSR, screen-space shadows) and global presets (settingsPresets.json). It provides core_settings_settings with the "option helpers" (get/set) of these settings and applies the video state to the Canvas. A modder mostly uses it via core_settings_settings.setValue; setPresetOverride lets you temporarily enforce a preset.
--- Access: extension `core_settings_graphic`: `extensions.load("core_settings_graphic")`, then the global `core_settings_graphic`
---@class core_settings_graphic
core_settings_graphic = {}

--- Applies the chosen video mode to the engine: requests saving, sets the display device (GFXDevice.setDisplayDevice) and the video mode (width, height, refresh rate, mode), applies HDR, restores the window position, then sets the rendering mode (SingleMonitor or MultiMonitor depending on GraphicTripleMonitorEnabled and the triple-screen FOVs). Ignored if already in progress, or if the Canvas is absent (after the save request).
---Source: lua/ge/extensions/core/settings/graphic.lua:263
function core_settings_graphic.applyGraphicsState() end

--- Intended to automatically choose a quality based on video memory; entirely commented out in the code, so inactive.
---Source: lua/ge/extensions/core/settings/graphic.lua:2032
function core_settings_graphic.autoDetectApplyGraphicsQuality() end

--- Builds and stores the table of graphics options (get/set/getModes and optionally sanitize, init, onSettingsChanged per option). Called by core_settings_settings.initSettings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:494
---@return table<string, table>  Helpers by setting name.
function core_settings_graphic.buildOptionHelpers() end

--- Returns the display information collected at startup (GPU, screens...) for the UI.
---Source: lua/ge/extensions/core/settings/graphic.lua:2117
---@return table  Display information (structure inferred from gatherDisplayInformation).
function core_settings_graphic.getDisplayInformation() end

--- Returns a specific option helper or the whole graphics options table.
---Source: lua/ge/extensions/core/settings/graphic.lua:2113
---@param optionName string|nil Option name (e.g. 'GraphicDisplayModes'). nil = the whole table.
---@return table|nil  Option helper, or full table.
function core_settings_graphic.getOptions(optionName) end

--- Returns the table of global presets read from lua/ge/extensions/core/settings/settingsPresets.json.
---Source: lua/ge/extensions/core/settings/graphic.lua:2179
---@return table<string, table>  Presets by name.
function core_settings_graphic.getOverallQualityPresets() end

--- Returns the active preset override.
---Source: lua/ge/extensions/core/settings/graphic.lua:2178
---@return table|nil  {name, enforce} or nil.
function core_settings_graphic.getPresetOverride() end

--- Called by core_settings_settings.load: refreshGraphicsState(newState) then applyGraphicsState().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:2014
---@param newState table<string, any> Full settings.
function core_settings_graphic.load(newState) end

--- Hook called at the end of settings initialization: if $forceFullscreen is true, forces the default settings in fullscreen; shows the window (canvas:showWindow), collects display information and cleans up the anti-aliasing type. No effect if the Canvas does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:1880
function core_settings_graphic.onFirstUpdateSettings() end

--- Hook called by core_settings_settings.initSettings: calls init(value) on each graphics option that has one, with the value read.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:1867
---@param data table<string, any> Values read from the settings.
function core_settings_graphic.onInitSettings(data) end

--- Called after every settings save. With an active override: re-enforces the preset if enforce, otherwise does nothing. Without an override: reruns GraphicPlatformPreset.onSettingsChanged and GraphicOverallQuality.onSettingsChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:2156
function core_settings_graphic.onSettingsChanged() end

--- UI state change hook. On entering 'menu.options.graphics', stores the display state; on leaving, if the changes were not applied, restores the old mode, resolution and refresh rate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:1997
---@param toState string New state.
---@param fromState string Old state.
function core_settings_graphic.onUiChangedState(toState, fromState) end

--- Update hook: counts down the deferred timers for the render scale and the HDR output mode, then applies them on expiry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/graphic.lua:2083
---@param dtReal number|nil Real frame duration in seconds.
function core_settings_graphic.onUpdate(dtReal) end

--- Opens the rendering "Coconut" debug window (Engine.Render.setCoconutWindowOpen(true)). No effect in a shipping build.
---Source: lua/ge/extensions/core/settings/graphic.lua:2022
function core_settings_graphic.openCoconutWindow() end

--- Empty body: does nothing.
---Source: lua/ge/extensions/core/settings/graphic.lua:2019
function core_settings_graphic.openMonitorConfiguration() end

--- Synchronizes the internal state (mode, driver, resolution, refresh rate, window placement) with a new settings state, cleans up invalid values (sanitize), notifies the UI and emits the hook onDisplayModeChanged(oldMode, newMode) if the mode changed. A WindowPlacement change is saved immediately.
---Source: lua/ge/extensions/core/settings/graphic.lua:1904
---@param newState table<string, any> Settings containing GraphicDisplayDriver, GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, WindowPlacement (all optional).
function core_settings_graphic.refreshGraphicsState(newState) end

--- Enforces a global preset without changing the saved GraphicOverallQuality choice. Passing nil releases the override and restores the saved preset. With enforce = true, the values are re-enforced on every settings change.
---Source: lua/ge/extensions/core/settings/graphic.lua:2148
---@param override {name: string, enforce: boolean}|nil name = name of a preset from settingsPresets.json.
---@return boolean  false if the preset is not found, otherwise true.
function core_settings_graphic.setPresetOverride(override) end

--- Toggles fullscreen/windowed on the Canvas (canvas:toggleFullscreen) if it exists.
---Source: lua/ge/extensions/core/settings/graphic.lua:2105
function core_settings_graphic.toggleFullscreen() end

