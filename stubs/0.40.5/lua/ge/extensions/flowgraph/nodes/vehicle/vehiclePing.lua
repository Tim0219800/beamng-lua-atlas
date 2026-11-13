---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_vehiclePing_C
local flowgraph_nodes_vehicle_vehiclePing_C = {}

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:26
function flowgraph_nodes_vehicle_vehiclePing_C:_executionStarted() end

--- Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:23
function flowgraph_nodes_vehicle_vehiclePing_C:init() end

--- Efface la réponse et passe en durée `inactive`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:30
function flowgraph_nodes_vehicle_vehiclePing_C:onNodeReset() end

--- Quand le ping revient, passe en `finished`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:48
function flowgraph_nodes_vehicle_vehiclePing_C:work() end

--- Envoie le ping et passe en `started`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehiclePing.lua:35
function flowgraph_nodes_vehicle_vehiclePing_C:workOnce() end

