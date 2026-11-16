---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/scene.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode "scene" tab: reads and modifies the level's environment (time of day, date, clouds, fog, wind, north offset, celestial displays and meteors) via core_environment and core_celestial. It also handles saving/restoring the original state when the session opens/closes, an environment bookmark, and "scene" type presets (which include an advancedRender part handled by ui_photomode_advancedRender).
--- Access: extension `ui_photomode_scene`: `extensions.load("ui_photomode_scene")`, then the global `ui_photomode_scene`
---@class ui_photomode_scene
---@field dependencies table<integer, string> Extensions loaded before: ui_photomode_shared, ui_photomode_advancedRender, core_celestial.
ui_photomode_scene = {}

--- Applies a scene preset (time, weather, north, celestial elements) then its advancedRender part. Stops at the first failure.
---Source: lua/ge/extensions/ui/photomode/scene.lua:822
---@param state table Preset {scene=..., advancedRender=...}.
---@param options table|nil options.part: all, environment, shadows, detailTerrain, weather, celestial.
---@return table  {state=...} or {ok=false, reason}.
function ui_photomode_scene.applyPresetState(state, options) end

--- Returns the scene part to include in a capture's metadata: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial.
---Source: lua/ge/extensions/ui/photomode/scene.lua:852
---@return table  Scene state for metadata.
function ui_photomode_scene.buildMetadataState() end

--- Builds the current scene state (values clamped to the limits) from core_environment and core_celestial, with the availability table indicating which elements are readable.
---Source: lua/ge/extensions/ui/photomode/scene.lua:274
---@return table  Scene state (see getSceneState).
function ui_photomode_scene.buildState() end

--- Captures the session's default state (restored or current scene state + default advanced render). Returns nil if neither is available.
---Source: lua/ge/extensions/ui/photomode/scene.lua:812
---@return table|nil  Combined preset data.
function ui_photomode_scene.captureDefaultPresetState() end

--- Captures the current state as a preset: {scene={...}, advancedRender=...} (advancedRender comes from ui_photomode_advancedRender.buildMetadataState).
---Source: lua/ge/extensions/ui/photomode/scene.lua:808
---@return table  Combined preset data.
function ui_photomode_scene.capturePresetState() end

--- Stores the original scene state in S.sessionSceneRestoreState to restore it at the end of the session. Called at the start of the photo session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/scene.lua:296
function ui_photomode_scene.captureRestoreState() end

--- Reads the raw scene state: time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind ({x,y,z} vectors), northOverride, celestial ({meteor, display}). Unavailable values are nil.
---Source: lua/ge/extensions/ui/photomode/scene.lua:145
---@return table  Serializable raw state.
function ui_photomode_scene.captureSerializableState() end

--- Returns the current scene state (buildState) with ok = session active; reason="session_inactive" otherwise.
---Source: lua/ge/extensions/ui/photomode/scene.lua:670
---@return table  Scene state: sessionActive, bookmarkAvailable, availability, time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial, plus ok/reason.
function ui_photomode_scene.getSceneState() end

--- Reapplies the stored environment bookmark (time, weather, north, celestial elements). Requires an active session and a bookmark.
---Source: lua/ge/extensions/ui/photomode/scene.lua:609
---@return table  {ok=true, state} or {ok=false, reason, state?}.
function ui_photomode_scene.loadEnvironmentBookmark() end

--- Logs (debug level) the time of day as {time, play, dayLength} with a label. See the note on the isDebugEnabled bug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/scene.lua:214
---@param label string Message prefix.
---@param sceneState table State to display.
function ui_photomode_scene.logTimeOfDayDebug(label, sceneState) end

--- Restores the scene state saved by captureRestoreState (time, environment, north, celestial elements) then clears it. Called at the end of the photo session; does nothing if there is nothing to restore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/scene.lua:478
function ui_photomode_scene.restoreState() end

--- Stores the current environment state in S.savedEnvironmentBookmark. Requires an active session.
---Source: lua/ge/extensions/ui/photomode/scene.lua:588
---@return table  {ok=true, state} or {ok=false, reason}.
function ui_photomode_scene.saveEnvironmentBookmark() end

--- Applies a partial scene patch (time, weather, north) during a photo session and returns the new state. Fails with scene_patch_empty if nothing was applied.
---Source: lua/ge/extensions/ui/photomode/scene.lua:523
---@param partialState table Possible fields: time (0..1), play (boolean, with time), year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, northOverride (degrees), __lerpSeconds (transition seconds).
---@return table  {ok=true, state=...} or {ok=false, reason=..., state?=...}.
function ui_photomode_scene.setSceneState(partialState) end

