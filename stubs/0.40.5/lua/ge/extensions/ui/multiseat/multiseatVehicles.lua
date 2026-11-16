---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the vehicles and profiles (personas) of players in multi-seat: choice of suggested vehicles, automatic colors close to the player's color, "staged" state of the settings (vehicle, icon, driving preferences), spawning, replacing, gathering and deleting vehicles, vehicle selectors and summary (digest) data. It is the engine behind ui_multiseat_multiseatSettings and ui_multiseat_freeroam. It tracks the vehicles owned per persona (ownedByPersona) and survives a Lua reload via onSerialize/onDeserialized.
--- Access: extension `ui_multiseat_multiseatVehicles`: `extensions.load("ui_multiseat_multiseatVehicles")`, then the global `ui_multiseat_multiseatVehicles`
---@class ui_multiseat_multiseatVehicles
---@field dependencies table<integer, string> Extensions loaded before: core_locales, core_playerPersonas, core_vehicle_configTarget, ui_gridSelectorRouteLifecycleCallbacks, ui_vehicleSelector_general.
ui_multiseat_multiseatVehicles = {}

--- Stops tracking a player's vehicle without deleting it, so that it survives removeAll when leaving multiseat.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1943
---@param player integer Player index.
---@return userdata|nil  Vehicle object, nil if none.
function ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player) end

--- Makes a player adopt an existing vehicle: records {model, config} in its persona and tracks the vehicle as owned.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1596
---@param player integer Player index.
---@param veh userdata Vehicle object.
---@return boolean  false if the player or the vehicle is invalid.
function ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh) end

--- Chains prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges and completeCommit, with rollback on failure.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1834
---@return table  {success, reason?, changes?}.
function ui_multiseat_multiseatVehicles.applyStagedChanges() end

--- Returns whether all the given (or owned) vehicles exist and are ready (veh:isReady).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1986
---@param spawned table[]|nil Vehicle entries.
---@return boolean  true if all are ready.
function ui_multiseat_multiseatVehicles.areVehiclesReady(spawned) end

--- Deletes the vehicles created by prepareStagedChanges and forgets the plan.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1853
function ui_multiseat_multiseatVehicles.cancelPreparedChanges() end

--- Clears the custom list and goes back to the registered players (render_splitScreen.clearCustomPlayers if available).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:683
function ui_multiseat_multiseatVehicles.clearCustomSplitPlayers() end

--- Clears all session data (selections, active and staged states, reload preferences).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1928
function ui_multiseat_multiseatVehicles.clearSession() end

--- Opens a player's vehicle parts configuration screen: starts core_vehicle_configTarget, switches to solo view (render_splitScreen.beginSoloView) then navigates to "pause.vehicle.configurationcombined". Cancels everything if a step fails.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1062
---@param vehicle userdata Vehicle object; must be the one owned by the player.
---@param playerId integer Player index.
---@return boolean  true if the screen is open.
function ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId) end

--- Delegates to multiseatConfiguration.cycleDevicePlayer then resynchronizes the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1108
---@param deviceId string Device identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId) end

--- Abandons the staged state and forces its rebuild on the next access.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1857
---@return boolean  Always true.
function ui_multiseat_multiseatVehicles.discardStagedChanges() end

--- Executes the summary button identified by buttonId.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1057
---@param buttonId any Identifier given by getDigestData.
---@param payload any Data passed to the button.
---@return boolean  false if buttonId is nil, otherwise the button's result.
function ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload) end

--- Last step: deletes vehicles that became unnecessary, records the session selections, assigns each player to their vehicle, applies the preferences and deletes pre-existing unowned vehicles (if multiseat is starting). Resets the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1793
---@param changes table|nil Result of getStagedChanges, returned as is.
---@param committedConfig table Applied configuration (not used directly).
---@return table  {success = true, changes} or {success = false, reason}.
function ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig) end

--- Gathers the owned vehicles: next to a player's vehicle (index) or at a spawn point ("spawnPoint:objectName"), lining them up one after another on the right side.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1370
---@param target integer|string Player index or "spawnPoint:objectName".
---@return boolean  true if at least one vehicle was moved.
function ui_multiseat_multiseatVehicles.gatherVehicles(target) end

