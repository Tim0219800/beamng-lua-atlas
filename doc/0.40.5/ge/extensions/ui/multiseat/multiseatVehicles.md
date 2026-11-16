# `ui_multiseat_multiseatVehicles`

*File: `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua` · VM: Game Engine (GE) · 2166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_multiseatVehicles`: `extensions.load("ui_multiseat_multiseatVehicles")`, then the global `ui_multiseat_multiseatVehicles`

Manages the vehicles and profiles (personas) of players in multi-seat: choice of suggested vehicles, automatic colors close to the player's color, "staged" state of the settings (vehicle, icon, driving preferences), spawning, replacing, gathering and deleting vehicles, vehicle selectors and summary (digest) data. It is the engine behind ui_multiseat_multiseatSettings and ui_multiseat_freeroam. It tracks the vehicles owned per persona (ownedByPersona) and survives a Lua reload via onSerialize/onDeserialized.

## Notes

- Fallback vehicles (fallbackVehicles): covet, pessima, pickup, roamer, vivace. A suggestion is only valid if {model, config} are strings and the file /<config> exists.
- Priority order of getSuggestedVehicles: mainLevel.getMultiseatSuggestedVehicles(playerCount) (at least one valid vehicle per player is needed), then the gamemode pool (gameplay_multiseat_gamemodeManager.getVehiclePool), then level.multiseat.suggestedVehicles from info.json, then the fallback vehicles.
- Automatic color: among the model's paints, those whose main color is close to the player's color (squared RGB distance <= 0.04); the choice among the 3 closest is stable (hash of persona|model|config). Without automatic color: paint chosen in the selector, otherwise the factory paint with the closest hue, otherwise the default paint.
- A player's driving preferences: gearbox ("arcade" or "realistic"), clutchAssist, throttleAssist, ignitionLevel (integer 0 to 3), characterFace.
- Reason codes returned: player_unavailable, invalid_vehicle_selection, persona_update_failed, vehicle_replace_failed, vehicle_spawn_failed, no_players, player_limit_exceeded, vehicles_not_prepared, prepared_vehicle_missing.
- Settings application in three steps: prepareStagedChanges (spawns the new vehicles), configuration commitCore, then finalizeStagedChanges (deletes surplus vehicles, assigns the players, applies the preferences).
- Probable BUG: getAutomaticColorEnabled uses the "a == nil and b or c" idiom; when nothing is staged and the multiseatAutomaticColor setting is false, the expression returns nil instead of false (harmless effect since nil is treated as false).
- UI event emitted: app:waiting (true/false) while replacing a vehicle from the quick selector; the replacement itself is executed in the onUiWaitingState hook.
- Routes used: pause.multiseatSettings, pause.multiseatSettings.vehicleSelector, pause.multiseatVehicleSelector.

**Dependencies (loaded first):** `core_locales`, `core_playerPersonas`, `core_vehicle_configTarget`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_vehicleSelector_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player)` | Stops tracking a player's vehicle without deleting it, so that it survives removeAll when leaving multiseat. | 1943 |
| `ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh)` | Makes a player adopt an existing vehicle: records {model, config} in its persona and tracks the vehicle as owned. | 1596 |
| `ui_multiseat_multiseatVehicles.applyStagedChanges()` | Chains prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges and completeCommit, with rollback on failure. | 1834 |
| `ui_multiseat_multiseatVehicles.areVehiclesReady(spawned)` | Returns whether all the given (or owned) vehicles exist and are ready (veh:isReady). | 1986 |
| `ui_multiseat_multiseatVehicles.cancelPreparedChanges()` | Deletes the vehicles created by prepareStagedChanges and forgets the plan. | 1853 |
| `ui_multiseat_multiseatVehicles.clearCustomSplitPlayers()` | Clears the custom list and goes back to the registered players (render_splitScreen.clearCustomPlayers if available). | 683 |
| `ui_multiseat_multiseatVehicles.clearSession()` | Clears all session data (selections, active and staged states, reload preferences). | 1928 |
| `ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId)` | Opens a player's vehicle parts configuration screen: starts core_vehicle_configTarget, switches to solo view (render_splitScreen.beginSoloView) then navigates to "pause.vehicle.configurationcombined". Cancels everything if a step fails. | 1062 |
| `ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId)` | Delegates to multiseatConfiguration.cycleDevicePlayer then resynchronizes the staged state. | 1108 |
| `ui_multiseat_multiseatVehicles.discardStagedChanges()` | Abandons the staged state and forces its rebuild on the next access. | 1857 |
| `ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload)` | Executes the summary button identified by buttonId. | 1057 |
| `ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig)` | Last step: deletes vehicles that became unnecessary, records the session selections, assigns each player to their vehicle, applies the preferences and deletes pre-existing unowned vehicles (if multiseat is starting). Resets the staged state. | 1793 |
| `ui_multiseat_multiseatVehicles.gatherVehicles(target)` | Gathers the owned vehicles: next to a player's vehicle (index) or at a spawn point ("spawnPoint:objectName"), lining them up one after another on the right side. | 1370 |
| `ui_multiseat_multiseatVehicles.getAutomaticColorEnabled()` | Returns whether automatic color is enabled (staged value if it exists, otherwise the multiseatAutomaticColor setting). See the note on the nil case. | 128 |
| `ui_multiseat_multiseatVehicles.getDigestData()` | Data of the vehicle summary for each registered player (label, device, vehicle, actions "changeVehicle" and "configureVehicle" with their buttonId). First assigns default vehicles to personas that have none. | 983 |
| `ui_multiseat_multiseatVehicles.getGatherVehicleOptions()` | Options of the "gather vehicles" field: a player as gathering point, then the level's spawn points (value "spawnPoint:objectName"). Returns nil if fewer than 2 vehicles are owned. | 1308 |
| `ui_multiseat_multiseatVehicles.getOwnedVehicles()` | List, sorted by player, of owned vehicle entries still present in the scene. | 1951 |
| `ui_multiseat_multiseatVehicles.getPersonaSelectorData()` | Data of the "personas" component of the settings screen: the multiseatConfiguration preview with playerLimit recomputed for the level (playerLimits.getCurrentLevelState). | 905 |
| `ui_multiseat_multiseatVehicles.getSettingsData()` | Data of the "vehicles" component: for each staged player, personaId, label, icon and selectable icons, color, connection state, device label, vehicle {model, config, label, paints} and preferences; plus characterFaceOptions. | 924 |
| `ui_multiseat_multiseatVehicles.getSharedVehicleOptions()` | Options of the "same vehicle for everyone" field: distinct vehicles already staged (value = player index), then up to 8 recent vehicles (value "recent:model/config") after a separator. Returns nil if fewer than 2 players are staged. | 1222 |
| `ui_multiseat_multiseatVehicles.getStagedChanges()` | Compares the active state to the staged state and returns {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. A change of players or of model/config requires a restart; a simple color is repainted on the vehicle in place. | 833 |
| `ui_multiseat_multiseatVehicles.getStagedPlayers()` | Sorted list of the indices of players registered in the staged state. | 896 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount)` | Returns one suggested vehicle per player by trying, in order: the level function mainLevel.getMultiseatSuggestedVehicles, the gamemode pool, then getSuggestedVehiclesForLevel. | 70 |
| `ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount)` | Picks one vehicle per player from the level's multiseat.suggestedVehicles pool (info.json), otherwise from the fallback vehicles; the pool is shuffled then looped over. | 61 |
| `ui_multiseat_multiseatVehicles.getVehicleForPlayer(player)` | Returns a copy of the vehicle {model, config, ...} of a player's persona. | 1874 |
| `ui_multiseat_multiseatVehicles.hasUserChanges()` | Returns whether the staged state differs from the initial state taken when the screen was opened. | 891 |
| `ui_multiseat_multiseatVehicles.isSynchronizing()` | Returns whether a snapshot is being built, changes are being applied or a preparation is pending. | 1996 |
| `ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId)` | Delegates to multiseatConfiguration.joinDeviceGroup then resynchronizes. | 1138 |
| `ui_multiseat_multiseatVehicles.leaveDeviceGroup(player)` | Removes a player via multiseatConfiguration.leavePlayer then resynchronizes. | 1144 |
| `ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction)` | Delegates to multiseatConfiguration.moveDevicePlayer then resynchronizes the staged state. | 1120 |
| `ui_multiseat_multiseatVehicles.onClientEndMission()` | Hook called at the end of the level; clears all state (the vehicles leave with the level). *(internal)* *(hook)* | 2107 |
| `ui_multiseat_multiseatVehicles.onDeserialized(data)` | Hook called after a Lua reload; relinks the serialized vehicles to the players and schedules a reconciliation. *(internal)* *(hook)* | 2038 |
| `ui_multiseat_multiseatVehicles.onExtensionUnloaded()` | Hook called when the extension is unloaded; deletes the owned vehicles unless a Lua reload is in progress (preserveVehiclesOnUnload), then clears the state. *(internal)* *(hook)* | 2131 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data)` | Entry callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter. *(internal)* *(hook)* | 1581 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data)` | Exit callback of the quick selector route; delegates to gridSelector then forgets the pending player if the route is left. *(internal)* *(hook)* | 1589 |
| `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data)` | Mount callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount. *(internal)* *(hook)* | 1585 |
| `ui_multiseat_multiseatVehicles.onSerialize(reason)` | Hook called before a Lua reload; if multiseat is active, returns the owned vehicles, the session selections and the preferences, and prevents the vehicles from being deleted on unload. *(internal)* *(hook)* | 2000 |
| `ui_multiseat_multiseatVehicles.onUiWaitingState()` | Hook called when the UI shows the waiting state; executes the vehicle replacement deferred by the quick selector. *(internal)* *(hook)* | 2098 |
| `ui_multiseat_multiseatVehicles.onUpdate()` | Hook called every frame; after a reload, reconciles the vehicles (preserveOwned), restores the preferences and unfreezes the vehicles as soon as participants are present. *(internal)* *(hook)* | 2068 |
| `ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute)` | Called by multiseatSettings when leaving the selector route; cancels the pending selection if this route is really being left. *(internal)* *(hook)* | 1466 |
| `ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player)` | Opens the quick selector (route pause.multiseatVehicleSelector) from the pause menu; on selection, returns to "pause" then replaces the vehicle after the onUiWaitingState event. | 1557 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers()` | Opens the vehicle selector and applies the choice to all staged players (at least 2 required). | 1440 |
| `ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player)` | Opens the vehicle selector for a staged player (route pause.multiseatSettings.vehicleSelector). On selection, the vehicle is staged and it returns to the settings screen. | 1415 |
| `ui_multiseat_multiseatVehicles.prepareStagedChanges()` | First application step: checks players and limit, writes the staged data into the personas and spawns new or different vehicles (the others are repainted). The created vehicles are kept in a plan until finalizeStagedChanges or cancelPreparedChanges. | 1711 |
| `ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options)` | Brings the owned vehicles in line with the registered players: deletes those of players who left, replaces vehicles that differ from the selection (except options.preserveOwned) and spawns missing ones behind an existing vehicle on the road (core_multiSpawn "roadBehind"), otherwise next to it. Then assigns each player and resynchronizes the split screen. | 1635 |
| `ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options)` | Matches the vehicles to a spawn plan by reusing or replacing them if needed, and deletes the others unless options.removeMissing == false. options.customPlayers sets the list of split screen players. | 1893 |
| `ui_multiseat_multiseatVehicles.removeAll()` | Deletes all owned vehicles (players leave them first). | 1922 |
| `ui_multiseat_multiseatVehicles.removeDevice(deviceId)` | Delegates to multiseatConfiguration.removeDevice (disconnected device) then resynchronizes. | 1132 |
| `ui_multiseat_multiseatVehicles.repaintOwnedVehicles()` | Repaints the owned vehicles with their persona's paints (live color update). | 1973 |
| `ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData)` | Live-replaces the vehicle of an active multiseat player (updates the persona, replaces or spawns the vehicle, assigns the player and resets the camera). Restores the old persona on failure. | 1509 |
| `ui_multiseat_multiseatVehicles.reseatAllPlayers()` | Puts each player back in their owned vehicle if they are no longer in it. | 1403 |
| `ui_multiseat_multiseatVehicles.resetSettingsSnapshots()` | Resets the settings screen snapshots (called when it closes). | 1866 |
| `ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players)` | Sets the list of players displayed in split screen (copy) and passes it to render_splitScreen.setCustomPlayers. | 678 |
| `ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber)` | Delegates to multiseatConfiguration.setDevicePlayer then resynchronizes the staged state. | 1126 |
| `ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen)` | Freezes or unfreezes vehicles via core_vehicleBridge (action setFreeze). | 1962 |
| `ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle)` | Records {model, config} as the vehicle of a player's persona (without spawning a vehicle). | 1614 |
| `ui_multiseat_multiseatVehicles.spawnAll(spawnPlan)` | Deletes all owned vehicles then spawns each plan player's vehicle at its position (parking spot or pos/rot), assigns the player and tracks the vehicle. | 1880 |
| `ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor)` | Stages the automatic color mode for all players and recomputes the paint of their staged vehicle. | 1204 |
| `ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon)` | Stages a player's icon; refused if it is not a persona icon, if it is unchanged or already taken by another player. | 1189 |
| `ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn)` | Stages a player's exit (only optedIn = false is accepted; true returns false). | 1101 |
| `ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences)` | Stages a player's driving preferences after validation (gearbox arcade/realistic, ignitionLevel integer 0 to 3, valid characterFace). | 1167 |
| `ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source)` | Stages the same vehicle for all players, from "recent:model/config" or from the index of a player whose vehicle is copied. | 1296 |
| `ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId)` | Delegates to multiseatConfiguration.toggleDevicePlayer then resynchronizes the staged state. | 1114 |

