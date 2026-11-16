# `freeroam_freeroamConfigurator`

*File: `lua/ge/extensions/freeroam/freeroamConfigurator.lua` · VM: Game Engine (GE) · 1975 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_freeroamConfigurator`: `extensions.load("freeroam_freeroamConfigurator")`, then the global `freeroam_freeroamConfigurator`

Freeroam game configurator (the UI "Wizard" assistant): stores the level, spawn point, vehicle (model, config, paints) and game options (time, date, traffic...); persists them in `settings/freeroamConfigurator.json`; provides the UI with the selection tiles (spawn point, vehicle), the start buttons and the wizard route data (per-step search/filters, selector snapshots, asynchronous loads); then launches the game via freeroam_freeroam.startFreeroamByName. The options come from other extensions via the onFreeroamConfiguratorGetOptions hook: all the `lua/ge/extensions/freeroam/configuratorOptions/*.lua` extensions (name `freeroam_configuratorOptions_<file>`) are added to the dependencies. Global: freeroam_freeroamConfigurator.

## Example

```lua
-- from the UI (or another module):
freeroam_freeroamConfigurator.setSpawnPoint('west_coast_usa', 'spawns_industrial')
freeroam_freeroamConfigurator.setVehicle('pickup', 'd15_4wd_A', {paint = 'Sea Blue'})
freeroam_freeroamConfigurator.updateOption('traffic_trafficMode', 'enabled')
freeroam_freeroamConfigurator.startFreeroam(configuration)
```

## Notes

- Defaults: level west_coast_usa, spawn point spawns_industrial; vehicle pickup/d15_4wd_A (paint Sea Blue) or, if the license is valid (extensions.license.isValid()), etk800/854_190d_A (Mineral Green); default options environment_timeOfDay='default', environment_date (level default via freeroam_configuratorOptions_freeroamOptions, otherwise 06/20/2026 noon), environment_timePlay='disabled', traffic_trafficMode='disabled'.
- The configuration file is versioned (version 1): a different version is ignored. Cached tiles are only reloaded if the saved language (_language) is the current language; onLanguageChanged empties the tiles. The configuration is only written if it is "dirty" (_dirty): in triggerButton and in onSerialize.
- Emitted hooks: onFreeroamConfiguratorGetOptions(level, options) (extensions add option groups {key, order, options[]...}), onFreeroamConfiguratorApplyOptions(options) (before start) and onFreeroamConfiguratorOverrideStartButton(buttonModule, configuration) (to replace/add a button; the highest-priority button is returned). Emitted UI event: FreeroamSelectorDataLoaded.
- Wizard steps: "level" (freeroamSelector selector, default path {keys={'allFreeroam'}}) and "vehicle" (vehicleSelector selector, default path {keys={'allModels'}}).
- startFreeroam passes `{model, options}` (options = config + paints resolved from the model's paints) as the 4th argument (spawnVehicle) of freeroam_freeroam.startFreeroamByName; trackRecent is called for the recents; the switch to the "play" screen is done in onLoadingScreenFadeout.
- doubleClickOverride only does dump(item) (debug leftover).
- Large file (nearly 2000 lines): most of the internal logic (resolving spawn points/fallback configs, building the wizard's tiles and snapshots, detail routes) is local and not exported; only the M.* functions are documented here.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_freeroamConfigurator.asyncLevelLoadComplete()` | Hook called when the asynchronous level loader has finished: emits the FreeroamSelectorDataLoaded('level') snapshot if the pending route is still current. *(internal)* | 1572 |
| `freeroam_freeroamConfigurator.asyncVehicleLoadComplete()` | Same for vehicles (called from util_asyncBulkLoader.loadVehicles via extensions.hook). *(internal)* | 1592 |
| `freeroam_freeroamConfigurator.clearWizardFiltersForStep(step)` | Clears a step's filters. | 796 |
| `freeroam_freeroamConfigurator.clearWizardSearchForStep(step)` | Clears the step's search. | 766 |
| `freeroam_freeroamConfigurator.doubleClickOverride(item)` | Double-click handler: only does dump(item). | 735 |
| `freeroam_freeroamConfigurator.getButtons()` | Builds the start button ("Start freeroam", priority 1), lets the extensions override it (onFreeroamConfiguratorOverrideStartButton) and returns the highest-priority one. | 703 |
| `freeroam_freeroamConfigurator.getConfiguration()` | Returns the configuration to the UI: options (groups collected by the onFreeroamConfiguratorGetOptions hook, sorted by `order`, values filled from the current configuration or their default value), currentSpawnPoint (tile) and currentVehicle (tile). Loads the configuration file on the first call. | 659 |
| `freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step)` | "Recent" tile of the current selection for the given step. | 579 |
| `freeroam_freeroamConfigurator.getCurrentSpawnPointTile()` | Tile of the current spawn point. If its files no longer exist or the tile is missing, reloads or falls back to the default level/point. | 1763 |
| `freeroam_freeroamConfigurator.getCurrentVehicle()` | Current vehicle of the configuration. | 1893 |
| `freeroam_freeroamConfigurator.getCurrentVehicleTile()` | Tile of the current vehicle, with fallback to the default vehicle if invalid. | 1820 |
| `freeroam_freeroamConfigurator.getWizardFiltersForStep(step)` | Returns a copy of a step's stored filters. | 787 |
| `freeroam_freeroamConfigurator.getWizardSearchForStep(step)` | Reads the stored search text. | 757 |
| `freeroam_freeroamConfigurator.isCurrentSelection(step, details)` | Tells whether the details match the current selection (level: levelName + spawnPointObjectName; vehicle: model + config). | 585 |
| `freeroam_freeroamConfigurator.onDeserialized(data)` | After Lua reload: restores the configuration. *(internal)* *(hook)* | 1927 |
| `freeroam_freeroamConfigurator.onLanguageChanged()` | Language change hook: clears the cached tiles (they contain translated text). *(internal)* *(hook)* | 1913 |
| `freeroam_freeroamConfigurator.onLoadingScreenFadeout()` | Loading screen fade-out end hook: if a start was launched, navigates once to the "play" screen. *(internal)* *(hook)* | 1966 |
| `freeroam_freeroamConfigurator.onSerialize()` | Before Lua reload: saves the configuration if modified and returns it. *(internal)* *(hook)* | 1920 |
| `freeroam_freeroamConfigurator.onSpawnPointTileClick()` | Click on the spawn point tile: opens the freeroam selector; on choice, calls setSpawnPoint and returns to menu.freeroamconfigurator. *(internal)* *(hook)* | 1898 |
| `freeroam_freeroamConfigurator.onVehicleTileClick()` | Click on the vehicle tile: opens the vehicle selector; on choice, calls setVehicle and returns to menu.freeroamconfigurator. *(internal)* *(hook)* | 1906 |
| `freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data)` | Same for a level's detail route (the level's spawn points). *(internal)* *(hook)* | 1103 |
| `freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data)` | Same for a level's detail. *(internal)* *(hook)* | 1685 |
| `freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data)` | Entry hook on the wizard's levels route: prepares the route data (default level path). *(internal)* *(hook)* | 1091 |
| `freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data)` | Mount hook of the levels route: prepares the data and attaches or defers the selector snapshot (asynchronous load if the list is not loaded). *(internal)* *(hook)* | 1677 |
| `freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data)` | Generic entry hook on a wizard route. *(internal)* *(hook)* | 1119 |
| `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data)` | Same for a vehicle's detail route (a model's configs). *(internal)* *(hook)* | 1109 |
| `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data)` | Same for a vehicle's detail. *(internal)* *(hook)* | 1701 |
| `freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data)` | Same for the vehicles route. *(internal)* *(hook)* | 1097 |
| `freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data)` | Same for the vehicle list. *(internal)* *(hook)* | 1693 |
| `freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params)` | Breadcrumb title for the level: first the level of the detail route (spawnPointsForLevel), otherwise the chosen level (tile or name). | 1171 |
| `freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params)` | Breadcrumb title for the vehicle: the route's model (configsForModel / configsForBrandSubModelOrModel), otherwise the vehicle tile, otherwise the name derived from the chosen model. | 1191 |
| `freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName)` | Chooses the level and the spawn point: resolves a fallback point if needed (resolveSpawnPointNameForLevel), updates the level's default environment date if it had not been modified, loads and caches the tile, marks the configuration as modified and navigates to routeName if provided. | 1715 |
| `freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key)` | Chooses the vehicle: resolves the config (fallback to an existing config of the model), keeps the existing additionalData if it is the same vehicle with no data, caches the tile. | 1868 |
| `freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload)` | Stores a step's filters (normalized payload). | 776 |
| `freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText)` | Stores a step's search text (normalized). | 746 |
| `freeroam_freeroamConfigurator.startFreeroam(configuration)` | Starts the game: resolves the vehicle's paints, calls freeroam_freeroam.startFreeroamByName(level, spawn point, nil, {model, options}), records the recents (spawn point and vehicle) and clears the wizard's filters. | 1933 |
| `freeroam_freeroamConfigurator.triggerButton(buttonId, ...)` | Runs a button: saves the configuration if modified, notifies onFreeroamConfiguratorApplyOptions then triggers the button. | 725 |
| `freeroam_freeroamConfigurator.updateOption(key, value)` | Stores a game option's value and marks the configuration as modified. | 741 |
| `freeroam_freeroamConfigurator.validateFiles(validationFiles)` | Checks that files (name.ext pattern) or folders exist (FS:fileExists / FS:directoryExists); true if the list is nil. | 1743 |

### Parameter details

#### `freeroam_freeroamConfigurator.clearWizardFiltersForStep(step)`

Clears a step's filters.

- `step` (*string*) : Step.
- **returns**: boolean Success.

#### `freeroam_freeroamConfigurator.clearWizardSearchForStep(step)`

Clears the step's search.

- `step` (*string*) : Step.
- **returns**: boolean Success.

#### `freeroam_freeroamConfigurator.doubleClickOverride(item)`

Double-click handler: only does dump(item).

- `item` (*any*) : Clicked item.

#### `freeroam_freeroamConfigurator.getButtons()`

Builds the start button ("Start freeroam", priority 1), lets the extensions override it (onFreeroamConfiguratorOverrideStartButton) and returns the highest-priority one.

- **returns**: table|nil Button info.

#### `freeroam_freeroamConfigurator.getConfiguration()`

Returns the configuration to the UI: options (groups collected by the onFreeroamConfiguratorGetOptions hook, sorted by `order`, values filled from the current configuration or their default value), currentSpawnPoint (tile) and currentVehicle (tile). Loads the configuration file on the first call.

- **returns**: table {options, currentSpawnPoint, currentVehicle}

#### `freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step)`

"Recent" tile of the current selection for the given step.

- `step` (*string*) : 'level' or 'vehicle'.
- **returns**: table|nil Tile.

#### `freeroam_freeroamConfigurator.getCurrentSpawnPointTile()`

Tile of the current spawn point. If its files no longer exist or the tile is missing, reloads or falls back to the default level/point.

- **returns**: table|nil Tile.

#### `freeroam_freeroamConfigurator.getCurrentVehicle()`

Current vehicle of the configuration.

- **returns**: table {model, config, additionalData}

#### `freeroam_freeroamConfigurator.getCurrentVehicleTile()`

Tile of the current vehicle, with fallback to the default vehicle if invalid.

- **returns**: table|nil Tile.

#### `freeroam_freeroamConfigurator.getWizardFiltersForStep(step)`

Returns a copy of a step's stored filters.

- `step` (*string*) : Step.
- **returns**: table|nil Filters.

#### `freeroam_freeroamConfigurator.getWizardSearchForStep(step)`

Reads the stored search text.

- `step` (*string*) : Step.
- **returns**: string|nil Text, nil if the step is not supported.

#### `freeroam_freeroamConfigurator.isCurrentSelection(step, details)`

Tells whether the details match the current selection (level: levelName + spawnPointObjectName; vehicle: model + config).

- `step` (*string*) : 'level' or 'vehicle'.
- `details` (*table*) : Tile details.
- **returns**: boolean True if identical.

#### `freeroam_freeroamConfigurator.onDeserialized(data)`

After Lua reload: restores the configuration.

- `data` (*table*) : Table returned by onSerialize.

#### `freeroam_freeroamConfigurator.onSerialize()`

Before Lua reload: saves the configuration if modified and returns it.

- **returns**: table The current configuration.

#### `freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data)`

Same for a level's detail route (the level's spawn points).

- `context` (*any*) : Context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data)`

Same for a level's detail.

- `context` (*any*) : Context.
- `toRoute` (*table*) : Road.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data)`

Entry hook on the wizard's levels route: prepares the route data (default level path).

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Route data to complete.

#### `freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data)`

Mount hook of the levels route: prepares the data and attaches or defers the selector snapshot (asynchronous load if the list is not loaded).

- `context` (*any*) : Context.
- `toRoute` (*table*) : Road.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data)`

Generic entry hook on a wizard route.

- `context` (*any*) : Context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data)`

Same for a vehicle's detail route (a model's configs).

- `context` (*any*) : Context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data)`

Same for a vehicle's detail.

- `context` (*any*) : Context.
- `toRoute` (*table*) : Road.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data)`

Same for the vehicles route.

- `context` (*any*) : Context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data)`

Same for the vehicle list.

- `context` (*any*) : Context.
- `toRoute` (*table*) : Road.
- `fromRoute` (*table*) : Origin route.
- `data` (*table*) : Data.

#### `freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params)`

Breadcrumb title for the level: first the level of the detail route (spawnPointsForLevel), otherwise the chosen level (tile or name).

- `params` (*table*) : Route parameters (params.path.keys).
- **returns**: string|nil Title.

#### `freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params)`

Breadcrumb title for the vehicle: the route's model (configsForModel / configsForBrandSubModelOrModel), otherwise the vehicle tile, otherwise the name derived from the chosen model.

- `params` (*table*) : Route parameters.
- **returns**: string|nil Title.

#### `freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName)`

Chooses the level and the spawn point: resolves a fallback point if needed (resolveSpawnPointNameForLevel), updates the level's default environment date if it had not been modified, loads and caches the tile, marks the configuration as modified and navigates to routeName if provided.

- `levelName` (*string*) : Level name.
- `spawnPointName` (*string|nil*) : Spawn object name ('undefined' or nil = default point).
- `key` (*string|nil*) : Tile key (not used in the body).
- `routeName` (*string|nil*) : UI route to navigate to.

#### `freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key)`

Chooses the vehicle: resolves the config (fallback to an existing config of the model), keeps the existing additionalData if it is the same vehicle with no data, caches the tile.

- `model` (*string*) : Model key.
- `config` (*string*) : Config key.
- `additionalData` (*table|nil*) : Data (paint, paint2, paint3: paint names).
- `key` (*string|nil*) : Not used in the body.

#### `freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload)`

Stores a step's filters (normalized payload).

- `step` (*string*) : Step.
- `filtersPayload` (*table*) : Filters.
- **returns**: boolean Success.

#### `freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText)`

Stores a step's search text (normalized).

- `step` (*string*) : 'level' or 'vehicle'.
- `searchText` (*string*) : Text.
- **returns**: boolean false if the step is not supported.

#### `freeroam_freeroamConfigurator.startFreeroam(configuration)`

Starts the game: resolves the vehicle's paints, calls freeroam_freeroam.startFreeroamByName(level, spawn point, nil, {model, options}), records the recents (spawn point and vehicle) and clears the wizard's filters.

- `configuration` (*table*) : Full configuration {levelName, spawnPointName, vehicle={model, config, additionalData}, spawnPointTile...}.

#### `freeroam_freeroamConfigurator.triggerButton(buttonId, ...)`

Runs a button: saves the configuration if modified, notifies onFreeroamConfiguratorApplyOptions then triggers the button.

- `buttonId` (*any*) : Button id (inferred from code: buttonModule.executeButton).
- `...` (*any*) : Extra arguments (not used here).

#### `freeroam_freeroamConfigurator.updateOption(key, value)`

Stores a game option's value and marks the configuration as modified.

- `key` (*string*) : Option key (e.g. traffic_trafficMode).
- `value` (*any*) : Value.

#### `freeroam_freeroamConfigurator.validateFiles(validationFiles)`

Checks that files (name.ext pattern) or folders exist (FS:fileExists / FS:directoryExists); true if the list is nil.

- `validationFiles` (*string[]|nil*) : Paths to validate.
- **returns**: boolean True if all exist.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | freeroam_configuratorOptions_* extension names discovered dynamically in lua/ge/extensions/freeroam/configuratorOptions/. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFreeroamConfiguratorApplyOptions` — listened to by 1 module(s)
- `onFreeroamConfiguratorGetOptions` — listened to by 1 module(s)
- `onFreeroamConfiguratorOverrideStartButton`

**UI events (guihooks.trigger):** `FreeroamSelectorDataLoaded`

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`
- `Lua:` `getSelectedLanguage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/freeroamConfigurator.lua`.*
