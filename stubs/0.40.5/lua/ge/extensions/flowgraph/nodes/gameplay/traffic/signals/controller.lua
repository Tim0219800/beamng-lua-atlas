---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_signals_controller_C
local flowgraph_nodes_gameplay_traffic_signals_controller_C = {}

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:74
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_traffic_signals_controller_C:_onDeserialized(res) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:70
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_traffic_signals_controller_C:_onSerialize(res) end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:32
function flowgraph_nodes_gameplay_traffic_signals_controller_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:24
function flowgraph_nodes_gameplay_traffic_signals_controller_C:init() end

--- Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:28
function flowgraph_nodes_gameplay_traffic_signals_controller_C:postInit() end

--- Ajoute ou retire les pins stateName_i / stateDuration_i et supprime leurs liens.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:50
---@param old integer ancien nombre de pins
---@param new integer nouveau nombre de pins
function flowgraph_nodes_gameplay_traffic_signals_controller_C:updatePins(old, new) end

--- Recopie type, nombre d'états, durée totale et nom/durée de chaque état sur les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:79
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_traffic_signals_controller_C:work(args) end

