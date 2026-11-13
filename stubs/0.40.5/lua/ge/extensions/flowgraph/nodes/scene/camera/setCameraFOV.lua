---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_setCameraFOV_C
local flowgraph_nodes_scene_camera_setCameraFOV_C = {}

--- Appele au demarrage du graphe : memorise le FOV actuel dans self._storedFov.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:30
function flowgraph_nodes_scene_camera_setCameraFOV_C:_executionStarted() end

--- Appele a l'arret du graphe : restaure le FOV memorise puis l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:33
function flowgraph_nodes_scene_camera_setCameraFOV_C:_executionStopped() end

--- Dessine la valeur du FOV (2 decimales) au milieu du noeud dans l'editeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:39
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_camera_setCameraFOV_C:drawMiddle(builder, style) end

--- Force la camera libre (commands.setFreeCamera) si besoin, puis applique le FOV du pin value via core_camera.setFOV(0, ...).
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraFOV.lua:23
function flowgraph_nodes_scene_camera_setCameraFOV_C:work() end

