---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_getAIMode_C
local flowgraph_nodes_vehicle_ai_getAIMode_C = {}

--- Oublie le dernier mode reçu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:40
function flowgraph_nodes_vehicle_ai_getAIMode_C:_executionStarted() end

--- Rappel appelé depuis le véhicule avec le mode IA ; le mémorise dans returnedMode.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:48
---@param mode string Mode IA du véhicule (ex. manual, disabled, random...).
function flowgraph_nodes_vehicle_ai_getAIMode_C:getAIMode(mode) end

--- Construit la commande Lua exécutée côté véhicule : lit ai.getState().mode et rappelle n:getAIMode(mode) sur ce nœud via core_flowgraphManager.getManagerGraphNode.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:44
function flowgraph_nodes_vehicle_ai_getAIMode_C:getCmd() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:21
function flowgraph_nodes_vehicle_ai_getAIMode_C:init() end

--- Envoie au véhicule la commande de getCmd et publie le dernier mode reçu sur aiMode (la valeur a donc au moins une frame de retard).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:25
function flowgraph_nodes_vehicle_ai_getAIMode_C:work() end

