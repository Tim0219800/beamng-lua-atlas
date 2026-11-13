---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_edgeDetect_C
local flowgraph_nodes_logic_edgeDetect_C = {}

--- Affiche la derniere valeur memorisee (dumpsz).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua:58
---@param builder any
---@param style any
function flowgraph_nodes_logic_edgeDetect_C:drawMiddle(builder, style) end

--- Compare signal a lastSignal (nombres avec seuil, tables element par element, autres types par egalite), met pinOut.flow a true en cas de changement, puis memorise le signal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua:33
function flowgraph_nodes_logic_edgeDetect_C:work() end

