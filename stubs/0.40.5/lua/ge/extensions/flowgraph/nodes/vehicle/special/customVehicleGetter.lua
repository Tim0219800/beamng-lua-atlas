---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_customVehicleGetter_C
local flowgraph_nodes_vehicle_special_customVehicleGetter_C = {}

--- Efface la valeur reçue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:97
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:_executionStarted() end

--- Liste déroulante des fonctions prédéfinies et champ de texte pour une fonction personnalisée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:42
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:drawCustomProperties() end

--- Construit la commande Lua envoyée au véhicule.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:102
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:getCmd() end

--- Constructeur ; `data.fun` = première fonction de la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:38
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:init() end

--- Appelé en retour par la VM véhicule avec la valeur sérialisée ; la désérialise dans `returnedValue`.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:106
---@param value string Valeur sérialisée renvoyée par la VM véhicule.
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:returnValue(value) end

--- Envoie la commande au véhicule une fois, puis expose `value`/`valBool` dès réception.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVehicleGetter.lua:67
function flowgraph_nodes_vehicle_special_customVehicleGetter_C:work() end

