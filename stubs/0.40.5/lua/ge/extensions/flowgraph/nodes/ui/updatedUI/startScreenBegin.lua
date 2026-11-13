---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_updatedUI_startScreenBegin_C
local flowgraph_nodes_ui_updatedUI_startScreenBegin_C = {}

--- Remet à zéro started/done/built et l'auto-skip au démarrage du projet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:25
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:_executionStarted() end

--- Appelé à l'arrêt du projet ; appelle closeDialogue (sans effet réel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:34
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:_executionStopped() end

--- Ne fait rien en pratique : la navigation vers « play » est commentée.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:42
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:closeDialogue() end

--- Hook de fin de mission côté client ; appelle closeDialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:38
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:onClientEndMission() end

--- Appelé quand le nœud est réinitialisé (pin reset ou reset du graphe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:48
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:onNodeReset() end

--- Simule le clic sur Start : met done=true, émet le hook onUIStartButtonClicked, navigue vers l'écran « play » et efface modules.ui.uiLayout.
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:107
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:startFromUi() end

--- Gère reset, construit l'écran au premier flow, active build une frame, publie done sur le pin flow de sortie, déclenche startFromUi si triggerStart est reçu, et applique l'auto-skip (startingOptions.autoSkipStartScreen, après 2 s de temps réel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:60
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:work() end

--- Variante exécutée une seule fois par le moteur flowgraph (corps vide ici).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenBegin.lua:57
function flowgraph_nodes_ui_updatedUI_startScreenBegin_C:workOnce() end

