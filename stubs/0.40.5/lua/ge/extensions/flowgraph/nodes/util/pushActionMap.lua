---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_pushActionMap_C
local flowgraph_nodes_util_pushActionMap_C = {}

--- Retire l'action map poussée (popActionMap) et oublie son nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:25
function flowgraph_nodes_util_pushActionMap_C:_executionStopped() end

--- Affiche « <nom> pushed. » dans le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:37
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_pushActionMap_C:drawMiddle(builder, style) end

--- Appelle _executionStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:21
---@param mgr any
---@param ... any
function flowgraph_nodes_util_pushActionMap_C:init(mgr, ...) end

--- Mémorise le nom et appelle pushActionMap(name).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:32
function flowgraph_nodes_util_pushActionMap_C:workOnce() end

