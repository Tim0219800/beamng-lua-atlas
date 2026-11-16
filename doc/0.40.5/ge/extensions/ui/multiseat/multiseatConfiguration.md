# `ui_multiseat_multiseatConfiguration`

*File: `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua` · VM: Game Engine (GE) · 913 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_multiseatConfiguration`: `extensions.load("ui_multiseat_multiseatConfiguration")`, then the global `ui_multiseat_multiseatConfiguration`

Transactional model of the multi-seat configuration: which input devices (or platform-managed device groups) belong to which player/persona. begin() opens a transaction (copy of the current state or of the assignment cache), the editing functions modify it, getPreview() provides the state to the UI, then commit() (or commitCore + completeCommit) applies it via core_multiseat.applyConfiguration; discard() abandons it. Used by the multiseat settings screen.

## Example

```lua
local cfg = require('ge/extensions/ui/multiseat/multiseatConfiguration')
cfg.begin({source = 'settings'})
cfg.setDevicePlayer('keyboard-mouse', 1)
local ok, configOrReason = cfg.commit()
```

## Notes

- All editing functions return false when no transaction is open (except getPreview, which calls begin() automatically).
- The functions toggleDevicePlayer, setDevicePlayer, removeDevice, moveDevicePlayer and cycleDevicePlayer only work in manual mode (platformManagesPlayers == false); joinDeviceGroup only in platform mode.
- The number of personas is limited to MAX_PLAYERS = 64 and by the hard limit of the current gamemode (core/multiseatPlayerLimits).
- Persona numbers start at 1; the player index (player) starts at 0 and follows the ascending order of persona numbers.
- A persona with no owner (no device/group) is automatically deleted.
- When there is no active multiseat session, begin() takes player 0's vehicle (except unicycle) for persona 1 and tries to reuse the assignment cache (core_multiseat.getCachedPlayerAssignments) if the platform mode has not changed.
- Each modification triggers guihooks MultiseatConfigurationChanged with an increasing revision number and updates the device color preview.
- commitCore refuses a configuration with no player (reason "no_players").

**Dependencies (loaded first):** `core_playerPersonas`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_multiseatConfiguration.begin(options)` | Opens the configuration transaction if it does not exist (copy of the active configuration or of the cache), otherwise reconciles the device inventory. Calls core_multiseat.beginConfigurationEdit. | 328 |
| `ui_multiseat_multiseatConfiguration.clearCachedAssignments()` | Clears the player assignment cache (core_multiseat.cachePlayerAssignments with empty lists). No effect if multiseat is already active. | 823 |
| `ui_multiseat_multiseatConfiguration.commit()` | commitCore then completeCommit. | 895 |
| `ui_multiseat_multiseatConfiguration.commitCore()` | Applies the configuration via core_multiseat.applyConfiguration (participant notification deferred) and stores the change log; the transaction stays open to allow rollbackCommit. | 860 |
| `ui_multiseat_multiseatConfiguration.completeCommit()` | Ends a successful commit: calls core_multiseat.finalizeConfiguration, closes the transaction and logs the changes. | 873 |
| `ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId)` | Manual mode: with no player, assigns the device to the first free persona; otherwise moves it to the previous persona (or unassigns it if there is none). | 506 |
| `ui_multiseat_multiseatConfiguration.discard()` | Abandons the transaction; if it had already been applied (commitCore), restores the starting configuration. Ends the edit on the core_multiseat side. | 367 |
| `ui_multiseat_multiseatConfiguration.getCommitConfiguration()` | Builds the configuration to apply: platformManagesPlayers, personaOptInMode, manualAssignments (deviceId to player, -1 if none), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} and adoptVehicleId. | 658 |
| `ui_multiseat_multiseatConfiguration.getPersona(personaNumber)` | Returns a copy of the transaction's persona. | 575 |
| `ui_multiseat_multiseatConfiguration.getPlayers()` | Returns the list of player indices (0 to n-1). | 651 |
| `ui_multiseat_multiseatConfiguration.getPreview()` | Returns the displayable state of the configuration (opens the transaction if needed): availablePlayers (devices in manual mode), availablePersonas and joinedPersonas, deviceGroups (platform mode), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} and revision. | 581 |
| `ui_multiseat_multiseatConfiguration.hasChanges()` | Compares the current configuration to the starting baseline: true if multiseat was not active, or if the number of players or the assignments differ. | 834 |
| `ui_multiseat_multiseatConfiguration.hasUserChanges()` | Returns whether the user has modified the assignments since opening (or whether they come from the cache). | 814 |
| `ui_multiseat_multiseatConfiguration.isActive()` | Returns whether a transaction is open. | 363 |
| `ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId)` | Platform mode: makes a device group join; the persona takes the group's number if it is free and valid, otherwise the first free one. | 531 |
| `ui_multiseat_multiseatConfiguration.leavePlayer(player)` | Removes a player: frees all its devices/groups and deletes its persona. | 547 |
| `ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction)` | Manual mode: moves the device to the previous persona (direction -1, or none if it is the first) or the next one (direction 1, or a new persona if it is the last and it has several devices). | 456 |
| `ui_multiseat_multiseatConfiguration.onClientEndMission()` | Hook called at the end of the level; abandons the transaction without restoring and clears the color preview. *(internal)* *(hook)* | 902 |
| `ui_multiseat_multiseatConfiguration.onInputBindingsChanged()` | Hook called when devices or bindings change; reconciles the inventory and notifies the UI if the list changed. *(internal)* *(hook)* | 908 |
| `ui_multiseat_multiseatConfiguration.removeDevice(deviceId)` | Manual mode: forgets a disconnected device (connected == false), unassigns it and marks it as removed. | 437 |
| `ui_multiseat_multiseatConfiguration.rollbackCommit()` | Restores the starting configuration after a commitCore. | 886 |
| `ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber)` | Manual mode: assigns the device to the given persona (1 to 64), or unassigns it with nil or 0. Returns false if nothing changes or the player limit forbids it. | 418 |
| `ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange)` | Copies the keys of data into the persona (name, icon, color, vehicle...). | 566 |
| `ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId)` | Manual mode: removes the device from its player if it has one, otherwise assigns it to the first free persona. | 397 |

