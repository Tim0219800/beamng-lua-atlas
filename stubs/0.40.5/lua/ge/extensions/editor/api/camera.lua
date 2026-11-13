---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de caméra de l'éditeur. initialize(editorInstance) installe sur l'objet editor les constantes de type de caméra (CameraType_Game = 1, CameraType_Free = 2), les constantes de vitesse (CameraSpeed_Slowest 5, Slow 35, Slower 70, Normal 100, Faster 130, Fast 165, Fastest 200), l'état currentCameraType / previousCameraType et les fonctions de caméra libre, de repères de caméra (bookmarks stockés dans MissionGroup/CameraBookmarks) et de paramètres de caméra « lisse » (newton). Les fonctions listées sont donc des méthodes de editor, pas du module.
--- Accès : extension `editor_api_camera` : `extensions.load("editor_api_camera")`, puis la globale `editor_api_camera`
---@class editor_api_camera
editor_api_camera = {}

--- Appelé par l'éditeur : installe les constantes et fonctions de caméra sur l'instance de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/camera.lua:323
---@param editorInstance table Instance de l'éditeur.
function editor_api_camera.initialize(editorInstance) end

--- Méthodes ajoutées à l'instance de l'éditeur par ce module.
---@class editor_api_camera_editor
local editor_api_camera_editor = {}

--- Ajoute un repère de caméra nommé à la position actuelle de la caméra libre, dans MissionGroup/CameraBookmarks (groupe créé au besoin).
---Source : lua/ge/extensions/editor/api/camera.lua:171
---@param name string Nom interne du repère.
---@return integer  Id de l'objet repère.
function editor_api_camera_editor.addCameraBookmark(name) end

--- Oriente la caméra vers un point du monde.
---Source : lua/ge/extensions/editor/api/camera.lua:45
---@param pt vec3 Point à regarder.
function editor_api_camera_editor.cameraLookAtPoint(pt) end

--- Supprime tous les repères de caméra.
---Source : lua/ge/extensions/editor/api/camera.lua:221
function editor_api_camera_editor.clearCameraBookmarks() end

--- Copie dans le presse-papiers la position et rotation d'un repère sous forme de texte [x, y, z, qx, qy, qz, qw].
---Source : lua/ge/extensions/editor/api/camera.lua:210
---@param obj table Objet repère.
function editor_api_camera_editor.copyCameraBookmarkToClipboard(obj) end

--- Supprime un repère de caméra.
---Source : lua/ge/extensions/editor/api/camera.lua:185
---@param objectId integer Id de l'objet repère.
function editor_api_camera_editor.deleteCameraBookmark(objectId) end

--- Place la caméra à 15 m en arrière du centre de la sélection (ou du gizmo) en gardant son orientation de départ puis la tourne vers le centre.
---Source : lua/ge/extensions/editor/api/camera.lua:74
---@param center vec3|nil Centre à viser ; par défaut le centre de la boîte de sélection.
function editor_api_camera_editor.fitViewToSelection(center) end

--- Comme fitViewToSelection mais avec une approche animée et une distance adaptée à la taille de la sélection.
---Source : lua/ge/extensions/editor/api/camera.lua:106
function editor_api_camera_editor.fitViewToSelectionSmooth() end

--- Retourne la caméra libre (commands.getCamera).
---Source : lua/ge/extensions/editor/api/camera.lua:39
---@return table  Objet caméra.
function editor_api_camera_editor.getCamera() end

--- Retourne le groupe SimGroup contenant les repères (le crée si besoin ; nil sans MissionGroup).
---Source : lua/ge/extensions/editor/api/camera.lua:193
---@return table|nil  SimGroup.
function editor_api_camera_editor.getCameraBookmarks() end

--- Retourne la vitesse de la caméra libre.
---Source : lua/ge/extensions/editor/api/camera.lua:153
---@param speed any
---@return number  Vitesse.
function editor_api_camera_editor.getCameraSpeed(speed) end

--- Retourne la position et rotation d'un objet en texte [x, y, z, qx, qy, qz, qw] (usage interne à l'éditeur).
---Source : lua/ge/extensions/editor/api/camera.lua:199
---@param obj table Objet de la scène.
---@return string  Texte formaté.
function editor_api_camera_editor.getObjectLocationText(obj) end

