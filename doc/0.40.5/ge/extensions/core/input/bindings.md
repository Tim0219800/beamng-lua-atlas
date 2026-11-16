# `core_input_bindings`

*File: `lua/ge/extensions/core/input/bindings.lua` · VM: Game Engine (GE) · 1509 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_bindings`: `extensions.load("core_input_bindings")`, then the global `core_input_bindings`

GE extension `core_input_bindings`: loads, merges, saves and sends to the engine the key/axis -> action associations (bindings) of all connected devices, for each player. It reads the default inputmaps (JSON of the game and the vehicles) then the user differences (*.diff in settings/inputmaps), applies the FFB response curves, notifies the UI, the engine, the vehicles (force feedback config) and the other extensions. It also handles the activation of menu ActionMaps according to the open screens. A modder mainly uses it to find the key of an action, reset the controls or enable/disable menu actions.

## Example

```lua
local ctrl = core_input_bindings.getControlForAction('accelerate')   -- e.g. 'axis1'
local others = core_input_bindings.getActionsSharingControls('toggleMenues')
core_input_bindings.setMenuActionsEnabled({menu_item_up = false, menu_item_down = false})
```

## Notes

- Structure of M.bindings: list of {devname, contents = {bindings = {...}, guid, vidpid, name, devicetype, …}} sorted by device name (wheel0 before xinput0). Each binding: action (unique name, prefixed by the vehicle if specific), control, player, unused (boolean), plus the normalized fields (deadzoneResting, deadzoneEnd, linearity, angle, lockType, filterType, isInverted, isForceEnabled, ffb{…}).
- Default values of the binding fields (fillNormalizeBindingDefaults): deadzoneResting 0, deadzoneEnd 0, linearity 1, filterType -1, angle 0, lockType 3, ffb.forceCoef 100, ffb.smoothing 150, ffb.softlockForce 0.5 (clamped 0..1), ffb.responseCurve {{0,0},{1,1}}, logitechVibrotactileFreqMax clamped 20..150 (default 50).
- Files: default bindings = JSON in settings/inputmaps (game), vehicles/<vehicle>/ and vehicles/<vehicle>/inputmaps; user settings = .diff files written under settings/inputmaps[/<vehicle>] (name '<devicetype>.diff' for keyboard/mouse, otherwise '<lowercase vidpid>.diff'). A diff contains 'bindings' (added/modified) and 'removed'; version 1 allows control duplicates.
- File changes (inputmaps, actions) trigger a deferred reload of 0.1 s (forceRefresh) processed in updateGFX.
- Players: assignedPlayers associates a device name with a player index (-1 = none). With autoAssignPlayersToDevices (true by default) the association is recomputed by core_multiseat.
- Menus: the menu ActionMaps are 'MenuActionMap' plus 'MenuIndependent_<action>ActionMap'; they activate when a non-gameplay UI route (other than play, multiseat, trackBuilder) or a popup is open.
- Emitted hooks: onInputBindingsChanged(assignedPlayers), onFFBConfigChanged, onMenuActionMapEnabled(enabled). UI events: InputBindingsChanged, AssignedPlayersChanged, MenuActionMapEnabled, MenuActionMapStateChanged(action, enabled), RecentDevicesChanged, ControllersChanged.
- Inconsistencies: menuActive is deprecated (logs an error with the call stack then calls setMenuActionMapEnabled); the error messages of setMenuActionEnabled format a boolean/nil with %q which can raise an error instead of being displayed; migrateScePadDiffFiles does ipairs on the content of settings/scePadGuids.json without a nil check; onVehicleSpawned recomputes the bindings but does not call notifyAll; the ImGui debug window for ActionMaps is entirely commented out in the file.
- Field exported but not initialized as expected: isMenuActive starts at false and is only modified by setMenuActionMapEnabled.

**Dependencies (loaded first):** `core_input_actions`, `core_input_categories`, `core_multiseat`, `license`, `core_versionUpdate`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_input_bindings.applyPlayerAssignments(assignments, reason)` | Applies an assignment table at once (device -> player; absent = -1). | 959 |
| `core_input_bindings.enableCustomModifier(player, enabled, modifier)` | Enables or disables a custom modifier of the ActionMap for a player (ActionMap.enableCustomModifier). | 1368 |
| `core_input_bindings.getActionsSharingControls(actionName)` | Other actions used (not 'unused') on the same controls as actionName, on the same device. | 684 |
| `core_input_bindings.getAssignedPlayers()` | Returns M.assignedPlayers. | 1293 |
| `core_input_bindings.getControlForAction(actionName)` | Returns the first control (key/axis) found for an action, across all devices. The result is cached until the next notifyGE. | 669 |
| `core_input_bindings.getFFBConfigForAction(veh, action)` | Reads the force feedback configuration of an action (steering, accelerate, brake) for a vehicle's driver: decodes the JSON returned by be:getFFBConfig then ffbParamsJson into ffbConfig.ffbParams. | 764 |
| `core_input_bindings.getMenuActionMapEnabled()` | Returns isMenuActive. | 1231 |
| `core_input_bindings.getMenuActionMapWatchEnabled()` | Indicates whether watching is active. | 1125 |
| `core_input_bindings.getMenuActionStates()` | Current state (enabled or not) of each independent menu action. | 1108 |
| `core_input_bindings.getMenuScrollActionMapEnabled()` | State of the MenuScrollActionMap. | 1141 |
| `core_input_bindings.getRecentDevices()` | List of devices sorted by recent activity (cached, getDevicesByRecentActivity). | 1459 |
| `core_input_bindings.getUsedBindingsFiles()` | Reloads the bindings while recording the file paths read (useful to list the inputmaps used). | 1362 |
| `core_input_bindings.isModalPopupOpen()` | Indicates whether a modal popup is open (UI state '/popup/...' other than '/popup/activity/'). | 1288 |
| `core_input_bindings.menuActive(enabled)` | Deprecated: logs an error with the call stack and calls setMenuActionMapEnabled(enabled). | 1347 |
| `core_input_bindings.notifyUI(reason)` | Sends to the UI the controllers, the assigned players and an InputBindingsChanged packet (categories, current vehicle's actions, binding template, bindings, defaultBindings, reason). | 702 |
| `core_input_bindings.onAfterRouteChange(context)` | UI route change hook: stores the route name and updates the menu ActionMap state. *(internal)* *(hook)* | 1262 |
| `core_input_bindings.onDeviceChanged()` | Hook when a device is plugged/unplugged: updates the list (with UI toasts), the assignments and notifies everyone. *(internal)* *(hook)* | 1325 |
| `core_input_bindings.onExtensionLoaded()` | Hook on load: runs the migrations (v37 layout popup; conversion of PlayStation controller diffs before 0.38). *(internal)* *(hook)* | 1455 |
| `core_input_bindings.onFileChanged(filename, t)` | File change hook: if an actions or inputmap file (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) changes, schedules a reload in 0.1 s. *(internal)* *(hook)* | 1316 |
| `core_input_bindings.onFirstUpdate()` | Hook at first update: lists the devices, assigns the players, computes all bindings and notifies. *(internal)* *(hook)* | 1353 |
| `core_input_bindings.onPlayerVehiclePresenceChanged(player)` | Hook when a player enters or leaves a vehicle: sends the force feedback config back to the vehicles. *(internal)* *(hook)* | 828 |
| `core_input_bindings.onRecentDevicesChanged(_recentDevices)` | Hook called when the device activity order changes: caches and sends RecentDevicesChanged to the UI. *(internal)* *(hook)* | 1464 |
| `core_input_bindings.onSettingsChanged()` | Settings change hook: if the 'multiseat' setting changed, recomputes assignments and bindings. *(internal)* *(hook)* | 1335 |
| `core_input_bindings.onUIInitialised()` | Hook on UI initialization: resets the modal popup state to false. *(internal)* *(hook)* | 1284 |
| `core_input_bindings.onUIStateTriggered(stateName, opened, stateStack)` | UI state change hook: detects open popups ('/popup/...') and updates the menu ActionMap. *(internal)* *(hook)* | 1269 |
| `core_input_bindings.onVehicleSpawned(vehId, veh)` | Hook on vehicle creation: recomputes assignments and bindings without notification. *(internal)* *(hook)* | 1016 |
| `core_input_bindings.onVehicleSwitched(oldId, newId, player)` | Hook on a player's vehicle change: recomputes assignments and bindings (the specific actions change) and notifies everyone. *(internal)* *(hook)* | 996 |
| `core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers)` | Recomputes the automatic assignment via core_multiseat (if autoAssign) and only notifies if it changed. | 973 |
| `core_input_bindings.resetBindings(desiredDevName)` | Deletes the custom bindings (user inputmaps/diff) of a device or of all, generic and of the player vehicle, and reloads. | 926 |
| `core_input_bindings.saveBindingsToDisk(data)` | Saves the bindings sent by the UI: splits them by vehicle/generic, compares to the default version and writes a .diff file per device and vehicle, then forces a reload. | 894 |
| `core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName)` | Enables or disables a menu ActionMap: either by action name ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), or directly by ActionMap name. Refuses (error log) ActionMaps not related to menus or unknown. | 1147 |
| `core_input_bindings.setMenuActionMapEnabled(enabled)` | Enables or disables the main menu ActionMap (and, on disabling, all independent menu ActionMaps), updates isMenuActive and notifies the UI/extensions. | 1204 |
| `core_input_bindings.setMenuActionMapWatchEnabled(enabled)` | Enables/disables the UI notification MenuActionMapStateChanged on every modification of a menu ActionMap. | 1120 |
| `core_input_bindings.setMenuActionsEnabled(actionStates)` | Applies in batch a state for several menu actions: {menu_item_up = true, menu_item_down = false}. Ignores non-boolean values. | 1183 |
| `core_input_bindings.setMenuScrollActionMapEnabled(enabled)` | Pushes or pops the 'MenuScrollActionMap' on the ActionMap stack. | 1131 |
| `core_input_bindings.setPlayerToDevice(devname, player)` | Assigns a player to a device (assignPlayerToDevice), recomputes the bindings and notifies everyone. | 952 |
| `core_input_bindings.updateGFX(dtRaw)` | Per-frame hook: runs the deferred bindings reload; disables the 'VehicleSpecificActionMap' when the player is walking (unicycle in world camera) outside split-screen. *(internal)* | 1298 |

