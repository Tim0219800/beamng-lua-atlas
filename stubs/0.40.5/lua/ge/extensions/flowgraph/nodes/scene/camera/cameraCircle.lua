---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_cameraCircle_C
local flowgraph_nodes_scene_camera_cameraCircle_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:28
function flowgraph_nodes_scene_camera_cameraCircle_C:_executionStarted() end

--- Remet centre, decalage, position camera et angle a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:32
function flowgraph_nodes_scene_camera_cameraCircle_C:onNodeReset() end

--- Calcule le centre, la position sur le cercle, la hauteur (avec lissage 5 % si snapHeight), oriente la camera vers le centre (core_camera.setPosRot) puis incremente l'angle de dtReal * speed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:54
function flowgraph_nodes_scene_camera_cameraCircle_C:work() end

--- Passe en camera libre et fixe l'angle de depart (+180 degres, plus l'orientation du vehicule si vehId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua:39
function flowgraph_nodes_scene_camera_cameraCircle_C:workOnce() end

