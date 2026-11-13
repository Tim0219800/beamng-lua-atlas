---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_onBigmapStateChange_C
local flowgraph_nodes_ui_onBigmapStateChange_C = {}

--- Initialise les drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:24
function flowgraph_nodes_ui_onBigmapStateChange_C:init() end

--- Hook : fin de l'ouverture de la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:45
function flowgraph_nodes_ui_onBigmapStateChange_C:onActivateBigMapCallback() end

--- Hook : début de transition ; activate vrai = entrée, faux = sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:40
---@param activate boolean true si la grande carte s'ouvre, false si elle se ferme.
---@param esc boolean Fermeture par la touche Échap (déduit du code, non utilisé).
function flowgraph_nodes_ui_onBigmapStateChange_C:onBigmapStartTransition(activate, esc) end

--- Hook : fin de la fermeture de la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:48
function flowgraph_nodes_ui_onBigmapStateChange_C:onDeactivateBigMapCallback() end

--- Remet les impulsions à false et applique les drapeaux reçus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:29
---@param args any Argument éventuel (non utilisé).
function flowgraph_nodes_ui_onBigmapStateChange_C:work(args) end

