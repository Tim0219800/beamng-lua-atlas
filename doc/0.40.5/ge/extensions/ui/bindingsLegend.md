# `ui_bindingsLegend`

*File: `lua/ge/extensions/ui/bindingsLegend.lua` · VM: Game Engine (GE) · 1107 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_bindingsLegend`: `extensions.load("ui_bindingsLegend")`, then the global `ui_bindingsLegend`

Feeds the interface's "controls legend" app (bindings legend). It groups sets of actions (named by a label and ranked by priority) and sends them to the UI via `setActionsForLegend`: actions tied to held modifiers (Shift, Ctrl, Alt, modifier1 to 6), vehicle-specific actions, basic driving controls and constant actions. A modder or another module uses it to display its own actions on screen with addActions. Depends on `core_input_actions` and `core_input_bindings`.

## Example

```lua
ui_bindingsLegend.addActions('myMod', {
  {action = 'toggle_slow_motion'}
}, {priority = 5, ttl = 8})
```

## Notes

- Each action set is identified by its label; addActions replaces the existing set with the same label. Priorities seen in the code: modifiers 9, vehicleSpecific 10 (shown on demand) or 8 (ephemeral after a vehicle change), constant actions 10. If a set has a priority, only the sets with the maximum priority are sent to the UI.
- `additionalData.ttl` (real seconds) removes the set automatically in onUpdate; `removeIfOverwrittenWithHigherPriority` cancels the addition if a set of higher priority already exists; `resetFade` is true by default.
- Each action receives `inputActionOnClick = true` by default and, without `label`, the title of the active action (`core_input_actions.getActiveActions()[action].title`): an unknown action would cause an error on nil.
- At most `actionLimit = 50` is defined as a constant; the Shift-only combination is filtered (actions marked `hidden`).
- shouldFade() always returns false: the automatic hiding after 7 s (fadeDelaySeconds) is disabled in this version, the original code being commented out.
- onInputBindingsChanged and onPlayerVehicleDataChanged are local; only onPlayerVehicleDataChanged is exported (under the names onVehicleSpawned and onVehicleResetted). onInputBindingsChanged is not exported, so never called as a hook: the file does not react to this bindings change (inferred from code).
- Setting used: `bindingsLegendShowApp` (boolean, true by default).
- The always-shown actions (actionsToAlwaysShow) are notably toggleWalkingMode, activateStarterMotor, toggleShowVehicleSpecificActions, toggle_slow_motion, toggleShowBindingsLegendApp, nodegrabberPadMode and switch_next_vehicle; the file `ui/bindingAppActions.json` is read on load.

**Dependencies (loaded first):** `core_input_actions`, `core_input_bindings`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_bindingsLegend.addActions(label, actions, additionalData)` | Adds (or replaces) an action set shown in the legend, then sends the data to the UI. An empty set simply removes the old set with the same label. | 754 |
| `ui_bindingsLegend.enableShowVehicleSpecificActions(enable)` | Enables or disables the display of vehicle-specific actions (priority 10). No effect if the app is hidden in the settings, if the requested state is already active, or if the vehicle has no such actions. | 925 |
| `ui_bindingsLegend.onActionFilterUpdated()` | Hook called when the action filter changes. Invalidates the caches and sends the data back to the UI. *(internal)* *(hook)* | 979 |
| `ui_bindingsLegend.onClientEndMission()` | Hook called at the end of a mission/level. Empties the action sets and caches, and unregisters the gearbox modes. *(internal)* *(hook)* | 951 |
| `ui_bindingsLegend.onClientStartMission()` | Hook called at the start of a mission/level. Does nothing. *(internal)* *(hook)* | 948 |
| `ui_bindingsLegend.onDeserialized(data)` | Hook called after a Lua reload. Starts a job that invalidates the modifier actions cache. *(internal)* *(hook)* | 1069 |
| `ui_bindingsLegend.onDeviceChanged()` | Hook called when the input device changes. Invalidates the caches and sends the data back to the UI. *(internal)* *(hook)* | 1063 |
| `ui_bindingsLegend.onExtensionLoaded()` | Hook called when the extension loads. Reads `ui/bindingAppActions.json` and computes the vehicle's available actions. *(internal)* *(hook)* | 1050 |
| `ui_bindingsLegend.onModifierChanged(newModifiers)` | Hook called when the held modifier keys change. Searches, among the bindings of recent devices, for the actions whose modifiers match exactly and shows them as the `modified` set (priority 9). *(internal)* *(hook)* | 791 |
| `ui_bindingsLegend.onSettingsChanged()` | Hook called when the settings change. Resets the signature of the basic controls and sends the data back to the UI. *(internal)* *(hook)* | 996 |
| `ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame. Advances the fade timer, refreshes the basic driving controls (gearbox mode change), counts down the `ttl` of the action sets and shows the debug window. Exits early if there is no player vehicle. *(internal)* *(hook)* | 869 |
| `ui_bindingsLegend.onVehicleResetted(vehId)` | Hook called when a vehicle is reset. Same function as onVehicleSpawned: if it is player 0's vehicle (or without an id), invalidates the caches and sends the data back to the UI. *(internal)* *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSpawned(vehId)` | Hook called when a vehicle is spawned. See onVehicleResetted. *(internal)* *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSwitched(oldId, newId, player)` | Hook called when the controlled vehicle changes. Recomputes the vehicle's actions and, if it has any, briefly shows them (`vehicleSpecific` set, ttl 10 s) with a help message. *(internal)* *(hook)* | 1027 |
| `ui_bindingsLegend.resetFade()` | Resets the legend's hiding timer. | 107 |
| `ui_bindingsLegend.sendDataToUI(forceResetFade)` | Merges the action sets (keeping those of highest priority), adds modifier info and the `showApp` state, then sends everything to the UI via the `setActionsForLegend` hook. | 630 |
| `ui_bindingsLegend.setDebug(enabled)` | Enables or disables the "BindingsLegend Debug" ImGui window (hiding delay, fade state). | 82 |
| `ui_bindingsLegend.setShowBasicDrivingControls(enable)` | Enables or disables the display of basic driving controls (`basicDriving` set), updated according to the gearbox mode. | 901 |
| `ui_bindingsLegend.showToggleVehicleSpecificActionsMessage()` | Shows two UI messages (`Message`, 10 s) indicating how to display the vehicle's actions, one for gamepad and one for keyboard. Ignored during the first-drive experience or if the app is hidden. | 1007 |
| `ui_bindingsLegend.toggleShowApp()` | Toggles the `bindingsLegendShowApp` setting, hides the vehicle actions, resets the timer and sends the data back to the UI. | 1075 |
| `ui_bindingsLegend.toggleShowVehicleSpecificActions()` | Shows or hides the actions specific to the player's vehicle. | 944 |
| `ui_bindingsLegend.triggerInputAction(action, value)` | Executes an input action as if it were triggered, on player 0's vehicle (called from the UI when an action is clicked). | 1058 |

### Parameter details

#### `ui_bindingsLegend.addActions(label, actions, additionalData)`

Adds (or replaces) an action set shown in the legend, then sends the data to the UI. An empty set simply removes the old set with the same label.

- `label` (*string*) : Name of the action set (replacement key).
- `actions` (*table<integer, table>*) : Actions; each entry has at least `action` (input action name) and optionally `label`, `inputActionOnClick`.
- `additionalData` (*table|nil*) : Options: priority, ttl, removeIfOverwrittenWithHigherPriority, resetFade, modifiersActive…

#### `ui_bindingsLegend.enableShowVehicleSpecificActions(enable)`

Enables or disables the display of vehicle-specific actions (priority 10). No effect if the app is hidden in the settings, if the requested state is already active, or if the vehicle has no such actions.

- `enable` (*boolean*) : true to show.

#### `ui_bindingsLegend.onDeserialized(data)`

Hook called after a Lua reload. Starts a job that invalidates the modifier actions cache.

- `data` (*any*) : Deserialized data (not used).

#### `ui_bindingsLegend.onModifierChanged(newModifiers)`

Hook called when the held modifier keys change. Searches, among the bindings of recent devices, for the actions whose modifiers match exactly and shows them as the `modified` set (priority 9).

- `newModifiers` (*integer*) : Bit mask: 1 Left Shift, 2 Right Shift, 4 Left Ctrl, 8 Right Ctrl, 16 Left Alt, 32 Right Alt, 64 to 2048 modifier1 to modifier6.

#### `ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame. Advances the fade timer, refreshes the basic driving controls (gearbox mode change), counts down the `ttl` of the action sets and shows the debug window. Exits early if there is no player vehicle.