### Parameter details

#### `ui_multiseat_multiseatVehicles.abandonPlayerVehicle(player)`

Stops tracking a player's vehicle without deleting it, so that it survives removeAll when leaving multiseat.

- `player` (*integer*) : Player index.
- **returns**: userdata|nil Vehicle object, nil if none.

#### `ui_multiseat_multiseatVehicles.adoptFreeroamVehicle(player, veh)`

Makes a player adopt an existing vehicle: records {model, config} in its persona and tracks the vehicle as owned.

- `player` (*integer*) : Player index.
- `veh` (*userdata*) : Vehicle object.
- **returns**: boolean false if the player or the vehicle is invalid.

#### `ui_multiseat_multiseatVehicles.applyStagedChanges()`

Chains prepareStagedChanges, multiseatConfiguration.commitCore, finalizeStagedChanges and completeCommit, with rollback on failure.

- **returns**: table {success, reason?, changes?}.

#### `ui_multiseat_multiseatVehicles.areVehiclesReady(spawned)`

Returns whether all the given (or owned) vehicles exist and are ready (veh:isReady).

- `spawned` (*table[]|nil*) : Vehicle entries.
- **returns**: boolean true if all are ready.

#### `ui_multiseat_multiseatVehicles.configurePlayerVehicle(vehicle, playerId)`

