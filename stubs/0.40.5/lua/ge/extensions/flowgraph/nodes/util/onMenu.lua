---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/onMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_onMenu_C
local flowgraph_nodes_util_onMenu_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:29
function flowgraph_nodes_util_onMenu_C:_executionStarted() end

--- Remet l'état précédent à « none » : la prochaine frame émettra une impulsion.
---Source : lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:25
function flowgraph_nodes_util_onMenu_C:reset() end

--- Calcule l'état ouvert/fermé et écrit open, close, openOrClosed ; émet l'impulsion onOpened ou onClosed au changement d'état, puis les remet à false à la frame suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:33
function flowgraph_nodes_util_onMenu_C:work() end

