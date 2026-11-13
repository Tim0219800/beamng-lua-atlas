---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_threeElementSelect_C
local flowgraph_nodes_ui_threeElementSelect_C = {}

--- Sorties à false, _active = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:44
function flowgraph_nodes_ui_threeElementSelect_C:_executionStarted() end

--- Ferme et réinitialise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:63
function flowgraph_nodes_ui_threeElementSelect_C:_executionStopped() end

--- Met à true la sortie pick choisie, les autres à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:76
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_threeElementSelect_C:buttonPushed(action) end

--- Marque l'écran comme fermé.
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:86
function flowgraph_nodes_ui_threeElementSelect_C:closeDialogue() end

--- done = true.
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:114
function flowgraph_nodes_ui_threeElementSelect_C:closed() end

--- Renvoie la commande Lua qui rappelle buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:82
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_threeElementSelect_C:getCmd(action) end

--- open = false, done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:39
function flowgraph_nodes_ui_threeElementSelect_C:init() end

--- Hook : réinitialise open et _active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:127
function flowgraph_nodes_ui_threeElementSelect_C:onClientEndMission() end

--- Construit les trois éléments (image, nom, description, code du bouton) et navigue vers 'menu.threeElementSelect'.
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:91
function flowgraph_nodes_ui_threeElementSelect_C:openDialogue() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:53
function flowgraph_nodes_ui_threeElementSelect_C:postInit() end

--- Remet done, open et _active à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:70
function flowgraph_nodes_ui_threeElementSelect_C:reset() end

--- Ferme l'écran puis écrit pinOut.flow (voir notes).
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:120
function flowgraph_nodes_ui_threeElementSelect_C:started() end

--- Gère reset ; ouvre l'écran quand le flux d'entrée est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/threeElementSelect.lua:132
function flowgraph_nodes_ui_threeElementSelect_C:work() end