### Parameter details

#### `ui_multiseat_multiseatConfiguration.begin(options)`

Opens the configuration transaction if it does not exist (copy of the active configuration or of the cache), otherwise reconciles the device inventory. Calls core_multiseat.beginConfigurationEdit.

- `options` (*table|nil*) : Options; source = origin of the opening (for example "settings").
- **returns**: table Preview, see getPreview.

#### `ui_multiseat_multiseatConfiguration.clearCachedAssignments()`

Clears the player assignment cache (core_multiseat.cachePlayerAssignments with empty lists). No effect if multiseat is already active.

- **returns**: boolean Result of the clearing, false if impossible.

#### `ui_multiseat_multiseatConfiguration.commit()`

commitCore then completeCommit.

- **returns**: boolean Success.
- **returns**: table|string Applied configuration, or failure reason.

#### `ui_multiseat_multiseatConfiguration.commitCore()`

Applies the configuration via core_multiseat.applyConfiguration (participant notification deferred) and stores the change log; the transaction stays open to allow rollbackCommit.

- **returns**: boolean Success.
- **returns**: table|string Applied configuration, or failure reason (for example "no_players").

#### `ui_multiseat_multiseatConfiguration.completeCommit()`

Ends a successful commit: calls core_multiseat.finalizeConfiguration, closes the transaction and logs the changes.

- **returns**: boolean false if no successful commitCore.

#### `ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId)`

Manual mode: with no player, assigns the device to the first free persona; otherwise moves it to the previous persona (or unassigns it if there is none).

