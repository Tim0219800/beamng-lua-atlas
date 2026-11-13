---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeSequence_C
local flowgraph_nodes_ui_fadeSequence_C = {}

--- Réinitialise l'état et le pin faded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:47
function flowgraph_nodes_ui_fadeSequence_C:_executionStopped() end

--- État de durée 'inactive', fadedTriggered = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:33
function flowgraph_nodes_ui_fadeSequence_C:init() end

--- Réinitialise l'état et le pin faded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:54
function flowgraph_nodes_ui_fadeSequence_C:onNodeReset() end

--- Hook : état 1 -> faded = true ; état 3 -> terminé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:73
---@param state integer État du fondu d'écran (1 = noir atteint, 3 = fondu terminé).
function flowgraph_nodes_ui_fadeSequence_C:onScreenFadeState(state) end

--- Modèles de durée à 0.75 pour startDuration et endDuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:38
function flowgraph_nodes_ui_fadeSequence_C:postInit() end

--- Transforme 'faded' en impulsion (remis à false à la frame suivante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:65
function flowgraph_nodes_ui_fadeSequence_C:work() end

--- Démarre la séquence avec les trois durées (défauts 1, 0, 1 si nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:60
function flowgraph_nodes_ui_fadeSequence_C:workOnce() end

