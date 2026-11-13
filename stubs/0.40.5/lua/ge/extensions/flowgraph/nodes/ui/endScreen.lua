---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_endScreen_C
local flowgraph_nodes_ui_endScreen_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:167
function flowgraph_nodes_ui_endScreen_C:_afterTrigger() end

--- Remet tous les pins de sortie à false et open = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:63
function flowgraph_nodes_ui_endScreen_C:_executionStarted() end

--- Ferme l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:163
function flowgraph_nodes_ui_endScreen_C:_executionStopped() end

--- Restaure l'état du nœud depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:158
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_ui_endScreen_C:_onDeserialized(nodeData) end

--- Écrit l'état du nœud dans la table de sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:154
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_endScreen_C:_onSerialize(res) end

--- Appelé par l'UI quand un bouton est cliqué ; met à true le pin de sortie portant le nom du bouton (les autres à false) et ferme le dialogue.
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:173
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_endScreen_C:buttonPushed(action) end

--- Si l'écran est ouvert, navigue vers l'état UI 'play' et open = false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:193
function flowgraph_nodes_ui_endScreen_C:closeDialogue() end

--- Édition de la liste des boutons (renommer, supprimer si texte vide, add, rem).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:70
function flowgraph_nodes_ui_endScreen_C:drawCustomProperties() end

--- Renvoie la commande Lua qui retrouve ce nœud et appelle buttonPushed(action).
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:182
---@param action string Nom du bouton ou du pin de sortie activé.
function flowgraph_nodes_ui_endScreen_C:getCmd(action) end

--- Initialise options, oldOptions, open = false et data.includeRetryButton = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:43
function flowgraph_nodes_ui_endScreen_C:init() end

--- Hook : ferme l'écran à la fin du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:203
function flowgraph_nodes_ui_endScreen_C:onClientEndMission() end

--- Ferme l'écran et remet les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:323
function flowgraph_nodes_ui_endScreen_C:onNodeReset() end

--- Hook : ferme l'écran si le bouton Retry est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:186
function flowgraph_nodes_ui_endScreen_C:onResetGameplay() end

--- Assemble boutons, texte, temps, médaille, points, stats, portraits et données de mission puis navigue vers 'scenario.end'.
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:207
function flowgraph_nodes_ui_endScreen_C:openDialogue() end

--- Crée l'option « cont » (Continuer), les pins correspondants et les modèles du pin medal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:51
function flowgraph_nodes_ui_endScreen_C:postInit() end

--- Recrée les pins des boutons selon options en rétablissant les liens existants.
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:105
function flowgraph_nodes_ui_endScreen_C:updateButtons() end

--- Ouvre l'écran de fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endScreen.lua:330
function flowgraph_nodes_ui_endScreen_C:workOnce() end

