---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_elemental_imBegin_C
local flowgraph_nodes_ui_imgui_elemental_imBegin_C = {}

--- done = false et sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua:33
function flowgraph_nodes_ui_imgui_elemental_imBegin_C:_executionStarted() end

--- done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua:27
function flowgraph_nodes_ui_imgui_elemental_imBegin_C:init() end

--- Fixe taille/position (une seule fois, via l'ancre) puis appelle im.Begin et écrit wasClosed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imBegin.lua:41
function flowgraph_nodes_ui_imgui_elemental_imBegin_C:work() end

