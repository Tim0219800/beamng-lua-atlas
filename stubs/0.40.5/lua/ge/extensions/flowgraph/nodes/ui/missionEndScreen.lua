---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionEndScreen_C
local flowgraph_nodes_ui_missionEndScreen_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:153
function flowgraph_nodes_ui_missionEndScreen_C:_afterTrigger() end

--- Sorties à false, open = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:43
function flowgraph_nodes_ui_missionEndScreen_C:_executionStarted() end

--- Ferme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:149
function flowgraph_nodes_ui_missionEndScreen_C:_executionStopped() end

--- Restaure options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:144
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_ui_missionEndScreen_C:_onDeserialized(nodeData) end

--- Sauvegarde options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:140
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_missionEndScreen_C:_onSerialize(res) end

--- Met à true le pin de sortie du bouton cliqué (sans remettre les autres à false) et ferme l'écran.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:159
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_missionEndScreen_C:buttonPushed(action) end

--- Si ouvert, navigue vers 'play'.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:181
function flowgraph_nodes_ui_missionEndScreen_C:closeDialogue() end

--- Édition de la liste des boutons personnalisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:50
function flowgraph_nodes_ui_missionEndScreen_C:drawCustomProperties() end

--- Renvoie la commande Lua qui rappelle buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:169
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_missionEndScreen_C:getCmd(action) end

--- Options vides et includeRetryButton = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:31
function flowgraph_nodes_ui_missionEndScreen_C:init() end

--- Hook : ferme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:191
function flowgraph_nodes_ui_missionEndScreen_C:onClientEndMission() end

--- Ferme l'écran et remet les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:304
function flowgraph_nodes_ui_missionEndScreen_C:onNodeReset() end

--- Hook : met retry à true et ferme l'écran si Retry est activé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:173
function flowgraph_nodes_ui_missionEndScreen_C:onResetGameplay() end

--- Construit la liste de boutons et les données de mission, puis navigue vers 'scenario.end'.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:195
function flowgraph_nodes_ui_missionEndScreen_C:openDialogue() end

--- Crée les pins des options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:38
function flowgraph_nodes_ui_missionEndScreen_C:postInit() end

--- Recrée les pins (texte, actif, sortie) par option en rétablissant les liens.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:85
function flowgraph_nodes_ui_missionEndScreen_C:updateButtons() end

--- Ouvre l'écran de fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionEndScreen.lua:311
function flowgraph_nodes_ui_missionEndScreen_C:workOnce() end

