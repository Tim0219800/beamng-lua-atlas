---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit les données des routes « véhicule » du menu pause (pause.vehicle et sous-routes : configuration combinée, packs, réglages, peinture, sauvegarde, liste des configurations, véhicules apparus, debug). Chaque fonction renvoie une table décrivant les composants Vue à afficher (mainPanelContent, sidePanelContents, rail, mainCardClass, heading). getVehicleData calcule en plus les permissions de chaque action selon le mode de jeu, la première conduite et la présence d'un véhicule.
--- Accès : extension `ui_pause_providers_routeData_vehicle` : `extensions.load("ui_pause_providers_routeData_vehicle")`, puis la globale `ui_pause_providers_routeData_vehicle`
---@class ui_pause_providers_routeData_vehicle
---@field dependencies table<integer, string> Extensions chargées avant : ui_pause_providers_vehicleTabInteractions, ui_vehicleSelector_general.
ui_pause_providers_routeData_vehicle = {}

--- Données de la route de gestion de la liste des configurations : composant PauseVehicleConfigListManage.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:454
---@return table  {mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData() end

--- Données de l'écran de configuration combinée (pièces, composant PauseVehicleConfigurationCombined), avec customConfigurationsEnabled selon les capacités de la première conduite.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:403
---@return table  {heading, mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData() end

--- Données de la route principale « véhicule » : indicateur editable, rail (groupes vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), composant PauseVehicleSpawned, panneau latéral PauseVehicleTab et table actions avec visible, enabled et disabledReason pour chaque action.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:282
---@param context table Contexte du pause : mode, isMultiseatActive, isFirstDriveActive.
---@return table  {editable, rail, mainCardClass, mainPanelContent, spawnedVehicles, sidePanelContents, actions}.
function ui_pause_providers_routeData_vehicle.getVehicleData(context) end

--- Données de la route de debug du véhicule : composant PauseVehicleDebug.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:484
---@return table  {mainCardClass, mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleDebugData() end

--- Données de la route des packs de pièces : composant PauseVehiclePacks.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:391
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehiclePacksData() end

--- Données de la route de peinture : composant PauseVehicleSkin.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:432
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehiclePaintData() end

--- Données de la route de sauvegarde de configuration : titre « Enregistrer la configuration - <marque modèle> » du véhicule actuel.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:444
---@return table  {heading}.
function ui_pause_providers_routeData_vehicle.getVehicleSaveData() end

--- Renvoie le titre de la route de sauvegarde : le texte ui.pause.route.saveConfig, suivi de « - marque modèle » si le véhicule joueur est connu.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:450
---@return string  Titre.
function ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle() end

--- Données de la route des véhicules apparus : composant PauseVehicleSpawned et données allégées (shell) de ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:467
---@param context table Contexte du pause.
---@return table  {mainCardClass, mainPanelContent, spawnedVehicles}.
function ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context) end

--- Données de la route de réglages : composant PauseVehicleTuning.
---Source : lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua:420
---@return table  {mainPanelContent}.
function ui_pause_providers_routeData_vehicle.getVehicleTuningData() end