Opens a player's vehicle parts configuration screen: starts core_vehicle_configTarget, switches to solo view (render_splitScreen.beginSoloView) then navigates to "pause.vehicle.configurationcombined". Cancels everything if a step fails.

- `vehicle` (*userdata*) : Vehicle object; must be the one owned by the player.
- `playerId` (*integer*) : Player index.
- **returns**: boolean true if the screen is open.

#### `ui_multiseat_multiseatVehicles.cycleDevicePlayer(deviceId)`

Delegates to multiseatConfiguration.cycleDevicePlayer then resynchronizes the staged state.

- `deviceId` (*string*) : Device identifier.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.discardStagedChanges()`

Abandons the staged state and forces its rebuild on the next access.

- **returns**: boolean Always true.

#### `ui_multiseat_multiseatVehicles.executeDigestAction(buttonId, payload)`

Executes the summary button identified by buttonId.

- `buttonId` (*any*) : Identifier given by getDigestData.
- `payload` (*any*) : Data passed to the button.
- **returns**: boolean false if buttonId is nil, otherwise the button's result.

#### `ui_multiseat_multiseatVehicles.finalizeStagedChanges(changes, committedConfig)`

Last step: deletes vehicles that became unnecessary, records the session selections, assigns each player to their vehicle, applies the preferences and deletes pre-existing unowned vehicles (if multiseat is starting). Resets the staged state.

- `changes` (*table|nil*) : Result of getStagedChanges, returned as is.
- `committedConfig` (*table*) : Applied configuration (not used directly).
- **returns**: table {success = true, changes} or {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.gatherVehicles(target)`

