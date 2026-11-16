---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/freeroamConfigurator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Freeroam game configurator (the UI "Wizard" assistant): stores the level, spawn point, vehicle (model, config, paints) and game options (time, date, traffic...); persists them in `settings/freeroamConfigurator.json`; provides the UI with the selection tiles (spawn point, vehicle), the start buttons and the wizard route data (per-step search/filters, selector snapshots, asynchronous loads); then launches the game via freeroam_freeroam.startFreeroamByName. The options come from other extensions via the onFreeroamConfiguratorGetOptions hook: all the `lua/ge/extensions/freeroam/configuratorOptions/*.lua` extensions (name `freeroam_configuratorOptions_<file>`) are added to the dependencies. Global: freeroam_freeroamConfigurator.
--- Access: extension `freeroam_freeroamConfigurator`: `extensions.load("freeroam_freeroamConfigurator")`, then the global `freeroam_freeroamConfigurator`
---@class freeroam_freeroamConfigurator
---@field dependencies string[] freeroam_configuratorOptions_* extension names discovered dynamically in lua/ge/extensions/freeroam/configuratorOptions/.
freeroam_freeroamConfigurator = {}

--- Hook called when the asynchronous level loader has finished: emits the FreeroamSelectorDataLoaded('level') snapshot if the pending route is still current.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1572
function freeroam_freeroamConfigurator.asyncLevelLoadComplete() end

--- Same for vehicles (called from util_asyncBulkLoader.loadVehicles via extensions.hook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1592
function freeroam_freeroamConfigurator.asyncVehicleLoadComplete() end

--- Clears a step's filters.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:796
---@param step string Step.
---@return boolean  Success.
function freeroam_freeroamConfigurator.clearWizardFiltersForStep(step) end

--- Clears the step's search.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:766
---@param step string Step.
---@return boolean  Success.
function freeroam_freeroamConfigurator.clearWizardSearchForStep(step) end

--- Double-click handler: only does dump(item).
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:735
---@param item any Clicked item.
function freeroam_freeroamConfigurator.doubleClickOverride(item) end

--- Builds the start button ("Start freeroam", priority 1), lets the extensions override it (onFreeroamConfiguratorOverrideStartButton) and returns the highest-priority one.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:703
---@return table|nil  Button info.
function freeroam_freeroamConfigurator.getButtons() end

--- Returns the configuration to the UI: options (groups collected by the onFreeroamConfiguratorGetOptions hook, sorted by `order`, values filled from the current configuration or their default value), currentSpawnPoint (tile) and currentVehicle (tile). Loads the configuration file on the first call.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:659
---@return table  {options, currentSpawnPoint, currentVehicle}
function freeroam_freeroamConfigurator.getConfiguration() end

--- "Recent" tile of the current selection for the given step.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:579
---@param step string 'level' or 'vehicle'.
---@return table|nil  Tile.
function freeroam_freeroamConfigurator.getCurrentSelectionRecentTile(step) end

--- Tile of the current spawn point. If its files no longer exist or the tile is missing, reloads or falls back to the default level/point.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1763
---@return table|nil  Tile.
function freeroam_freeroamConfigurator.getCurrentSpawnPointTile() end

--- Current vehicle of the configuration.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1893
---@return table  {model, config, additionalData}
function freeroam_freeroamConfigurator.getCurrentVehicle() end

--- Tile of the current vehicle, with fallback to the default vehicle if invalid.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1820
---@return table|nil  Tile.
function freeroam_freeroamConfigurator.getCurrentVehicleTile() end

--- Returns a copy of a step's stored filters.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:787
---@param step string Step.
---@return table|nil  Filters.
function freeroam_freeroamConfigurator.getWizardFiltersForStep(step) end

--- Reads the stored search text.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:757
---@param step string Step.
---@return string|nil  Text, nil if the step is not supported.
function freeroam_freeroamConfigurator.getWizardSearchForStep(step) end

--- Tells whether the details match the current selection (level: levelName + spawnPointObjectName; vehicle: model + config).
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:585
---@param step string 'level' or 'vehicle'.
---@param details table Tile details.
---@return boolean  True if identical.
function freeroam_freeroamConfigurator.isCurrentSelection(step, details) end

--- After Lua reload: restores the configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1927
---@param data table Table returned by onSerialize.
function freeroam_freeroamConfigurator.onDeserialized(data) end

--- Language change hook: clears the cached tiles (they contain translated text).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1913
function freeroam_freeroamConfigurator.onLanguageChanged() end

--- Loading screen fade-out end hook: if a start was launched, navigates once to the "play" screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1966
function freeroam_freeroamConfigurator.onLoadingScreenFadeout() end

--- Before Lua reload: saves the configuration if modified and returns it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1920
---@return table  The current configuration.
function freeroam_freeroamConfigurator.onSerialize() end

--- Click on the spawn point tile: opens the freeroam selector; on choice, calls setSpawnPoint and returns to menu.freeroamconfigurator.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1898
function freeroam_freeroamConfigurator.onSpawnPointTileClick() end

--- Click on the vehicle tile: opens the vehicle selector; on choice, calls setVehicle and returns to menu.freeroamconfigurator.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1906
function freeroam_freeroamConfigurator.onVehicleTileClick() end

--- Same for a level's detail route (the level's spawn points).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1103
---@param context any Context.
---@param toRoute table Target route.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardLevelDetailRouteEnter(context, toRoute, fromRoute, data) end

