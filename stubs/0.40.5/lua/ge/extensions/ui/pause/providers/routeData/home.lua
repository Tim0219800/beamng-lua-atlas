---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/home.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the data of the pause menu home screen (route "pause"). Depending on the game mode (career, mission, multiplayer, freeroam, freeroamTutorial, scenario) and the first drive state, it composes the content of the main panel and the side panels (Vue components by name), adds the career buttons and the button rail from ui_pause_features_homeRail. Also provides the detail data of the selected vehicle.
--- Access: extension `ui_pause_providers_routeData_home`: `extensions.load("ui_pause_providers_routeData_home")`, then the global `ui_pause_providers_routeData_home`
---@class ui_pause_providers_routeData_home
---@field dependencies table<integer, string> Extensions loaded before: career_career, career_saveSystem, ui_pause_providers_nearbyActivities, ui_pause_providers_missionObjectives, ui_pause_providers_routeData_multiplayer, ui_pause_providers_vehicleTabInteractions, ui_pause_features_homeRail, ui_vehicleSelector_general.
ui_pause_providers_routeData_home = {}

--- Builds the pause home route data: mode, mainPanelContent, sidePanelContents, rail, and depending on the case heading, mainCardClass, nearbyActivities and missionObjectives. In career, adds buttons (loading map, cancel certification, cancel trial); in mission, the task list and the objectives.
---Source: lua/ge/extensions/ui/pause/providers/routeData/home.lua:117
---@param context table Pause context: mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isCareerActive...
---@return table  Home route data.
function ui_pause_providers_routeData_home.getHomeData(context) end

--- Data of the selected spawned vehicle's details route: title (label), PauseVehicleSpawnedSelected component and spawnedVehicleSelected.
---Source: lua/ge/extensions/ui/pause/providers/routeData/home.lua:262
---@param context table Pause context, passed to vehicleTabInteractions.
---@return table  {heading, mainPanelContent, spawnedVehicleSelected}.
function ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context) end

--- Returns whether the driving assists summary is active (false by default).
---Source: lua/ge/extensions/ui/pause/providers/routeData/home.lua:94
---@return boolean  true if active.
function ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled() end

--- Enables or disables the display of the driving assists summary (DrivingAssistsDigest component) in place of the normal home.
---Source: lua/ge/extensions/ui/pause/providers/routeData/home.lua:90
---@param enabled boolean true to enable (any other value disables).
function ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled) end