### Parameter details

#### `core_input_bindings.applyPlayerAssignments(assignments, reason)`

Applies an assignment table at once (device -> player; absent = -1).

- `assignments` (*table<string, integer>*) : Assignments.
- `reason` (*string|nil*) : Text for the notifications.
- **returns**: boolean false if assignments is not a table.

#### `core_input_bindings.enableCustomModifier(player, enabled, modifier)`

Enables or disables a custom modifier of the ActionMap for a player (ActionMap.enableCustomModifier).

- `player` (*integer*) : Player index.
- `enabled` (*boolean*) : Enable.
- `modifier` (*any*) : Modifier (engine value).

#### `core_input_bindings.getActionsSharingControls(actionName)`

Other actions used (not 'unused') on the same controls as actionName, on the same device.

- `actionName` (*string*) : Unique name of the action.
- **returns**: string[] Sorted action names.

#### `core_input_bindings.getAssignedPlayers()`

Returns M.assignedPlayers.

- **returns**: table<string, integer> Device -> player.

#### `core_input_bindings.getControlForAction(actionName)`

Returns the first control (key/axis) found for an action, across all devices. The result is cached until the next notifyGE.

- `actionName` (*string*) : Unique name of the action.
- **returns**: string|nil Control name (e.g. 'keyboard0' control, 'axis1').