--- Same for a level's detail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1685
---@param context any Context.
---@param toRoute table Road.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardLevelDetailRouteMount(context, toRoute, fromRoute, data) end

--- Entry hook on the wizard's levels route: prepares the route data (default level path).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1091
---@param context any Router context.
---@param toRoute table Target route.
---@param fromRoute table Origin route.
---@param data table Route data to complete.
function freeroam_freeroamConfigurator.onWizardLevelsRouteEnter(context, toRoute, fromRoute, data) end

--- Mount hook of the levels route: prepares the data and attaches or defers the selector snapshot (asynchronous load if the list is not loaded).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1677
---@param context any Context.
---@param toRoute table Road.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardLevelsRouteMount(context, toRoute, fromRoute, data) end

--- Generic entry hook on a wizard route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1119
---@param context any Context.
---@param toRoute table Target route.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardRouteEnter(context, toRoute, fromRoute, data) end

--- Same for a vehicle's detail route (a model's configs).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1109
---@param context any Context.
---@param toRoute table Target route.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardVehicleDetailRouteEnter(context, toRoute, fromRoute, data) end

--- Same for a vehicle's detail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1701
---@param context any Context.
---@param toRoute table Road.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardVehicleDetailRouteMount(context, toRoute, fromRoute, data) end

--- Same for the vehicles route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1097
---@param context any Context.
---@param toRoute table Target route.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardVehiclesRouteEnter(context, toRoute, fromRoute, data) end

--- Same for the vehicle list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1693
---@param context any Context.
---@param toRoute table Road.
---@param fromRoute table Origin route.
---@param data table Data.
function freeroam_freeroamConfigurator.onWizardVehiclesRouteMount(context, toRoute, fromRoute, data) end

--- Breadcrumb title for the level: first the level of the detail route (spawnPointsForLevel), otherwise the chosen level (tile or name).
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1171
---@param params table Route parameters (params.path.keys).
---@return string|nil  Title.
function freeroam_freeroamConfigurator.resolveSelectedLevelTitle(params) end

--- Breadcrumb title for the vehicle: the route's model (configsForModel / configsForBrandSubModelOrModel), otherwise the vehicle tile, otherwise the name derived from the chosen model.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1191
---@param params table Route parameters.
---@return string|nil  Title.
function freeroam_freeroamConfigurator.resolveSelectedVehicleTitle(params) end

--- Chooses the level and the spawn point: resolves a fallback point if needed (resolveSpawnPointNameForLevel), updates the level's default environment date if it had not been modified, loads and caches the tile, marks the configuration as modified and navigates to routeName if provided.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1715
---@param levelName string Level name.
---@param spawnPointName string|nil Spawn object name ('undefined' or nil = default point).
---@param key string|nil Tile key (not used in the body).
---@param routeName string|nil UI route to navigate to.
function freeroam_freeroamConfigurator.setSpawnPoint(levelName, spawnPointName, key, routeName) end

--- Chooses the vehicle: resolves the config (fallback to an existing config of the model), keeps the existing additionalData if it is the same vehicle with no data, caches the tile.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1868
---@param model string Model key.
---@param config string Config key.
---@param additionalData table|nil Data (paint, paint2, paint3: paint names).
---@param key string|nil Not used in the body.
function freeroam_freeroamConfigurator.setVehicle(model, config, additionalData, key) end

--- Stores a step's filters (normalized payload).
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:776
---@param step string Step.
---@param filtersPayload table Filters.
---@return boolean  Success.
function freeroam_freeroamConfigurator.setWizardFiltersForStep(step, filtersPayload) end

--- Stores a step's search text (normalized).
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:746
---@param step string 'level' or 'vehicle'.
---@param searchText string Text.
---@return boolean  false if the step is not supported.
function freeroam_freeroamConfigurator.setWizardSearchForStep(step, searchText) end

--- Starts the game: resolves the vehicle's paints, calls freeroam_freeroam.startFreeroamByName(level, spawn point, nil, {model, options}), records the recents (spawn point and vehicle) and clears the wizard's filters.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1933
---@param configuration table Full configuration {levelName, spawnPointName, vehicle={model, config, additionalData}, spawnPointTile...}.
function freeroam_freeroamConfigurator.startFreeroam(configuration) end

--- Runs a button: saves the configuration if modified, notifies onFreeroamConfiguratorApplyOptions then triggers the button.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:725
---@param buttonId any Button id (inferred from code: buttonModule.executeButton).
---@param ... any Extra arguments (not used here).
function freeroam_freeroamConfigurator.triggerButton(buttonId, ...) end

--- Stores a game option's value and marks the configuration as modified.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:741
---@param key string Option key (e.g. traffic_trafficMode).
---@param value any Value.
function freeroam_freeroamConfigurator.updateOption(key, value) end

--- Checks that files (name.ext pattern) or folders exist (FS:fileExists / FS:directoryExists); true if the list is nil.
---Source: lua/ge/extensions/freeroam/freeroamConfigurator.lua:1743
---@param validationFiles string[]|nil Paths to validate.
---@return boolean  True if all exist.
function freeroam_freeroamConfigurator.validateFiles(validationFiles) end

