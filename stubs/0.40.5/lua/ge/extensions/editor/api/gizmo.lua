---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour le gizmo d'axes 3D (déplacer / tourner / mettre à l'échelle) et pour les icônes d'objets dans la vue monde. Il enveloppe `worldEditorCppApi` : choix du mode et de l'alignement, verrous par axe, magnétisme (snap) de translation/rotation/échelle, détection du survol/glisser à la souris, et calcul des transformations d'objets pendant un déplacement avec accrochage au terrain (raycast ou core_terrain). `initialize` installe tout sur l'objet `editor` et définit les constantes `editor.AxisGizmoMode_*` et `editor.AxisGizmoAlignment_*`.
--- Accès : extension `editor_api_gizmo` : `extensions.load("editor_api_gizmo")`, puis la globale `editor_api_gizmo`
---@class editor_api_gizmo
editor_api_gizmo = {}

--- Mémorise l'éditeur, définit les constantes d'axe/mode/alignement et installe toutes les fonctions gizmo/icônes sur `editor`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/gizmo.lua:533
---@param editorInstance table objet `editor`
function editor_api_gizmo.initialize(editorInstance) end

--- Fonctions ajoutées à `editor` par initialize.
---@class editor_api_gizmo_editor
local editor_api_gizmo_editor = {}

--- À appeler une fois au début du glissement : mémorise les transformations de départ et, si l'accrochage au terrain est activé, les décalages au sol, normales et boîtes englobantes (collision des objets désactivée temporairement pour le raycast).
---Source : lua/ge/extensions/editor/api/gizmo.lua:96
---@param objectTransforms MatrixF[] transformations initiales des objets
---@param objectBBs Box3F[] boîtes englobantes des objets
---@param objectHeights number[] hauteur de départ du raycast par objet
---@param objects table[] objets (pour disableCollision/enableCollision)
function editor_api_gizmo_editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects) end

--- Annule une interaction en cours : relâche virtuellement la souris, restaure la pause de la simulation et désélectionne l'élément du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:349
function editor_api_gizmo_editor.cancelAxisGizmoInteraction() end

