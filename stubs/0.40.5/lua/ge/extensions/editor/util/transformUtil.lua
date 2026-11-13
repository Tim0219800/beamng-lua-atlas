---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/transformUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur du module. Champs publics notables : pos (vec3), rot (quat), scl (vec3|number), allowTranslate/allowRotate/allowScale (booléens), oneDimensionalScale, showWidgets, showGizmo, widgetSettings.width, switchRotationForMouse, isDragging.
---@class editor_util_transformUtil
local editor_util_transformUtil = {}

--- Début de glissement du gizmo : mémorise pos/rot/scl de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:674
function editor_util_transformUtil:beginDrag() end

--- Dessine l'interface combinée (gizmo, boutons d'aide, champs) dans la largeur disponible.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:418
---@return boolean  true si le transform a changé.
function editor_util_transformUtil:combinedWidget() end

--- Dessine le menu contextuel d'aide (position/rotation vers caméra, caméra vers position, etc.).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:366
---@return boolean  true si une action a modifié le transform.
function editor_util_transformUtil:contextMenu() end

--- Indique si l'edit mode actif de l'éditeur est celui de cet assistant.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:742
---@return boolean  true si actif.
function editor_util_transformUtil:correctEditMode() end

--- Pendant le glissement : met à jour pos, rot ou scl selon le mode du gizmo (translation, rotation, échelle) et trace les axes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:681
function editor_util_transformUtil:dragging() end

--- Active l'edit mode de cet assistant, avec un délai de quelques frames avant de traiter les clics.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:306
---@param cooldown integer|nil Nombre de frames d'attente (1 par défaut).
function editor_util_transformUtil:enableEditing(cooldown) end

--- Fin de glissement du gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:732
function editor_util_transformUtil:endDragging() end

--- Renvoie la liste des boutons d'aide compatibles avec allowTranslate/allowRotate (s'arrête au premier incompatible).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:547
---@return table  Liste de définitions de boutons.
function editor_util_transformUtil:getValidButtons() end

--- Dessine le bouton 'Edit <objet>' / 'Exit Editing', le gizmo d'axes en edit mode, et le menu '...'.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:559
---@return boolean  true si le gizmo ou le menu a modifié le transform.
function editor_util_transformUtil:gizmo() end

--- Aligne l'axe haut sur la normale lissée du terrain en conservant la direction avant projetée (sans effet sans terrain).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:355
function editor_util_transformUtil:helperAlignWithTerrain() end

--- Passe en caméra libre et déplace la caméra à la position, en gardant son orientation.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:329
function editor_util_transformUtil:helperCameraToPosition() end

--- Passe en caméra libre et applique position et rotation à la caméra.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:343
function editor_util_transformUtil:helperCameraToPositionRotation() end

--- Passe en caméra libre et applique la rotation à la caméra, en gardant sa position.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:336
function editor_util_transformUtil:helperCameraToRotation() end

--- Centre la vue de l'éditeur sur la position (editor.fitViewToSelectionSmooth).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:313
function editor_util_transformUtil:helperFocus() end

--- Téléporte le véhicule joueur (spawn.safeTeleport) à la position/rotation.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:349
function editor_util_transformUtil:helperMoveToTransform() end

--- Pose la position à la hauteur du terrain (sans effet s'il n'y a pas de terrain).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:322
function editor_util_transformUtil:helperPositionDownToTerrain() end

--- Place la position 15 m devant la caméra.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:319
function editor_util_transformUtil:helperPositionInFrontOfToCamera() end

--- Place la position sur celle de la caméra.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:316
function editor_util_transformUtil:helperPositionToCamera() end

--- Copie la rotation de la caméra (identique à helperRotationToCamera ; l'info-bulle du bouton dit 'face away from the camera').
---Source : lua/ge/extensions/editor/util/transformUtil.lua:361
function editor_util_transformUtil:helperRotateWithCamera() end

--- Copie la rotation de la caméra.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:326
function editor_util_transformUtil:helperRotationToCamera() end

--- Constructeur : crée l'état (pos 0, rot identité, scl 1), les champs imgui et enregistre l'edit mode de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:68
---@param editName string Nom de l'edit mode (un id unique est ajouté).
---@param objectName string|nil Libellé de l'objet dans l'UI, 'Object' par défaut.
function editor_util_transformUtil:init(editName, objectName) end

--- Callback d'edit mode : efface la sélection d'objets et réinitialise via set().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:747
function editor_util_transformUtil:onActivate() end

--- Callback d'edit mode : efface la sélection d'objets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/transformUtil.lua:751
function editor_util_transformUtil:onDeactivate() end

--- Efface les valeurs de début de glissement (appel manuel).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:737
function editor_util_transformUtil:resetDragging() end

--- Définit position, rotation et échelle ; les arguments nil sont ignorés. Met à jour le transform du gizmo et les champs de saisie.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:146
---@param pos vec3|nil Nouvelle position.
---@param rot quat|nil Nouvelle rotation.
---@param scl vec3|number|nil Nouvelle échelle (convertie selon oneDimensionalScale).
function editor_util_transformUtil:set(pos, rot, scl) end

--- Bascule entre échelle scalaire et échelle vec3 et recrée le champ d'entrée correspondant.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:116
---@param ods boolean true pour une échelle à une seule valeur.
function editor_util_transformUtil:setOneDimensionalScale(ods) end

--- Gère le Quick Edit (Maj + souris) : pose la position sur le point visé et oriente l'objet selon le glissement.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:201
---@param mouseInfo table Infos souris de l'éditeur (rayCast, down, hold, up, valid).
---@return boolean|nil  true si une édition a eu lieu pendant le maintien.
function editor_util_transformUtil:shiftUpdate(mouseInfo) end

--- Entre dans l'edit mode de cet assistant s'il n'y est pas déjà.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:131
function editor_util_transformUtil:start() end

--- Quitte l'edit mode (editor.selectEditMode(nil)) s'il est actif.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:138
function editor_util_transformUtil:stop() end

--- À appeler à chaque frame : gère les clics, les messages d'aide et le Quick Edit quand l'edit mode est actif, puis dessine les widgets (combinedWidget).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:254
---@param mouseInfo table|nil Infos souris de l'éditeur.
---@return boolean  true si le transform a changé.
function editor_util_transformUtil:update(mouseInfo) end

--- Recopie pos, rot et scl dans les tableaux imgui (inputPos, inputRot, inputScl).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:182
function editor_util_transformUtil:updateInputFields() end

--- Recalcule la matrice du gizmo à partir de pos/rot (orientation locale ou monde selon l'alignement du gizmo) et l'applique si cet edit mode est actif.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:164
function editor_util_transformUtil:updateTransform() end

--- Dessine les champs de saisie Position, Rotation (quaternion) et Scale selon les autorisations.
---Source : lua/ge/extensions/editor/util/transformUtil.lua:597
---@return boolean  true si une valeur a été modifiée.
function editor_util_transformUtil:widget() end

--- Version compacte de widget() (libellés Pos, Rot, Scl).
---Source : lua/ge/extensions/editor/util/transformUtil.lua:635
---@return boolean  true si une valeur a été modifiée.
function editor_util_transformUtil:widgetCondensed() end

