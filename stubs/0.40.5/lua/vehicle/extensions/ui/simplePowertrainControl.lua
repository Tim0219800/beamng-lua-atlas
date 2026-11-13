---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/ui/simplePowertrainControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le véhicule et les boutons de contrôle simplifié du groupe motopropulseur affichés dans l'UI. setButton envoie l'événement UI `ChangePowerTrainButtons` (créer, mettre à jour ou retirer un bouton) ; updateButtons demande à powertrain et aux contrôleurs de republier leurs boutons. Les modules powertrain/controller s'en servent, un moddeur peut y ajouter ses propres boutons.
--- Accès : extension `ui_simplePowertrainControl` : `extensions.load (VM véhicule)("ui_simplePowertrainControl")`, puis la globale `ui_simplePowertrainControl`
---@class ui_simplePowertrainControl
ui_simplePowertrainControl = {}

--- Hook d'initialisation du véhicule ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/ui/simplePowertrainControl.lua:49
function ui_simplePowertrainControl.onInit() end

--- Hook de reset du véhicule ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/ui/simplePowertrainControl.lua:46
function ui_simplePowertrainControl.onReset() end

--- Publie un bouton de contrôle simplifié vers l'UI via guihooks.trigger('ChangePowerTrainButtons', {...}).
---Source : lua/vehicle/extensions/ui/simplePowertrainControl.lua:17
---@param id string Identifiant du bouton.
---@param uiName string Texte d'infobulle (champ tooltip).
---@param icon string Identifiant d'icône.
---@param color string|nil Couleur hexadécimale ; '#' ajouté si absent.
---@param ringValue number|any Valeur de l'anneau de progression du bouton (transmise telle quelle).
---@param onClickCallback string|any Callback transmis à l'UI (champ onClick).
---@param remove boolean|nil true pour retirer le bouton.
---@param active boolean|nil État actif du bouton.
function ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active) end

--- Appelle powertrain.updateSimpleControlButtons() puis controller.updateSimpleControlButtons() pour que chaque module republie ses boutons.
---Source : lua/vehicle/extensions/ui/simplePowertrainControl.lua:41
function ui_simplePowertrainControl.updateButtons() end