Gathers the owned vehicles: next to a player's vehicle (index) or at a spawn point ("spawnPoint:objectName"), lining them up one after another on the right side.

- `target` (*integer|string*) : Player index or "spawnPoint:objectName".
- **returns**: boolean true if at least one vehicle was moved.

#### `ui_multiseat_multiseatVehicles.getAutomaticColorEnabled()`

Returns whether automatic color is enabled (staged value if it exists, otherwise the multiseatAutomaticColor setting). See the note on the nil case.

- **returns**: boolean|nil true if enabled.

#### `ui_multiseat_multiseatVehicles.getDigestData()`

Data of the vehicle summary for each registered player (label, device, vehicle, actions "changeVehicle" and "configureVehicle" with their buttonId). First assigns default vehicles to personas that have none.

- **returns**: table {players = {...}}.

#### `ui_multiseat_multiseatVehicles.getGatherVehicleOptions()`

Options of the "gather vehicles" field: a player as gathering point, then the level's spawn points (value "spawnPoint:objectName"). Returns nil if fewer than 2 vehicles are owned.

- **returns**: table[]|nil Options {value, label, disabled?}.

#### `ui_multiseat_multiseatVehicles.getOwnedVehicles()`

List, sorted by player, of owned vehicle entries still present in the scene.

