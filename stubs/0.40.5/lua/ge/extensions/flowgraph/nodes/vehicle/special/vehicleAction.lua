---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_vehicleAction_C
local flowgraph_nodes_vehicle_special_vehicleAction_C = {}

--- Restaure modèle, type, nom et action.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:183
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_vehicle_special_vehicleAction_C:_onDeserialized(nodeData) end

--- Sauvegarde modèle, type, nom et action.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:176
---@param res table Table de sauvegarde à remplir.
function flowgraph_nodes_vehicle_special_vehicleAction_C:_onSerialize(res) end

--- Sélecteur de véhicule et liste des actions disponibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:71
function flowgraph_nodes_vehicle_special_vehicleAction_C:drawCustomProperties() end

--- Remplace VALUE, FILTERTYPE et ANGLE dans la commande par les valeurs des pins.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:149
---@param cmd string Commande avec jetons VALUE, FILTERTYPE, ANGLE.
function flowgraph_nodes_vehicle_special_vehicleAction_C:formatCommand(cmd) end

--- Constructeur ; aucune action sélectionnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:34
function flowgraph_nodes_vehicle_special_vehicleAction_C:init() end

--- Charge et met en cache les actions d'un modèle (`key`) depuis `file` (défaut `vehicles/<key>/input_actions.json`).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:47
---@param key string Clé du modèle de véhicule ou 'allVehicles'.
---@param file string|nil Fichier d'actions (défaut vehicles/<key>/input_actions.json).
function flowgraph_nodes_vehicle_special_vehicleAction_C:loadActions(key, file) end

--- Envoie au véhicule `onDown`, `onChange`, `onUp` de l'action selon les pins de flux actifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/vehicleAction.lua:156
function flowgraph_nodes_vehicle_special_vehicleAction_C:work() end

