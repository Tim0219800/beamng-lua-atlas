---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_imVehicleSelect_C
local flowgraph_nodes_ui_imgui_imVehicleSelect_C = {}

--- Crée l'utilitaire de sélection avec les options data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:33
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:_executionStarted() end

--- Dessine la fenêtre « Vehicle Select » (widget, boutons Select et Reset) et met à jour les sorties.
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:48
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:displayWindow() end

--- Zone centrale vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:44
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:drawMiddle(builder, style) end

--- Options data par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:27
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:init() end

--- Ferme la fenêtre et remet selected à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:79
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:onNodeReset() end

--- Affiche la fenêtre si ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:90
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:work() end

--- Ouvre la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imVehicleSelect.lua:85
function flowgraph_nodes_ui_imgui_imVehicleSelect_C:workOnce() end