--- Returns whether automatic color is enabled (staged value if it exists, otherwise the multiseatAutomaticColor setting). See the note on the nil case.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:128
---@return boolean|nil  true if enabled.
function ui_multiseat_multiseatVehicles.getAutomaticColorEnabled() end

--- Data of the vehicle summary for each registered player (label, device, vehicle, actions "changeVehicle" and "configureVehicle" with their buttonId). First assigns default vehicles to personas that have none.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:983
---@return table  {players = {...}}.
function ui_multiseat_multiseatVehicles.getDigestData() end

--- Options of the "gather vehicles" field: a player as gathering point, then the level's spawn points (value "spawnPoint:objectName"). Returns nil if fewer than 2 vehicles are owned.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1308
---@return table[]|nil  Options {value, label, disabled?}.
function ui_multiseat_multiseatVehicles.getGatherVehicleOptions() end

--- List, sorted by player, of owned vehicle entries still present in the scene.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1951
---@return table[]  Entries {veh, vehId, player, personaId}.
function ui_multiseat_multiseatVehicles.getOwnedVehicles() end

--- Data of the "personas" component of the settings screen: the multiseatConfiguration preview with playerLimit recomputed for the level (playerLimits.getCurrentLevelState).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:905
---@return table  Enriched preview.
function ui_multiseat_multiseatVehicles.getPersonaSelectorData() end

--- Data of the "vehicles" component: for each staged player, personaId, label, icon and selectable icons, color, connection state, device label, vehicle {model, config, label, paints} and preferences; plus characterFaceOptions.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:924
---@return table  {players, characterFaceOptions}.
function ui_multiseat_multiseatVehicles.getSettingsData() end

--- Options of the "same vehicle for everyone" field: distinct vehicles already staged (value = player index), then up to 8 recent vehicles (value "recent:model/config") after a separator. Returns nil if fewer than 2 players are staged.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1222
---@return table[]|nil  Options {value, label, disabled?}.
---@return integer|nil  Currently shared value, nil if the vehicles differ.
function ui_multiseat_multiseatVehicles.getSharedVehicleOptions() end

--- Compares the active state to the staged state and returns {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. A change of players or of model/config requires a restart; a simple color is repainted on the vehicle in place.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:833
---@return table  Table of flags.
function ui_multiseat_multiseatVehicles.getStagedChanges() end

--- Sorted list of the indices of players registered in the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:896
---@return integer[]  Player indices.
function ui_multiseat_multiseatVehicles.getStagedPlayers() end

--- Returns one suggested vehicle per player by trying, in order: the level function mainLevel.getMultiseatSuggestedVehicles, the gamemode pool, then getSuggestedVehiclesForLevel.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:70
---@param levelName string|nil Level name.
---@param playerCount integer Number of players; < 1 returns {}.
---@return table[]  List of {model, config}.
function ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount) end

--- Picks one vehicle per player from the level's multiseat.suggestedVehicles pool (info.json), otherwise from the fallback vehicles; the pool is shuffled then looped over.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:61
---@param levelName string|nil Level name.
---@param playerCount integer Number of players; < 1 returns {}.
---@return table[]  List of {model, config}, one entry per player.
function ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount) end

--- Returns a copy of the vehicle {model, config, ...} of a player's persona.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1874
---@param player integer Player index.
---@return table|nil  Vehicle, nil if the player is absent.
function ui_multiseat_multiseatVehicles.getVehicleForPlayer(player) end

--- Returns whether the staged state differs from the initial state taken when the screen was opened.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:891
---@return boolean  true if the user modified something.
function ui_multiseat_multiseatVehicles.hasUserChanges() end

--- Returns whether a snapshot is being built, changes are being applied or a preparation is pending.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1996
---@return boolean  true if in progress.
function ui_multiseat_multiseatVehicles.isSynchronizing() end

