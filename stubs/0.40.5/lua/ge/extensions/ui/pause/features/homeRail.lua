---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/features/homeRail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit le rail de boutons de droite de l'accueil du menu pause. Selon le contexte (mode freeroam, career, mission, multiplayer, garage, freeroamTutorial, scénario, première conduite, multiseat) il assemble des groupes de boutons : recovery (reprendre, réparer, récupération carrière/mission), firstDriveLearning, tutorialLesson, career, auxiliary (sélecteur de véhicule, carte, mode photo, replay), mainMenu (changer de niveau, quitter l'activité, quitter le niveau) et multiseat. Utilisé par ui_pause_providers_routeData_home.
--- Accès : extension `ui_pause_features_homeRail` : `extensions.load("ui_pause_features_homeRail")`, puis la globale `ui_pause_features_homeRail`
---@class ui_pause_features_homeRail
ui_pause_features_homeRail = {}

--- Construit la liste des groupes du rail pour le contexte du pause. Chaque groupe vient de Common.asRailGroup(nom, actions) et les groupes vides sont omis. Journalise le nombre de groupes et d'actions multiseat.
---Source : lua/ge/extensions/ui/pause/features/homeRail.lua:681
---@param context table Contexte du pause : mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isScenarioActive, isMissionActive, isBigMapAllowed…
---@param registerButton function Fonction (definition, callback) qui enregistre un bouton et renvoie sa description.
---@return table[]  Groupes de boutons du rail.
function ui_pause_features_homeRail.build(context, registerButton) end