--- Dessine le gizmo avec sa transformation et son mode actuels (si la caméra de l'éditeur existe).
---Source : lua/ge/extensions/editor/api/gizmo.lua:364
function editor_api_gizmo_editor.drawAxisGizmo() end

--- Dessine les icônes des objets les plus proches si la caméra existe et que editor.hideObjectIcons n'est pas vrai.
---Source : lua/ge/extensions/editor/api/gizmo.lua:14
function editor_api_gizmo_editor.drawObjectIcons() end

--- Renvoie l'alignement actuel du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:423
---@return integer  alignement
function editor_api_gizmo_editor.getAxisGizmoAlignment() end

--- Renvoie le mode actuel du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:417
---@return integer  mode
function editor_api_gizmo_editor.getAxisGizmoMode() end

--- Renvoie l'échelle actuelle du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:54
---@return Point3F  échelle
function editor_api_gizmo_editor.getAxisGizmoScale() end

--- Renvoie l'élément du gizmo sélectionné (axe ou plan).
---Source : lua/ge/extensions/editor/api/gizmo.lua:433
---@return integer  indice d'élément, -1 si aucun
function editor_api_gizmo_editor.getAxisGizmoSelectedElement() end

--- Renvoie la transformation actuelle du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:49
---@return MatrixF  transformation
function editor_api_gizmo_editor.getAxisGizmoTransform() end

--- À appeler à chaque frame du glissement après beginGizmoTranslate : renvoie les nouvelles transformations des objets (translation du gizmo, avec accrochage terrain et rotation relative selon les préférences). Renvoie {} si beginGizmoTranslate n'a pas été appelé.
---Source : lua/ge/extensions/editor/api/gizmo.lua:170
---@param objects table[] objets déplacés
---@param objectHeights number[] hauteur de départ du raycast par objet
---@return MatrixF[]  transformations mises à jour
function editor_api_gizmo_editor.getTransformsGizmoTranslate(objects, objectHeights) end

--- Indique si un élément (axe ou plan) du gizmo est survolé/sélectionné.
---Source : lua/ge/extensions/editor/api/gizmo.lua:428
---@return boolean  true si l'élément sélectionné n'est pas -1
function editor_api_gizmo_editor.isAxisGizmoHovered() end

--- Ajuste la distance de fondu des icônes d'objets (préférence gizmos.objectIcons.fadeIconsDistance += delta x fadeIconsDistanceModifySpeed, bornée à 1..50000) et affiche une notification.
---Source : lua/ge/extensions/editor/api/gizmo.lua:499
---@param deltaValue number variation (0 = rien ; sans effet si editor.disableModifyFadeIconsDistance)
function editor_api_gizmo_editor.modifyFadeIconsDistance(deltaValue) end

--- Choisit l'alignement du gizmo et émet onEditorAxisGizmoAligmentChanged.
---Source : lua/ge/extensions/editor/api/gizmo.lua:385
---@param alignment integer editor.AxisGizmoAlignment_World (0) ou _Local (1)
function editor_api_gizmo_editor.setAxisGizmoAlignment(alignment) end

--- Choisit le mode du gizmo et émet onEditorAxisGizmoModeChanged(mode).
---Source : lua/ge/extensions/editor/api/gizmo.lua:376
---@param mode integer editor.AxisGizmoMode_Translate (1), _Rotate (2) ou _Scale (3)
function editor_api_gizmo_editor.setAxisGizmoMode(mode) end

--- Autorise ou non la rotation par axe.
---Source : lua/ge/extensions/editor/api/gizmo.lua:403
---@param x boolean axe X
---@param y boolean axe Y
---@param z boolean axe Z
function editor_api_gizmo_editor.setAxisGizmoRotateLock(x, y, z) end

--- Règle le magnétisme de rotation.
---Source : lua/ge/extensions/editor/api/gizmo.lua:447
---@param enabled boolean activer
---@param rotationSnap number pas d'angle
function editor_api_gizmo_editor.setAxisGizmoRotateSnap(enabled, rotationSnap) end

--- Autorise ou non la mise à l'échelle par axe.
---Source : lua/ge/extensions/editor/api/gizmo.lua:411
---@param x boolean axe X
---@param y boolean axe Y
---@param z boolean axe Z
function editor_api_gizmo_editor.setAxisGizmoScaleLock(x, y, z) end

--- Règle le magnétisme d'échelle.
---Source : lua/ge/extensions/editor/api/gizmo.lua:454
---@param enabled boolean activer
---@param scaleSnap number pas d'échelle
function editor_api_gizmo_editor.setAxisGizmoScaleSnap(enabled, scaleSnap) end

--- Place le gizmo dans le monde (pour éditer des parties d'objet ou des poignées personnalisées).
---Source : lua/ge/extensions/editor/api/gizmo.lua:44
---@param matrix MatrixF transformation monde du gizmo
---@param scale vec3|nil échelle du gizmo (défaut vec3(1,1,1)), évite les problèmes de décomposition d'échelle non uniforme
function editor_api_gizmo_editor.setAxisGizmoTransform(matrix, scale) end

--- Autorise ou non la translation par axe.
---Source : lua/ge/extensions/editor/api/gizmo.lua:395
---@param x boolean axe X
---@param y boolean axe Y
---@param z boolean axe Z
function editor_api_gizmo_editor.setAxisGizmoTranslateLock(x, y, z) end

--- Règle le magnétisme de translation.
---Source : lua/ge/extensions/editor/api/gizmo.lua:440
---@param enabled boolean activer
---@param gridSize number taille de cellule de la grille
function editor_api_gizmo_editor.setAxisGizmoTranslateSnap(enabled, gridSize) end

--- Bascule entre alignement monde et local.
---Source : lua/ge/extensions/editor/api/gizmo.lua:459
function editor_api_gizmo_editor.toggleAxisGizmoAlignment() end

--- Inverse la préférence gizmos.general.drawGizmoPlane et active/désactive plan, hachures et grille de déplacement du gizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:468
function editor_api_gizmo_editor.toggleDrawGizmoPlane() end

--- Inverse la préférence gizmos.general.drawObjectIcons et l'applique au C++.
---Source : lua/ge/extensions/editor/api/gizmo.lua:482
function editor_api_gizmo_editor.toggleDrawObjectIcons() end

--- Inverse la préférence gizmos.general.drawObjectText (affichage des noms d'objets) et l'applique au C++.
---Source : lua/ge/extensions/editor/api/gizmo.lua:488
function editor_api_gizmo_editor.toggleDrawObjectText() end

--- Inverse la préférence gizmos.general.highlightSelectedMeshes.
---Source : lua/ge/extensions/editor/api/gizmo.lua:494
function editor_api_gizmo_editor.toggleSelectionHighlight() end

--- Active/désactive le magnétisme de rotation et de translation selon les préférences snapping.general.* (rotateSnapSize, gridSize), sauf si la préférence rotateSnapEnabled / snapToGrid correspondante est déjà vraie.
---Source : lua/ge/extensions/editor/api/gizmo.lua:513
---@param value integer 0 = désactiver, 1 = activer (autres valeurs ignorées)
function editor_api_gizmo_editor.toggleSnapping(value) end

--- Traite les événements souris du gizmo (début, glissement, fin, survol), relaie les modificateurs clavier au C++ et émet onEditorAxisGizmoAligmentChanged si l'alignement a changé côté C++. À appeler avec drawAxisGizmo.
---Source : lua/ge/extensions/editor/api/gizmo.lua:289
---@param onStartGizmoDragFunc function|nil appelée au début du glissement (sans argument)
---@param onEndGizmoDragFunc function|nil appelée à la fin si le gizmo a été glissé (sans argument)
---@param onGizmoDraggingFunc function|nil appelée à chaque frame de glissement (sans argument)
function editor_api_gizmo_editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc) end

--- Met à jour editor.objectIconHitId (icône d'objet sous la souris, 0 si icônes masquées ou préférence gizmos.general.drawObjectIcons == false) et editor.objectIconHoverId (seulement si aucun bouton souris n'est enfoncé et que l'UI ne capture pas la souris). À appeler à chaque frame.
---Source : lua/ge/extensions/editor/api/gizmo.lua:24
function editor_api_gizmo_editor.updateObjectIcons() end

