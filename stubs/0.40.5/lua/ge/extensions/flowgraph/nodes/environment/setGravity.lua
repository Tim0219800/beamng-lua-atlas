---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setGravity_C
local flowgraph_nodes_environment_setGravity_C = {}

--- Mémorise la gravité actuelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:23
function flowgraph_nodes_environment_setGravity_C:_executionStarted() end

--- Restaure la gravité mémorisée si data.restoreGravity est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:26
function flowgraph_nodes_environment_setGravity_C:_executionStopped() end

--- Définit data.restoreGravity = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:19
---@param mgr table Gestionnaire du flowgraph
function flowgraph_nodes_environment_setGravity_C:init(mgr) end

--- En mode repeat, réapplique la gravité à chaque frame seulement si le pin value est utilisé (branché).
---Source : lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:37
function flowgraph_nodes_environment_setGravity_C:work() end

--- Applique la gravité du pin value une fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setGravity.lua:33
function flowgraph_nodes_environment_setGravity_C:workOnce() end

