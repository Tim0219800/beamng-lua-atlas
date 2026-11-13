---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/biomeTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Biome Tool » (mode d'édition « Edit Biome ») de l'éditeur de niveaux : génère de la végétation (objets Forest) et peint des matériaux de terrain par couches. Deux types de couches (terrain = 0, area = 1) ; les couches « area » contiennent des zones au lasso (inclusion/exclusion) ou par matériau de terrain. Chaque couche a des champs (densité de forêt, influence et plage de pente, falloff et densité de bordure, méthode de fusion Add/Replace/Delete, placement en champ avec distance/rangées/orientation, zone aléatoire par bruit RA_*, placement sur les bords EP_*). L'outil s'appuie sur ForestBrushTool et les brosses de forêt. Les couches sont lues dans <niveau>/art/biomeTool/biomeTool.json à l'initialisation et réécrites après chaque sauvegarde du niveau.
--- Accès : extension `editor_biomeTool` : `extensions.load("editor_biomeTool")`, puis la globale `editor_biomeTool`
---@class editor_biomeTool
---@field onExtensionLoaded nil Vaut nil : référence à une variable jamais définie dans le fichier.
editor_biomeTool = {}

--- Hook appelé après la sauvegarde du niveau : écrit les couches (var.layers) dans <niveau>/art/biomeTool/biomeTool.json (ancien fichier supprimé d'abord). Ne fait rien si aucune couche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/biomeTool.lua:3962
function editor_biomeTool.onEditorAfterSaveLevel() end

--- Appelé chaque frame de l'éditeur. Ne fait rien hors du mode « Edit Biome ». Sinon vérifie la présence d'un objet Forest (dialogue de création sinon) et dessine l'interface (onglets Level Biome / Biome Areas), le lasso, les zones et les animations de mise en évidence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/biomeTool.lua:3623
function editor_biomeTool.onEditorGui() end

--- Initialisation : charge biomeTool.json du niveau s'il existe, remplit la liste des brosses de forêt et des matériaux, enregistre le mode d'édition biomeEditMode (icône biome_tool), la fenêtre « biomeTool » (500x560), la fenêtre modale NoForestObjDialog et les éditeurs de champs personnalisés (TerrainMaterial, BlendingMethod, SlopeRange, VegetationFalloff, FieldPlacement, RA_Map).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/biomeTool.lua:3903
function editor_biomeTool.onEditorInitialized() end

--- Hook : quand la fenêtre « biomeTool » prend le focus, active le mode d'édition biomeEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/biomeTool.lua:3956
---@param windowName string Nom de la fenêtre qui a pris le focus.
function editor_biomeTool.onEditorToolWindowGotFocus(windowName) end

--- Hook : quand la fenêtre « biomeTool » est masquée, repasse en mode d'édition objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/biomeTool.lua:3950
---@param windowName string Nom de la fenêtre masquée.
function editor_biomeTool.onEditorToolWindowHide(windowName) end

--- Table d'état interne de l'outil (couches, zones, lasso, brosses de forêt, file de génération). Seules quelques méthodes d'accès aux champs « edge placement » et aux bornes sont définies dessus ; layerType vaut 0 (terrain), 1 (area) ou 2 (any, dans les modèles de champs).
---@class editor_biomeTool_var
local editor_biomeTool_var = {}

--- Renvoie l'atténuation de bordure (EP_BorderFalloff, -10 à 10) d'une couche ; crée le champ avec la valeur par défaut (0.0) s'il manque.
---Source : lua/ge/extensions/editor/biomeTool.lua:1473
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@return number|nil  Valeur courante, nil si le champ est inconnu.
function editor_biomeTool_var.getEPFalloff(layerType, layerID) end

--- Renvoie la distance entre objets pour le placement sur les bords (EP_ItemDistance, -10 à 10, défaut 1) ; crée le champ s'il manque.
---Source : lua/ge/extensions/editor/biomeTool.lua:1516
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@return number|nil  Valeur courante.
function editor_biomeTool_var.getEPItemDistance(layerType, layerID) end

--- Renvoie la plage d'inclinaison aléatoire (champ EP_RandomTilt) d'une couche ; {-5, 5} par défaut si la couche n'a pas ce champ.
---Source : lua/ge/extensions/editor/biomeTool.lua:1431
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@return table<integer, number>  {min, max} en degrés (déduit du code, plage -40 à 40).
function editor_biomeTool_var.getEPRandomTiltRange(layerType, layerID) end

--- Renvoie les bornes {min, max} d'un champ du modèle fieldInfoTemplate pour ce type de couche ; {0, 0} si introuvable.
---Source : lua/ge/extensions/editor/biomeTool.lua:1421
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche (non utilisé dans le calcul).
---@param fieldName string Nom du champ, ex. "EP_ItemDistance".
---@return table<integer, number>  {minValue, maxValue}.
function editor_biomeTool_var.getFieldMinMax(layerType, layerID, fieldName) end

--- Fixe EP_BorderFalloff d'une couche, bornée aux minValue/maxValue du champ ; crée le champ s'il manque.
---Source : lua/ge/extensions/editor/biomeTool.lua:1494
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@param val number Nouvelle valeur.
function editor_biomeTool_var.setEPFalloff(layerType, layerID, val) end

--- Fixe EP_ItemDistance d'une couche, bornée à -10..10 ; crée le champ s'il manque.
---Source : lua/ge/extensions/editor/biomeTool.lua:1537
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@param val number Nouvelle valeur.
function editor_biomeTool_var.setEPItemDistance(layerType, layerID, val) end

--- Fixe la plage EP_RandomTilt d'une couche, bornée à -40..40 ; crée le champ s'il manque. La table passée est modifiée.
---Source : lua/ge/extensions/editor/biomeTool.lua:1447
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer ID de la couche.
---@param range table<integer, number> {min, max} demandés.
function editor_biomeTool_var.setEPRandomTiltRange(layerType, layerID, range) end

