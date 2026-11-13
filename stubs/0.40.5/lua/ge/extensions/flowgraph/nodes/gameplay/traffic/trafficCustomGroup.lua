---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C
local flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C = {}

--- Remet self.done à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:133
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_executionStarted() end

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:222
---@param data table données sauvegardées du nœud
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_onDeserialized(data) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:212
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_onSerialize(res) end

--- Construit un groupe de type 'custom' à partir des pins model_i / config_i.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:137
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:buildGroup() end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:34
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:drawCustomProperties() end

--- Construit un groupe de type 'generator' à partir des paramètres choisis (20 véhicules via core_multiSpawn.createGroup ou copie depuis réglages/monde).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:149
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:generateGroup() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:24
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:init() end

--- Remet self.done à false.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:105
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:onStateStarted() end

--- Remet les paramètres du mode Parameters à leurs valeurs par défaut.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:30
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:resetParams() end

--- Ajoute ou retire les paires de pins model_i / config_i (mode Custom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:109
---@param old integer ancien nombre de pins
---@param new integer nouveau nombre de pins
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:updatePins(old, new) end

--- Une seule fois par exécution : génère le groupe (generateGroup ou buildGroup) et le publie sur group.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:192
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:work() end

