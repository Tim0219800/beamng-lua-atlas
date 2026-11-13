---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficActivate_C
local flowgraph_nodes_gameplay_traffic_trafficActivate_C = {}

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:34
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:_executionStopped() end

--- Appelle onNodeReset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:30
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:init() end

--- Désactive le trafic et remet les flags à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:38
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:onNodeReset() end

--- Publie le nombre total de véhicules IA et l'impulsion activated.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:54
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:work() end

--- Active le trafic pour vehicleIds (si défini) et publie la liste de trafic validée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua:44
function flowgraph_nodes_gameplay_traffic_trafficActivate_C:workOnce() end

