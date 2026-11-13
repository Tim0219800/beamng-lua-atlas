---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_worldEditorOpen_C
local flowgraph_nodes_util_worldEditorOpen_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:29
function flowgraph_nodes_util_worldEditorOpen_C:_executionStarted() end

--- Remet l'état précédent à « none ».
---Source : lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:25
function flowgraph_nodes_util_worldEditorOpen_C:reset() end

--- Écrit open/close/openOrClosed selon editor.active et émet une impulsion onOpened ou onClosed quand l'état change par rapport à la frame précédente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:33
function flowgraph_nodes_util_worldEditorOpen_C:work() end

