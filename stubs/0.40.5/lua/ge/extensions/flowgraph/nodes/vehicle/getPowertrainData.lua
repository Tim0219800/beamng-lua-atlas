---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_getPowertrainData_C
local flowgraph_nodes_vehicle_getPowertrainData_C = {}

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua:29
function flowgraph_nodes_vehicle_getPowertrainData_C:_executionStarted() end

--- Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua:26
function flowgraph_nodes_vehicle_getPowertrainData_C:init() end

--- Efface la réponse reçue et passe en durée `inactive`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua:33
function flowgraph_nodes_vehicle_getPowertrainData_C:onNodeReset() end

--- Quand la réponse est arrivée, la copie sur `value` et passe en `finished`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua:51
function flowgraph_nodes_vehicle_getPowertrainData_C:work() end

--- Envoie la requête powertrain au véhicule et passe en `started`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getPowertrainData.lua:38
function flowgraph_nodes_vehicle_getPowertrainData_C:workOnce() end

