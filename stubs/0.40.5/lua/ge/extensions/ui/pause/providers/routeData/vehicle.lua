---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the data for the pause menu "vehicle" routes (pause.vehicle and sub-routes: combined configuration, packs, tuning, paint, save, configuration list, spawned vehicles, debug). Each function returns a table describing the Vue components to display (mainPanelContent, sidePanelContents, rail, mainCardClass, heading). getVehicleData also computes the permissions of each action based on the game mode, the first drive and the presence of a vehicle.
--- Access: extension `ui_pause_providers_routeData_vehicle`: `extensions.load("ui_pause_providers_routeData_vehicle")`, then the global `ui_pause_providers_routeData_vehicle`
---@class ui_pause_providers_routeData_vehicle
---@field dependencies table<integer, string> Extensions loaded beforehand: ui_pause_providers_vehicleTabInteractions, ui_vehicleSelector_general.
ui_pause_providers_routeData_vehicle = {}

--- Data for the configuration list management route: PauseVehicleConfigListManage component.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:454
---@return table  {mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData() end

--- Data for the combined configuration screen (parts, PauseVehicleConfigurationCombined component), with customConfigurationsEnabled depending on the first-drive capabilities.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:403
---@return table  {heading, mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData() end

--- Data for the main "vehicle" route: editable flag, rail (groups vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), PauseVehicleSpawned component, PauseVehicleTab side panel and actions table with visible, enabled and disabledReason for each action.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:282
---@param context table Pause context: mode, isMultiseatActive, isFirstDriveActive.
---@return table  {editable, rail, mainCardClass, mainPanelContent, spawnedVehicles, sidePanelContents, actions}.
function ui_pause_providers_routeData_vehicle.getVehicleData(context) end

--- Data for the vehicle debug route: PauseVehicleDebug component.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:484
---@return table  {mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleDebugData() end

--- Data for the part packs route: PauseVehiclePacks component.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:391
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehiclePacksData() end

--- Data for the paint route: PauseVehicleSkin component.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:432
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehiclePaintData() end

--- Data for the configuration save route: title "Save configuration - <make model>" of the current vehicle.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:444
---@return table  {heading}.
function ui_pause_providers_routeData_vehicle.getVehicleSaveData() end

--- Returns the save route title: the text ui.pause.route.saveConfig, followed by "- make model" if the player vehicle is known.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:450
---@return string  Title.
function ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle() end

--- Data for the spawned vehicles route: PauseVehicleSpawned component and lightweight data (shell) from ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:467
---@param context table Pause context.
---@return table  {mainCardClass, mainPanelContent, spawnedVehicles}.
function ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context) end

--- Data for the tuning route: PauseVehicleTuning component.
---Source: lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:420
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleTuningData() end

