---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/environment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour la page Environnement : résumé (météo, circulation, autres), page météo/heure, page simulation (gravité, vitesse) et page circulation. Il décide si l'édition est permise (freeroam, multiplayer, freeroamTutorial, ou si le réglage restrictScenarios est désactivé) et tient compte des capacités de la session First Drive. Les mods peuvent ajouter des boutons à la page via le hook onEnvironmentGetOtherButtons.
--- Accès : extension `ui_pause_providers_routeData_environment` : `extensions.load("ui_pause_providers_routeData_environment")`, puis la globale `ui_pause_providers_routeData_environment`
---@class ui_pause_providers_routeData_environment
---@field dependencies string[] {"ui_pause_providers_trafficControls"}
ui_pause_providers_routeData_environment = {}

--- Renvoie la page résumé Environnement : composant PauseEnvironmentDigest avec boutons météo, circulation et autres (simulation incluse), états d'action, options d'heure du jour, valeurs initiales du niveau et nom du niveau courant.
---Source : lua/ge/extensions/ui/pause/providers/routeData/environment.lua:79
---@param context table Contexte pause (champ lu : mode).
---@return table  {editable, mainPanelContent, actions, timeOfDayOptions, levelDefaults, currentLevelName}
function ui_pause_providers_routeData_environment.getEnvironmentData(context) end

--- Renvoie la page simulation (composant PauseEnvironmentSimulation). Pendant une session First Drive, renvoie une page vide non éditable.
---Source : lua/ge/extensions/ui/pause/providers/routeData/environment.lua:194
---@param context table Contexte pause.
---@return table  {editable, disabledReason, mainPanelContent}
function ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context) end

--- Renvoie la page circulation (composant PauseEnvironmentTraffic) avec les données de ui_pause_providers_trafficControls.getData({editable = ...}).
---Source : lua/ge/extensions/ui/pause/providers/routeData/environment.lua:217
---@param context table Contexte pause.
---@return table  {editable, disabledReason, traffic, mainPanelContent}
function ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context) end

--- Renvoie la page météo/heure (composant PauseEnvironmentWeather) avec gravityPresets, simSpeedPresets, timeOfDayOptions et levelDefaults de core_environment.
---Source : lua/ge/extensions/ui/pause/providers/routeData/environment.lua:163
---@param context table Contexte pause.
---@return table  {editable, disabledReason, mainCardClass, mainPanelContent, gravityPresets, simSpeedPresets, timeOfDayOptions, levelDefaults}
function ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context) end

--- Redirige vers ui_pause_providers_trafficControls.getData(payload), pour rafraîchir uniquement les données de circulation.
---Source : lua/ge/extensions/ui/pause/providers/routeData/environment.lua:242
---@param payload table Charge utile transmise (champ lu : editable).
---@return table  Données de circulation.
function ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload) end

