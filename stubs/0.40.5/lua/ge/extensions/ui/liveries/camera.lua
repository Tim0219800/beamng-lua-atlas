---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pilote la caméra de l'éditeur de livrées : vues prédéfinies autour du véhicule (haut, gauche, droite, arrière, avant), cadrage de la caméra sur l'angle d'un décalque, et mode « transformation » où la caméra passe en caméra libre ou en orbite pendant le placement d'un décalque. Les mouvements sont exécutés dans des jobs (core_jobsystem) car la caméra a besoin d'une image pour se mettre à jour. Utilisé par l'interface de livrées via ui_liveries_camera.
--- Accès : extension `ui_liveries_camera` : `extensions.load("ui_liveries_camera")`, puis la globale `ui_liveries_camera`
---@class ui_liveries_camera
---@field dependencies string[] Extensions chargées avant celle-ci : editor_api_dynamicDecals.
ui_liveries_camera = {}

--- Passe en caméra de jeu et active la caméra orbite du joueur 0.
---Source : lua/ge/extensions/ui/liveries/camera.lua:157
---@return boolean  Toujours true.
function ui_liveries_camera.activateOrbitMode() end

--- Force la caméra en orbite pendant une transformation. Si elle était libre, annule les jobs, arrête le mouvement et, pour un décalque existant, remet l'orbite sur son angle.
---Source : lua/ge/extensions/ui/liveries/camera.lua:383
---@return boolean  false si aucune transformation n'est active, sinon true.
function ui_liveries_camera.ensureTransformOrbitMode() end

--- Renvoie la liste des vues prédéfinies pour l'interface.
---Source : lua/ge/extensions/ui/liveries/camera.lua:137
---@return table[]  Éléments { id, labelKey, icon } pour top, left, right, back, front.
function ui_liveries_camera.getViews() end

--- Entrée d'axe gauche/droite pendant une transformation. En caméra libre, déplace latéralement ; en orbite, fait tourner le lacet (rotate_yaw). Sans effet hors transformation.
---Source : lua/ge/extensions/ui/liveries/camera.lua:456
---@param value number Valeur d'axe signée.
---@param filterType any Type de filtre d'entrée transmis à core_camera.rotate_yaw.
---@param player any Joueur transmis à core_camera.rotate_yaw (déduit du code).
function ui_liveries_camera.moveLeftRight(value, filterType, player) end

--- Cadre la caméra orbite sur un décalque : vue prédéfinie si le décalque est orthographique, sinon rotation de l'orbite sur l'angle du décalque sans toucher à la distance.
---Source : lua/ge/extensions/ui/liveries/camera.lua:246
---@param layerUid string Uid d'une couche decal avec pose de caméra.
---@return boolean  false si la couche est inutilisable.
function ui_liveries_camera.orbitToLayer(layerUid) end

--- Place la caméra libre à la position et à l'orientation mémorisées dans le décalque (camPosition, camDirection convertis dans le repère monde du véhicule).
---Source : lua/ge/extensions/ui/liveries/camera.lua:232
---@param layerUid string Uid d'une couche de type decal ayant une pose de caméra.
---@return boolean  false si la couche est introuvable ou sans pose de caméra.
function ui_liveries_camera.panToLayer(layerUid) end

--- Entrée d'axe haut/bas pendant une transformation. En caméra libre, monte (valeur positive) ou descend (valeur négative) ; en orbite, fait tourner le tangage (rotate_pitch). Sans effet hors transformation.
---Source : lua/ge/extensions/ui/liveries/camera.lua:438
---@param value number Valeur d'axe signée.
---@param filterType any Type de filtre d'entrée transmis à core_camera.rotate_pitch.
---@param player any Joueur transmis à core_camera.rotate_pitch (déduit du code).
function ui_liveries_camera.panUpDown(value, filterType, player) end

--- Prévisualise un décalque : vue prédéfinie s'il est orthographique, sinon restaure l'angle exact (caméra libre : pose du décalque ; orbite active : rotation directe ; autre caméra : passage en orbite).
---Source : lua/ge/extensions/ui/liveries/camera.lua:265
---@param layerUid string Uid d'une couche decal avec pose de caméra.
---@return boolean  false si la couche est inutilisable.
function ui_liveries_camera.previewLayer(layerUid) end

--- Applique une vue prédéfinie : repasse en caméra de jeu en mode orbite, règle la rotation par défaut du véhicule puis réinitialise la caméra, dans un job. Déclenche liveries_camera_viewApplied à la fin.
---Source : lua/ge/extensions/ui/liveries/camera.lua:145
---@param viewId string « top », « left », « right », « back » ou « front ».
---@return boolean  false (avec avertissement) si la vue est inconnue, sinon true.
function ui_liveries_camera.setView(viewId) end

--- Démarre le module : mémorise la rotation d'orbite par défaut actuelle du véhicule du joueur pour la restaurer plus tard. Sans effet si déjà démarré.
---Source : lua/ge/extensions/ui/liveries/camera.lua:112
function ui_liveries_camera.setup() end

--- Démarre le mode transformation pour un nouveau décalque : mémorise la caméra courante, puis garde l'orbite (placement souris) ou passe en caméra libre. Sans effet si une transformation est déjà active.
---Source : lua/ge/extensions/ui/liveries/camera.lua:329
function ui_liveries_camera.startTransform() end

--- Démarre le mode transformation sur un décalque existant : mémorise la caméra courante, puis cadre le décalque en orbite (placement souris) ou en caméra libre.
---Source : lua/ge/extensions/ui/liveries/camera.lua:300
---@param layerUid string Uid du décalque à éditer.
---@return boolean  false si une transformation est déjà active ou si la couche est inutilisable.
function ui_liveries_camera.startTransformAtLayer(layerUid) end

--- Termine la transformation : annule les jobs, arrête les mouvements et rotations, repasse en caméra de jeu, restaure la caméra et la rotation d'orbite mémorisées, puis réinitialise la caméra.
---Source : lua/ge/extensions/ui/liveries/camera.lua:404
function ui_liveries_camera.stopTransform() end

--- Arrête le module : termine la transformation en cours (stopTransform), annule le job de caméra, et restaure la rotation d'orbite par défaut mémorisée par setup. Sans effet si le module n'est pas démarré.
---Source : lua/ge/extensions/ui/liveries/camera.lua:121
function ui_liveries_camera.teardown() end

--- Bascule pendant une transformation entre caméra libre et caméra orbite.
---Source : lua/ge/extensions/ui/liveries/camera.lua:387
---@return boolean  false si aucune transformation n'est active, sinon true.
function ui_liveries_camera.toggleTransformCameraMode() end

