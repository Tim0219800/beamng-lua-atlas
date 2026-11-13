---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_setFuelLevel_C
local flowgraph_nodes_career_setFuelLevel_C = {}

--- Appelle onNodeReset au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:27
function flowgraph_nodes_career_setFuelLevel_C:_executionStarted() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:24
function flowgraph_nodes_career_setFuelLevel_C:init() end

--- Réinitialise les données reçues, le drapeau d'envoi et l'état de durée ('inactive').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:36
function flowgraph_nodes_career_setFuelLevel_C:onNodeReset() end

--- Quand les données sont arrivées, règle chaque réservoir à maxEnergy*mult et passe à 'finished'.
---Source : lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:55
function flowgraph_nodes_career_setFuelLevel_C:work() end

--- Trouve le véhicule, demande les données d'énergie et passe à l'état 'started'.
---Source : lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:44
function flowgraph_nodes_career_setFuelLevel_C:workOnce() end

