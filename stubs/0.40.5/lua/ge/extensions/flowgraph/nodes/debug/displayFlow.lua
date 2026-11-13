---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_displayFlow_C
local flowgraph_nodes_debug_displayFlow_C = {}

--- Éditeur : dessine la case cochée (active/inactive) et cumule le temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:33
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_displayFlow_C:drawMiddle(builder, style) end

--- Éditeur : infobulle « N fps ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:44
function flowgraph_nodes_debug_displayFlow_C:drawTooltip() end

--- Initialise lastTime, time et lastUsedFrame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:21
function flowgraph_nodes_debug_displayFlow_C:init() end

--- Mémorise le temps écoulé depuis le dernier flux et le numéro de frame courant (mgr.frameCount).
---Source : lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua:27
function flowgraph_nodes_debug_displayFlow_C:work() end