--- Delegates to multiseatConfiguration.joinDeviceGroup then resynchronizes.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1138
---@param groupId integer Group identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId) end

--- Removes a player via multiseatConfiguration.leavePlayer then resynchronizes.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1144
---@param player integer Player index.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.leaveDeviceGroup(player) end

--- Delegates to multiseatConfiguration.moveDevicePlayer then resynchronizes the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1120
---@param deviceId string Device identifier.
---@param direction integer -1 or 1.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction) end

--- Hook called at the end of the level; clears all state (the vehicles leave with the level).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2107
function ui_multiseat_multiseatVehicles.onClientEndMission() end

--- Hook called after a Lua reload; relinks the serialized vehicles to the players and schedules a reconciliation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2038
---@param data table Data returned by onSerialize.
function ui_multiseat_multiseatVehicles.onDeserialized(data) end

--- Hook called when the extension is unloaded; deletes the owned vehicles unless a Lua reload is in progress (preserveVehiclesOnUnload), then clears the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2131
function ui_multiseat_multiseatVehicles.onExtensionUnloaded() end

--- Entry callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1581
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data) end

--- Exit callback of the quick selector route; delegates to gridSelector then forgets the pending player if the route is left.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1589
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data) end

--- Mount callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1585
---@param context table Route context.
---@param toRoute table Destination route.
---@param fromRoute table Origin route.
---@param data any Navigation data.
function ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data) end

--- Hook called before a Lua reload; if multiseat is active, returns the owned vehicles, the session selections and the preferences, and prevents the vehicles from being deleted on unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2000
---@param reason string Reason (log).
---@return table|nil  {ownedVehicles, sessionByPersona, preferencesByPersona}.
function ui_multiseat_multiseatVehicles.onSerialize(reason) end

--- Hook called when the UI shows the waiting state; executes the vehicle replacement deferred by the quick selector.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2098
function ui_multiseat_multiseatVehicles.onUiWaitingState() end

--- Hook called every frame; after a reload, reconciles the vehicles (preserveOwned), restores the preferences and unfreezes the vehicles as soon as participants are present.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:2068
function ui_multiseat_multiseatVehicles.onUpdate() end

--- Called by multiseatSettings when leaving the selector route; cancels the pending selection if this route is really being left.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1466
---@param toRoute table|nil Destination route.
function ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute) end

--- Opens the quick selector (route pause.multiseatVehicleSelector) from the pause menu; on selection, returns to "pause" then replaces the vehicle after the onUiWaitingState event.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1557
---@param player integer Player index.
---@return boolean  false if multiseat is inactive or the player is absent.
function ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player) end

--- Opens the vehicle selector and applies the choice to all staged players (at least 2 required).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1440
---@return boolean  false if there are fewer than 2 players.
function ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers() end

--- Opens the vehicle selector for a staged player (route pause.multiseatSettings.vehicleSelector). On selection, the vehicle is staged and it returns to the settings screen.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1415
---@param player integer Player index.
---@return boolean  false if the player is not registered.
function ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player) end

--- First application step: checks players and limit, writes the staged data into the personas and spawns new or different vehicles (the others are repainted). The created vehicles are kept in a plan until finalizeStagedChanges or cancelPreparedChanges.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1711
---@return table  {success = true, changes} or {success = false, reason}.
function ui_multiseat_multiseatVehicles.prepareStagedChanges() end

--- Brings the owned vehicles in line with the registered players: deletes those of players who left, replaces vehicles that differ from the selection (except options.preserveOwned) and spawns missing ones behind an existing vehicle on the road (core_multiSpawn "roadBehind"), otherwise next to it. Then assigns each player and resynchronizes the split screen.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1635
---@param options table|nil preserveOwned = true keeps the existing vehicles as they are.
---@return boolean  Success.
---@return string|nil  vehicle_replace_failed or vehicle_spawn_failed.
function ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options) end

