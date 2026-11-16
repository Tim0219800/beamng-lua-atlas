---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logic of the multi-seat settings screen (routes "pause.multiseatSettings" and "pause.multiseatSettings.vehicleSelector"). It collects the settings providers from other extensions (hook onGetMultiseatGameSettings), keeps active values and staged values, builds the screen data for the Vue UI, applies or abandons changes and handles exit confirmation. Actions on players/devices are delegated to ui_multiseat_multiseatVehicles. A modder adds settings by answering the hook onGetMultiseatGameSettings.
--- Access: extension `ui_multiseat_multiseatSettings`: `extensions.load("ui_multiseat_multiseatSettings")`, then the global `ui_multiseat_multiseatSettings`
---@class ui_multiseat_multiseatSettings
---@field dependencies table<integer, string> Extensions loaded before: ui_multiseat_generalSettings, ui_multiseat_multiseatConfiguration, ui_multiseat_multiseatVehicles, ui_gridSelectorRouteLifecycleCallbacks, ui_pause_routeLifecycleCallbacks.
ui_multiseat_multiseatSettings = {}

--- Applies the staged changes: validates (hook onValidateMultiseatGameSettings), prepares the vehicles, applies the player configuration (commitCore), finalizes the vehicles, calls onApplyMultiseatGameSettings then onMultiseatSettingsApplied. On failure the configuration is restored (rollbackCommit).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:319
---@param options table|nil exitAfterApply = true passes the flag to the hooks (result.exitAfterApply).
---@return table  {success, reason?, requiresRestart?, exitAfterApply?, ...}; {success = true} if there are no changes.
function ui_multiseat_multiseatSettings.applyStagedSettings(options) end

--- Cancels the pending exit navigation.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:516
function ui_multiseat_multiseatSettings.cancelExit() end

--- Route exit guard: if there are unapplied changes, stores the targeted navigation and shows a box (cancel, discard, apply) then returns false to block the exit. Returns true if the exit is allowed.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:470
---@param route table Targeted route (name field).
---@param params table|nil Navigation parameters.
---@param context table|nil Context (routeName, options).
---@return boolean  true to allow the exit.
function ui_multiseat_multiseatSettings.confirmExit(route, params, context) end

--- Applies the staged settings then resumes the pending navigation; on failure, cancels the navigation and returns the result.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:525
---@return table|any  Failure result, otherwise navigation result.
function ui_multiseat_multiseatSettings.confirmExitApplying() end

--- Resumes the pending navigation without applying; staged values are lost on close (closeSettings).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:521
---@return any  Result of ui_router.navigate, or false.
function ui_multiseat_multiseatSettings.confirmExitDiscarding() end

--- Quits multiseat: caches the assignments if no staged players remain, applies pending changes if only one player remains, calls ui_multiseat_freeroam.exitMultiseat then closes the menu.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:432
---@return boolean  true if the exit and the menu closing succeeded.
function ui_multiseat_multiseatSettings.confirmMultiseatExit() end

--- Moves a device to the next player (delegated to multiseatVehicles).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:543
---@param deviceId string Device identifier.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId) end

--- Abandons the staged values (back to active values), clears the assignment cache if multiseat is not active, abandons the configuration and the vehicle changes.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:399
---@return table|nil  Updated screen data.
function ui_multiseat_multiseatSettings.discardStagedSettings() end

--- Builds the screen data: components "personas", "settings" (one per provider), "vehicles", title, flags active, dirty, discardDirty, applyMode ("none", "apply" or "restart"), readyToPlay and busy. Opens the multiseatConfiguration transaction if needed. Returns nil if the screen is not open.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:213
---@return table|nil  Screen data.
function ui_multiseat_multiseatSettings.getScreenData() end

--- Makes a platform-managed device group join.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:583
---@param groupId integer Group identifier.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.joinDeviceGroup(groupId) end

--- Removes a player (and its group).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:591
---@param player integer Player index.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.leaveDeviceGroup(player) end

--- Moves a device to the previous or next player.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:559
---@param deviceId string Device identifier.
---@param direction integer -1 or 1.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction) end

--- Sends the UI event MultiseatSettingsChanged so that the screen reloads.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:625
function ui_multiseat_multiseatSettings.notifyScreenChanged() end

--- Hook called at the end of the level; resets all state (values, pause, pending exits).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:661
function ui_multiseat_multiseatSettings.onClientEndMission() end

--- Hook called when the extension is unloaded; releases the pause request.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:671
function ui_multiseat_multiseatSettings.onExtensionUnloaded() end

--- Hook called when the local participants change; notifies the screen except during a vehicle synchronization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:629
function ui_multiseat_multiseatSettings.onLocalParticipantsChanged() end

--- Entry callback of the settings route: marks the screen open and pauses the game.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:634
function ui_multiseat_multiseatSettings.onSettingsEnter() end

--- Exit callback of the settings route: calls ui_pause_routeLifecycleCallbacks.onPauseLeave then closes the settings if the targeted route is no longer part of them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:639
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data) end

--- Entry callback of the vehicle selector route: marks the screen open, pauses the game and delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:644
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data) end

--- Exit callback of the selector route: delegates to gridSelector and pause, informs multiseatVehicles then closes the settings if the targeted route is no longer part of them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:654
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data) end

--- Mount callback of the selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:650
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data) end

--- Opens the vehicle selector for a player (delegated to multiseatVehicles).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:599
---@param player integer Player index.
---@return any  Result of multiseatVehicles.openVehicleSelectorForPlayer.
function ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player) end

--- Emits the hook onPlayMultiseatGameSettings; a game mode can start the game there by setting result.success = true.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:619
---@return table  {success = boolean}.
function ui_multiseat_multiseatSettings.play() end

--- Forgets a disconnected device.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:575
---@param deviceId string Device identifier.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.removeDevice(deviceId) end

--- Shows a confirmation box to quit multiseat (confirmation button: confirmMultiseatExit). Does nothing if multiseat is not active.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:410
---@return boolean  false if multiseat is not active.
function ui_multiseat_multiseatSettings.requestMultiseatExit() end

--- Executes a field of type "action" or "actionSelect" via the hook onMultiseatGameSettingAction. Reloads the screen if the action succeeded.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:298
---@param providerId string Provider identifier.
---@param fieldId string Field identifier.
---@param value any Chosen option (actionSelect only).
---@return table  {success = boolean, data = screen data}.
function ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value) end

--- Assigns a device to a given persona.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:567
---@param deviceId string Device identifier.
---@param personaNumber integer|nil Persona number, nil or 0 to unassign.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber) end

--- Stages a player's icon.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:611
---@param player integer Player index.
---@param icon string Icon identifier (inferred from code).
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon) end

--- Stages a player's opt-in or exit (via ui_multiseat_multiseatVehicles.stagePlayerOptIn).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:535
---@param player integer Player index.
---@param optedIn boolean true to sign up.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn) end

--- Stages a player's vehicle preferences.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:603
---@param player integer Player index.
---@param preferences table Preferences (inferred from code).
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences) end

--- Stages a field's value (normalized according to its options) and emits onMultiseatGameSettingChanged. Invalid value or field: the screen is simply returned unchanged.
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:275
---@param providerId string Provider identifier.
---@param fieldId string Field identifier.
---@param value any New value.
---@return table|nil  Updated screen data.
function ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value) end

--- Assigns/unassigns a device (delegated to multiseatVehicles).
---Source: lua/ge/extensions/ui/multiseat/multiseatSettings.lua:551
---@param deviceId string Device identifier.
---@return table  {success, data}.
function ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId) end

