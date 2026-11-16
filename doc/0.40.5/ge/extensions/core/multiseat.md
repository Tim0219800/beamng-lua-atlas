# `core_multiseat`

*File: `lua/ge/extensions/core/multiseat.lua` · VM: Game Engine (GE) · 1527 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_multiseat`: `extensions.load("core_multiseat")`, then the global `core_multiseat`

GE extension `core_multiseat`: local multiplayer management (several players on the same PC: keyboard/mouse and controllers). It decides which player (index 0, 1, 2...) controls each input device, either by manual assignment (per device), or by device groups managed by the platform (console user accounts). It maintains the list of 'joined' players (joinedPlayers) with their persona (name, icon, color via core_playerPersonas), places players in vehicles, displays player tags (render_playerTags), colors the devices and emits onLocalParticipantsChanged. Most functions are called by core_input_bindings and by the multiseat UI.

## Example

```lua
if settings.getValue('multiseat') then
  for _, p in ipairs(core_multiseat.getParticipants()) do
    log('I','', p.persona.displayName .. ' -> player ' .. p.assignment.playerIndex)
  end
end
```

## Notes

- Vocabulary: 'player' = player index (0-based, at most 64: maxPlayers hardcoded 'to be aligned with the limit of the steering fast path on the C++ side'); 'persona' = identity numbered from 1 (core_playerPersonas); 'participant' = { id, persona, assignment, inputIcon } where assignment = { playerIndex, devices, deviceIds, primaryDeviceId, deviceLabel, connectedDeviceLabel, connectedInputIcon, connected }.
- Input devices: `devices` is the table provided by core_input_bindings: device name -> { guid, productName, pidvid, playerNumber, platformUserNumber } (indices 1 to 5). The keyboard and mouse are grouped as a single 'device' (id 'keyboard-mouse') in the assignment lists.
- Two assignment modes: manual (manuallyAssignedPlayers, one index per device, -1 = unassigned; cycleDevicePlayer cycles through) or platform-managed (Input.getPlatformUserCount() non-nil: platformDeviceGroupPlayers, one index per device group, via assignDeviceGroup). Without a true 'multiseat' setting, all devices belong to player 0.
- normalizePlayerAssignments (internal) renumbers the players so that they are contiguous from 0, in persona number order. getAssignedPlayers does this work on every call from core_input_bindings, stores the assignment, updates activePlayers/joinedPlayers and can place on-foot players in the least occupied vehicle (seatPlayers).
- Configuration editing: beginConfigurationEdit/endConfigurationEdit freeze the real assignments while the UI composes a configuration. applyConfiguration(config) validates it (resolveConfiguration), takes a snapshot (exportConfiguration), applies it via core_input_bindings.applyPlayerAssignments, and restores the snapshot on failure. With config.deferParticipantNotification, the notification is postponed until finalizeConfiguration().
- Emitted hooks: onLocalParticipantsChanged(revision); UI event LocalParticipantsChanged(participants, revision). The 'revision' = internal counter + core_playerPersonas revision.
- Bug/inconsistency: getPlayerMarkersEnabled reads the 'multiseatTags' setting as a boolean and, if the value is not one (for example the string 'always'/'smart'/'never' written by core_multiseatPlayerMarkers), replaces it with true/false in the settings (overwriting the old string). The two modules do not share the same format.
- Inconsistency: at load nextMockPlatformDeviceGroupId is 1 but reset() sets it back to 0 (only affects the debugMockPlatformUsers debug mode).
- M.allowTrafficDebug is set to false and is not used anywhere in this file.
- reset() (called at the end of the level) clears players, personas, assignments and device colors, sets activePlayers = {0} and disables the 'multiseat' setting if this session had enabled it (personaOptInMode or multiseatActive).
- onSerialize only returns a snapshot if multiseatActive is true; otherwise nothing is saved. onDeserialized tries to restore the exported configuration.
- Player tags (render_playerTags) are only displayed if the multiseat setting is true, more than one player is active and split-screen is not loaded (render_splitScreen then handles the tags).

**Dependencies (loaded first):** `core_playerPersonas`, `render_playerTags`, `ui_multiseat_assignmentCache`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_multiseat.applyConfiguration(config)` | Applies a multiseat configuration: enables the 'multiseat' setting and the action map, installs the assignments, personas and players, with automatic restoration on error. | 1138 |
| `core_multiseat.assignDeviceGroup(groupId, player)` | Assigns a platform device group to a player (or -1 to unassign). Refuses if the platform does not manage players, if the group does not exist or if the player is already taken by another group. | 585 |
| `core_multiseat.beginConfigurationEdit()` | Starts an editing session: getAssignedPlayers then returns frozen assignments instead of recomputing. | 1496 |
| `core_multiseat.cachePlayerAssignments(config)` | Builds the cache (device/group owners by persona number) from a configuration and stores it in ui_multiseat_assignmentCache. | 1022 |
| `core_multiseat.clearDeviceColors()` | Removes the player colors from the devices, if they had been applied. | 1362 |
| `core_multiseat.clearJoinedPlayers()` | Removes all joined players and clears all personas. | 886 |
| `core_multiseat.clearPlayerPersona(player)` | Resets a joined player's persona to its default values and notifies. | 1291 |
| `core_multiseat.cycleDevicePlayer(deviceId)` | Moves a device (or the keyboard+mouse group) to the next player in the cycle (player 0, -1 unassigned, then previous player...), renumbers the players and updates core_input_bindings. Refused if the platform manages players. | 616 |
| `core_multiseat.endConfigurationEdit(devices, assignments)` | Ends the editing, and optionally stores the provided device and assignment state. | 1497 |
| `core_multiseat.exportConfiguration()` | Exports the full multiseat state (assignments, joined players, personas, caches) as a copyable table, used as a snapshot for restoration or Lua reload. | 971 |
| `core_multiseat.finalizeConfiguration()` | Finishes a deferred application: updates the pending assignment cache and emits the participants notification. | 1228 |
| `core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers)` | Computes which player controls each device, applies it via assignPlayerToDevice and updates the internal state (active players, personas). During a configuration edit, returns 'safe' assignments without modifying them. Called by core_input_bindings. *(internal)* | 201 |
| `core_multiseat.getAvailableParticipants()` | Participants available for the UI: for each active player, { id = 'local-player:N', assignment, inputIcon, joined, persona (real if joined, otherwise preview) }. | 1239 |
| `core_multiseat.getCachedPlayerAssignments()` | Returns the assignment cache stored in ui_multiseat_assignmentCache. | 1029 |
| `core_multiseat.getDeviceAssignments()` | Lists, for the UI, the 'devices' (keyboard+mouse grouped, controllers) with their manually assigned player: { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }. | 469 |
| `core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices)` | Parameterized version of getDeviceAssignments for provided devices and assignments. | 409 |
| `core_multiseat.getDeviceGroupForPlayer(player)` | Returns the device group assigned to a player. | 609 |
| `core_multiseat.getDeviceGroups()` | Platform device groups (one per user account), with the assigned player; includes assigned but disconnected groups (connected = false). | 566 |
| `core_multiseat.getDeviceGroupsFor(devices, groupAssignments)` | Parameterized version of getDeviceGroups. | 496 |
| `core_multiseat.getJoinedParticipants()` | Participants of the joined players, sorted by player index. | 961 |
| `core_multiseat.getJoinedPlayers()` | Sorted indices of the players that have joined (with persona). | 713 |
| `core_multiseat.getParticipant(player)` | Returns a player's participant. | 1272 |
| `core_multiseat.getParticipantRevision()` | Returns the participants revision (internal counter + core_playerPersonas revision), to detect changes. | 62 |
| `core_multiseat.getParticipants(players)` | Returns the participants (persona + assignment). With no argument and if there are joined players, these are the joined players; otherwise the active players (with a preview persona if not joined). | 1258 |
| `core_multiseat.getPlayerMarkersEnabled()` | Indicates whether player tags are enabled ('multiseatTags' boolean setting, default true). Converts an old string value to a boolean ('never' = false). See the notes on the inconsistency with core_multiseatPlayerMarkers. | 49 |
| `core_multiseat.getPlayers(result)` | Fills and returns the ordered list of currently active player indices. | 322 |
| `core_multiseat.isApplyingConfiguration()` | Indicates whether applyConfiguration is in progress. | 1495 |
| `core_multiseat.isConfigurationEditActive()` | Indicates whether a configuration edit is in progress. | 1505 |
| `core_multiseat.isMultiseatActive()` | Indicates whether multiseat is active. | 1399 |
| `core_multiseat.isPlatformManagingPlayers()` | Indicates whether the platform (console, Steam...) manages players itself: Input.getPlatformUserCount() non-nil (or debug mode). | 120 |
| `core_multiseat.joinPlayer(player)` | Makes an active player join: assigns it the first free persona number (default persona), renumbers and notifies. Returns true if already joined. | 838 |
| `core_multiseat.leavePlayer(player)` | Removes a joined player: clears its persona and frees its devices or group, then notifies. | 852 |
| `core_multiseat.onClientEndMission()` | End of level: resets the whole multiseat state (see notes, reset()). *(internal)* *(hook)* | 1403 |
| `core_multiseat.onDeserialized(data)` | After a Lua reload: restores the configuration from the snapshot. *(internal)* *(hook)* | 1450 |
| `core_multiseat.onExtensionUnloaded()` | On unload: destroys the player tags and removes the device colors. *(internal)* *(hook)* | 1518 |
| `core_multiseat.onLanguageChanged()` | Language change hook: resynchronizes the joined players, invalidates the personas (translated names) and notifies. *(internal)* *(hook)* | 1511 |
| `core_multiseat.onSerialize(reason)` | Before a Lua reload: destroys tags and colors, and returns a snapshot if multiseat is active. *(internal)* *(hook)* | 1435 |
| `core_multiseat.onUpdate(dtReal, dtSim)` | Per-frame hook (only when a level is loaded): synchronizes the device colors and displays/updates the player tags (render_playerTags), unless split-screen is loaded. *(internal)* *(hook)* | 1379 |
| `core_multiseat.previewDeviceColors(config)` | Shows on the devices the player colors of a configuration still being edited (core_devices.setPlayerColors). | 1348 |
| `core_multiseat.resolveConfiguration(config, devices)` | Validates and normalizes a configuration proposed by the UI: renumbers the players from 0 according to persona number order and translates the device/group assignments. | 1033 |
| `core_multiseat.restoreConfiguration(snapshot)` | Restores a snapshot produced by exportConfiguration (protected by pcall, refused during an applyConfiguration) and notifies. | 1125 |
| `core_multiseat.setMultiseatActive(active)` | Marks multiseat as active (multiseat session in progress). | 1395 |
| `core_multiseat.setPersonaOptInMode(enabled)` | Enables or disables the mode where players must join explicitly (instead of getting a persona automatically). Enabling it clears the joined players. | 898 |
| `core_multiseat.setPlayerMarkersEnabled(enabled)` | Saves the boolean 'multiseatTags' setting. | 58 |
| `core_multiseat.setPlayerPersona(player, data)` | Sets the persona of a joined player (name, icon, color, vehicle) and notifies. | 1282 |

