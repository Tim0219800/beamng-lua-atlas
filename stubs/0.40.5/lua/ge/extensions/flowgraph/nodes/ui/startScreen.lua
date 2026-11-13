---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_startScreen_C
local flowgraph_nodes_ui_startScreen_C = {}

--- Sorties à false, _active = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:34
function flowgraph_nodes_ui_startScreen_C:_executionStarted() end

--- Ferme et réinitialise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:58
function flowgraph_nodes_ui_startScreen_C:_executionStopped() end

--- Convertit l'ancien format portraitMode en layout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:174
---@param data table Données sauvegardées / reçues.
function flowgraph_nodes_ui_startScreen_C:_onDeserialized(data) end

--- Met à true la sortie du bouton ; les autres à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:71
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_startScreen_C:buttonPushed(action) end

--- Marque l'écran comme fermé.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:81
function flowgraph_nodes_ui_startScreen_C:closeDialogue() end

--- done = true, _active = false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:136
function flowgraph_nodes_ui_startScreen_C:closed() end

--- Renvoie la commande Lua qui rappelle buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:77
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_startScreen_C:getCmd(action) end

--- open = false, done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:29
function flowgraph_nodes_ui_startScreen_C:init() end

--- Hook : ferme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:152
function flowgraph_nodes_ui_startScreen_C:onClientEndMission() end

--- Hook d'entrée filtrée ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:141
---@param devName string Nom du périphérique d'entrée.
---@param action string Nom du bouton ou du pin de sortie activé.
---@param value number Valeur de l'entrée.
function flowgraph_nodes_ui_startScreen_C:onFilteredInputChanged(devName, action, value) end

--- Hook : l'UI est prête ; renvoie les données mémorisées via 'ScenarioChange' si l'écran est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:130
---@param state integer État du fondu d'écran (1 = noir atteint, 3 = fondu terminé).
function flowgraph_nodes_ui_startScreen_C:onScenarioUIReady(state) end

--- Prépare les données et navigue vers 'scenario.start'.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:90
function flowgraph_nodes_ui_startScreen_C:openDialogue() end

--- Modèles de layout.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:43
function flowgraph_nodes_ui_startScreen_C:postInit() end

--- Remet done, open et _active à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:65
function flowgraph_nodes_ui_startScreen_C:reset() end

--- Ferme l'écran et met le flux de sortie à true.
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:145
function flowgraph_nodes_ui_startScreen_C:started() end

--- Gère reset ; ouvre l'écran quand le flux d'entrée est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/startScreen.lua:156
function flowgraph_nodes_ui_startScreen_C:work() end

