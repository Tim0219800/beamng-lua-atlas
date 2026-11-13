---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeToBlack_C
local flowgraph_nodes_ui_fadeToBlack_C = {}

--- Remet l'état 'inactive' et isFadeScreenActive = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:38
function flowgraph_nodes_ui_fadeToBlack_C:_executionStopped() end

--- État de durée 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:28
function flowgraph_nodes_ui_fadeToBlack_C:init() end

--- Remet l'état 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:44
function flowgraph_nodes_ui_fadeToBlack_C:onNodeReset() end

--- Hook : état 1 (noir atteint) -> terminé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:58
---@param state integer État du fondu d'écran (1 = noir atteint, 3 = fondu terminé).
function flowgraph_nodes_ui_fadeToBlack_C:onScreenFadeState(state) end

--- Modèle de durée à 0.75.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:32
function flowgraph_nodes_ui_fadeToBlack_C:postInit() end

--- Lance ui_fadeScreen.fadeToBlack (sauf si déjà noir).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:48
function flowgraph_nodes_ui_fadeToBlack_C:workOnce() end