- `dtReal` (*number*) : Real time delta in seconds.
- `dtSim` (*number*) : Simulation time delta in seconds (not used).
- `dtRaw` (*number*) : Raw delta in seconds (not used).

#### `ui_bindingsLegend.onVehicleResetted(vehId)`

Hook called when a vehicle is reset. Same function as onVehicleSpawned: if it is player 0's vehicle (or without an id), invalidates the caches and sends the data back to the UI.

- `vehId` (*integer*) : Vehicle id.

#### `ui_bindingsLegend.onVehicleSpawned(vehId)`

Hook called when a vehicle is spawned. See onVehicleResetted.

- `vehId` (*integer*) : Vehicle id.

#### `ui_bindingsLegend.onVehicleSwitched(oldId, newId, player)`

Hook called when the controlled vehicle changes. Recomputes the vehicle's actions and, if it has any, briefly shows them (`vehicleSpecific` set, ttl 10 s) with a help message.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player concerned (unused).

#### `ui_bindingsLegend.sendDataToUI(forceResetFade)`

Merges the action sets (keeping those of highest priority), adds modifier info and the `showApp` state, then sends everything to the UI via the `setActionsForLegend` hook.

- `forceResetFade` (*boolean|nil*) : Forces the hiding delay to reset.

#### `ui_bindingsLegend.setDebug(enabled)`

Enables or disables the "BindingsLegend Debug" ImGui window (hiding delay, fade state).

- `enabled` (*boolean*) : true to display the window.

#### `ui_bindingsLegend.setShowBasicDrivingControls(enable)`

Enables or disables the display of basic driving controls (`basicDriving` set), updated according to the gearbox mode.

- `enable` (*boolean*) : true to enable.

#### `ui_bindingsLegend.triggerInputAction(action, value)`

Executes an input action as if it were triggered, on player 0's vehicle (called from the UI when an action is clicked).

- `action` (*string*) : Input action name.
- `value` (*number|nil*) : Value passed to `core_input_actions.executeCommand`.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: core_input_actions and core_input_bindings. |

**UI events (guihooks.trigger):** `Message`, `setActionsForLegend`, `setBindingsLegendFade`

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/bindingsLegend.lua`.*
