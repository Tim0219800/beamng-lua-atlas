---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_imgui_imDialogue_C
local flowgraph_nodes_ui_imgui_imDialogue_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:127
function flowgraph_nodes_ui_imgui_imDialogue_C:_executionStopped() end

--- Restaure options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:122
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_ui_imgui_imDialogue_C:_onDeserialized(nodeData) end

--- Sauvegarde options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:118
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_imgui_imDialogue_C:_onSerialize(res) end

--- Édition de la liste des boutons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:35
function flowgraph_nodes_ui_imgui_imDialogue_C:drawCustomProperties() end

--- Options par défaut {accept, decline}, wrapSize = 500.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:26
function flowgraph_nodes_ui_imgui_imDialogue_C:init() end

--- Ferme la fenêtre (open = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:135
function flowgraph_nodes_ui_imgui_imDialogue_C:onNodeReset() end

--- Crée les pins des options.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:31
function flowgraph_nodes_ui_imgui_imDialogue_C:postInit() end

--- Recrée les pins des options.
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:72
function flowgraph_nodes_ui_imgui_imDialogue_C:updateButtons() end

--- Si ouvert, dessine la fenêtre, le texte et les boutons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:139
function flowgraph_nodes_ui_imgui_imDialogue_C:work() end

--- Ouvre la fenêtre (open = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/imgui/imDialogue.lua:131
function flowgraph_nodes_ui_imgui_imDialogue_C:workOnce() end

