---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/once.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_once_C
local flowgraph_nodes_logic_once_C = {}

--- Rearme le noeud (ready = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/once.lua:27
function flowgraph_nodes_logic_once_C:_executionStopped() end

--- ready = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/once.lua:23
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_once_C:init(mgr, ...) end

--- Si reset : rearme et sortie false. Sinon, si pret et flux d'entree : sortie true une fois puis ready=false ; dans tous les autres cas sortie false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/once.lua:31
---@param args any non utilise
function flowgraph_nodes_logic_once_C:work(args) end

