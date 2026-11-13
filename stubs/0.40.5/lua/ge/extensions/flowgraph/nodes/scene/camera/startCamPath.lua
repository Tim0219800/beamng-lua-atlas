---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_startCamPath_C
local flowgraph_nodes_scene_camera_startCamPath_C = {}

--- Zone centrale du noeud (rien d'affiche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:49
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_camera_startCamPath_C:drawMiddle(builder, style) end

--- Rien a initialiser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:24
function flowgraph_nodes_scene_camera_startCamPath_C:init() end

--- Restreint le pin pathName au selecteur de fichiers « Camera Path Files » (.camPath.json).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:27
function flowgraph_nodes_scene_camera_startCamPath_C:postInit() end

--- Retombe activated a false a la frame suivant l'activation (flag activatedFlag).
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:41
function flowgraph_nodes_scene_camera_startCamPath_C:work() end

--- Trouve le chemin (modules.camera:findPath), le demarre (startPath avec loop), ecrit id et leve l'impulsion activated.
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua:33
function flowgraph_nodes_scene_camera_startCamPath_C:workOnce() end

