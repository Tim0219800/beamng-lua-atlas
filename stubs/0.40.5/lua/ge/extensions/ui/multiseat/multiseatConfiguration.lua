---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transactional model of the multi-seat configuration: which input devices (or platform-managed device groups) belong to which player/persona. begin() opens a transaction (copy of the current state or of the assignment cache), the editing functions modify it, getPreview() provides the state to the UI, then commit() (or commitCore + completeCommit) applies it via core_multiseat.applyConfiguration; discard() abandons it. Used by the multiseat settings screen.
--- Access: extension `ui_multiseat_multiseatConfiguration`: `extensions.load("ui_multiseat_multiseatConfiguration")`, then the global `ui_multiseat_multiseatConfiguration`
---@class ui_multiseat_multiseatConfiguration
---@field AUTOMATIC_COLOR_DEFAULT boolean Default value (true) of the multiseatAutomaticColor setting.
---@field dependencies table<integer, string> Extensions loaded before: core_playerPersonas.
ui_multiseat_multiseatConfiguration = {}

--- Opens the configuration transaction if it does not exist (copy of the active configuration or of the cache), otherwise reconciles the device inventory. Calls core_multiseat.beginConfigurationEdit.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:328
---@param options table|nil Options; source = origin of the opening (for example "settings").
---@return table  Preview, see getPreview.
function ui_multiseat_multiseatConfiguration.begin(options) end

--- Clears the player assignment cache (core_multiseat.cachePlayerAssignments with empty lists). No effect if multiseat is already active.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:823
---@return boolean  Result of the clearing, false if impossible.
function ui_multiseat_multiseatConfiguration.clearCachedAssignments() end

--- commitCore then completeCommit.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:895
---@return boolean  Success.
---@return table|string  Applied configuration, or failure reason.
function ui_multiseat_multiseatConfiguration.commit() end

--- Applies the configuration via core_multiseat.applyConfiguration (participant notification deferred) and stores the change log; the transaction stays open to allow rollbackCommit.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:860
---@return boolean  Success.
---@return table|string  Applied configuration, or failure reason (for example "no_players").
function ui_multiseat_multiseatConfiguration.commitCore() end

--- Ends a successful commit: calls core_multiseat.finalizeConfiguration, closes the transaction and logs the changes.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:873
---@return boolean  false if no successful commitCore.
function ui_multiseat_multiseatConfiguration.completeCommit() end

--- Manual mode: with no player, assigns the device to the first free persona; otherwise moves it to the previous persona (or unassigns it if there is none).
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:506
---@param deviceId string Device or group identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId) end

--- Abandons the transaction; if it had already been applied (commitCore), restores the starting configuration. Ends the edit on the core_multiseat side.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:367
---@return boolean  false if there was no transaction.
function ui_multiseat_multiseatConfiguration.discard() end

--- Builds the configuration to apply: platformManagesPlayers, personaOptInMode, manualAssignments (deviceId to player, -1 if none), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} and adoptVehicleId.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:658
---@return table|nil  Configuration, nil without a transaction.
function ui_multiseat_multiseatConfiguration.getCommitConfiguration() end

--- Returns a copy of the transaction's persona.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:575
---@param personaNumber integer Persona number.
---@return table|nil  Persona or nil.
function ui_multiseat_multiseatConfiguration.getPersona(personaNumber) end

--- Returns the list of player indices (0 to n-1).
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:651
---@return integer[]  Indices; empty without a transaction.
function ui_multiseat_multiseatConfiguration.getPlayers() end

--- Returns the displayable state of the configuration (opens the transaction if needed): availablePlayers (devices in manual mode), availablePersonas and joinedPersonas, deviceGroups (platform mode), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} and revision.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:581
---@return table  Preview table.
function ui_multiseat_multiseatConfiguration.getPreview() end

--- Compares the current configuration to the starting baseline: true if multiseat was not active, or if the number of players or the assignments differ.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:834
---@return boolean  true if there are changes.
function ui_multiseat_multiseatConfiguration.hasChanges() end

--- Returns whether the user has modified the assignments since opening (or whether they come from the cache).
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:814
---@return boolean  true if modified.
function ui_multiseat_multiseatConfiguration.hasUserChanges() end

--- Returns whether a transaction is open.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:363
---@return boolean  true if open.
function ui_multiseat_multiseatConfiguration.isActive() end

--- Platform mode: makes a device group join; the persona takes the group's number if it is free and valid, otherwise the first free one.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:531
---@param groupId integer Group identifier (converted with tonumber).
---@return boolean  false if already joined or limit reached.
function ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId) end

--- Removes a player: frees all its devices/groups and deletes its persona.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:547
---@param player integer Player index (0-based).
---@return boolean  false if the player does not exist.
function ui_multiseat_multiseatConfiguration.leavePlayer(player) end

--- Manual mode: moves the device to the previous persona (direction -1, or none if it is the first) or the next one (direction 1, or a new persona if it is the last and it has several devices).
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:456
---@param deviceId string Device or group identifier.
---@param direction integer -1 or 1.
---@return boolean  true if modified.
function ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction) end

--- Hook called at the end of the level; abandons the transaction without restoring and clears the color preview.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:902
function ui_multiseat_multiseatConfiguration.onClientEndMission() end

--- Hook called when devices or bindings change; reconciles the inventory and notifies the UI if the list changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:908
function ui_multiseat_multiseatConfiguration.onInputBindingsChanged() end

--- Manual mode: forgets a disconnected device (connected == false), unassigns it and marks it as removed.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:437
---@param deviceId string Device or group identifier.
---@return boolean  false if the device is not found or still connected.
function ui_multiseat_multiseatConfiguration.removeDevice(deviceId) end

--- Restores the starting configuration after a commitCore.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:886
---@return boolean  Result of core_multiseat.restoreConfiguration, or false.
function ui_multiseat_multiseatConfiguration.rollbackCommit() end

--- Manual mode: assigns the device to the given persona (1 to 64), or unassigns it with nil or 0. Returns false if nothing changes or the player limit forbids it.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:418
---@param deviceId string Device or group identifier.
---@param personaNumber integer|nil 1..64 to assign, nil or 0 to unassign.
---@return boolean  true if modified.
function ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber) end

--- Copies the keys of data into the persona (name, icon, color, vehicle...).
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:566
---@param personaNumber integer Persona number.
---@param data table Fields to overwrite.
---@param emitChange boolean|nil If false, does not notify the UI.
---@return boolean  false if no transaction, invalid data or unknown persona.
function ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange) end

--- Manual mode: removes the device from its player if it has one, otherwise assigns it to the first free persona.
---Source: lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua:397
---@param deviceId string Device or group identifier.
---@return boolean  true if modified.
function ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId) end

