---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/advancedRender.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Advanced photo mode render settings: detail fineness (detailAdjust), terrain LOD scale, grass density, shadow quality, vehicle shadows, "last split casters" and cloud quality. The module reads and writes these values in the graphics settings and engine variables (via ui_photomode_shared), stores the session's initial state so it can be restored, and manages a settings bookmark. It serves as the backend of the photo mode "advanced render" panel and of presets.
--- Access: extension `ui_photomode_advancedRender`: `extensions.load("ui_photomode_advancedRender")`, then the global `ui_photomode_advancedRender`
---@class ui_photomode_advancedRender
---@field dependencies string[] {"ui_photomode_shared", "core_settings_graphic"}
ui_photomode_advancedRender = {}

--- Applies a preset (partial patch). A non-table state is treated as an empty patch, which returns an advanced_render_patch_empty error.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:589
---@param state table Preset state
---@return table  {state} on success, otherwise {ok = false, reason}
function ui_photomode_advancedRender.applyPresetState(state) end

--- Subset of the state to write into a photo's metadata: the seven settings without the UI fields.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:602
---@return table  Settings only
function ui_photomode_advancedRender.buildMetadataState() end

--- Builds the advanced render display state (same function as the local buildAdvancedRenderState).
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:254
---@return table  State with values, availability, defaults, sessionActive, bookmarkAvailable
function ui_photomode_advancedRender.buildState() end

--- Default state for a preset: the session's starting state, or nil if it was not captured.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:581
---@return table|nil  Initial settings
function ui_photomode_advancedRender.captureDefaultPresetState() end

--- State to save in a preset (same as buildMetadataState).
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:577
---@return table  Settings
function ui_photomode_advancedRender.capturePresetState() end

--- Captures the session's starting state for later restoration. Called at the start of a photo mode session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:267
function ui_photomode_advancedRender.captureRestoreState() end

--- Returns the current state (values, availability, defaults, sessionActive, bookmarkAvailable) with ok (session active and setting enabled) and reason (advanced_render_disabled or session_inactive).
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:548
---@return table  Display state
function ui_photomode_advancedRender.getAdvancedRenderState() end

--- Indicates whether advanced render is enabled by default: true when the game is not a shipping build.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:60
---@return boolean  enabled by default
function ui_photomode_advancedRender.getDefaultEnabled() end

--- Returns the effective enablement: the override set by setAdvancedRenderTuningEnabled if it exists, otherwise getDefaultEnabled().
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:68
---@return boolean  setting active
function ui_photomode_advancedRender.isTuningEnabled() end

--- Indicates whether the UI should offer to unlock advanced render: true only in a shipping build.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:64
---@return boolean  unlock visible
function ui_photomode_advancedRender.isUnlockVisible() end

--- Reapplies the saved bookmark.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:513
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.loadAdvancedRenderBookmark() end

--- Resets the settings to the state captured at the start of the session.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:450
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.resetAdvancedRenderToDefaults() end

--- Restores the state captured at the start of the session, then forgets it. Called at the end of the session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:401
function ui_photomode_advancedRender.restoreState() end

--- Stores the current state as the session bookmark.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:486
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.saveAdvancedRenderBookmark() end

--- Applies a partial patch of the settings (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Numbers are clamped, modes validated.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:415
---@param partialState table Fields to change
---@return table  {ok, reason?, state?}
function ui_photomode_advancedRender.setAdvancedRenderState(partialState) end

--- Enables or disables advanced tuning (session override). Also returns the photo mode capabilities and, if enabled during a session, the current state.
---Source: lua/ge/extensions/ui/photomode/advancedRender.lua:559
---@param value boolean true by default if the value is not a recognized boolean (inferred from code)
---@return table  {ok = true, enabled, capabilities, state?}
function ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value) end

