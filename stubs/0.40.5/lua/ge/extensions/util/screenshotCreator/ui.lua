---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle Screenshot Creator (WIP)" ImGui window of the vehicle thumbnail creator. It serves as a facade for the other util_screenshotCreator_* modules: buttons to start a job ("Run selected models", "Run selected defaults", "Run current config", Stop with progress bar), opening of the showroom_v2_lighting_simple level, tabs Output, Lighting, Debug (framing mode and overlays), Node outpainting, Models selection, Manual controls and Last run review. It also handles the parking markup tagging tools (thumbnailLayer field, requires the world editor), hiding UI apps, disabling driving during adjustments and restoring the session state when the window is closed.
--- Access: extension `util_screenshotCreator_ui`: `extensions.load("util_screenshotCreator_ui")`, then the global `util_screenshotCreator_ui`
---@class util_screenshotCreator_ui
---@field dependencies string[] Extensions loaded before: ui_imgui, editor_main, core_camera, core_vehicles, core_gamestate, freeroam_freeroam and util_screenshotCreator_settings, job, lightingSetup, thumbnailConfig, framingManager, modelSelection, nodeOutpaint, shippedConfigs.
util_screenshotCreator_ui = {}

--- Hook called after reload with the serialized state; restores the UI and migrates old formats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/ui.lua:833
---@param data table|nil Serialized state.
function util_screenshotCreator_ui.onDeserialized(data) end

--- Unload hook: runs restoreSessionState (driving, UI apps, resolution, environment).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/ui.lua:158
function util_screenshotCreator_ui.onExtensionUnloaded() end

--- Serialization hook before reload: returns windowOpen, generateMissingThumbnailsOnly, reloadUIOnJobFinished, drivingEnabled, uiAppsVisible, cameraSpeed, runDone, reviewData, framingModeId, previousFov and isCameraSet.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/ui.lua:809
---@return table  UI state.
function util_screenshotCreator_ui.onSerialize() end

--- Hook called every frame: consumes the job-done flag, draws the 3D overlays and the ImGui window with its tabs, and updates the nodeOutpaint brush. When the window is closed, restores the session state once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/ui.lua:687
function util_screenshotCreator_ui.onUpdate() end

--- Opens the screenshot creator window (loads the settings if needed, initializes the editor and applies the environment).
---Source: lua/ge/extensions/util/screenshotCreator/ui.lua:785
---@return boolean  false if util_screenshotCreator_settings could not be loaded, otherwise true.
function util_screenshotCreator_ui.openWindow() end

