---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_multiFlow_C
local flowgraph_nodes_debug_multiFlow_C = {}

--- Éditeur : dessine quatre cases cochées selon l'état des pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua:37
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_multiFlow_C:drawMiddle(builder, style) end

--- Met data.logOnWork à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua:24
function flowgraph_nodes_debug_multiFlow_C:init() end

--- Si data.logOnWork, imprime l'état des quatre entrées.
---Source : lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua:28
function flowgraph_nodes_debug_multiFlow_C:work() end

