---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_locationsByTag_C
local flowgraph_nodes_gameplay_sites_locationsByTag_C = {}

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:129
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_sites_locationsByTag_C:_onDeserialized(res) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:125
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_sites_locationsByTag_C:_onSerialize(res) end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:37
function flowgraph_nodes_gameplay_sites_locationsByTag_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:34
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gameplay_sites_locationsByTag_C:init(mgr, ...) end

--- Ajoute ou retire les paires de pins found_i / loc_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:53
---@param old integer ancien nombre de pins
---@param new integer nouveau nombre de pins
function flowgraph_nodes_gameplay_sites_locationsByTag_C:updatePins(old, new) end

--- Construit la liste des locations (par tag ou par rayon), la mélange, garde les premières, les trie par distance, puis remplit found_i, loc_i et count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:77
function flowgraph_nodes_gameplay_sites_locationsByTag_C:workOnce() end

