---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_cameraPath_C
local flowgraph_nodes_scene_camera_cameraPath_C = {}

--- Remet activatedFlag et l'etat de duree 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:45
function flowgraph_nodes_scene_camera_cameraPath_C:_executionStarted() end

--- Migre l'ancien champ data.loop vers le pin code en dur 'loop'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:89
---@param data any
function flowgraph_nodes_scene_camera_cameraPath_C:_onDeserialized(data) end

--- Dessine le milieu du noeud (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:86
---@param builder any
---@param style any
function flowgraph_nodes_scene_camera_cameraPath_C:drawMiddle(builder, style) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:36
function flowgraph_nodes_scene_camera_cameraPath_C:init() end

--- Meme remise a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:50
function flowgraph_nodes_scene_camera_cameraPath_C:onNodeReset() end

--- Restreint le pin pathName aux fichiers '.camPath.json'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:39
function flowgraph_nodes_scene_camera_cameraPath_C:postInit() end

--- Pendant l'etat started : gere l'impulsion activated, met inactive/duration selon que la trajectoire est active, passe a 'finished' quand isPathComplete.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:64
function flowgraph_nodes_scene_camera_cameraPath_C:work() end

--- Trouve la trajectoire (camera:findPath), la demarre (startPath), ecrit id, activated=true et passe a l'etat 'started'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua:55
function flowgraph_nodes_scene_camera_cameraPath_C:workOnce() end

