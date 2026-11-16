# `ui_multiseat_multiseatSettings`

*File: `lua/ge/extensions/ui/multiseat/multiseatSettings.lua` · VM: Game Engine (GE) · 676 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_multiseatSettings`: `extensions.load("ui_multiseat_multiseatSettings")`, then the global `ui_multiseat_multiseatSettings`

Logic of the multi-seat settings screen (routes "pause.multiseatSettings" and "pause.multiseatSettings.vehicleSelector"). It collects the settings providers from other extensions (hook onGetMultiseatGameSettings), keeps active values and staged values, builds the screen data for the Vue UI, applies or abandons changes and handles exit confirmation. Actions on players/devices are delegated to ui_multiseat_multiseatVehicles. A modder adds settings by answering the hook onGetMultiseatGameSettings.

## Example

```lua
-- settings provider in an extension
function M.onGetMultiseatGameSettings(providers)
  providers[#providers + 1] = {id = 'monMod', title = 'Mon mod', applyMode = 'apply', fields = {
    {id = 'actif', type = 'switch', label = 'Actif', value = true}
  }}
end
```

## Notes

- A valid provider is a table {id = string, fields = table, title, placement, applyMode}. placement = "afterVehicles" places the section after the vehicle list.
- Field types: "action" and "actionSelect" do not store a value (executed immediately by onMultiseatGameSettingAction); the others (switch, select, layout...) are stored and staged.
- applyMode (per field or per provider) is "restart" by default; "apply" or "immediate" otherwise. "immediate" also updates the active value as soon as it changes.
- If a field has an options list, the value must be in it (tolerant numeric comparison); otherwise refused (reason "invalid_setting"), except the value "" with allowEmpty = true.
- Hooks emitted: onGetMultiseatGameSettings(providers), onGetMultiseatSettingsScreenData(screen), onMultiseatGameSettingChanged(providerId, fieldId, value), onMultiseatGameSettingAction(providerId, fieldId, result[, value]), onValidateMultiseatGameSettings(staged, active, result, context), onApplyMultiseatGameSettings(staged, active, result, context), onMultiseatSettingsApplied(changeSet, result), onMultiseatSettingsClosed(toRoute), onPlayMultiseatGameSettings(result).
- A hook can set result.success = false (and result.reason) to refuse; result.valueOverrides[providerId][fieldId] replaces staged values after application; result.deferred = true avoids the screen notification.
- While the screen is open, the game is paused via simTimeAuthority.pushPauseRequest("multiseat_settings"); the pause is released on close.
- UI events emitted: MultiseatSettingsChanged (the screen must reload) and showConfirmationDialog (buttons with luaCallback).

**Dependencies (loaded first):** `ui_multiseat_generalSettings`, `ui_multiseat_multiseatConfiguration`, `ui_multiseat_multiseatVehicles`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_multiseatSettings.applyStagedSettings(options)` | Applies the staged changes: validates (hook onValidateMultiseatGameSettings), prepares the vehicles, applies the player configuration (commitCore), finalizes the vehicles, calls onApplyMultiseatGameSettings then onMultiseatSettingsApplied. On failure the configuration is restored (rollbackCommit). | 319 |
| `ui_multiseat_multiseatSettings.cancelExit()` | Cancels the pending exit navigation. | 516 |
| `ui_multiseat_multiseatSettings.confirmExit(route, params, context)` | Route exit guard: if there are unapplied changes, stores the targeted navigation and shows a box (cancel, discard, apply) then returns false to block the exit. Returns true if the exit is allowed. | 470 |
| `ui_multiseat_multiseatSettings.confirmExitApplying()` | Applies the staged settings then resumes the pending navigation; on failure, cancels the navigation and returns the result. | 525 |
| `ui_multiseat_multiseatSettings.confirmExitDiscarding()` | Resumes the pending navigation without applying; staged values are lost on close (closeSettings). | 521 |
| `ui_multiseat_multiseatSettings.confirmMultiseatExit()` | Quits multiseat: caches the assignments if no staged players remain, applies pending changes if only one player remains, calls ui_multiseat_freeroam.exitMultiseat then closes the menu. | 432 |
| `ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId)` | Moves a device to the next player (delegated to multiseatVehicles). | 543 |
| `ui_multiseat_multiseatSettings.discardStagedSettings()` | Abandons the staged values (back to active values), clears the assignment cache if multiseat is not active, abandons the configuration and the vehicle changes. | 399 |
| `ui_multiseat_multiseatSettings.getScreenData()` | Builds the screen data: components "personas", "settings" (one per provider), "vehicles", title, flags active, dirty, discardDirty, applyMode ("none", "apply" or "restart"), readyToPlay and busy. Opens the multiseatConfiguration transaction if needed. Returns nil if the screen is not open. | 213 |
| `ui_multiseat_multiseatSettings.joinDeviceGroup(groupId)` | Makes a platform-managed device group join. | 583 |
| `ui_multiseat_multiseatSettings.leaveDeviceGroup(player)` | Removes a player (and its group). | 591 |
| `ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction)` | Moves a device to the previous or next player. | 559 |
| `ui_multiseat_multiseatSettings.notifyScreenChanged()` | Sends the UI event MultiseatSettingsChanged so that the screen reloads. | 625 |
| `ui_multiseat_multiseatSettings.onClientEndMission()` | Hook called at the end of the level; resets all state (values, pause, pending exits). *(internal)* *(hook)* | 661 |
| `ui_multiseat_multiseatSettings.onExtensionUnloaded()` | Hook called when the extension is unloaded; releases the pause request. *(internal)* *(hook)* | 671 |
| `ui_multiseat_multiseatSettings.onLocalParticipantsChanged()` | Hook called when the local participants change; notifies the screen except during a vehicle synchronization. *(internal)* *(hook)* | 629 |
| `ui_multiseat_multiseatSettings.onSettingsEnter()` | Entry callback of the settings route: marks the screen open and pauses the game. *(internal)* *(hook)* | 634 |
| `ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data)` | Exit callback of the settings route: calls ui_pause_routeLifecycleCallbacks.onPauseLeave then closes the settings if the targeted route is no longer part of them. *(internal)* *(hook)* | 639 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data)` | Entry callback of the vehicle selector route: marks the screen open, pauses the game and delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter. *(internal)* *(hook)* | 644 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data)` | Exit callback of the selector route: delegates to gridSelector and pause, informs multiseatVehicles then closes the settings if the targeted route is no longer part of them. *(internal)* *(hook)* | 654 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data)` | Mount callback of the selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount. *(internal)* *(hook)* | 650 |
| `ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player)` | Opens the vehicle selector for a player (delegated to multiseatVehicles). | 599 |
| `ui_multiseat_multiseatSettings.play()` | Emits the hook onPlayMultiseatGameSettings; a game mode can start the game there by setting result.success = true. | 619 |
| `ui_multiseat_multiseatSettings.removeDevice(deviceId)` | Forgets a disconnected device. | 575 |
| `ui_multiseat_multiseatSettings.requestMultiseatExit()` | Shows a confirmation box to quit multiseat (confirmation button: confirmMultiseatExit). Does nothing if multiseat is not active. | 410 |
| `ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value)` | Executes a field of type "action" or "actionSelect" via the hook onMultiseatGameSettingAction. Reloads the screen if the action succeeded. | 298 |
| `ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber)` | Assigns a device to a given persona. | 567 |
| `ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon)` | Stages a player's icon. | 611 |
| `ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn)` | Stages a player's opt-in or exit (via ui_multiseat_multiseatVehicles.stagePlayerOptIn). | 535 |
| `ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences)` | Stages a player's vehicle preferences. | 603 |
| `ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value)` | Stages a field's value (normalized according to its options) and emits onMultiseatGameSettingChanged. Invalid value or field: the screen is simply returned unchanged. | 275 |
| `ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId)` | Assigns/unassigns a device (delegated to multiseatVehicles). | 551 |

### Parameter details

#### `ui_multiseat_multiseatSettings.applyStagedSettings(options)`

Applies the staged changes: validates (hook onValidateMultiseatGameSettings), prepares the vehicles, applies the player configuration (commitCore), finalizes the vehicles, calls onApplyMultiseatGameSettings then onMultiseatSettingsApplied. On failure the configuration is restored (rollbackCommit).

- `options` (*table|nil*) : exitAfterApply = true passes the flag to the hooks (result.exitAfterApply).
- **returns**: table {success, reason?, requiresRestart?, exitAfterApply?, ...}; {success = true} if there are no changes.

#### `ui_multiseat_multiseatSettings.confirmExit(route, params, context)`

Route exit guard: if there are unapplied changes, stores the targeted navigation and shows a box (cancel, discard, apply) then returns false to block the exit. Returns true if the exit is allowed.

- `route` (*table*) : Targeted route (name field).
- `params` (*table|nil*) : Navigation parameters.
- `context` (*table|nil*) : Context (routeName, options).
- **returns**: boolean true to allow the exit.

#### `ui_multiseat_multiseatSettings.confirmExitApplying()`

Applies the staged settings then resumes the pending navigation; on failure, cancels the navigation and returns the result.

- **returns**: table|any Failure result, otherwise navigation result.

#### `ui_multiseat_multiseatSettings.confirmExitDiscarding()`

Resumes the pending navigation without applying; staged values are lost on close (closeSettings).

- **returns**: any Result of ui_router.navigate, or false.

#### `ui_multiseat_multiseatSettings.confirmMultiseatExit()`

Quits multiseat: caches the assignments if no staged players remain, applies pending changes if only one player remains, calls ui_multiseat_freeroam.exitMultiseat then closes the menu.

- **returns**: boolean true if the exit and the menu closing succeeded.

#### `ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId)`

Moves a device to the next player (delegated to multiseatVehicles).

- `deviceId` (*string*) : Device identifier.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.discardStagedSettings()`

