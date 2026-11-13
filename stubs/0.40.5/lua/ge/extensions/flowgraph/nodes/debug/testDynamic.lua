---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_testDynamic_C
local flowgraph_nodes_debug_testDynamic_C = {}

--- Réinitialise à l'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:18
function flowgraph_nodes_debug_testDynamic_C:_executionStarted() end

--- Éditeur : barre de progression timer/5.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:28
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_testDynamic_C:drawMiddle(builder, style) end

--- Minuteur à 0 et état 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:13
---@param mgr table non utilisé
---@param ... any
function flowgraph_nodes_debug_testDynamic_C:init(mgr, ...) end

--- Réinitialise le minuteur et l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:23
function flowgraph_nodes_debug_testDynamic_C:onNodeReset() end

--- Avance le minuteur et passe à 'finished' à 5 s.
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:38
---@param args any non utilisé
function flowgraph_nodes_debug_testDynamic_C:work(args) end

--- Minuteur à 0, état 'started'.
---Source : lua/ge/extensions/flowgraph/nodes/debug/testDynamic.lua:33
function flowgraph_nodes_debug_testDynamic_C:workOnce() end

