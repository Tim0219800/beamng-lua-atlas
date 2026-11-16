# `ui_vehicleSelector_vehicleOperations`

*File: `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua` · VM: Game Engine (GE) · 542 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_vehicleOperations`: `extensions.load("ui_vehicleSelector_vehicleOperations")`, then the global `ui_vehicleSelector_vehicleOperations`

Vehicle selector actions: creates the "Spawn" and "Replace vehicle" buttons of a config, and the management buttons (save the config, clone, random choice, reset all, remove all, remove the current vehicle or the others, default vehicle in dev mode). It executes the chosen vehicle after the fade screen through core_vehicles (spawnNewVehicle, replaceVehicle, cloneCurrent), respects multiplayer permissions and tutorial restrictions, and emits onVehicleSelector* hooks.

## Notes

- The buttons are managed by ui/gridSelectorUtils/buttonModule (addButton, getFreeButtonId, clearButtonFunctions); each button has a buttonId, a function and metadata (label, icon, primary, disabled, uiEvent, canClearFilters...).
- Spawn and replace are deferred: the callbackAfterFade function is run when onScreenFadeState(1) or onUiWaitingState passes, while the UI displays 'app:waiting' (true then false).
- Emitted hooks: onVehicleSelectorSpawnNewRequested, onVehicleSelectorSpawnNew(modelKey, configKey, paint1, paint2, paint3), onVehicleSelectorReplaceCurrentRequested, onVehicleSelectorReplaceCurrent(same arguments), onVehicleSelectorCloneCurrent, onVehicleSelectorSetAsDefault, onVehicleSelectorLoadDefault, onVehicleSelectorSelectRandom, onVehicleSelectorResetAll, onVehicleSelectorRemoveAll, onVehicleSelectorRemoveCurrent, onVehicleSelectorRemoveOthers, trackNewVeh, trackVehReset.
- The paints in additionalData (paint, paint2, paint3) are names resolved in model.model.paints.
- In multiplayer (multiplayer_permissions), each action is disabled according to the player's permission (resetVehicle, removeVehicle, spawnVehicle).
- Probable bug: the "Select Random" button crashes if no config passes the filters (validConfigs empty, randomConfig nil). It also reads randomConfig.subModel and randomConfig.brand (lowercase), fields probably absent from the configs (which use SubModel and Brand), so the navigation path receives empty strings.
- Detail: setDetailsButtonForFreeroam and setCustomDetailsButtons only store a value in M.detailsButtonForFreeroam and M.customDetailsButtons, which are not read back in this file (the sorting is done by detailsInteraction).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_vehicleOperations.addButton(...)` | Adds a button to the instance (delegates to buttonModule). | 537 |
| `ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...)` | Removes all registered buttons (delegates to buttonModule). | 538 |
| `ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData)` | Executes the button with the given identifier; if its metadata has canClearFilters, clears the filters when the filterResetOnSpawn option is active. Logs an error if the id is unknown. | 40 |
| `ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails)` | For a double-click on an item: fetches its details and executes the first button marked isDoubleClickAction (or the only button). | 497 |
| `ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh)` | Returns the preview of a vehicle's config. | 316 |
| `ui_vehicleSelector_vehicleOperations.getFreeButtonId(...)` | Returns a free button identifier (delegates to buttonModule). | 539 |
| `ui_vehicleSelector_vehicleOperations.getManagementDetails()` | Creates the management buttons (if enabled) and the player 0 vehicle info (name and thumbnail). | 332 |
| `ui_vehicleSelector_vehicleOperations.getVehicleName(veh)` | Builds the readable name "Brand Name Configuration" of a vehicle from its JBeam model and its config. | 289 |
| `ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly)` | Creates the launch buttons of a config: "Spawn new" (action_2) and, unless spawnOnly, "Replace current" (ok, main action and double-click). They are disabled according to the restrictions of the first drive, lessons and permissions. | 225 |
| `ui_vehicleSelector_vehicleOperations.onScreenFadeState(state)` | Hook called when the fade screen changes state; at state 1, executes the deferred action (spawn, replace, clone). *(internal)* *(hook)* | 52 |
| `ui_vehicleSelector_vehicleOperations.onUiWaitingState(state)` | Hook called when the UI waiting state changes; executes the pending deferred action, whatever the state. *(internal)* *(hook)* | 59 |
| `ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons)` | Stores a list of custom buttons (challenge mode). | 520 |
| `ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled)` | Stores a freeroam flag for the details button. | 515 |
| `ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled)` | Enables or disables the creation of the management buttons. | 510 |

