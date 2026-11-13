---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_getElectricsValue_C
local flowgraph_nodes_vehicle_getElectricsValue_C = {}

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:41
function flowgraph_nodes_vehicle_getElectricsValue_C:_executionStarted() end

--- Appelé par le gestionnaire quand l'exécution du projet s'arrête ; nettoie l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:44
function flowgraph_nodes_vehicle_getElectricsValue_C:_executionStopped() end

--- Se désabonne de la notification de changement de valeur (`unregisterValueChangeNotification`) et vide `_setupData`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:48
function flowgraph_nodes_vehicle_getElectricsValue_C:clearNotification() end

--- Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:25
function flowgraph_nodes_vehicle_getElectricsValue_C:init() end

--- Passe en durée `inactive` et supprime la notification.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:59
function flowgraph_nodes_vehicle_getElectricsValue_C:onNodeReset() end

--- Définit `hardTemplates` du pin `key` : liste de clés electrics courantes proposées dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:28
function flowgraph_nodes_vehicle_getElectricsValue_C:postInit() end

--- Lit la valeur en cache ; si elle existe, l'écrit dans `value` et passe en `finished`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:78
function flowgraph_nodes_vehicle_getElectricsValue_C:work() end

--- S'abonne à la valeur `key` du véhicule et passe en durée `started`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/getElectricsValue.lua:64
function flowgraph_nodes_vehicle_getElectricsValue_C:workOnce() end

