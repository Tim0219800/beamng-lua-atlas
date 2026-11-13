---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/foreach.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_macro_foreach_C
local flowgraph_nodes_macro_foreach_C = {}

--- Si destroyTargetOnStop, arrete et supprime les managers crees ; vide targets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:39
function flowgraph_nodes_macro_foreach_C:_executionStopped() end

--- data.destroyTargetOnStop=true, targets=nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:28
---@param mgr any
---@param ... any
function flowgraph_nodes_macro_foreach_C:init(mgr, ...) end

--- Restreint le pin elementFile aux fichiers '.flow.json'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:33
function flowgraph_nodes_macro_foreach_C:postInit() end

--- Au premier flux, cree et demarre un gestionnaire par element de la table ; self.done evite de recommencer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:52
function flowgraph_nodes_macro_foreach_C:work() end

