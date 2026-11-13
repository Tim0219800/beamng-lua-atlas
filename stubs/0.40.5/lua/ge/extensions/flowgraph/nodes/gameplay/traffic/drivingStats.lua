---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_drivingStats_C
local flowgraph_nodes_gameplay_traffic_drivingStats_C = {}

--- Réinitialise le nœud (appelle onNodeReset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua:40
function flowgraph_nodes_gameplay_traffic_drivingStats_C:_executionStopped() end

--- Réinitialise le nœud (appelle onNodeReset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua:36
function flowgraph_nodes_gameplay_traffic_drivingStats_C:init() end

--- Oublie le véhicule et le suivi en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua:44
function flowgraph_nodes_gameplay_traffic_drivingStats_C:onNodeReset() end

--- Crée ou met à jour l'objet roadTracking pour le véhicule (onUpdate avec dtSim) et recopie ses valeurs sur les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua:49
function flowgraph_nodes_gameplay_traffic_drivingStats_C:work() end

