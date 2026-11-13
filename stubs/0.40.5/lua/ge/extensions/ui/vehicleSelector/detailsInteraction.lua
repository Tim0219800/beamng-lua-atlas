---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade du panneau de détails du sélecteur de véhicules. Elle assemble les spécifications (ui_vehicleSelector_vehicleSpecifications) et les boutons d'action (ui_vehicleSelector_vehicleOperations) d'un élément, et expose quelques actions (ouvrir un dossier, aller à la page d'un mod). Un mode de boutons personnalisés permet à d'autres systèmes (mode défi) de remplacer les boutons de freeroam.
--- Accès : extension `ui_vehicleSelector_detailsInteraction` : `extensions.load("ui_vehicleSelector_detailsInteraction")`, puis la globale `ui_vehicleSelector_detailsInteraction`
---@class ui_vehicleSelector_detailsInteraction
---@field customDetailsButtons table Boutons personnalisés ({callback, meta}) ; vide par défaut.
---@field dependencies string[] ui_vehicleSelector_vehicleOperations, ui_vehicleSelector_vehicleSpecifications.
---@field exitCallback function Callback de sortie, nop par défaut ; modifié par setExitCallback.
---@field managementButtonsEnabled boolean Valeur initiale true (configuration).
ui_vehicleSelector_detailsInteraction = {}

--- Délègue à ui_vehicleSelector_vehicleOperations.executeButton avec les mêmes arguments.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:79
---@param ... any Arguments transmis tels quels.
---@return any  Résultat de vehicleOperations.executeButton.
function ui_vehicleSelector_detailsInteraction.executeButton(...) end

--- Délègue à ui_vehicleSelector_vehicleOperations.executeDoubleClick avec les mêmes arguments.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:80
---@param ... any Arguments transmis tels quels.
---@return any  Résultat de vehicleOperations.executeDoubleClick.
function ui_vehicleSelector_detailsInteraction.executeDoubleClick(...) end

--- Ouvre un dossier dans l'explorateur de fichiers du système (Engine.Platform.exploreFolder).
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:65
---@param path string Chemin du dossier.
function ui_vehicleSelector_detailsInteraction.exploreFolder(path) end

--- Renvoie les détails d'un élément (spécifications issues de vehicleSpecifications) complétés de `buttonInfo` : boutons personnalisés si définis, sinon boutons de lancement standard de vehicleOperations.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:13
---@param itemDetails table Élément sélectionné (transmis à vehicleSpecifications.getDetails).
---@return table  Détails avec champ buttonInfo.
function ui_vehicleSelector_detailsInteraction.getDetails(itemDetails) end

--- Renvoie les détails des boutons de gestion fournis par vehicleOperations.getManagementDetails().
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:55
---@return table  Informations de gestion (déduit du code).
function ui_vehicleSelector_detailsInteraction.getManagementDetails() end

--- Navigue vers la page de détails d'un mod dans l'interface (route 'menu.mods.details').
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:70
---@param modId string Identifiant du mod.
function ui_vehicleSelector_detailsInteraction.goToMod(modId) end

--- Définit la liste des boutons personnalisés qui remplacent les boutons standard dans getDetails.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:83
---@param buttons table Liste d'objets {callback, meta}.
function ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons) end

--- Délègue à ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:82
---@param ... any Arguments transmis tels quels.
function ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...) end

--- Définit la fonction appelée à la sortie ; nop si nil.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:59
---@param callback function|nil Callback de sortie.
function ui_vehicleSelector_detailsInteraction.setExitCallback(callback) end

--- Délègue à ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled.
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:81
---@param ... any Arguments transmis tels quels.
function ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...) end

