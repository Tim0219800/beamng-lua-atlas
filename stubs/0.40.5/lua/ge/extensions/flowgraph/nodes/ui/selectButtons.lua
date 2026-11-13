---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_selectButtons_C
local flowgraph_nodes_ui_selectButtons_C = {}

--- Ferme le dialogue si le flux d'entrée est false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:164
function flowgraph_nodes_ui_selectButtons_C:_afterTrigger() end

--- Remet les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:39
function flowgraph_nodes_ui_selectButtons_C:_executionStarted() end

--- Ferme le dialogue s'il est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:158
function flowgraph_nodes_ui_selectButtons_C:_executionStopped() end

--- Restaure options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:147
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_ui_selectButtons_C:_onDeserialized(nodeData) end

--- Sauvegarde options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:143
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_selectButtons_C:_onSerialize(res) end

--- Met à true la sortie du bouton cliqué (les autres à false) et ferme le dialogue.
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:169
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_selectButtons_C:buttonPushed(action) end

--- Ferme le dialogue (ui_missionInfo) et réaffiche les apps si masquées.
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:182
function flowgraph_nodes_ui_selectButtons_C:closeDialogue() end

--- Édition de la liste des boutons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:45
function flowgraph_nodes_ui_selectButtons_C:drawCustomProperties() end

--- Renvoie la commande Lua qui rappelle buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:178
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_selectButtons_C:getCmd(action) end

--- Options {accept, decline}, count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:27
function flowgraph_nodes_ui_selectButtons_C:init() end

--- Ferme le dialogue et remet les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:209
function flowgraph_nodes_ui_selectButtons_C:onNodeReset() end

--- Construit les boutons et ouvre le dialogue ; masque les apps si hideApps.
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:192
function flowgraph_nodes_ui_selectButtons_C:openDialogue() end

--- Crée les pins des options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:35
function flowgraph_nodes_ui_selectButtons_C:postInit() end

--- Recrée les pins par option en rétablissant les liens.
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:94
function flowgraph_nodes_ui_selectButtons_C:updateButtons() end

--- Ouvre le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/selectButtons.lua:218
function flowgraph_nodes_ui_selectButtons_C:workOnce() end

