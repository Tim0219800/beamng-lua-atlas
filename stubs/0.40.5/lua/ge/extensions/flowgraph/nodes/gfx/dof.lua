---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gfx/dof.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gfx_dof_C
local flowgraph_nodes_gfx_dof_C = {}

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:61
function flowgraph_nodes_gfx_dof_C:_executionStopped() end

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:57
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gfx_dof_C:init(mgr, ...) end

--- Remet le timer et le mode à zéro et restaure les variables DOF sauvegardées.
---Source : lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:33
function flowgraph_nodes_gfx_dof_C:reset() end

--- Appelle DOFPostEffect.updateDOFSettings() si l'effet existe.
---Source : lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:26
function flowgraph_nodes_gfx_dof_C:updateSettings() end

--- Détecte le mode (in/out), sauvegarde les réglages DOF puis fait avancer le fondu avec dtSim ; met blurDone à true à la fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gfx/dof.lua:65
function flowgraph_nodes_gfx_dof_C:work() end

