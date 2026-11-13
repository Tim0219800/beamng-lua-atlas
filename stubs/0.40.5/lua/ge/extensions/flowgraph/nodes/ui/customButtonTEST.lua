---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_customButtonTEST_C
local flowgraph_nodes_ui_customButtonTEST_C = {}

--- open = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:25
function flowgraph_nodes_ui_customButtonTEST_C:_executionStarted() end

--- Ferme le dialogue s'il est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:29
function flowgraph_nodes_ui_customButtonTEST_C:_executionStopped() end

--- Met à true le pin de sortie correspondant au bouton cliqué, les autres à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:35
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_customButtonTEST_C:buttonPushed(action) end

--- Envoie une liste vide à 'CustomFGButtons' (cache les boutons).
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:45
function flowgraph_nodes_ui_customButtonTEST_C:closeDialogue() end

--- Construit la commande Lua rappelant buttonPushed(action) sur ce nœud.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:41
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_customButtonTEST_C:getCmd(action) end

--- open = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:21
function flowgraph_nodes_ui_customButtonTEST_C:init() end

--- Ferme le dialogue s'il est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:60
function flowgraph_nodes_ui_customButtonTEST_C:onNodeReset() end

--- Envoie le bouton « Click me! » à l'UI et met done = true.
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:49
function flowgraph_nodes_ui_customButtonTEST_C:openDialogue() end

--- Envoie le bouton « Click me! » à l'UI (guihooks 'CustomFGButtons').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/customButtonTEST.lua:66
function flowgraph_nodes_ui_customButtonTEST_C:workOnce() end