### Parameter details

#### `core_multiseat.applyConfiguration(config)`

Applies a multiseat configuration: enables the 'multiseat' setting and the action map, installs the assignments, personas and players, with automatic restoration on error.

- `config` (*table*) : See resolveConfiguration; extra fields: multiseatActive (default true), deferParticipantNotification.
- **returns**: boolean true if applied.
- **returns**: string|nil Failure reason.

#### `core_multiseat.assignDeviceGroup(groupId, player)`

Assigns a platform device group to a player (or -1 to unassign). Refuses if the platform does not manage players, if the group does not exist or if the player is already taken by another group.

- `groupId` (*integer*) : Group identifier.
- `player` (*integer*) : Player index >= 0, or -1.
- **returns**: boolean true if the assignment was made.

#### `core_multiseat.cachePlayerAssignments(config)`

Builds the cache (device/group owners by persona number) from a configuration and stores it in ui_multiseat_assignmentCache.

- `config` (*table*) : Configuration with participants and assignments.
- **returns**: boolean false if the config is invalid.

#### `core_multiseat.clearJoinedPlayers()`

Removes all joined players and clears all personas.

- **returns**: boolean false if there were none.

#### `core_multiseat.clearPlayerPersona(player)`

Resets a joined player's persona to its default values and notifies.

