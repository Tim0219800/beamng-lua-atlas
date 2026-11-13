---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_playerMoves_C
local flowgraph_nodes_gameplay_playerMoves_C = {}

--- Réinitialise la position initiale et msgSent au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:28
function flowgraph_nodes_gameplay_playerMoves_C:_executionStarted() end

--- Initialise initialPos à nil, msgSent à true et data.useScenarioRealtimeDisplay à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:20
function flowgraph_nodes_gameplay_playerMoves_C:init() end

--- Chaque frame : gère reset, mémorise la position initiale du véhicule, affiche/efface le message de départ et met success à vrai si le véhicule s'est déplacé de plus de 0,1 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:33
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_playerMoves_C:work(args) end

