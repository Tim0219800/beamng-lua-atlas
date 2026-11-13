---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_camera_setCameraPosition_C
local flowgraph_nodes_scene_camera_setCameraPosition_C = {}

--- Appelle core_camera.setPosRot(0, ...) avec la position du noeud et la rotation courante de la camera (core_camera.getQuat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:88
function flowgraph_nodes_scene_camera_setCameraPosition_C:SetCamera() end

--- Restaure position et mode ; recree le pin 'pos' en mode 'from Pin'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:101
---@param nodeData any donnees sauvegardees
function flowgraph_nodes_scene_camera_setCameraPosition_C:_onDeserialized(nodeData) end

--- Sauvegarde la position (res.ppos) et le mode (res.mode).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:95
---@param res any table de sauvegarde du noeud
function flowgraph_nodes_scene_camera_setCameraPosition_C:_onSerialize(res) end

--- Panneau de proprietes de l'editeur : choix du mode, champs x/y/z, boutons « Set from camera » et « Preview ». Cree ou supprime le pin 'pos' selon le mode. Renvoie une chaine de raison si une modification a eu lieu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:27
function flowgraph_nodes_scene_camera_setCameraPosition_C:drawCustomProperties() end

--- Zone centrale du noeud dans l'editeur (rien d'affiche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:84
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_camera_setCameraPosition_C:drawMiddle(builder, style) end

--- Initialise la position a (0,0,0), le mode a 'custom' et la liste des modes {'custom','from Pin'}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:21
function flowgraph_nodes_scene_camera_setCameraPosition_C:init() end

--- Passe en camera libre si besoin, lit la position du pin 'pos' en mode 'from Pin', applique la position (SetCamera) et ecrit le pin value.
---Source : lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua:73
function flowgraph_nodes_scene_camera_setCameraPosition_C:work() end

