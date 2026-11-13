---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/modelSelection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet « Models selection » de l'outil de création de vignettes (ImGui) : liste tous les modèles de véhicules (core_vehicles.getModelList), regroupés par type, avec des cases à cocher pour choisir lesquels seront photographiés. Il propose des filtres par type (Cars, Trucks, Heavy Machinery, Trailers, Props, Other), des boutons Player Vehicle Model, Select All, Unselect All, Invert Selection, et deux colonnes « Unselected / Selected Models ». Le module job.lua l'interroge via getSelectedModels pour construire la liste de travail.
--- Accès : extension `util_screenshotCreator_modelSelection` : `extensions.load("util_screenshotCreator_modelSelection")`, puis la globale `util_screenshotCreator_modelSelection`
---@class util_screenshotCreator_modelSelection
---@field dependencies string[] Extensions chargées avant : ui_imgui, ui_vehicleSelector_tileGrouping, core_vehicles, util_screenshotCreator_settings, util_screenshotCreator_shippedConfigs.
util_screenshotCreator_modelSelection = {}

--- Dessine l'onglet ImGui « Models selection » (filtres, boutons, listes). À appeler à chaque frame dans la fenêtre de l'outil, entre BeginTabBar et EndTabBar ; ne dessine rien si l'onglet n'est pas actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/modelSelection.lua:128
function util_screenshotCreator_modelSelection.drawTab() end

--- Compte les modèles cochés et visibles.
---Source : lua/ge/extensions/util/screenshotCreator/modelSelection.lua:204
---@return integer  Nombre de modèles sélectionnés.
function util_screenshotCreator_modelSelection.getSelectedCount() end

--- Renvoie les clés des modèles cochés et visibles. Si aucun n'est coché, renvoie le modèle du véhicule joueur.
---Source : lua/ge/extensions/util/screenshotCreator/modelSelection.lua:188
---@return string[]  Clés de modèles (dossier de véhicule, ex. « pickup »).
function util_screenshotCreator_modelSelection.getSelectedModels() end

--- Reconstruit la liste des modèles depuis core_vehicles.getModelList() ; toutes les sélections sont perdues.
---Source : lua/ge/extensions/util/screenshotCreator/modelSelection.lua:215
function util_screenshotCreator_modelSelection.repopulate() end

--- Coche uniquement le modèle du véhicule du joueur (comparaison avec JBeam) et décoche tous les autres. Journalise une erreur (tag selectCurVeh) s'il n'y a pas de véhicule joueur.
---Source : lua/ge/extensions/util/screenshotCreator/modelSelection.lua:116
function util_screenshotCreator_modelSelection.selectPlayerVehicle() end