Abandons the staged values (back to active values), clears the assignment cache if multiseat is not active, abandons the configuration and the vehicle changes.

- **returns**: table|nil Updated screen data.

#### `ui_multiseat_multiseatSettings.getScreenData()`

Builds the screen data: components "personas", "settings" (one per provider), "vehicles", title, flags active, dirty, discardDirty, applyMode ("none", "apply" or "restart"), readyToPlay and busy. Opens the multiseatConfiguration transaction if needed. Returns nil if the screen is not open.

- **returns**: table|nil Screen data.

#### `ui_multiseat_multiseatSettings.joinDeviceGroup(groupId)`

Makes a platform-managed device group join.

- `groupId` (*integer*) : Group identifier.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.leaveDeviceGroup(player)`

Removes a player (and its group).

- `player` (*integer*) : Player index.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction)`

Moves a device to the previous or next player.

- `deviceId` (*string*) : Device identifier.
- `direction` (*integer*) : -1 or 1.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data)`

Exit callback of the settings route: calls ui_pause_routeLifecycleCallbacks.onPauseLeave then closes the settings if the targeted route is no longer part of them.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data)`

Entry callback of the vehicle selector route: marks the screen open, pauses the game and delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data)`

Exit callback of the selector route: delegates to gridSelector and pause, informs multiseatVehicles then closes the settings if the targeted route is no longer part of them.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data)`

