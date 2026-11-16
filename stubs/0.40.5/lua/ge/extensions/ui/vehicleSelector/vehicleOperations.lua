---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle selector actions: creates the "Spawn" and "Replace vehicle" buttons of a config, and the management buttons (save the config, clone, random choice, reset all, remove all, remove the current vehicle or the others, default vehicle in dev mode). It executes the chosen vehicle after the fade screen through core_vehicles (spawnNewVehicle, replaceVehicle, cloneCurrent), respects multiplayer permissions and tutorial restrictions, and emits onVehicleSelector* hooks.
--- Access: extension `ui_vehicleSelector_vehicleOperations`: `extensions.load("ui_vehicleSelector_vehicleOperations")`, then the global `ui_vehicleSelector_vehicleOperations`
---@class ui_vehicleSelector_vehicleOperations
---@field managementButtonsEnabled boolean true by default; if false, getManagementDetails creates no button.
ui_vehicleSelector_vehicleOperations = {}

--- Adds a button to the instance (delegates to buttonModule).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:537
---@param ... any (function, metadata) as in buttonModule.addButton.
---@return table  Button information (including buttonId).
function ui_vehicleSelector_vehicleOperations.addButton(...) end

--- Removes all registered buttons (delegates to buttonModule).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:538
---@param ... any Passed through as is.
function ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...) end

--- Executes the button with the given identifier; if its metadata has canClearFilters, clears the filters when the filterResetOnSpawn option is active. Logs an error if the id is unknown.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:40
---@param buttonId integer Button identifier.
---@param additionalData table|nil Additional data passed to the button function _anon(for example paint, paint2, paint3).
---@return any  Result of the button function _anon(for example {gotoPath = ...} for the random choice).
function ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData) end

--- For a double-click on an item: fetches its details and executes the first button marked isDoubleClickAction (or the only button).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:497
---@param itemDetails table Item (model, config).
function ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails) end

--- Returns the preview of a vehicle's config.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:316
---@param veh userdata|nil Vehicle object.
---@return string|nil  Image path, or nil.
function ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh) end

--- Returns a free button identifier (delegates to buttonModule).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:539
---@param ... any Passed through as is.
---@return integer  Free identifier (inferred from the name).
function ui_vehicleSelector_vehicleOperations.getFreeButtonId(...) end

--- Creates the management buttons (if enabled) and the player 0 vehicle info (name and thumbnail).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:332
---@return table  {buttonInfo = buttons, details = {currentVehicleName, currentVehicleThumb}}.
function ui_vehicleSelector_vehicleOperations.getManagementDetails() end

--- Builds the readable name "Brand Name Configuration" of a vehicle from its JBeam model and its config.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:289
---@param veh userdata|nil Vehicle object; nil gives 'No vehicle'.
---@return string  Vehicle name.
function ui_vehicleSelector_vehicleOperations.getVehicleName(veh) end

--- Creates the launch buttons of a config: "Spawn new" (action_2) and, unless spawnOnly, "Replace current" (ok, main action and double-click). They are disabled according to the restrictions of the first drive, lessons and permissions.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:225
---@param configDetails table|nil Config (model_key, key); without it, no button.
---@param spawnOnly boolean true to offer only the spawn button.
---@return table[]  Button information to send to the UI.
function ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly) end

--- Hook called when the fade screen changes state; at state 1, executes the deferred action (spawn, replace, clone).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:52
---@param state integer Fade state (1 triggers the action).
function ui_vehicleSelector_vehicleOperations.onScreenFadeState(state) end

--- Hook called when the UI waiting state changes; executes the pending deferred action, whatever the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:59
---@param state any Waiting state (unused).
function ui_vehicleSelector_vehicleOperations.onUiWaitingState(state) end

--- Stores a list of custom buttons (challenge mode).
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:520
---@param buttons table|nil Custom buttons.
function ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons) end

--- Stores a freeroam flag for the details button.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:515
---@param enabled boolean Value stored in M.detailsButtonForFreeroam.
function ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled) end

--- Enables or disables the creation of the management buttons.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:510
---@param enabled boolean true to show them.
function ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled) end

