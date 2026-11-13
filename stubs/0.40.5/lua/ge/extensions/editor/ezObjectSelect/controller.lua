---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de l'outil « Easy Select » de l'éditeur (M.id = "ezObjectSelect", label « Easy Select »). Remplace la sélection d'objets classique : découverte des objets sous la souris dans un rayon écran, pile de candidats superposés, filtres par distance/volume/motif de nom, sélection, déplacement (glisser avec projection sur terrain/raycast/écran, snap grille et rotation, placement sur surface), opérateurs modaux G/R/S (transformOperator, rotateOperator, scaleOperator), gizmo natif, mode « fence » (sous-outil de sélection par zone), signets de caméra, caméra orthographique et préréglages pavé numérique. Il centralise la configuration (cfg), l'état (st), les préférences ezObjectSelect.* et la fenêtre de l'espace de travail (onglets Selection, Hints, Fence). Il est piloté par le module editor/ezObjectSelect.lua (mode d'édition) qui appelle activate/deactivate/update/drawWorkspace.
--- Accès : extension `editor_ezObjectSelect_controller` : `extensions.load("editor_ezObjectSelect_controller")`, puis la globale `editor_ezObjectSelect_controller`
---@class editor_ezObjectSelect_controller
editor_ezObjectSelect_controller = {}

--- Active l'outil : réinitialise l'état, réserve la sélectabilité, active la caméra temporaire de l'éditeur, applique la teinte de sélection et les bindings.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1005
---@return boolean  true si actif (déjà actif ou activation réussie), false si la réservation de sélectabilité échoue
function editor_ezObjectSelect_controller.activate() end

--- Désactive l'outil : annule fence, opérateurs modaux, session de transformation et gizmo natif, restaure la teinte de sélection selon gizmos.general.highlightSelectedMeshes, rend la caméra et le pavé numérique, quitte l'ortho.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1033
function editor_ezObjectSelect_controller.deactivate() end

--- Dessine les labels et diagnostics en overlay écran (anneau de survol, étiquettes, états du glisser). Ne fait rien si l'outil est inactif ou si fence est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:508
function editor_ezObjectSelect_controller.drawScreenDebug() end

--- Dessine le contenu de la fenêtre « Easy Select » (onglets Selection avec snapping/placement/grille/rotation, Hints, Fence ; signets de caméra).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1808
function editor_ezObjectSelect_controller.drawWorkspace() end

--- Invalide le cache du modèle de sélection et le volume en cache des stats, et efface le dernier snapshot.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1112
---@param reason string Raison (ex. objectAdded, prefabExploded), transmise au cache
function editor_ezObjectSelect_controller.invalidateSelectionCache(reason) end

--- Indique si l'outil est actif.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1063
---@return boolean
function editor_ezObjectSelect_controller.isActive() end

--- Charge toutes les préférences ezObjectSelect.* de l'éditeur dans la configuration locale.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2194
function editor_ezObjectSelect_controller.loadPreferences() end

--- Hook relayé quand l'alignement du gizmo (monde/local) change : synchronise le mode de coordonnées et transmet l'espace aux opérateurs modaux actifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1098
function editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged() end

--- Hook relayé quand le mode du gizmo d'axes change. Pendant un glisser natif, restaure le mode courant ; si le nouveau mode est translate/rotate/scale, bascule la visibilité du gizmo natif (le même mode une 2e fois le masque).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1074
---@param mode integer editor.AxisGizmoMode_Translate, _Rotate ou _Scale
function editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode) end

--- Hook : recopie la valeur modifiée d'une préférence ezObjectSelect.* dans la configuration locale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2263
---@param path string Chemin de préférence
---@param value any Nouvelle valeur
function editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value) end

--- Enregistre la catégorie « ezObjectSelect » (sous-catégories general, selection, etc.) avec valeurs par défaut, bornes et rendus prefUi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2330
---@param prefsRegistry table Registre de préférences
function editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry) end

--- Demande de ré-appliquer la teinte des meshes sélectionnés (setAxisGizmoHighlightSelectedMeshes) si l'outil est actif.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1067
function editor_ezObjectSelect_controller.refreshSelectedTint() end

--- Centre la caméra en douceur sur l'objet survolé, sinon sur la sélection (editor.fitViewToSelectionSmooth). Ignoré pendant une opération.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1207
function editor_ezObjectSelect_controller.requestFocusShortcut() end

--- Mémorise un préréglage de vue du pavé numérique, appliqué à la prochaine mise à jour si numpadMode == 1.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1272
---@param preset any Préréglage demandé (valeur transmise telle quelle)
function editor_ezObjectSelect_controller.requestNumpadPreset(preset) end

--- Demande l'opérateur de rotation (R) sous les mêmes conditions.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1154
function editor_ezObjectSelect_controller.requestRotateShortcut() end

--- Demande l'opérateur d'échelle (S) sous les mêmes conditions.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1163
function editor_ezObjectSelect_controller.requestScaleShortcut() end