- `deviceId` (*string*) : Device or group identifier.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatConfiguration.discard()`

Abandons the transaction; if it had already been applied (commitCore), restores the starting configuration. Ends the edit on the core_multiseat side.

- **returns**: boolean false if there was no transaction.

#### `ui_multiseat_multiseatConfiguration.getCommitConfiguration()`

Builds the configuration to apply: platformManagesPlayers, personaOptInMode, manualAssignments (deviceId to player, -1 if none), manualDeviceMetadata, groupAssignments, platformDeviceGroups, participants {playerIndex, personaNumber, persona} and adoptVehicleId.

- **returns**: table|nil Configuration, nil without a transaction.

#### `ui_multiseat_multiseatConfiguration.getPersona(personaNumber)`

Returns a copy of the transaction's persona.

- `personaNumber` (*integer*) : Persona number.
- **returns**: table|nil Persona or nil.

#### `ui_multiseat_multiseatConfiguration.getPlayers()`

Returns the list of player indices (0 to n-1).

- **returns**: integer[] Indices; empty without a transaction.

#### `ui_multiseat_multiseatConfiguration.getPreview()`

Returns the displayable state of the configuration (opens the transaction if needed): availablePlayers (devices in manual mode), availablePersonas and joinedPersonas, deviceGroups (platform mode), maxPlayers, platformManagesPlayers, playerLimit {limit, hard, atLimit, exceeded} and revision.

- **returns**: table Preview table.

#### `ui_multiseat_multiseatConfiguration.hasChanges()`

Compares the current configuration to the starting baseline: true if multiseat was not active, or if the number of players or the assignments differ.

- **returns**: boolean true if there are changes.

#### `ui_multiseat_multiseatConfiguration.hasUserChanges()`

Returns whether the user has modified the assignments since opening (or whether they come from the cache).

- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatConfiguration.isActive()`

Returns whether a transaction is open.

- **returns**: boolean true if open.

#### `ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId)`

Platform mode: makes a device group join; the persona takes the group's number if it is free and valid, otherwise the first free one.

- `groupId` (*integer*) : Group identifier (converted with tonumber).
- **returns**: boolean false if already joined or limit reached.

#### `ui_multiseat_multiseatConfiguration.leavePlayer(player)`

Removes a player: frees all its devices/groups and deletes its persona.

- `player` (*integer*) : Player index (0-based).
- **returns**: boolean false if the player does not exist.

#### `ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction)`

Manual mode: moves the device to the previous persona (direction -1, or none if it is the first) or the next one (direction 1, or a new persona if it is the last and it has several devices).

- `deviceId` (*string*) : Device or group identifier.
- `direction` (*integer*) : -1 or 1.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatConfiguration.removeDevice(deviceId)`

Manual mode: forgets a disconnected device (connected == false), unassigns it and marks it as removed.

- `deviceId` (*string*) : Device or group identifier.
- **returns**: boolean false if the device is not found or still connected.

#### `ui_multiseat_multiseatConfiguration.rollbackCommit()`

Restores the starting configuration after a commitCore.

- **returns**: boolean Result of core_multiseat.restoreConfiguration, or false.

#### `ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber)`

Manual mode: assigns the device to the given persona (1 to 64), or unassigns it with nil or 0. Returns false if nothing changes or the player limit forbids it.

- `deviceId` (*string*) : Device or group identifier.
- `personaNumber` (*integer|nil*) : 1..64 to assign, nil or 0 to unassign.
- **returns**: boolean true if modified.

#### `ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange)`

Copies the keys of data into the persona (name, icon, color, vehicle...).

- `personaNumber` (*integer*) : Persona number.
- `data` (*table*) : Fields to overwrite.
- `emitChange` (*boolean|nil*) : If false, does not notify the UI.
- **returns**: boolean false if no transaction, invalid data or unknown persona.

#### `ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId)`

Manual mode: removes the device from its player if it has one, otherwise assigns it to the first free persona.

- `deviceId` (*string*) : Device or group identifier.
- **returns**: boolean true if modified.

## Fields

| Field | Type | Description |
|---|---|---|
| `AUTOMATIC_COLOR_DEFAULT` | boolean | Default value (true) of the multiseatAutomaticColor setting. |
| `dependencies` | table<integer, string> | Extensions loaded before: core_playerPersonas. |

**UI events (guihooks.trigger):** `MultiseatConfigurationChanged`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua`.*