#### `core_input_bindings.getFFBConfigForAction(veh, action)`

Reads the force feedback configuration of an action (steering, accelerate, brake) for a vehicle's driver: decodes the JSON returned by be:getFFBConfig then ffbParamsJson into ffbConfig.ffbParams.

- `veh` (*userdata*) : Vehicle object.
- `action` (*string*) : Name of the action.
- **returns**: table|nil FFB config, nil if there is no driver or FFB controller or on a decoding error.
- **returns**: integer FFBID.

#### `core_input_bindings.getMenuActionMapEnabled()`

Returns isMenuActive.

- **returns**: boolean State.

#### `core_input_bindings.getMenuActionMapWatchEnabled()`

Indicates whether watching is active.

- **returns**: boolean State.

#### `core_input_bindings.getMenuActionStates()`

Current state (enabled or not) of each independent menu action.

- **returns**: table<string, boolean> Action -> enabled.

#### `core_input_bindings.getMenuScrollActionMapEnabled()`

State of the MenuScrollActionMap.

- **returns**: boolean true if pushed.

#### `core_input_bindings.getRecentDevices()`

List of devices sorted by recent activity (cached, getDevicesByRecentActivity).

- **returns**: table Recent devices.

#### `core_input_bindings.getUsedBindingsFiles()`