### Parameter details

#### `ui_vehicleSelector_vehicleOperations.addButton(...)`

Adds a button to the instance (delegates to buttonModule).

- `...` (*any*) : (function, metadata) as in buttonModule.addButton.
- **returns**: table Button information (including buttonId).

#### `ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...)`

Removes all registered buttons (delegates to buttonModule).

- `...` (*any*) : Passed through as is.

#### `ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData)`

Executes the button with the given identifier; if its metadata has canClearFilters, clears the filters when the filterResetOnSpawn option is active. Logs an error if the id is unknown.

- `buttonId` (*integer*) : Button identifier.
- `additionalData` (*table|nil*) : Additional data passed to the button function (for example paint, paint2, paint3).
- **returns**: any Result of the button function (for example {gotoPath = ...} for the random choice).

#### `ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails)`

For a double-click on an item: fetches its details and executes the first button marked isDoubleClickAction (or the only button).

- `itemDetails` (*table*) : Item (model, config).

#### `ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh)`

Returns the preview of a vehicle's config.

- `veh` (*userdata|nil*) : Vehicle object.
- **returns**: string|nil Image path, or nil.

#### `ui_vehicleSelector_vehicleOperations.getFreeButtonId(...)`

Returns a free button identifier (delegates to buttonModule).

- `...` (*any*) : Passed through as is.
- **returns**: integer Free identifier (inferred from the name).

#### `ui_vehicleSelector_vehicleOperations.getManagementDetails()`

Creates the management buttons (if enabled) and the player 0 vehicle info (name and thumbnail).

- **returns**: table {buttonInfo = buttons, details = {currentVehicleName, currentVehicleThumb}}.

#### `ui_vehicleSelector_vehicleOperations.getVehicleName(veh)`

Builds the readable name "Brand Name Configuration" of a vehicle from its JBeam model and its config.

- `veh` (*userdata|nil*) : Vehicle object; nil gives 'No vehicle'.
- **returns**: string Vehicle name.

#### `ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly)`

Creates the launch buttons of a config: "Spawn new" (action_2) and, unless spawnOnly, "Replace current" (ok, main action and double-click). They are disabled according to the restrictions of the first drive, lessons and permissions.

- `configDetails` (*table|nil*) : Config (model_key, key); without it, no button.
- `spawnOnly` (*boolean*) : true to offer only the spawn button.
- **returns**: table[] Button information to send to the UI.

#### `ui_vehicleSelector_vehicleOperations.onScreenFadeState(state)`

Hook called when the fade screen changes state; at state 1, executes the deferred action (spawn, replace, clone).

- `state` (*integer*) : Fade state (1 triggers the action).

#### `ui_vehicleSelector_vehicleOperations.onUiWaitingState(state)`

Hook called when the UI waiting state changes; executes the pending deferred action, whatever the state.

- `state` (*any*) : Waiting state (unused).

#### `ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons)`

Stores a list of custom buttons (challenge mode).

- `buttons` (*table|nil*) : Custom buttons.

#### `ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled)`

Stores a freeroam flag for the details button.

- `enabled` (*boolean*) : Value stored in M.detailsButtonForFreeroam.

#### `ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled)`

Enables or disables the creation of the management buttons.

- `enabled` (*boolean*) : true to show them.

## Fields

| Field | Type | Description |
|---|---|---|
| `managementButtonsEnabled` | boolean | true by default; if false, getManagementDetails creates no button. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSelectorCloneCurrent`
- `onVehicleSelectorLoadDefault`
- `onVehicleSelectorRemoveAll`
- `onVehicleSelectorRemoveCurrent`
- `onVehicleSelectorRemoveOthers`
- `onVehicleSelectorReplaceCurrent` — listened to by 1 module(s)
- `onVehicleSelectorReplaceCurrentRequested`
- `onVehicleSelectorResetAll`
- `onVehicleSelectorSelectRandom`
- `onVehicleSelectorSetAsDefault`
- `onVehicleSelectorSpawnNew` — listened to by 1 module(s)
- `onVehicleSelectorSpawnNewRequested`
- `trackNewVeh`
- `trackVehReset`

**UI events (guihooks.trigger):** `app:waiting`

## Calls into the engine (C++)

- `be:` `getObject`, `getObjectCount`, `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua`.*
