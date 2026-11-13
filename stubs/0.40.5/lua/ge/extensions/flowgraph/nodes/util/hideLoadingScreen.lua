---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_hideLoadingScreen_C
local flowgraph_nodes_util_hideLoadingScreen_C = {}

--- Désactive clearOutPinsOnStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:20
function flowgraph_nodes_util_hideLoadingScreen_C:init() end

--- Met finished à true dès que modules.level n'est plus en chargement de niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:34
function flowgraph_nodes_util_hideLoadingScreen_C:work() end

--- Met finished à false, appelle modules.level:finishedLevelLoading() et server.fadeoutLoadingScreen(true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/hideLoadingScreen.lua:24
function flowgraph_nodes_util_hideLoadingScreen_C:workOnce() end