--- Retourne les paramètres de la caméra libre lisse.
---Source : lua/ge/extensions/editor/api/camera.lua:290
---@return table|nil  {newtonMode, newtonRotation, mass, drag, force, angularDrag, angularForce}, ou nil (avertissement) si la caméra libre n'existe pas.
function editor_api_camera_editor.getSmoothCameraParams() end

--- Déplace la caméra à la position et rotation d'un repère.
---Source : lua/ge/extensions/editor/api/camera.lua:237
---@param objectId integer Id de l'objet repère.
function editor_api_camera_editor.jumpToCameraBookmark(objectId) end

--- Applique à la caméra libre le texte de transformation lu dans le presse-papiers (commands.setFreeCameraTransformJson).
---Source : lua/ge/extensions/editor/api/camera.lua:215
function editor_api_camera_editor.pasteCameraBookmarkFromClipboard() end

--- Place la caméra à la position du joueur (commands.dropCameraAtPlayer).
---Source : lua/ge/extensions/editor/api/camera.lua:60
function editor_api_camera_editor.placeCameraAtPlayer() end

--- Place la caméra au centroïde de la sélection d'objets (sans effet si rien n'est sélectionné).
---Source : lua/ge/extensions/editor/api/camera.lua:51
function editor_api_camera_editor.placeCameraAtSelection() end

--- Place le véhicule du joueur à la position de la caméra (position seulement).
---Source : lua/ge/extensions/editor/api/camera.lua:65
function editor_api_camera_editor.placePlayerAtCamera() end

--- Choisit la caméra de la vue : jeu (commands.setGameCamera) ou libre (commands.setFreeCamera) ; mémorise le type précédent.
---Source : lua/ge/extensions/editor/api/camera.lua:12
---@param type integer editor.CameraType_Game ou editor.CameraType_Free.
function editor_api_camera_editor.selectCamera(type) end

--- Règle la vitesse de la caméra libre (core_camera.setSpeed).
---Source : lua/ge/extensions/editor/api/camera.lua:149
---@param speed number Vitesse, par exemple editor.CameraSpeed_Normal.
function editor_api_camera_editor.setCameraSpeed(speed) end

--- Règle la traînée angulaire de la caméra libre.
---Source : lua/ge/extensions/editor/api/camera.lua:269
---@param drag number Traînée angulaire.
function editor_api_camera_editor.setSmoothCameraAngularDrag(drag) end

--- Règle la traînée angulaire à partir d'une valeur 0-1 (même échelle).
---Source : lua/ge/extensions/editor/api/camera.lua:283
---@param value number Valeur normalisée.
function editor_api_camera_editor.setSmoothCameraAngularDragNormalized(value) end

--- Règle la traînée de translation de la caméra libre.
---Source : lua/ge/extensions/editor/api/camera.lua:262
---@param drag number Traînée.
function editor_api_camera_editor.setSmoothCameraDrag(drag) end

--- Règle la traînée à partir d'une valeur 0-1 (1 donne 5, 0 donne 20).
---Source : lua/ge/extensions/editor/api/camera.lua:276
---@param value number Valeur normalisée.
function editor_api_camera_editor.setSmoothCameraDragNormalized(value) end

--- Active ou règle la translation « newton » (inertie) de la caméra libre.
---Source : lua/ge/extensions/editor/api/camera.lua:248
---@param value boolean|number Valeur passée à core_camera.setNewtonTranslation.
function editor_api_camera_editor.setSmoothCameraMove(value) end

--- Applique des paramètres de caméra libre lisse et remet la vitesse angulaire à zéro.
---Source : lua/ge/extensions/editor/api/camera.lua:307
---@param params table {newtonMode, newtonRotation, drag, mass, force, angularDrag, angularForce}.
function editor_api_camera_editor.setSmoothCameraParams(params) end

--- Active ou règle la rotation « newton » de la caméra libre.
---Source : lua/ge/extensions/editor/api/camera.lua:255
---@param value boolean|number Valeur passée à core_camera.setNewtonRotation.
function editor_api_camera_editor.setSmoothCameraRotate(value) end

--- Bascule entre la caméra de jeu courante et la caméra libre de l'éditeur.
---Source : lua/ge/extensions/editor/api/camera.lua:30
function editor_api_camera_editor.toggleFreeCamera() end

