---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_setCameraRotation_C
local flowgraph_nodes_scene_camera_setCameraRotation_C = {}

--- Appelle core_camera.setPosRot(0, ...) avec la position courante de la camera et la rotation du noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:88
function flowgraph_nodes_scene_camera_setCameraRotation_C:SetCamera() end

--- Restaure rotation et mode ; recree le pin 'rot' si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:102
---@param nodeData any donnees sauvegardees
function flowgraph_nodes_scene_camera_setCameraRotation_C:_onDeserialized(nodeData) end

--- Sauvegarde la rotation (res.rot) et le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:97
---@param res any table de sauvegarde
function flowgraph_nodes_scene_camera_setCameraRotation_C:_onSerialize(res) end

--- Panneau de proprietes de l'editeur : choix du mode, champs x/y/z/w (normalises), boutons « Set from camera » et « Preview ». Cree/supprime le pin 'rot'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:28
function flowgraph_nodes_scene_camera_setCameraRotation_C:drawCustomProperties() end

--- Zone centrale du noeud (rien d'affiche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:84
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_camera_setCameraRotation_C:drawMiddle(builder, style) end

--- Initialise la rotation a quat(0,0,0,0), le mode a 'custom' et la liste des modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:22
function flowgraph_nodes_scene_camera_setCameraRotation_C:init() end

--- Passe en camera libre si besoin, lit le pin 'rot' en mode 'from Pin', applique la rotation (SetCamera) et ecrit le pin value.
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua:73
function flowgraph_nodes_scene_camera_setCameraRotation_C:work() end

