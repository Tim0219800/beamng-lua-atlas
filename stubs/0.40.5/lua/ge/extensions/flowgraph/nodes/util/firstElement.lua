---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/firstElement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_firstElement_C
local flowgraph_nodes_util_firstElement_C = {}

--- Met oldPos à nil (champ inutilisé ensuite).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:23
function flowgraph_nodes_util_firstElement_C:_executionStarted() end

--- Renvoie table[1] du pin d'entrée table (l'argument n'est pas utilisé).
---Source : lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:27
---@param table table Ignoré : la fonction relit le pin d'entrée.
function flowgraph_nodes_util_firstElement_C:getFirstElement(table) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:20
---@param mgr any
function flowgraph_nodes_util_firstElement_C:init(mgr) end

--- Écrit le premier élément dans firstElement si la table est connectée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:33
function flowgraph_nodes_util_firstElement_C:work() end

