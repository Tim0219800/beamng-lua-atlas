---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/orbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Regard à la souris de Camera V2, de type éditeur : soit rotation sur place depuis la position actuelle de la caméra (mode 0), soit orbite autour de la surface au centre de la vue (mode 1). L'orbite est contrainte pour ne pas faire passer la caméra sous le terrain (recherche dichotomique sur le pitch) et dispose d'une inertie à la relâche du bouton. Utilisé par editor/cameraV2/controller qui lui transmet les entrées souris relatives et appelle update() à chaque frame.
--- Accès : extension `editor_cameraV2_orbit` : `extensions.load("editor_cameraV2_orbit")`, puis la globale `editor_cameraV2_orbit`
---@class editor_cameraV2_orbit
editor_cameraV2_orbit = {}

--- Arrête le glisser et l'inertie d'orbite et abandonne la rotation sur place, en conservant la pose d'orbite.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:576
function editor_cameraV2_orbit.cancel() end

--- État de debug de l'orbite pour la fenêtre Camera V2 Debug.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:563
---@return table|nil  {source, distance, pivot = vec3, moving = boolean}, ou nil sans pose
function editor_cameraV2_orbit.getDebugState() end

--- Renvoie une copie du pivot d'orbite courant.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:528
---@return vec3|nil  pivot, ou nil sans pose
function editor_cameraV2_orbit.getPivot() end

--- Renvoie le pivot s'il est réel (source différente de « virtual »), pour que le zoom l'utilise comme point focal fixe.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:532
---@return vec3|nil  pivot réel ou nil
function editor_cameraV2_orbit.getZoomPivot() end

--- Vrai si une pose d'orbite (pivot, distance) est mémorisée.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:524
---@return boolean  true si orbit existe
function editor_cameraV2_orbit.hasPose() end

--- Vrai si une orbite est en cours (glisser ou inertie) ou si une rotation sur place est en cours.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:515
---@return boolean  état d'activité
function editor_cameraV2_orbit.isActive() end

--- Vrai seulement si une orbite autour d'un pivot est en cours (glisser ou inertie).
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:520
---@return boolean  état d'orbite
function editor_cameraV2_orbit.isOrbitActive() end

--- Marque l'orbite pour qu'un nouveau pivot soit recalculé au prochain début de glisser (après un déplacement WASD combiné).
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:572
function editor_cameraV2_orbit.markForReacquire() end

--- Reçoit un mouvement de souris relatif pendant qu'un bouton d'orbite est enfoncé. Au clic initial, démarre l'orbite (mode 1) ou la rotation sur place ; ensuite accumule l'entrée yaw ou pitch, appliquée par update().
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:278
---@param axis string « yaw » pour l'axe horizontal ; toute autre valeur est traitée comme pitch
---@param value number Mouvement de souris ; non fini = refusé ; |value| > 250 = ignoré (mais consommé)
---@param mode integer 1 = orbite, sinon rotation sur place
---@param mouseButton integer Bouton imgui maintenu (1 droit, 2 milieu)
---@return boolean  true si l'entrée est consommée, false si le bouton n'est pas actif/viewport non survolé
function editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton) end

--- Oublie complètement la pose d'orbite et la rotation sur place.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:584
function editor_cameraV2_orbit.reset() end

--- Définit le pivot d'orbite et recalcule yaw, pitch et distance à partir de la position de la caméra. Annule glisser et inertie.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:536
---@param pivot vec3 Nouveau pivot ; doit être un point raisonnable
---@param source string|nil Étiquette de source (défaut « focus »)
---@return boolean  true si appliqué, false si pivot/caméra invalide ou distance nulle
function editor_cameraV2_orbit.setPivot(pivot, source) end

--- Recalcule la géométrie d'orbite (distance, yaw, pitch) depuis la position actuelle de la caméra en gardant le pivot et la source ; utilisé après un zoom vers le pivot.
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:553
---@return boolean  false sans pose d'orbite ou en cas de position invalide
function editor_cameraV2_orbit.syncDistanceFromCamera() end

--- Fait avancer la rotation sur place ou l'orbite d'une frame (lissage, inertie, contrainte terrain) et applique la pose à core_camera (setRotation ou setPosRot).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:495
---@param mode integer 1 = orbite, sinon rotation sur place
---@param mouseButton integer Bouton imgui de l'orbite
---@param deltaTime number|nil Secondes, bornées à [0 ; 0,05]
function editor_cameraV2_orbit.update(mode, mouseButton, deltaTime) end