Reloads the bindings while recording the file paths read (useful to list the inputmaps used).

- **returns**: string[] Paths read.

#### `core_input_bindings.isModalPopupOpen()`

Indicates whether a modal popup is open (UI state '/popup/...' other than '/popup/activity/').

- **returns**: boolean State.

#### `core_input_bindings.menuActive(enabled)`

Deprecated: logs an error with the call stack and calls setMenuActionMapEnabled(enabled).

- `enabled` (*boolean*) : Desired state.

#### `core_input_bindings.notifyUI(reason)`

Sends to the UI the controllers, the assigned players and an InputBindingsChanged packet (categories, current vehicle's actions, binding template, bindings, defaultBindings, reason).

- `reason` (*string*) : Text indicating the cause.

#### `core_input_bindings.onAfterRouteChange(context)`

UI route change hook: stores the route name and updates the menu ActionMap state.

- `context` (*table*) : Context with toRoute.name.

#### `core_input_bindings.onFileChanged(filename, t)`

File change hook: if an actions or inputmap file (settings/inputmaps, vehicles/.../inputmaps, *.inputmap.json) changes, schedules a reload in 0.1 s.

- `filename` (*string*) : Modified path.
- `t` (*any*) : Unused (inferred from code).

#### `core_input_bindings.onPlayerVehiclePresenceChanged(player)`

Hook when a player enters or leaves a vehicle: sends the force feedback config back to the vehicles.

- `player` (*integer*) : Player index.

#### `core_input_bindings.onRecentDevicesChanged(_recentDevices)`

Hook called when the device activity order changes: caches and sends RecentDevicesChanged to the UI.

- `_recentDevices` (*table*) : New list.

#### `core_input_bindings.onUIStateTriggered(stateName, opened, stateStack)`

UI state change hook: detects open popups ('/popup/...') and updates the menu ActionMap.

- `stateName` (*string*) : UI state.
- `opened` (*boolean*) : Open or closed.
- `stateStack` (*string[]*) : Stack of open states.

#### `core_input_bindings.onVehicleSpawned(vehId, veh)`

Hook on vehicle creation: recomputes assignments and bindings without notification.

- `vehId` (*integer*) : Vehicle id.
- `veh` (*userdata*) : Vehicle object.

#### `core_input_bindings.onVehicleSwitched(oldId, newId, player)`

Hook on a player's vehicle change: recomputes assignments and bindings (the specific actions change) and notifies everyone.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player index.

#### `core_input_bindings.refreshAssignedPlayers(logEnabled, seatPlayers)`

Recomputes the automatic assignment via core_multiseat (if autoAssign) and only notifies if it changed.

- `logEnabled` (*boolean|nil*) : Enables core_multiseat logs.
- `seatPlayers` (*boolean|nil*) : Passed to core_multiseat.getAssignedPlayers.
- **returns**: table<string, integer> Current assignments.

#### `core_input_bindings.resetBindings(desiredDevName)`

Deletes the custom bindings (user inputmaps/diff) of a device or of all, generic and of the player vehicle, and reloads.

- `desiredDevName` (*string|nil*) : Device name; nil = all connected devices.

#### `core_input_bindings.saveBindingsToDisk(data)`

Saves the bindings sent by the UI: splits them by vehicle/generic, compares to the default version and writes a .diff file per device and vehicle, then forces a reload.

- `data` (*table*) : Complete inputmap of a device: {bindings, devicetype, guid, name, vidpid, …}.

#### `core_input_bindings.setMenuActionEnabled(enabled, actionName, actionMapName)`

Enables or disables a menu ActionMap: either by action name ('menu_item_up' -> MenuIndependent_menu_item_upActionMap), or directly by ActionMap name. Refuses (error log) ActionMaps not related to menus or unknown.

- `enabled` (*boolean*) : New state.
- `actionName` (*string|nil*) : Action name; can be nil if actionMapName is given.
- `actionMapName` (*string|nil*) : Full name of the ActionMap.
- **returns**: boolean|nil New effective state (am.enabled), nil on failure.

#### `core_input_bindings.setMenuActionMapEnabled(enabled)`

Enables or disables the main menu ActionMap (and, on disabling, all independent menu ActionMaps), updates isMenuActive and notifies the UI/extensions.

- `enabled` (*boolean*) : true = menus active.

#### `core_input_bindings.setMenuActionMapWatchEnabled(enabled)`

Enables/disables the UI notification MenuActionMapStateChanged on every modification of a menu ActionMap.

- `enabled` (*boolean*) : true = watch.
- **returns**: boolean New state.

#### `core_input_bindings.setMenuActionsEnabled(actionStates)`

Applies in batch a state for several menu actions: {menu_item_up = true, menu_item_down = false}. Ignores non-boolean values.

- `actionStates` (*table<string, boolean>*) : Action -> desired state.
- **returns**: table<string, boolean>|boolean Action -> effective state; false if the argument is not a table.

#### `core_input_bindings.setMenuScrollActionMapEnabled(enabled)`

Pushes or pops the 'MenuScrollActionMap' on the ActionMap stack.

- `enabled` (*boolean*) : true = push.
- **returns**: boolean Resulting state; false if the ActionMap does not exist.

#### `core_input_bindings.setPlayerToDevice(devname, player)`

Assigns a player to a device (assignPlayerToDevice), recomputes the bindings and notifies everyone.

- `devname` (*string*) : Device name.
- `player` (*integer*) : Player index.

#### `core_input_bindings.updateGFX(dtRaw)`

Per-frame hook: runs the deferred bindings reload; disables the 'VehicleSpecificActionMap' when the player is walking (unicycle in world camera) outside split-screen.

- `dtRaw` (*number*) : Raw time delta in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `assignedPlayers` | table<string, integer> | Device name -> player index. |
| `autoAssignPlayersToDevices` | boolean | true (default): the player<->device assignment is computed automatically by core_multiseat. |
| `bindings` | table[] | Current bindings per device (see notes). |
| `defaultBindings` | table[] | Official default bindings, same structure as bindings; used as a reference to compute the diffs. |
| `dependencies` | string[] | {'core_input_actions', 'core_input_categories', 'core_multiseat', 'license', 'core_versionUpdate'}. |
| `devices` | table<string, table> | Connected devices: name (e.g. 'xinput0') -> {guid, productName, vidpid, playerNumber, platformUserNumber}. |
| `isMenuActive` | boolean | true when the menu ActionMap is active (menu screen or popup open). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFFBConfigChanged` — listened to by 1 module(s)
- `onInputBindingsChanged` — listened to by 6 module(s)
- `onMenuActionMapEnabled` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `AssignedPlayersChanged`, `InputBindingsChanged`, `MenuActionMapEnabled`, `MenuActionMapStateChanged`, `RecentDevicesChanged`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `stat`
- `be:` `getFFBConfig`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/bindings.lua`.*
