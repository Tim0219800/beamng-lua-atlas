---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actions du sélecteur de véhicules : crée les boutons « Faire apparaître » et « Remplacer le véhicule » d'une config, et les boutons de gestion (sauvegarder la config, cloner, choix aléatoire, tout réinitialiser, tout supprimer, supprimer le véhicule courant ou les autres, véhicule par défaut en mode dev). Il exécute le véhicule choisi après l'écran de fade en passant par core_vehicles (spawnNewVehicle, replaceVehicle, cloneCurrent), respecte les permissions multijoueur et les restrictions des tutoriels, et émet des hooks onVehicleSelector*.
--- Accès : extension `ui_vehicleSelector_vehicleOperations` : `extensions.load("ui_vehicleSelector_vehicleOperations")`, puis la globale `ui_vehicleSelector_vehicleOperations`
---@class ui_vehicleSelector_vehicleOperations
---@field managementButtonsEnabled boolean true par défaut ; si false, getManagementDetails ne crée aucun bouton.
ui_vehicleSelector_vehicleOperations = {}

--- Ajoute un bouton à l'instance (délègue à buttonModule).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:537
---@param ... any (fonction, métadonnées) comme dans buttonModule.addButton.
---@return table  Informations du bouton (dont buttonId).
function ui_vehicleSelector_vehicleOperations.addButton(...) end

--- Supprime tous les boutons enregistrés (délègue à buttonModule).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:538
---@param ... any Transmis tels quels.
function ui_vehicleSelector_vehicleOperations.clearButtonFunctions(...) end

--- Exécute le bouton d'identifiant donné ; si ses métadonnées ont canClearFilters, efface les filtres quand l'option filterResetOnSpawn est active. Logue une erreur si l'id est inconnu.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:40
---@param buttonId integer Identifiant du bouton.
---@param additionalData table|nil Données additionnelles transmises à la fonction du bouton (par exemple paint, paint2, paint3).
---@return any  Résultat de la fonction du bouton (par exemple {gotoPath = ...} pour le choix aléatoire).
function ui_vehicleSelector_vehicleOperations.executeButton(buttonId, additionalData) end

--- Pour un double-clic sur un élément : récupère ses détails et exécute le premier bouton marqué isDoubleClickAction (ou l'unique bouton).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:497
---@param itemDetails table Élément (model, config).
function ui_vehicleSelector_vehicleOperations.executeDoubleClick(itemDetails) end

--- Renvoie l'aperçu de la config d'un véhicule.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:316
---@param veh userdata|nil Objet véhicule.
---@return string|nil  Chemin de l'image, ou nil.
function ui_vehicleSelector_vehicleOperations.getCurrentVehicleThumb(veh) end

--- Renvoie un identifiant de bouton libre (délègue à buttonModule).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:539
---@param ... any Transmis tels quels.
---@return integer  Identifiant libre (déduit du nom).
function ui_vehicleSelector_vehicleOperations.getFreeButtonId(...) end

--- Crée les boutons de gestion (si activés) et les infos du véhicule joueur 0 (nom et miniature).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:332
---@return table  {buttonInfo = boutons, details = {currentVehicleName, currentVehicleThumb}}.
function ui_vehicleSelector_vehicleOperations.getManagementDetails() end

--- Construit le nom lisible « Marque Nom Configuration » d'un véhicule à partir de son modèle JBeam et de sa config.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:289
---@param veh userdata|nil Objet véhicule ; nil donne 'No vehicle'.
---@return string  Nom du véhicule.
function ui_vehicleSelector_vehicleOperations.getVehicleName(veh) end

--- Crée les boutons de lancement d'une config : « Spawn new » (action_2) et, sauf spawnOnly, « Replace current » (ok, action principale et double-clic). Ils sont désactivés selon les restrictions de la première conduite, des leçons et des permissions.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:225
---@param configDetails table|nil Config (model_key, key) ; sans elle, aucun bouton.
---@param spawnOnly boolean true pour ne proposer que le bouton d'apparition.
---@return table[]  Informations de boutons à envoyer à l'UI.
function ui_vehicleSelector_vehicleOperations.makeSpawningButtons(configDetails, spawnOnly) end

--- Hook appelé quand l'écran de fade change d'état ; à l'état 1, exécute l'action différée (spawn, remplacement, clonage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:52
---@param state integer État du fade (1 déclenche l'action).
function ui_vehicleSelector_vehicleOperations.onScreenFadeState(state) end

--- Hook appelé quand l'état d'attente de l'UI change ; exécute l'action différée en attente, quel que soit l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:59
---@param state any État d'attente (non utilisé).
function ui_vehicleSelector_vehicleOperations.onUiWaitingState(state) end

--- Mémorise une liste de boutons personnalisés (mode défi).
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:520
---@param buttons table|nil Boutons personnalisés.
function ui_vehicleSelector_vehicleOperations.setCustomDetailsButtons(buttons) end

--- Mémorise un indicateur freeroam pour le bouton de détails.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:515
---@param enabled boolean Valeur mémorisée dans M.detailsButtonForFreeroam.
function ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam(enabled) end

--- Active ou désactive la création des boutons de gestion.
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleOperations.lua:510
---@param enabled boolean true pour les afficher.
function ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled(enabled) end

