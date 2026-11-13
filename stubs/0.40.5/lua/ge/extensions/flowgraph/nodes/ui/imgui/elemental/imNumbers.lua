---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_elemental_imNumbers_C
local flowgraph_nodes_ui_imgui_elemental_imNumbers_C = {}

--- Efface les sorties et la valeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:59
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_executionStarted() end

--- Restaure le mode (défaut 'Int').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:120
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_onDeserialized(nodeData) end

--- Sauvegarde le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:116
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:_onSerialize(res) end

--- Combo du mode d'édition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:45
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:drawCustomProperties() end

--- Liste des modes et mode = 'Int'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:33
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:init() end

--- Dessine le widget du mode choisi, borne la valeur et écrit value/changed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imNumbers.lua:66
function flowgraph_nodes_ui_imgui_elemental_imNumbers_C:work() end

