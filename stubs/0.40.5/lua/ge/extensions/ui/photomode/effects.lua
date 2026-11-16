---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/effects.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode post-processing effects: depth of field (DOF, with autofocus), SSAO, specular occlusion, screen-space shadows, SSR reflections, motion blur, dynamic reflections and mirror quality, occupant visibility, plus the flash state (delegated to ui_photomode_flash). The module reads and writes these values via the scenetree postFX objects, the $DOFPostFx::* variables and the graphics settings, saves the session's starting state (including to disk with ui_photomode_postFxPersistence) and restores it at the end.
--- Access: extension `ui_photomode_effects`: `extensions.load("ui_photomode_effects")`, then the global `ui_photomode_effects`
---@class ui_photomode_effects
---@field dependencies string[] ui_photomode_shared, ui_photomode_postFxPersistence, ui_photomode_flash, core_settings_graphic
ui_photomode_effects = {}

--- Applies an effects preset, in full or for a part (options.part), then delegates the flash sub-table to ui_photomode_flash.applyPresetState.
---Source: lua/ge/extensions/ui/photomode/effects.lua:854
---@param state table Preset state
---@param options table|nil {part = part name} (optional)
---@return table  {state} on success, otherwise {ok = false, reason}
function ui_photomode_effects.applyPresetState(state, options) end

--- Subset of the state to write into a photo's metadata: the 16 effect settings plus flash.
---Source: lua/ge/extensions/ui/photomode/effects.lua:882
---@return table  Settings
function ui_photomode_effects.buildMetadataState() end

--- Builds the effects display state (same function as the local buildEffectsState).
---Source: lua/ge/extensions/ui/photomode/effects.lua:406
---@return table  State with values, availability, defaults, sessionActive, flash
function ui_photomode_effects.buildState() end

--- Default state for a preset (the session's starting state, with the default flash), or nil if the starting state was not captured.
---Source: lua/ge/extensions/ui/photomode/effects.lua:798
---@return table|nil  Initial settings
function ui_photomode_effects.captureDefaultPresetState() end

--- State to save in a preset (same as buildMetadataState).
---Source: lua/ge/extensions/ui/photomode/effects.lua:794
---@return table  Settings
function ui_photomode_effects.capturePresetState() end

--- Captures the session's starting state and saves it via ui_photomode_postFxPersistence.saveRestoreState (merged with the persisted version), for restoration at the end. Called at the start of a photo mode session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/effects.lua:420
function ui_photomode_effects.captureRestoreState() end

--- Reads the current values directly from the engine (postFX objects, $DOFPostFx::* variables, graphics settings) and returns them in raw form; unreadable values are nil.
---Source: lua/ge/extensions/ui/photomode/effects.lua:355
---@return table  Raw state
function ui_photomode_effects.captureSerializableState() end

--- Returns the current effects state (values, availability, defaults, defaultsAvailable, sessionActive, flash) with ok = session active, and reason = session_inactive otherwise.
---Source: lua/ge/extensions/ui/photomode/effects.lua:785
---@return table  Display state
function ui_photomode_effects.getEffectsState() end

--- Reapplies the state captured at the start of the session, including the flash.
---Source: lua/ge/extensions/ui/photomode/effects.lua:755
---@return table  {ok, reason?, state?}
function ui_photomode_effects.resetEffectsToDefaults() end

--- Restores the starting state (re-read from persistence if it succeeded, otherwise from memory): first the non-DOF effects, then the DOF. Called at the end of a session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/effects.lua:707
function ui_photomode_effects.restoreState() end

--- Applies a partial effects patch: dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (aliases ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Numeric values clamped, modes validated. Stops at the first error (fields already applied stay applied).
---Source: lua/ge/extensions/ui/photomode/effects.lua:726
---@param partialState table Fields to change
---@return table  {ok, reason?, state}
function ui_photomode_effects.setEffectsState(partialState) end

