---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeFromBlack_C
local flowgraph_nodes_ui_fadeFromBlack_C = {}

--- Remet l'état 'inactive' et isFadeScreenActive = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:38
function flowgraph_nodes_ui_fadeFromBlack_C:_executionStopped() end

--- État de durée 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:28
function flowgraph_nodes_ui_fadeFromBlack_C:init() end

--- Remet l'état 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:44
function flowgraph_nodes_ui_fadeFromBlack_C:onNodeReset() end

--- Hook appelé par ui_fadeScreen avec l'état du fondu ; l'état 3 termine le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:63
---@param state integer État du fondu d'écran (1 = noir atteint, 3 = fondu terminé).
function flowgraph_nodes_ui_fadeFromBlack_C:onScreenFadeState(state) end

--- Modèle de la durée : 0.75 (durée par défaut des fondus de mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:32
function flowgraph_nodes_ui_fadeFromBlack_C:postInit() end

--- Lance le fondu depuis le noir (ou termine le chargement) et met à jour l'état de durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:48
function flowgraph_nodes_ui_fadeFromBlack_C:workOnce() end