- **returns**: table[] Entries {veh, vehId, player, personaId}.

#### `ui_multiseat_multiseatVehicles.getPersonaSelectorData()`

Data of the "personas" component of the settings screen: the multiseatConfiguration preview with playerLimit recomputed for the level (playerLimits.getCurrentLevelState).

- **returns**: table Enriched preview.

#### `ui_multiseat_multiseatVehicles.getSettingsData()`

Data of the "vehicles" component: for each staged player, personaId, label, icon and selectable icons, color, connection state, device label, vehicle {model, config, label, paints} and preferences; plus characterFaceOptions.

- **returns**: table {players, characterFaceOptions}.

#### `ui_multiseat_multiseatVehicles.getSharedVehicleOptions()`

Options of the "same vehicle for everyone" field: distinct vehicles already staged (value = player index), then up to 8 recent vehicles (value "recent:model/config") after a separator. Returns nil if fewer than 2 players are staged.

- **returns**: table[]|nil Options {value, label, disabled?}.
- **returns**: integer|nil Currently shared value, nil if the vehicles differ.

#### `ui_multiseat_multiseatVehicles.getStagedChanges()`

Compares the active state to the staged state and returns {dirty, requiresRestart, rosterChanged, vehicleChanged, colorChanged, iconChanged, preferencesChanged}. A change of players or of model/config requires a restart; a simple color is repainted on the vehicle in place.

- **returns**: table Table of flags.

#### `ui_multiseat_multiseatVehicles.getStagedPlayers()`

Sorted list of the indices of players registered in the staged state.

- **returns**: integer[] Player indices.

#### `ui_multiseat_multiseatVehicles.getSuggestedVehicles(levelName, playerCount)`

Returns one suggested vehicle per player by trying, in order: the level function mainLevel.getMultiseatSuggestedVehicles, the gamemode pool, then getSuggestedVehiclesForLevel.

- `levelName` (*string|nil*) : Level name.
- `playerCount` (*integer*) : Number of players; < 1 returns {}.
- **returns**: table[] List of {model, config}.

#### `ui_multiseat_multiseatVehicles.getSuggestedVehiclesForLevel(levelName, playerCount)`

Picks one vehicle per player from the level's multiseat.suggestedVehicles pool (info.json), otherwise from the fallback vehicles; the pool is shuffled then looped over.

- `levelName` (*string|nil*) : Level name.
- `playerCount` (*integer*) : Number of players; < 1 returns {}.
- **returns**: table[] List of {model, config}, one entry per player.

#### `ui_multiseat_multiseatVehicles.getVehicleForPlayer(player)`

Returns a copy of the vehicle {model, config, ...} of a player's persona.

- `player` (*integer*) : Player index.
- **returns**: table|nil Vehicle, nil if the player is absent.

#### `ui_multiseat_multiseatVehicles.hasUserChanges()`

Returns whether the staged state differs from the initial state taken when the screen was opened.

- **returns**: boolean true if the user modified something.

#### `ui_multiseat_multiseatVehicles.isSynchronizing()`

Returns whether a snapshot is being built, changes are being applied or a preparation is pending.

- **returns**: boolean true if in progress.

#### `ui_multiseat_multiseatVehicles.joinDeviceGroup(groupId)`

Delegates to multiseatConfiguration.joinDeviceGroup then resynchronizes.

