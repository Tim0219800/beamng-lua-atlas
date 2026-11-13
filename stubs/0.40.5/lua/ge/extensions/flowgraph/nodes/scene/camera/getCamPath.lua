---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_getCamPath_C
local flowgraph_nodes_scene_camera_getCamPath_C = {}

--- Remet done et completedFlag a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:35
function flowgraph_nodes_scene_camera_getCamPath_C:_executionStarted() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:40
function flowgraph_nodes_scene_camera_getCamPath_C:_executionStopped() end

--- Dessine le milieu du noeud (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:79
---@param builder any
---@param style any
function flowgraph_nodes_scene_camera_getCamPath_C:drawMiddle(builder, style) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:32
function flowgraph_nodes_scene_camera_getCamPath_C:init() end

--- Sur reset, repart de zero. flow suit l'entree. Avec du flux, determine si la trajectoire est active, puis calcule inactive/complete/completed/incomplete/duration via camera:isPathComplete et getPathDuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/getCamPath.lua:43
function flowgraph_nodes_scene_camera_getCamPath_C:work() end

