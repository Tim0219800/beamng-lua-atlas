---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_customLuaCommand_C
local flowgraph_nodes_scene_customLuaCommand_C = {}

--- Remet le pin return a nil au demarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:25
function flowgraph_nodes_scene_customLuaCommand_C:_executionStarted() end

--- Compatibilite : convertit l'ancien data.func en pin code en dur 'func' de type string.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:38
---@param data any donnees sauvegardees du noeud
function flowgraph_nodes_scene_customLuaCommand_C:_onDeserialized(data) end

--- Desactive le vidage des pins de sortie au demarrage (clearOutPinsOnStart = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:21
function flowgraph_nodes_scene_customLuaCommand_C:init() end

--- Compile et execute le texte du pin func ; ecrit flow = succes du pcall et return = valeur retournee.
---Source : lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:29
function flowgraph_nodes_scene_customLuaCommand_C:workOnce() end

