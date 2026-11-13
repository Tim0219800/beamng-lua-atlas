---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/lightRunnerSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend du sélecteur en grille pour l'assistant Vue LightRunner. Il réutilise les mêmes niveaux/pistes que la course rapide (scenario_quickRaceLoader) : seule la sélection de véhicule est restreinte (voiture/camion compatibles powerglow), ailleurs dans les filtres du sélecteur de véhicules. Le module copie simplement dans M toutes les fonctions du backend créé par `oneshotRaceSelector/core` avec le descripteur `quickRaceTrackDescriptor.build("lightRunnerSelector")`.
--- Accès : extension `ui_lightRunnerSelector_general` : `extensions.load("ui_lightRunnerSelector_general")`, puis la globale `ui_lightRunnerSelector_general`
---@class ui_lightRunnerSelector_general
---@field dependencies table<integer, string> {"scenario_quickRaceLoader"}.
ui_lightRunnerSelector_general = {}