- `groupId` (*integer*) : Group identifier.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.leaveDeviceGroup(player)`

Removes a player via multiseatConfiguration.leavePlayer then resynchronizes.

- `player` (*integer*) : Player index.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.moveDevicePlayer(deviceId, direction)`

Delegates to multiseatConfiguration.moveDevicePlayer then resynchronizes the staged state.

- `deviceId` (*string*) : Device identifier.
- `direction` (*integer*) : -1 or 1.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.onDeserialized(data)`

Hook called after a Lua reload; relinks the serialized vehicles to the players and schedules a reconciliation.

- `data` (*table*) : Data returned by onSerialize.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorEnter(context, toRoute, fromRoute, data)`

Entry callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorLeave(context, toRoute, fromRoute, data)`

Exit callback of the quick selector route; delegates to gridSelector then forgets the pending player if the route is left.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatVehicles.onQuickVehicleSelectorMount(context, toRoute, fromRoute, data)`

Mount callback of the quick selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatVehicles.onSerialize(reason)`

Hook called before a Lua reload; if multiseat is active, returns the owned vehicles, the session selections and the preferences, and prevents the vehicles from being deleted on unload.

- `reason` (*string*) : Reason (log).
- **returns**: table|nil {ownedVehicles, sessionByPersona, preferencesByPersona}.

#### `ui_multiseat_multiseatVehicles.onVehicleSelectorLeave(toRoute)`

Called by multiseatSettings when leaving the selector route; cancels the pending selection if this route is really being left.

- `toRoute` (*table|nil*) : Destination route.

#### `ui_multiseat_multiseatVehicles.openQuickVehicleSelectorForPlayer(player)`

Opens the quick selector (route pause.multiseatVehicleSelector) from the pause menu; on selection, returns to "pause" then replaces the vehicle after the onUiWaitingState event.

- `player` (*integer*) : Player index.
- **returns**: boolean false if multiseat is inactive or the player is absent.

#### `ui_multiseat_multiseatVehicles.openVehicleSelectorForAllPlayers()`

Opens the vehicle selector and applies the choice to all staged players (at least 2 required).

- **returns**: boolean false if there are fewer than 2 players.

#### `ui_multiseat_multiseatVehicles.openVehicleSelectorForPlayer(player)`

Opens the vehicle selector for a staged player (route pause.multiseatSettings.vehicleSelector). On selection, the vehicle is staged and it returns to the settings screen.

- `player` (*integer*) : Player index.
- **returns**: boolean false if the player is not registered.

#### `ui_multiseat_multiseatVehicles.prepareStagedChanges()`

First application step: checks players and limit, writes the staged data into the personas and spawns new or different vehicles (the others are repainted). The created vehicles are kept in a plan until finalizeStagedChanges or cancelPreparedChanges.

- **returns**: table {success = true, changes} or {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.reconcileFreeroamVehicles(options)`

Brings the owned vehicles in line with the registered players: deletes those of players who left, replaces vehicles that differ from the selection (except options.preserveOwned) and spawns missing ones behind an existing vehicle on the road (core_multiSpawn "roadBehind"), otherwise next to it. Then assigns each player and resynchronizes the split screen.

- `options` (*table|nil*) : preserveOwned = true keeps the existing vehicles as they are.
- **returns**: boolean Success.
- **returns**: string|nil vehicle_replace_failed or vehicle_spawn_failed.

#### `ui_multiseat_multiseatVehicles.reconcileSpawnPlan(spawnPlan, options)`

Matches the vehicles to a spawn plan by reusing or replacing them if needed, and deletes the others unless options.removeMissing == false. options.customPlayers sets the list of split screen players.

- `spawnPlan` (*table[]*) : List of {player, parkingSpot|pos+rot}.
- `options` (*table|nil*) : removeMissing, customPlayers.
- **returns**: table[] Reconciled entries.
- **returns**: string|nil Reason for stopping (player_unavailable, vehicle_replace_failed, vehicle_spawn_failed).

#### `ui_multiseat_multiseatVehicles.removeDevice(deviceId)`

Delegates to multiseatConfiguration.removeDevice (disconnected device) then resynchronizes.