--- Matches the vehicles to a spawn plan by reusing or replacing them if needed, and deletes the others unless options.removeMissing == false. options.customPlayers sets the list of split screen players.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1893
---@param spawnPlan table[] List of {player, parkingSpot|pos+rot}.
---@param options table|nil removeMissing, customPlayers.
---@return table[]  Reconciled entries.
---@return string|nil  Reason for stopping (player_unavailable, vehicle_replace_failed, vehicle_spawn_failed).
function ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options) end

--- Deletes all owned vehicles (players leave them first).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1922
function ui_multiseat_multiseatVehicles.removeAll() end

--- Delegates to multiseatConfiguration.removeDevice (disconnected device) then resynchronizes.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1132
---@param deviceId string Device identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.removeDevice(deviceId) end

--- Repaints the owned vehicles with their persona's paints (live color update).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1973
function ui_multiseat_multiseatVehicles.repaintOwnedVehicles() end

--- Live-replaces the vehicle of an active multiseat player (updates the persona, replaces or spawns the vehicle, assigns the player and resets the camera). Restores the old persona on failure.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1509
---@param player integer Player index.
---@param model string Template.
---@param config string Configuration.
---@param additionalData table|nil Selector data; paint, paint2, paint3 give the chosen paints.
---@return table  {success = true} or {success = false, reason}.
function ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData) end

--- Puts each player back in their owned vehicle if they are no longer in it.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1403
---@return boolean  true if at least one player was reseated.
function ui_multiseat_multiseatVehicles.reseatAllPlayers() end

--- Resets the settings screen snapshots (called when it closes).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1866
function ui_multiseat_multiseatVehicles.resetSettingsSnapshots() end

--- Sets the list of players displayed in split screen (copy) and passes it to render_splitScreen.setCustomPlayers.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:678
---@param players integer[] Player indices.
function ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players) end

--- Delegates to multiseatConfiguration.setDevicePlayer then resynchronizes the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1126
---@param deviceId string Device identifier.
---@param personaNumber integer|nil Persona number, nil or 0 to unassign.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber) end

--- Freezes or unfreezes vehicles via core_vehicleBridge (action setFreeze).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1962
---@param spawned table[]|nil Vehicle entries; all owned vehicles if nil.
---@param frozen boolean true to freeze.
function ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen) end

--- Records {model, config} as the vehicle of a player's persona (without spawning a vehicle).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1614
---@param player integer Player index.
---@param vehicle table {model, config}.
---@return boolean  true if the persona was updated.
function ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle) end

--- Deletes all owned vehicles then spawns each plan player's vehicle at its position (parking spot or pos/rot), assigns the player and tracks the vehicle.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1880
---@param spawnPlan table[] List of {player, parkingSpot} or {player, pos, rot}.
---@return table[]  Created vehicle entries.
function ui_multiseat_multiseatVehicles.spawnAll(spawnPlan) end

--- Stages the automatic color mode for all players and recomputes the paint of their staged vehicle.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1204
---@param automaticColor boolean true for automatic color.
---@return boolean  true if at least one vehicle changed.
function ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor) end

--- Stages a player's icon; refused if it is not a persona icon, if it is unchanged or already taken by another player.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1189
---@param player integer Player index.
---@param icon string Icon identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon) end

--- Stages a player's exit (only optedIn = false is accepted; true returns false).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1101
---@param player integer Player index.
---@param optedIn boolean Must be false.
---@return boolean  true if the player was removed.
function ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn) end

--- Stages a player's driving preferences after validation (gearbox arcade/realistic, ignitionLevel integer 0 to 3, valid characterFace).
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1167
---@param player integer Player index.
---@param preferences table {gearbox, clutchAssist, throttleAssist, ignitionLevel, characterFace}.
---@return boolean  false if the player is absent or a value is invalid.
function ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences) end

--- Stages the same vehicle for all players, from "recent:model/config" or from the index of a player whose vehicle is copied.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1296
---@param source string|integer Vehicle source.
---@return boolean  true if at least one vehicle changed.
function ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source) end

--- Delegates to multiseatConfiguration.toggleDevicePlayer then resynchronizes the staged state.
---Source: lua/ge/extensions/ui/multiseat/multiseatVehicles.lua:1114
---@param deviceId string Device identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId) end

