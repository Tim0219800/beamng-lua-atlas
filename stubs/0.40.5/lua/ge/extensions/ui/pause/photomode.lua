---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade of the photo mode integrated into the pause menu. It contains no logic: it loads the eight ui_photomode_* modules (session, camera, scene, effects, advancedRender, capture, preview, presets) and redirects about sixty functions to them via a FORWARDED_FUNCTIONS table. It also relays the engine hooks (capture metadata, pre-render, update, end of capture) to the right submodules.
--- Access: extension `ui_pause_photomode`: `extensions.load("ui_pause_photomode")`, then the global `ui_pause_photomode`
---@class ui_pause_photomode
---@field dependencies string[] List of the ui_photomode_* extensions loaded before this module.
ui_pause_photomode = {}

--- Hook called when collecting a capture's metadata; delegates to ui_photomode_preview.collectScreenshotMetadata.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:84
---@param ... any Arguments passed as is.
---@return any  Value returned by the submodule.
function ui_pause_photomode.onCollectScreenshotMetadata(...) end

--- Load hook; delegates to ui_photomode_session.handleExtensionLoaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:100
---@param ... any Arguments passed on.
function ui_pause_photomode.onExtensionLoaded(...) end

--- Unload hook; delegates to ui_photomode_session.handleExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:104
---@param ... any Arguments passed on.
function ui_pause_photomode.onExtensionUnloaded(...) end

--- Hook called before rendering; delegates to ui_photomode_capture.handlePreRender.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:88
---@param ... any Arguments passed on.
function ui_pause_photomode.onPreRender(...) end

--- Hook called when all requested captures are finished; delegates to ui_photomode_capture.onScreenshotAllDone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:96
---@param ... any Arguments passed on.
function ui_pause_photomode.onScreenshotAllDone(...) end

--- Hook called every frame; delegates to ui_photomode_preview.handleUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/photomode.lua:92
---@param ... any Arguments passed on.
function ui_pause_photomode.onUpdate(...) end

