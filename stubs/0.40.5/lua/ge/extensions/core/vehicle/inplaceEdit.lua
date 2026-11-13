---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/inplaceEdit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_inplaceEdit` : éditeur de pièces « en jeu » rudimentaire (« ingame vehicle editor ») : masque l'interface CEF, affiche en texte debug (debugDrawer:drawTextAdvanced) l'arbre de slots/pièces du véhicule du joueur 0 et permet de naviguer au clavier (haut/bas/gauche/droite), de choisir une pièce pour un slot et de respawn le véhicule avec la nouvelle config. Ouvert par core_vehicle_manager.toggleModifyKey. C'est un outil de développement, pas une API de gameplay.
--- Accès : extension `core_vehicle_inplaceEdit` : `extensions.load("core_vehicle_inplaceEdit")`, puis la globale `core_vehicle_inplaceEdit`
---@class core_vehicle_inplaceEdit
core_vehicle_inplaceEdit = {}

--- Hook d'entrée : reçoit les touches de navigation de l'éditeur ('up', 'down', 'left', 'right', 'select', 'back') et déplace la sélection, descend/remonte dans les pièces ou applique le choix d'une pièce pour un slot (respawn du véhicule avec la config modifiée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/inplaceEdit.lua:361
---@param type string nom de l'action
---@param value number 1 = appui ; les autres valeurs sont ignorées
function core_vehicle_inplaceEdit.onInput(type, value) end

--- Hook par frame : charge les données du véhicule au besoin, anime l'activation et, si l'éditeur est actif, dessine à l'écran les infos et la liste des slots/pièces.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/inplaceEdit.lua:210
---@param dtReal number temps réel (s)
---@param dtSim number temps de simulation (s)
---@param dtRaw number temps brut (s)
function core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw) end

--- Active ou désactive l'éditeur (change de mode : masque/affiche l'interface CEF).
---Source : lua/ge/extensions/core/vehicle/inplaceEdit.lua:345
---@param val boolean true pour afficher
function core_vehicle_inplaceEdit.setShowWindow(val) end

--- Inverse l'état de l'éditeur et bascule le mode d'édition (toggleEditMode) du véhicule du joueur 0.
---Source : lua/ge/extensions/core/vehicle/inplaceEdit.lua:350
function core_vehicle_inplaceEdit.toggleShowWindow() end