Mount callback of the selector route; delegates to ui_gridSelectorRouteLifecycleCallbacks.onRouteMount.

- `context` (*table*) : Route context.
- `toRoute` (*table*) : Destination route.
- `fromRoute` (*table*) : Origin route.
- `data` (*any*) : Navigation data.

#### `ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player)`

Opens the vehicle selector for a player (delegated to multiseatVehicles).

- `player` (*integer*) : Player index.
- **returns**: any Result of multiseatVehicles.openVehicleSelectorForPlayer.

#### `ui_multiseat_multiseatSettings.play()`

Emits the hook onPlayMultiseatGameSettings; a game mode can start the game there by setting result.success = true.

- **returns**: table {success = boolean}.

#### `ui_multiseat_multiseatSettings.removeDevice(deviceId)`

Forgets a disconnected device.

- `deviceId` (*string*) : Device identifier.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.requestMultiseatExit()`

Shows a confirmation box to quit multiseat (confirmation button: confirmMultiseatExit). Does nothing if multiseat is not active.

- **returns**: boolean false if multiseat is not active.

#### `ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value)`

Executes a field of type "action" or "actionSelect" via the hook onMultiseatGameSettingAction. Reloads the screen if the action succeeded.

- `providerId` (*string*) : Provider identifier.
- `fieldId` (*string*) : Field identifier.
- `value` (*any*) : Chosen option (actionSelect only).
- **returns**: table {success = boolean, data = screen data}.

#### `ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber)`

Assigns a device to a given persona.

- `deviceId` (*string*) : Device identifier.
- `personaNumber` (*integer|nil*) : Persona number, nil or 0 to unassign.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon)`

Stages a player's icon.

- `player` (*integer*) : Player index.
- `icon` (*string*) : Icon identifier (inferred from code).
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn)`

Stages a player's opt-in or exit (via ui_multiseat_multiseatVehicles.stagePlayerOptIn).

- `player` (*integer*) : Player index.
- `optedIn` (*boolean*) : true to sign up.
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences)`

Stages a player's vehicle preferences.

- `player` (*integer*) : Player index.
- `preferences` (*table*) : Preferences (inferred from code).
- **returns**: table {success, data}.

#### `ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value)`

Stages a field's value (normalized according to its options) and emits onMultiseatGameSettingChanged. Invalid value or field: the screen is simply returned unchanged.

- `providerId` (*string*) : Provider identifier.
- `fieldId` (*string*) : Field identifier.
- `value` (*any*) : New value.
- **returns**: table|nil Updated screen data.

#### `ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId)`

Assigns/unassigns a device (delegated to multiseatVehicles).

- `deviceId` (*string*) : Device identifier.
- **returns**: table {success, data}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: ui_multiseat_generalSettings, ui_multiseat_multiseatConfiguration, ui_multiseat_multiseatVehicles, ui_gridSelectorRouteLifecycleCallbacks, ui_pause_routeLifecycleCallbacks. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onApplyMultiseatGameSettings` — listened to by 1 module(s)
- `onGetMultiseatGameSettings` — listened to by 1 module(s)
- `onGetMultiseatSettingsScreenData`
- `onMultiseatGameSettingAction` — listened to by 1 module(s)
- `onMultiseatGameSettingChanged` — listened to by 1 module(s)
- `onMultiseatSettingsApplied` — listened to by 2 module(s)
- `onMultiseatSettingsClosed` — listened to by 1 module(s)
- `onPlayMultiseatGameSettings`
- `onValidateMultiseatGameSettings` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `MultiseatSettingsChanged`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/multiseatSettings.lua`.*
