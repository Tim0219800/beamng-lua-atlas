---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/idByName.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_idByName_C
local flowgraph_nodes_scene_idByName_C = {}

--- Oublie l'id memorise au demarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:56
function flowgraph_nodes_scene_idByName_C:_executionStarted() end

--- Affiche le nom et l'id courants au milieu du noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:60
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_idByName_C:drawMiddle(builder, style) end

--- Nom vide et objID nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:24
function flowgraph_nodes_scene_idByName_C:init() end

--- Hook de fin de mission : oublie l'id memorise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:48
function flowgraph_nodes_scene_idByName_C:onClientEndMission() end

--- Hook de debut de mission : oublie l'id memorise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:52
function flowgraph_nodes_scene_idByName_C:onClientStartMission() end

--- Utilise le pin name s'il est branche, cherche l'objet et ecrit objID et exist.
---Source : lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:29
function flowgraph_nodes_scene_idByName_C:work() end

