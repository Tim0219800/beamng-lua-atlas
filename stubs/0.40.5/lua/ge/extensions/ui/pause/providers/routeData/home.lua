---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/home.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit les données de l'écran d'accueil du menu pause (route « pause »). Selon le mode de jeu (career, mission, multiplayer, freeroam, freeroamTutorial, scenario) et l'état de la première conduite, il compose le contenu du panneau principal et des panneaux latéraux (composants Vue par nom), ajoute les boutons de carrière et le rail de boutons de ui_pause_features_homeRail. Fournit aussi les données de détail du véhicule sélectionné.
--- Accès : extension `ui_pause_providers_routeData_home` : `extensions.load("ui_pause_providers_routeData_home")`, puis la globale `ui_pause_providers_routeData_home`
---@class ui_pause_providers_routeData_home
---@field dependencies table<integer, string> Extensions chargées avant : career_career, career_saveSystem, ui_pause_providers_nearbyActivities, ui_pause_providers_missionObjectives, ui_pause_providers_routeData_multiplayer, ui_pause_providers_vehicleTabInteractions, ui_pause_features_homeRail, ui_vehicleSelector_general.
ui_pause_providers_routeData_home = {}

--- Construit les données de la route d'accueil du pause : mode, mainPanelContent, sidePanelContents, rail, et selon le cas heading, mainCardClass, nearbyActivities et missionObjectives. En carrière, ajoute des boutons (carte du chargement, annuler la certification, annuler l'essai) ; en mission, la liste de tâches et les objectifs.
---Source : lua/ge/extensions/ui/pause/providers/routeData/home.lua:117
---@param context table Contexte du pause : mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isCareerActive…
---@return table  Données de la route d'accueil.
function ui_pause_providers_routeData_home.getHomeData(context) end

--- Données de la route de détails du véhicule apparu sélectionné : titre (label), composant PauseVehicleSpawnedSelected et spawnedVehicleSelected.
---Source : lua/ge/extensions/ui/pause/providers/routeData/home.lua:262
---@param context table Contexte du pause, transmis à vehicleTabInteractions.
---@return table  {heading, mainPanelContent, spawnedVehicleSelected}.
function ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context) end

--- Indique si le récapitulatif des aides à la conduite est actif (faux par défaut).
---Source : lua/ge/extensions/ui/pause/providers/routeData/home.lua:94
---@return boolean  true si actif.
function ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled() end

--- Active ou désactive l'affichage du récapitulatif des aides à la conduite (composant DrivingAssistsDigest) à la place de l'accueil normal.
---Source : lua/ge/extensions/ui/pause/providers/routeData/home.lua:90
---@param enabled boolean true pour activer (toute autre valeur désactive).
function ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled) end

