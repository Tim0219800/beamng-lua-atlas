---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_multiseat`: local multiplayer management (several players on the same PC: keyboard/mouse and controllers). It decides which player (index 0, 1, 2...) controls each input device, either by manual assignment (per device), or by device groups managed by the platform (console user accounts). It maintains the list of 'joined' players (joinedPlayers) with their persona (name, icon, color via core_playerPersonas), places players in vehicles, displays player tags (render_playerTags), colors the devices and emits onLocalParticipantsChanged. Most functions are called by core_input_bindings and by the multiseat UI.
--- Access: extension `core_multiseat`: `extensions.load("core_multiseat")`, then the global `core_multiseat`
---@class core_multiseat
---@field allowTrafficDebug boolean false. Not used in this file.
---@field dependencies string[] { 'core_playerPersonas', 'render_playerTags', 'ui_multiseat_assignmentCache' }.
core_multiseat = {}

--- Applies a multiseat configuration: enables the 'multiseat' setting and the action map, installs the assignments, personas and players, with automatic restoration on error.
---Source: lua/ge/extensions/core/multiseat.lua:1138
---@param config table See resolveConfiguration; extra fields: multiseatActive (default true), deferParticipantNotification.
---@return boolean  true if applied.
---@return string|nil  Failure reason.
function core_multiseat.applyConfiguration(config) end

--- Assigns a platform device group to a player (or -1 to unassign). Refuses if the platform does not manage players, if the group does not exist or if the player is already taken by another group.
---Source: lua/ge/extensions/core/multiseat.lua:585
---@param groupId integer Group identifier.
---@param player integer Player index >= 0, or -1.
---@return boolean  true if the assignment was made.
function core_multiseat.assignDeviceGroup(groupId, player) end

--- Starts an editing session: getAssignedPlayers then returns frozen assignments instead of recomputing.
---Source: lua/ge/extensions/core/multiseat.lua:1496
function core_multiseat.beginConfigurationEdit() end

--- Builds the cache (device/group owners by persona number) from a configuration and stores it in ui_multiseat_assignmentCache.
---Source: lua/ge/extensions/core/multiseat.lua:1022
---@param config table Configuration with participants and assignments.
---@return boolean  false if the config is invalid.
function core_multiseat.cachePlayerAssignments(config) end

--- Removes the player colors from the devices, if they had been applied.
---Source: lua/ge/extensions/core/multiseat.lua:1362
function core_multiseat.clearDeviceColors() end

--- Removes all joined players and clears all personas.
---Source: lua/ge/extensions/core/multiseat.lua:886
---@return boolean  false if there were none.
function core_multiseat.clearJoinedPlayers() end

--- Resets a joined player's persona to its default values and notifies.
---Source: lua/ge/extensions/core/multiseat.lua:1291
---@param player integer Player index.
---@return boolean  false if the player has not joined.
function core_multiseat.clearPlayerPersona(player) end

--- Moves a device (or the keyboard+mouse group) to the next player in the cycle (player 0, -1 unassigned, then previous player...), renumbers the players and updates core_input_bindings. Refused if the platform manages players.
---Source: lua/ge/extensions/core/multiseat.lua:616
---@param deviceId string Id of a device.
---@return boolean  true if the assignment changed.
function core_multiseat.cycleDevicePlayer(deviceId) end

--- Ends the editing, and optionally stores the provided device and assignment state.
---Source: lua/ge/extensions/core/multiseat.lua:1497
---@param devices table|nil Devices to store.
---@param assignments table|nil Assignments to store.
function core_multiseat.endConfigurationEdit(devices, assignments) end

--- Exports the full multiseat state (assignments, joined players, personas, caches) as a copyable table, used as a snapshot for restoration or Lua reload.
---Source: lua/ge/extensions/core/multiseat.lua:971
---@return table  Snapshot.
function core_multiseat.exportConfiguration() end

--- Finishes a deferred application: updates the pending assignment cache and emits the participants notification.
---Source: lua/ge/extensions/core/multiseat.lua:1228
---@return boolean  false if there was nothing to finalize.
function core_multiseat.finalizeConfiguration() end

--- Computes which player controls each device, applies it via assignPlayerToDevice and updates the internal state (active players, personas). During a configuration edit, returns 'safe' assignments without modifying them. Called by core_input_bindings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:201
---@param devices table device name -> { guid, productName, pidvid, playerNumber, platformUserNumber }.
---@param logEnabled boolean|nil Writes the number of players and the assignments to the log.
---@param seatPlayers boolean|nil If true, makes on-foot players enter the least occupied vehicle and makes those who became inactive exit.
---@return table<string, integer>  Device -> player index (-1 = none).
function core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers) end

--- Participants available for the UI: for each active player, { id = 'local-player:N', assignment, inputIcon, joined, persona (real if joined, otherwise preview) }.
---Source: lua/ge/extensions/core/multiseat.lua:1239
---@return table[]  Available participants.
function core_multiseat.getAvailableParticipants() end

--- Returns the assignment cache stored in ui_multiseat_assignmentCache.
---Source: lua/ge/extensions/core/multiseat.lua:1029
---@return table|nil  Cache.
function core_multiseat.getCachedPlayerAssignments() end

--- Lists, for the UI, the 'devices' (keyboard+mouse grouped, controllers) with their manually assigned player: { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }.
---Source: lua/ge/extensions/core/multiseat.lua:469
---@return table[]  Elements described above, keyboard-mouse first.
function core_multiseat.getDeviceAssignments() end

--- Parameterized version of getDeviceAssignments for provided devices and assignments.
---Source: lua/ge/extensions/core/multiseat.lua:409
---@param devices table|nil Devices.
---@param assignedPlayers table<string, integer>|nil Device -> player.
---@param connectedDevices table|nil Connected devices (nil = all).
---@return table[]  Same format as getDeviceAssignments.
function core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices) end

--- Returns the device group assigned to a player.
---Source: lua/ge/extensions/core/multiseat.lua:609
---@param player integer Player index.
---@return integer|nil  groupId, or nil.
function core_multiseat.getDeviceGroupForPlayer(player) end

--- Platform device groups (one per user account), with the assigned player; includes assigned but disconnected groups (connected = false).
---Source: lua/ge/extensions/core/multiseat.lua:566
---@return table[]  Elements { id, groupId, playerIndex, label, devices, connected }.
function core_multiseat.getDeviceGroups() end

--- Parameterized version of getDeviceGroups.
---Source: lua/ge/extensions/core/multiseat.lua:496
---@param devices table|nil Devices.
---@param groupAssignments table<integer, integer>|nil groupId -> player.
---@return table[]  Groups sorted by groupId.
function core_multiseat.getDeviceGroupsFor(devices, groupAssignments) end

--- Participants of the joined players, sorted by player index.
---Source: lua/ge/extensions/core/multiseat.lua:961
---@return table[]  Participants.
function core_multiseat.getJoinedParticipants() end

--- Sorted indices of the players that have joined (with persona).
---Source: lua/ge/extensions/core/multiseat.lua:713
---@return integer[]  Player indices.
function core_multiseat.getJoinedPlayers() end

--- Returns a player's participant.
---Source: lua/ge/extensions/core/multiseat.lua:1272
---@param player integer Player index.
---@return table|nil  Participant.
function core_multiseat.getParticipant(player) end

--- Returns the participants revision (internal counter + core_playerPersonas revision), to detect changes.
---Source: lua/ge/extensions/core/multiseat.lua:62
---@return integer  Revision.
function core_multiseat.getParticipantRevision() end

--- Returns the participants (persona + assignment). With no argument and if there are joined players, these are the joined players; otherwise the active players (with a preview persona if not joined).
---Source: lua/ge/extensions/core/multiseat.lua:1258
---@param players integer[]|nil List of player indices.
---@return table[]  Participants.
function core_multiseat.getParticipants(players) end

--- Indicates whether player tags are enabled ('multiseatTags' boolean setting, default true). Converts an old string value to a boolean ('never' = false). See the notes on the inconsistency with core_multiseatPlayerMarkers.
---Source: lua/ge/extensions/core/multiseat.lua:49
---@return boolean  true if enabled.
function core_multiseat.getPlayerMarkersEnabled() end

--- Fills and returns the ordered list of currently active player indices.
---Source: lua/ge/extensions/core/multiseat.lua:322
---@param result integer[]|nil Table to reuse (cleared then filled).
---@return integer[]  Player indices.
function core_multiseat.getPlayers(result) end

--- Indicates whether applyConfiguration is in progress.
---Source: lua/ge/extensions/core/multiseat.lua:1495
---@return boolean  true if in progress.
function core_multiseat.isApplyingConfiguration() end

--- Indicates whether a configuration edit is in progress.
---Source: lua/ge/extensions/core/multiseat.lua:1505
---@return boolean  true if in progress.
function core_multiseat.isConfigurationEditActive() end

--- Indicates whether multiseat is active.
---Source: lua/ge/extensions/core/multiseat.lua:1399
---@return boolean  true if active.
function core_multiseat.isMultiseatActive() end

--- Indicates whether the platform (console, Steam...) manages players itself: Input.getPlatformUserCount() non-nil (or debug mode).
---Source: lua/ge/extensions/core/multiseat.lua:120
---@return boolean  true if platform-managed.
function core_multiseat.isPlatformManagingPlayers() end

--- Makes an active player join: assigns it the first free persona number (default persona), renumbers and notifies. Returns true if already joined.
---Source: lua/ge/extensions/core/multiseat.lua:838
---@param player integer Active player index.
---@return boolean  false if the player is not active or there is no room left.
function core_multiseat.joinPlayer(player) end

--- Removes a joined player: clears its persona and frees its devices or group, then notifies.
---Source: lua/ge/extensions/core/multiseat.lua:852
---@param player integer Player index.
---@return boolean  false if the player had not joined.
function core_multiseat.leavePlayer(player) end

--- End of level: resets the whole multiseat state (see notes, reset()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1403
function core_multiseat.onClientEndMission() end

--- After a Lua reload: restores the configuration from the snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1450
---@param data table Snapshot returned by onSerialize.
function core_multiseat.onDeserialized(data) end

--- On unload: destroys the player tags and removes the device colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1518
function core_multiseat.onExtensionUnloaded() end

--- Language change hook: resynchronizes the joined players, invalidates the personas (translated names) and notifies.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1511
function core_multiseat.onLanguageChanged() end

--- Before a Lua reload: destroys tags and colors, and returns a snapshot if multiseat is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1435
---@param reason string|nil Serialization reason (log).
---@return table|nil  Snapshot, or nil if multiseat is inactive.
function core_multiseat.onSerialize(reason) end

--- Per-frame hook (only when a level is loaded): synchronizes the device colors and displays/updates the player tags (render_playerTags), unless split-screen is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseat.lua:1379
---@param dtReal number Elapsed real time (s).
---@param dtSim number Elapsed simulation time (s), unused.
function core_multiseat.onUpdate(dtReal, dtSim) end

--- Shows on the devices the player colors of a configuration still being edited (core_devices.setPlayerColors).
---Source: lua/ge/extensions/core/multiseat.lua:1348
---@param config table|nil Configuration to preview; nil clears the colors.
function core_multiseat.previewDeviceColors(config) end

--- Validates and normalizes a configuration proposed by the UI: renumbers the players from 0 according to persona number order and translates the device/group assignments.
---Source: lua/ge/extensions/core/multiseat.lua:1033
---@param config table { participants = [{ playerIndex, personaNumber, persona }], manualAssignments, groupAssignments, platformManagesPlayers, personaOptInMode, manualDeviceMetadata, platformDeviceGroups }.
---@param devices table|nil Known devices.
---@return table|nil  Resolved configuration { platformManagesPlayers, personaOptInMode, manualAssignments, groupAssignments, assignments, participants, personas, ... }.
---@return string|nil  Failure reason: 'invalid_configuration', 'invalid_player_count' or 'invalid_participant'.
function core_multiseat.resolveConfiguration(config, devices) end

--- Restores a snapshot produced by exportConfiguration (protected by pcall, refused during an applyConfiguration) and notifies.
---Source: lua/ge/extensions/core/multiseat.lua:1125
---@param snapshot table Snapshot.
---@return boolean  true if restored.
function core_multiseat.restoreConfiguration(snapshot) end

--- Marks multiseat as active (multiseat session in progress).
---Source: lua/ge/extensions/core/multiseat.lua:1395
---@param active boolean New state.
function core_multiseat.setMultiseatActive(active) end

--- Enables or disables the mode where players must join explicitly (instead of getting a persona automatically). Enabling it clears the joined players.
---Source: lua/ge/extensions/core/multiseat.lua:898
---@param enabled boolean true to enable.
function core_multiseat.setPersonaOptInMode(enabled) end

--- Saves the boolean 'multiseatTags' setting.
---Source: lua/ge/extensions/core/multiseat.lua:58
---@param enabled boolean true to enable.
function core_multiseat.setPlayerMarkersEnabled(enabled) end

--- Sets the persona of a joined player (name, icon, color, vehicle) and notifies.
---Source: lua/ge/extensions/core/multiseat.lua:1282
---@param player integer Player index.
---@param data table { id, displayName, icon, color, vehicle }
---@return boolean  false if the player has not joined or the data is invalid.
function core_multiseat.setPlayerPersona(player, data) end