- `player` (*integer*) : Player index.
- **returns**: boolean false if the player has not joined.

#### `core_multiseat.cycleDevicePlayer(deviceId)`

Moves a device (or the keyboard+mouse group) to the next player in the cycle (player 0, -1 unassigned, then previous player...), renumbers the players and updates core_input_bindings. Refused if the platform manages players.

- `deviceId` (*string*) : Id of a device.
- **returns**: boolean true if the assignment changed.

#### `core_multiseat.endConfigurationEdit(devices, assignments)`

Ends the editing, and optionally stores the provided device and assignment state.

- `devices` (*table|nil*) : Devices to store.
- `assignments` (*table|nil*) : Assignments to store.

#### `core_multiseat.exportConfiguration()`

Exports the full multiseat state (assignments, joined players, personas, caches) as a copyable table, used as a snapshot for restoration or Lua reload.

- **returns**: table Snapshot.

#### `core_multiseat.finalizeConfiguration()`

Finishes a deferred application: updates the pending assignment cache and emits the participants notification.

- **returns**: boolean false if there was nothing to finalize.

#### `core_multiseat.getAssignedPlayers(devices, logEnabled, seatPlayers)`

Computes which player controls each device, applies it via assignPlayerToDevice and updates the internal state (active players, personas). During a configuration edit, returns 'safe' assignments without modifying them. Called by core_input_bindings.