- `deviceId` (*string*) : Device identifier.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.replacePlayerVehicle(player, model, config, additionalData)`

Live-replaces the vehicle of an active multiseat player (updates the persona, replaces or spawns the vehicle, assigns the player and resets the camera). Restores the old persona on failure.

- `player` (*integer*) : Player index.
- `model` (*string*) : Template.
- `config` (*string*) : Configuration.
- `additionalData` (*table|nil*) : Selector data; paint, paint2, paint3 give the chosen paints.
- **returns**: table {success = true} or {success = false, reason}.

#### `ui_multiseat_multiseatVehicles.reseatAllPlayers()`

Puts each player back in their owned vehicle if they are no longer in it.

- **returns**: boolean true if at least one player was reseated.

#### `ui_multiseat_multiseatVehicles.setCustomSplitPlayers(players)`

Sets the list of players displayed in split screen (copy) and passes it to render_splitScreen.setCustomPlayers.

- `players` (*integer[]*) : Player indices.

#### `ui_multiseat_multiseatVehicles.setDevicePlayer(deviceId, personaNumber)`

Delegates to multiseatConfiguration.setDevicePlayer then resynchronizes the staged state.

- `deviceId` (*string*) : Device identifier.
- `personaNumber` (*integer|nil*) : Persona number, nil or 0 to unassign.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.setFrozen(spawned, frozen)`

Freezes or unfreezes vehicles via core_vehicleBridge (action setFreeze).

- `spawned` (*table[]|nil*) : Vehicle entries; all owned vehicles if nil.
- `frozen` (*boolean*) : true to freeze.

#### `ui_multiseat_multiseatVehicles.setPlayerVehicleSelection(player, vehicle)`

Records {model, config} as the vehicle of a player's persona (without spawning a vehicle).

- `player` (*integer*) : Player index.
- `vehicle` (*table*) : {model, config}.
- **returns**: boolean true if the persona was updated.

#### `ui_multiseat_multiseatVehicles.spawnAll(spawnPlan)`

Deletes all owned vehicles then spawns each plan player's vehicle at its position (parking spot or pos/rot), assigns the player and tracks the vehicle.

- `spawnPlan` (*table[]*) : List of {player, parkingSpot} or {player, pos, rot}.
- **returns**: table[] Created vehicle entries.

#### `ui_multiseat_multiseatVehicles.stageAutomaticColorForAllPlayers(automaticColor)`

Stages the automatic color mode for all players and recomputes the paint of their staged vehicle.

- `automaticColor` (*boolean*) : true for automatic color.
- **returns**: boolean true if at least one vehicle changed.

#### `ui_multiseat_multiseatVehicles.stagePlayerIcon(player, icon)`

Stages a player's icon; refused if it is not a persona icon, if it is unchanged or already taken by another player.

- `player` (*integer*) : Player index.
- `icon` (*string*) : Icon identifier.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatVehicles.stagePlayerOptIn(player, optedIn)`

Stages a player's exit (only optedIn = false is accepted; true returns false).

- `player` (*integer*) : Player index.
- `optedIn` (*boolean*) : Must be false.
- **returns**: boolean true if the player was removed.

#### `ui_multiseat_multiseatVehicles.stagePlayerVehiclePreferences(player, preferences)`

Stages a player's driving preferences after validation (gearbox arcade/realistic, ignitionLevel integer 0 to 3, valid characterFace).

- `player` (*integer*) : Player index.
- `preferences` (*table*) : {gearbox, clutchAssist, throttleAssist, ignitionLevel, characterFace}.
- **returns**: boolean false if the player is absent or a value is invalid.

#### `ui_multiseat_multiseatVehicles.stageSameVehicleForAllPlayers(source)`

Stages the same vehicle for all players, from "recent:model/config" or from the index of a player whose vehicle is copied.

- `source` (*string|integer*) : Vehicle source.
- **returns**: boolean true if at least one vehicle changed.

#### `ui_multiseat_multiseatVehicles.toggleDevicePlayer(deviceId)`

Delegates to multiseatConfiguration.toggleDevicePlayer then resynchronizes the staged state.

- `deviceId` (*string*) : Device identifier.
- **returns**: boolean true if modified.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: core_locales, core_playerPersonas, core_vehicle_configTarget, ui_gridSelectorRouteLifecycleCallbacks, ui_vehicleSelector_general. |

**UI events (guihooks.trigger):** `app:waiting`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `exitVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/multiseatVehicles.lua`.*
