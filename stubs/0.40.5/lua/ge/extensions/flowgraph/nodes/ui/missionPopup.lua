---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionPopup_C
local flowgraph_nodes_ui_missionPopup_C = {}

--- Remet sorties et état à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:30
function flowgraph_nodes_ui_missionPopup_C:_executionStarted() end

--- Ferme le popup s'il est ouvert et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:50
function flowgraph_nodes_ui_missionPopup_C:_executionStopped() end

--- Ferme le popup tutoriel si ouvert.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:67
function flowgraph_nodes_ui_missionPopup_C:closeDialogue() end

--- Renvoie l'identifiant unique du popup (manager, graphe, nœud).
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:63
function flowgraph_nodes_ui_missionPopup_C:getPopupId() end

--- open = false, done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:25
function flowgraph_nodes_ui_missionPopup_C:init() end

--- Hook : réinitialise open et _active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:103
function flowgraph_nodes_ui_missionPopup_C:onClientEndMission() end

--- Hook d'entrée filtrée ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:99
---@param devName string Nom du périphérique d'entrée.
---@param action string Nom du bouton ou du pin de sortie activé.
---@param value number Valeur de l'entrée.
function flowgraph_nodes_ui_missionPopup_C:onFilteredInputChanged(devName, action, value) end

--- Hook : popup fermé (id) ; si c'est celui de ce nœud, met le flux de sortie à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:91
---@param id string Identifiant du popup fermé.
function flowgraph_nodes_ui_missionPopup_C:onIntroPopupCareerClosed(id) end

--- Ouvre le popup avec titre, texte et libellé du bouton.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:75
function flowgraph_nodes_ui_missionPopup_C:openDialogue() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:39
function flowgraph_nodes_ui_missionPopup_C:postInit() end

--- Remet done, open et _active à false.
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:57
function flowgraph_nodes_ui_missionPopup_C:reset() end

--- Gère le reset ; ouvre le popup quand le flux d'entrée est actif et qu'il n'est pas déjà ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionPopup.lua:108
function flowgraph_nodes_ui_missionPopup_C:work() end