- `devices` (*table*) : device name -> { guid, productName, pidvid, playerNumber, platformUserNumber }.
- `logEnabled` (*boolean|nil*) : Writes the number of players and the assignments to the log.
- `seatPlayers` (*boolean|nil*) : If true, makes on-foot players enter the least occupied vehicle and makes those who became inactive exit.
- **returns**: table<string, integer> Device -> player index (-1 = none).

#### `core_multiseat.getAvailableParticipants()`

Participants available for the UI: for each active player, { id = 'local-player:N', assignment, inputIcon, joined, persona (real if joined, otherwise preview) }.

- **returns**: table[] Available participants.

#### `core_multiseat.getCachedPlayerAssignments()`

Returns the assignment cache stored in ui_multiseat_assignmentCache.

- **returns**: table|nil Cache.

#### `core_multiseat.getDeviceAssignments()`

Lists, for the UI, the 'devices' (keyboard+mouse grouped, controllers) with their manually assigned player: { id, deviceIds, primaryDeviceId, deviceLabel, inputIcon, playerIndex, connected, deviceMetadata }.

- **returns**: table[] Elements described above, keyboard-mouse first.

#### `core_multiseat.getDeviceAssignmentsFor(devices, assignedPlayers, connectedDevices)`

Parameterized version of getDeviceAssignments for provided devices and assignments.

- `devices` (*table|nil*) : Devices.
- `assignedPlayers` (*table<string, integer>|nil*) : Device -> player.
- `connectedDevices` (*table|nil*) : Connected devices (nil = all).
- **returns**: table[] Same format as getDeviceAssignments.

#### `core_multiseat.getDeviceGroupForPlayer(player)`

Returns the device group assigned to a player.

- `player` (*integer*) : Player index.
- **returns**: integer|nil groupId, or nil.

#### `core_multiseat.getDeviceGroups()`

Platform device groups (one per user account), with the assigned player; includes assigned but disconnected groups (connected = false).

- **returns**: table[] Elements { id, groupId, playerIndex, label, devices, connected }.

#### `core_multiseat.getDeviceGroupsFor(devices, groupAssignments)`

Parameterized version of getDeviceGroups.

- `devices` (*table|nil*) : Devices.
- `groupAssignments` (*table<integer, integer>|nil*) : groupId -> player.
- **returns**: table[] Groups sorted by groupId.

#### `core_multiseat.getJoinedParticipants()`

Participants of the joined players, sorted by player index.

- **returns**: table[] Participants.

#### `core_multiseat.getJoinedPlayers()`

Sorted indices of the players that have joined (with persona).

- **returns**: integer[] Player indices.

#### `core_multiseat.getParticipant(player)`

Returns a player's participant.

- `player` (*integer*) : Player index.
- **returns**: table|nil Participant.

#### `core_multiseat.getParticipantRevision()`

Returns the participants revision (internal counter + core_playerPersonas revision), to detect changes.

- **returns**: integer Revision.

#### `core_multiseat.getParticipants(players)`

Returns the participants (persona + assignment). With no argument and if there are joined players, these are the joined players; otherwise the active players (with a preview persona if not joined).

- `players` (*integer[]|nil*) : List of player indices.
- **returns**: table[] Participants.

#### `core_multiseat.getPlayerMarkersEnabled()`

Indicates whether player tags are enabled ('multiseatTags' boolean setting, default true). Converts an old string value to a boolean ('never' = false). See the notes on the inconsistency with core_multiseatPlayerMarkers.

- **returns**: boolean true if enabled.

#### `core_multiseat.getPlayers(result)`

Fills and returns the ordered list of currently active player indices.

- `result` (*integer[]|nil*) : Table to reuse (cleared then filled).
- **returns**: integer[] Player indices.

