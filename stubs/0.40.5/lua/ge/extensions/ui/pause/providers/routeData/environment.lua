---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/environment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for the Environment page: summary (weather, traffic, others), weather/time page, simulation page (gravity, speed) and traffic page. It decides whether editing is allowed (freeroam, multiplayer, freeroamTutorial, or if the restrictScenarios setting is disabled) and takes the First Drive session's capabilities into account. Mods can add buttons to the page via the hook onEnvironmentGetOtherButtons.
--- Access: extension `ui_pause_providers_routeData_environment`: `extensions.load("ui_pause_providers_routeData_environment")`, then the global `ui_pause_providers_routeData_environment`
---@class ui_pause_providers_routeData_environment
---@field dependencies string[] {"ui_pause_providers_trafficControls"}
ui_pause_providers_routeData_environment = {}

--- Returns the Environment summary page: PauseEnvironmentDigest component with weather, traffic and other buttons (simulation included), action states, time of day options, the level's initial values and the current level name.
---Source: lua/ge/extensions/ui/pause/providers/routeData/environment.lua:79
---@param context table Pause context (field read: mode).
---@return table  {editable, mainPanelContent, actions, timeOfDayOptions, levelDefaults, currentLevelName}
function ui_pause_providers_routeData_environment.getEnvironmentData(context) end

--- Returns the simulation page (PauseEnvironmentSimulation component). During a First Drive session, returns an empty non-editable page.
---Source: lua/ge/extensions/ui/pause/providers/routeData/environment.lua:194
---@param context table Pause context.
---@return table  {editable, disabledReason, mainPanelContent}
function ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context) end

--- Returns the traffic page (PauseEnvironmentTraffic component) with the data from ui_pause_providers_trafficControls.getData({editable = ...}).
---Source: lua/ge/extensions/ui/pause/providers/routeData/environment.lua:217
---@param context table Pause context.
---@return table  {editable, disabledReason, traffic, mainPanelContent}
function ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context) end

--- Returns the weather/time page (PauseEnvironmentWeather component) with gravityPresets, simSpeedPresets, timeOfDayOptions and levelDefaults from core_environment.
---Source: lua/ge/extensions/ui/pause/providers/routeData/environment.lua:163
---@param context table Pause context.
---@return table  {editable, disabledReason, mainCardClass, mainPanelContent, gravityPresets, simSpeedPresets, timeOfDayOptions, levelDefaults}
function ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context) end

--- Redirects to ui_pause_providers_trafficControls.getData(payload), to refresh only the traffic data.
---Source: lua/ge/extensions/ui/pause/providers/routeData/environment.lua:242
---@param payload table Payload passed (field read: editable).
---@return table  Traffic data.
function ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload) end