--- Demande l'opérateur de déplacement (G) si suppressCameraForGrs est activé et si aucune opération n'est en cours et que des objets sont sélectionnés.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1145
function editor_ezObjectSelect_controller.requestTransformShortcut() end

--- Débloque molette, mouvement caméra, entrées modales et pavé numérique, retire les action maps (Blender, numpad) et efface les demandes de raccourci.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:410
function editor_ezObjectSelect_controller.resetInputFilters() end

--- Mise à jour par frame appelée par le mode d'édition : gère fence, opérateurs modaux, raccourcis, survol/sélection, glisser, gizmo natif, caméra et dessin 3D.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1594
---@return boolean  false si l'outil est inactif ; sinon indique que l'outil a géré la frame (valeur comparée à true par le mode d'édition)
function editor_ezObjectSelect_controller.update() end

--- Table locale de fonctions de rendu des préférences dans la fenêtre de préférences de l'éditeur. Chaque fonction a la signature (cat, subCat, item) : cat et subCat sont ignorés, item.path est le chemin de la préférence. Chaque fonction dessine le widget de la valeur correspondante et un bouton de remise par défaut.
---@class editor_ezObjectSelect_controller_prefUi
local editor_ezObjectSelect_controller_prefUi = {}

--- Case à cocher : masquer les segments de boîte de survol derrière la géométrie.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2057
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.boundsDepthTest(_, _, item) end

--- Case à cocher : masquer les lignes de grille derrière la géométrie (désactivée si le plan n'est pas affiché).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2109
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.clipMoveConstraintPlane(_, _, item) end

--- Case à cocher du mode debug (ezObjectSelect.general.debug).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1953
---@param _ any
---@param _ any
---@param item table Entrée de préférence (path)
function editor_ezObjectSelect_controller_prefUi.debug(_, _, item) end

--- Entier : rayon écran de découverte des objets (8 à 500 px, défaut 100).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1967
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.discoveryRadius(_, _, item) end

--- Case à cocher : idem pour les boîtes pendant le glisser.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2077
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.dragBoundsDepthTest(_, _, item) end

--- Liste : placement des étiquettes (par défaut « Follow mouse »).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2087
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.labelPlacementMode(_, _, item) end

--- Entier : nombre max de contours d'objets proches (0 à 50, défaut 5).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1976
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.maxDiscoveryOutlines(_, _, item) end

--- Flottant : distance max entre le point de focus caméra et un objet sélectionnable (10 à 500, défaut 150).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2001
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.maxPickDistance(_, _, item) end

--- Flottant : volume max de boîte orientée pour être sélectionnable (défaut 500000).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2017
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.maxPickVolume(_, _, item) end

--- Flottant : au-delà de cette distance caméra, le survol ne résout que le meilleur objet (10 à 1000, défaut 200).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2026
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.maxStackDistance(_, _, item) end

--- Entier : nombre max de contours de candidats superposés (1 à 50, défaut 5).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1985
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.maxStackOutlines(_, _, item) end

--- Liste : mode du pavé numérique (standard ou préréglages de vue).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2180
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.numpadMode(_, _, item) end

--- Entier : décalage horizontal en pixels depuis le coin haut-droit (défaut 75).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2156
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.orientationGizmoRightOffset(_, _, item) end

--- Entier : décalage vertical en pixels depuis le coin haut-droit (défaut 140).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2144
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.orientationGizmoTopOffset(_, _, item) end

--- Liste : mode de contour (Outline ou boîtes remplies).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2042
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.outlineMode(_, _, item) end

--- Case à cocher : idem pour les boîtes des objets sélectionnés.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2067
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.selectedBoundsDepthTest(_, _, item) end

--- Case à cocher : teinter les meshes sélectionnés.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2035
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.selectedTintEnabled(_, _, item) end

--- Flottant : multiplicateur de longueur des axes d'origine des objets sélectionnés (défaut 2).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2119
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLengthScale(_, _, item) end

--- Flottant : épaisseur de ces axes (défaut 4).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2128
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.selectionGizmoLineWidth(_, _, item) end

--- Case à cocher : anneau de distance de sélection maximale.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1994
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.showDistanceRing(_, _, item) end

--- Case à cocher : anneau de survol et lignes guides.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:1960
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.showHoverRing(_, _, item) end

--- Case à cocher : dessiner le plan de déplacement (G libre ou planaire).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2102
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.showMoveConstraintPlane(_, _, item) end

--- Case à cocher : repère d'orientation fixe monde/local dans le viewport.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2137
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.showOrientationGizmo(_, _, item) end

--- Case à cocher : contour rouge des objets exclus par la limite de volume.
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2010
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.showVolumeFilteredObjects(_, _, item) end

--- Case à cocher : réserver G, R, S aux outils modaux Move/Rotate/Scale (supprime le déplacement caméra WASD).
---Source : lua/ge/extensions/editor/ezObjectSelect/controller.lua:2168
---@param _ any
---@param _ any
---@param item table Entrée de préférence
function editor_ezObjectSelect_controller_prefUi.suppressCameraForGrs(_, _, item) end