#### `core_multiseat.isApplyingConfiguration()`

Indicates whether applyConfiguration is in progress.

- **returns**: boolean true if in progress.

#### `core_multiseat.isConfigurationEditActive()`

Indicates whether a configuration edit is in progress.

- **returns**: boolean true if in progress.

#### `core_multiseat.isMultiseatActive()`

Indicates whether multiseat is active.

- **returns**: boolean true if active.

#### `core_multiseat.isPlatformManagingPlayers()`

Indicates whether the platform (console, Steam...) manages players itself: Input.getPlatformUserCount() non-nil (or debug mode).

- **returns**: boolean true if platform-managed.

#### `core_multiseat.joinPlayer(player)`

Makes an active player join: assigns it the first free persona number (default persona), renumbers and notifies. Returns true if already joined.

- `player` (*integer*) : Active player index.
- **returns**: boolean false if the player is not active or there is no room left.

#### `core_multiseat.leavePlayer(player)`

Removes a joined player: clears its persona and frees its devices or group, then notifies.

- `player` (*integer*) : Player index.
- **returns**: boolean false if the player had not joined.

#### `core_multiseat.onDeserialized(data)`

After a Lua reload: restores the configuration from the snapshot.

- `data` (*table*) : Snapshot returned by onSerialize.

#### `core_multiseat.onSerialize(reason)`

Before a Lua reload: destroys tags and colors, and returns a snapshot if multiseat is active.

- `reason` (*string|nil*) : Serialization reason (log).
- **returns**: table|nil Snapshot, or nil if multiseat is inactive.

#### `core_multiseat.onUpdate(dtReal, dtSim)`

Per-frame hook (only when a level is loaded): synchronizes the device colors and displays/updates the player tags (render_playerTags), unless split-screen is loaded.

- `dtReal` (*number*) : Elapsed real time (s).
- `dtSim` (*number*) : Elapsed simulation time (s), unused.

#### `core_multiseat.previewDeviceColors(config)`

Shows on the devices the player colors of a configuration still being edited (core_devices.setPlayerColors).

- `config` (*table|nil*) : Configuration to preview; nil clears the colors.

#### `core_multiseat.resolveConfiguration(config, devices)`

Validates and normalizes a configuration proposed by the UI: renumbers the players from 0 according to persona number order and translates the device/group assignments.

- `config` (*table*) : { participants = [{ playerIndex, personaNumber, persona }], manualAssignments, groupAssignments, platformManagesPlayers, personaOptInMode, manualDeviceMetadata, platformDeviceGroups }.
- `devices` (*table|nil*) : Known devices.
- **returns**: table|nil Resolved configuration { platformManagesPlayers, personaOptInMode, manualAssignments, groupAssignments, assignments, participants, personas, ... }.
- **returns**: string|nil Failure reason: 'invalid_configuration', 'invalid_player_count' or 'invalid_participant'.

#### `core_multiseat.restoreConfiguration(snapshot)`

Restores a snapshot produced by exportConfiguration (protected by pcall, refused during an applyConfiguration) and notifies.

- `snapshot` (*table*) : Snapshot.
- **returns**: boolean true if restored.

#### `core_multiseat.setMultiseatActive(active)`

Marks multiseat as active (multiseat session in progress).

- `active` (*boolean*) : New state.

#### `core_multiseat.setPersonaOptInMode(enabled)`

Enables or disables the mode where players must join explicitly (instead of getting a persona automatically). Enabling it clears the joined players.

- `enabled` (*boolean*) : true to enable.

#### `core_multiseat.setPlayerMarkersEnabled(enabled)`

Saves the boolean 'multiseatTags' setting.

- `enabled` (*boolean*) : true to enable.

#### `core_multiseat.setPlayerPersona(player, data)`

Sets the persona of a joined player (name, icon, color, vehicle) and notifies.

- `player` (*integer*) : Player index.
- `data` (*table*) : { id, displayName, icon, color, vehicle }
- **returns**: boolean false if the player has not joined or the data is invalid.

## Fields

| Field | Type | Description |
|---|---|---|
| `allowTrafficDebug` | boolean | false. Not used in this file. |
| `dependencies` | string[] | { 'core_playerPersonas', 'render_playerTags', 'ui_multiseat_assignmentCache' }. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onLocalParticipantsChanged` — listened to by 4 module(s)

**UI events (guihooks.trigger):** `LocalParticipantsChanged`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `exitVehicle`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/multiseat.lua`.*
