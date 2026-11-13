---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud, instanciée par _flowgraph_createNode(C).
---@class flowgraph_nodes_gameplay_isWalking_C
local flowgraph_nodes_gameplay_isWalking_C = {}

--- Appelé au démarrage du graphe ; enregistre l'état de marche actuel dans self.prevWalk.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:23
function flowgraph_nodes_gameplay_isWalking_C:_executionStarted() end

--- Dessine dans l'éditeur une icône de marcheur, verte si le joueur marche, grisée sinon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:35
---@param builder table Constructeur de nœud imgui de l'éditeur.
---@param style table Style du nœud.
function flowgraph_nodes_gameplay_isWalking_C:drawMiddle(builder, style) end

--- Chaque frame : lit gameplay_walk.isWalking() et renseigne les pins walking, nonWalking, enteredWalking, exitedWalking.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:27
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_isWalking_C:work(args) end

