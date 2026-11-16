---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/generalSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "general" settings provider of the multiseat settings window. It declares the fields: same vehicle for everyone, gather vehicles, reseat all players, automatic color, player markers and split screen layout for 2 to 9+ players; then it handles their actions, changes, validation and application via the onXxxMultiseatGameSetting(s) hooks.
--- Access: extension `ui_multiseat_generalSettings`: `extensions.load("ui_multiseat_generalSettings")`, then the global `ui_multiseat_generalSettings`
---@class ui_multiseat_generalSettings
ui_multiseat_generalSettings = {}

--- Saves automatic color and layouts, refreshes render_splitScreen, gathers the vehicles (gatherVehicles) and reseats the players (reseatAllPlayers) if requested, then resets these two fields to zero via result.valueOverrides.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/generalSettings.lua:201
---@param stagedSettings table Settings staged per provider.
---@param _activeSettings table Active settings (unused).
---@param result table Result table (valueOverrides).
function ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result) end

--- Adds the "general" provider (placement afterVehicles, applyMode apply) with all its fields to providers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/generalSettings.lua:107
---@param providers table[] List of settings providers to complete.
function ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers) end

--- Handles the action of the sameVehicleForEveryone field: "selector" opens the vehicle selector for all players, otherwise the chosen vehicle is staged for all. The result is written to result.success. Ignored for other providers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/generalSettings.lua:142
---@param providerId string Provider identifier ("general").
---@param fieldId string Field identifier.
---@param result table Result table (success).
---@param value any Chosen value.
function ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value) end

--- Reacts to a field change: automaticColor is staged for all players; showPlayerMarkers is applied immediately (core_multiseat.setPlayerMarkersEnabled, otherwise the multiseatTags setting).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/generalSettings.lua:153
---@param providerId string Provider identifier.
---@param fieldId string Field identifier.
---@param value any New value.
function ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value) end

--- Validates the staged settings: provider presence, boolean showPlayerMarkers and automaticColor, valid layouts for each player count. Writes result.success = false and result.reason on error.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/generalSettings.lua:166
---@param stagedSettings table Settings staged per provider.
---@param _activeSettings table Active settings (unused).
---@param result table Result table (success, reason).
function ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result) end

