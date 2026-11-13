# `editor_ezObjectSelect_controller`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/controller.lua` · VM : Game Engine (GE) · 2383 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_controller` : `extensions.load("editor_ezObjectSelect_controller")`, puis la globale `editor_ezObjectSelect_controller`

Contrôleur de l'outil « Easy Select » de l'éditeur (M.id = "ezObjectSelect", label « Easy Select »). Remplace la sélection d'objets classique : découverte des objets sous la souris dans un rayon écran, pile de candidats superposés, filtres par distance/volume/motif de nom, sélection, déplacement (glisser avec projection sur terrain/raycast/écran, snap grille et rotation, placement sur surface), opérateurs modaux G/R/S (transformOperator, rotateOperator, scaleOperator), gizmo natif, mode « fence » (sous-outil de sélection par zone), signets de caméra, caméra orthographique et préréglages pavé numérique. Il centralise la configuration (cfg), l'état (st), les préférences ezObjectSelect.* et la fenêtre de l'espace de travail (onglets Selection, Hints, Fence). Il est piloté par le module editor/ezObjectSelect.lua (mode d'édition) qui appelle activate/deactivate/update/drawWorkspace.

## Remarques

- activate() réserve la sélectabilité (selectabilityPresets.beginScope "staticsAndProps") ; si elle échoue, renvoie false et l'extension parente revient au mode objectSelect.
- Les raccourcis request*Shortcut (G/R/S) ne font rien tant que la préférence suppressCameraForGrs est désactivée (par défaut false) : dans ce cas, S reste le déplacement caméra.
- requestNumpadPreset n'est pris en compte que si numpadMode == 1 (préférence numpadMode).
- Préférences par défaut notables : discoveryRadius 100 px, maxDiscoveryOutlines 5, maxStackOutlines 5, maxPickDistance 150 m, maxStackDistance 200 m, maxPickVolume 500000 (volume de boîte), selectionGizmoLengthScale 2, selectionGizmoLineWidth 4.
- Les fonctions de prefUi sont les rendus personnalisés des préférences (case à cocher, curseur, liste) ; elles ignorent leurs deux premiers paramètres (cat, subCat), utilisent item.path pour appeler editor.setPreference et dessinent un bouton « valeur par défaut ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_controller.activate()` | Active l'outil : réinitialise l'état, réserve la sélectabilité, active la caméra temporaire de l'éditeur, applique la teinte de sélection et les bindings. | 1005 |
| `editor_ezObjectSelect_controller.deactivate()` | Désactive l'outil : annule fence, opérateurs modaux, session de transformation et gizmo natif, restaure la teinte de sélection selon gizmos.general.highlightSelectedMeshes, rend la caméra et le pavé numérique, quitte l'ortho. | 1033 |
| `editor_ezObjectSelect_controller.drawScreenDebug()` | Dessine les labels et diagnostics en overlay écran (anneau de survol, étiquettes, états du glisser). Ne fait rien si l'outil est inactif ou si fence est actif. *(interne)* | 508 |
| `editor_ezObjectSelect_controller.drawWorkspace()` | Dessine le contenu de la fenêtre « Easy Select » (onglets Selection avec snapping/placement/grille/rotation, Hints, Fence ; signets de caméra). *(interne)* | 1808 |
| `editor_ezObjectSelect_controller.invalidateSelectionCache(reason)` | Invalide le cache du modèle de sélection et le volume en cache des stats, et efface le dernier snapshot. | 1112 |
| `editor_ezObjectSelect_controller.isActive()` | Indique si l'outil est actif. | 1063 |
| `editor_ezObjectSelect_controller.loadPreferences()` | Charge toutes les préférences ezObjectSelect.* de l'éditeur dans la configuration locale. | 2194 |
| `editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged()` | Hook relayé quand l'alignement du gizmo (monde/local) change : synchronise le mode de coordonnées et transmet l'espace aux opérateurs modaux actifs. *(interne)* *(hook)* | 1098 |
| `editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode)` | Hook relayé quand le mode du gizmo d'axes change. Pendant un glisser natif, restaure le mode courant ; si le nouveau mode est translate/rotate/scale, bascule la visibilité du gizmo natif (le même mode une 2e fois le masque). *(interne)* *(hook)* | 1074 |
| `editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value)` | Hook : recopie la valeur modifiée d'une préférence ezObjectSelect.* dans la configuration locale. *(interne)* *(hook)* | 2263 |
| `editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry)` | Enregistre la catégorie « ezObjectSelect » (sous-catégories general, selection, etc.) avec valeurs par défaut, bornes et rendus prefUi. *(interne)* *(hook)* | 2330 |
| `editor_ezObjectSelect_controller.refreshSelectedTint()` | Demande de ré-appliquer la teinte des meshes sélectionnés (setAxisGizmoHighlightSelectedMeshes) si l'outil est actif. | 1067 |
| `editor_ezObjectSelect_controller.requestFocusShortcut()` | Centre la caméra en douceur sur l'objet survolé, sinon sur la sélection (editor.fitViewToSelectionSmooth). Ignoré pendant une opération. | 1207 |
| `editor_ezObjectSelect_controller.requestNumpadPreset(preset)` | Mémorise un préréglage de vue du pavé numérique, appliqué à la prochaine mise à jour si numpadMode == 1. | 1272 |
| `editor_ezObjectSelect_controller.requestRotateShortcut()` | Demande l'opérateur de rotation (R) sous les mêmes conditions. | 1154 |
| `editor_ezObjectSelect_controller.requestScaleShortcut()` | Demande l'opérateur d'échelle (S) sous les mêmes conditions. | 1163 |
| `editor_ezObjectSelect_controller.requestTransformShortcut()` | Demande l'opérateur de déplacement (G) si suppressCameraForGrs est activé et si aucune opération n'est en cours et que des objets sont sélectionnés. | 1145 |
| `editor_ezObjectSelect_controller.resetInputFilters()` | Débloque molette, mouvement caméra, entrées modales et pavé numérique, retire les action maps (Blender, numpad) et efface les demandes de raccourci. | 410 |
| `editor_ezObjectSelect_controller.update()` | Mise à jour par frame appelée par le mode d'édition : gère fence, opérateurs modaux, raccourcis, survol/sélection, glisser, gizmo natif, caméra et dessin 3D. *(interne)* | 1594 |

### Détail des paramètres

#### `editor_ezObjectSelect_controller.activate()`

Active l'outil : réinitialise l'état, réserve la sélectabilité, active la caméra temporaire de l'éditeur, applique la teinte de sélection et les bindings.

- **renvoie** : boolean true si actif (déjà actif ou activation réussie), false si la réservation de sélectabilité échoue

#### `editor_ezObjectSelect_controller.invalidateSelectionCache(reason)`

Invalide le cache du modèle de sélection et le volume en cache des stats, et efface le dernier snapshot.

- `reason` (*string*) : Raison (ex. objectAdded, prefabExploded), transmise au cache

#### `editor_ezObjectSelect_controller.isActive()`

Indique si l'outil est actif.

- **renvoie** : boolean 

#### `editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode)`

Hook relayé quand le mode du gizmo d'axes change. Pendant un glisser natif, restaure le mode courant ; si le nouveau mode est translate/rotate/scale, bascule la visibilité du gizmo natif (le même mode une 2e fois le masque).

- `mode` (*integer*) : editor.AxisGizmoMode_Translate, _Rotate ou _Scale

#### `editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value)`

Hook : recopie la valeur modifiée d'une préférence ezObjectSelect.* dans la configuration locale.

- `path` (*string*) : Chemin de préférence
- `value` (*any*) : Nouvelle valeur

#### `editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry)`

Enregistre la catégorie « ezObjectSelect » (sous-catégories general, selection, etc.) avec valeurs par défaut, bornes et rendus prefUi.

- `prefsRegistry` (*table*) : Registre de préférences

#### `editor_ezObjectSelect_controller.requestNumpadPreset(preset)`

Mémorise un préréglage de vue du pavé numérique, appliqué à la prochaine mise à jour si numpadMode == 1.

- `preset` (*any*) : Préréglage demandé (valeur transmise telle quelle)

#### `editor_ezObjectSelect_controller.update()`

Mise à jour par frame appelée par le mode d'édition : gère fence, opérateurs modaux, raccourcis, survol/sélection, glisser, gizmo natif, caméra et dessin 3D.

- **renvoie** : boolean false si l'outil est inactif ; sinon indique que l'outil a géré la frame (valeur comparée à true par le mode d'édition)

## Classe `prefUi`

Table locale de fonctions de rendu des préférences dans la fenêtre de préférences de l'éditeur. Chaque fonction a la signature (cat, subCat, item) : cat et subCat sont ignorés, item.path est le chemin de la préférence. Chaque fonction dessine le widget de la valeur correspondante et un bouton de remise par défaut.

| Méthode | Description | Ligne |
|---|---|---|
| `prefUi.boundsDepthTest(_, _, item)` | Case à cocher : masquer les segments de boîte de survol derrière la géométrie. | 2057 |
| `prefUi.clipMoveConstraintPlane(_, _, item)` | Case à cocher : masquer les lignes de grille derrière la géométrie (désactivée si le plan n'est pas affiché). | 2109 |
| `prefUi.debug(_, _, item)` | Case à cocher du mode debug (ezObjectSelect.general.debug). | 1953 |
| `prefUi.discoveryRadius(_, _, item)` | Entier : rayon écran de découverte des objets (8 à 500 px, défaut 100). | 1967 |
| `prefUi.dragBoundsDepthTest(_, _, item)` | Case à cocher : idem pour les boîtes pendant le glisser. | 2077 |
| `prefUi.labelPlacementMode(_, _, item)` | Liste : placement des étiquettes (par défaut « Follow mouse »). | 2087 |
| `prefUi.maxDiscoveryOutlines(_, _, item)` | Entier : nombre max de contours d'objets proches (0 à 50, défaut 5). | 1976 |
| `prefUi.maxPickDistance(_, _, item)` | Flottant : distance max entre le point de focus caméra et un objet sélectionnable (10 à 500, défaut 150). | 2001 |
| `prefUi.maxPickVolume(_, _, item)` | Flottant : volume max de boîte orientée pour être sélectionnable (défaut 500000). | 2017 |
| `prefUi.maxStackDistance(_, _, item)` | Flottant : au-delà de cette distance caméra, le survol ne résout que le meilleur objet (10 à 1000, défaut 200). | 2026 |
| `prefUi.maxStackOutlines(_, _, item)` | Entier : nombre max de contours de candidats superposés (1 à 50, défaut 5). | 1985 |
| `prefUi.numpadMode(_, _, item)` | Liste : mode du pavé numérique (standard ou préréglages de vue). | 2180 |
| `prefUi.orientationGizmoRightOffset(_, _, item)` | Entier : décalage horizontal en pixels depuis le coin haut-droit (défaut 75). | 2156 |
| `prefUi.orientationGizmoTopOffset(_, _, item)` | Entier : décalage vertical en pixels depuis le coin haut-droit (défaut 140). | 2144 |
| `prefUi.outlineMode(_, _, item)` | Liste : mode de contour (Outline ou boîtes remplies). | 2042 |
| `prefUi.selectedBoundsDepthTest(_, _, item)` | Case à cocher : idem pour les boîtes des objets sélectionnés. | 2067 |
| `prefUi.selectedTintEnabled(_, _, item)` | Case à cocher : teinter les meshes sélectionnés. | 2035 |
| `prefUi.selectionGizmoLengthScale(_, _, item)` | Flottant : multiplicateur de longueur des axes d'origine des objets sélectionnés (défaut 2). | 2119 |
| `prefUi.selectionGizmoLineWidth(_, _, item)` | Flottant : épaisseur de ces axes (défaut 4). | 2128 |
| `prefUi.showDistanceRing(_, _, item)` | Case à cocher : anneau de distance de sélection maximale. | 1994 |
| `prefUi.showHoverRing(_, _, item)` | Case à cocher : anneau de survol et lignes guides. | 1960 |
| `prefUi.showMoveConstraintPlane(_, _, item)` | Case à cocher : dessiner le plan de déplacement (G libre ou planaire). | 2102 |
| `prefUi.showOrientationGizmo(_, _, item)` | Case à cocher : repère d'orientation fixe monde/local dans le viewport. | 2137 |
| `prefUi.showVolumeFilteredObjects(_, _, item)` | Case à cocher : contour rouge des objets exclus par la limite de volume. | 2010 |
| `prefUi.suppressCameraForGrs(_, _, item)` | Case à cocher : réserver G, R, S aux outils modaux Move/Rotate/Scale (supprime le déplacement caméra WASD). | 2168 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`
- `obj:` `disableCollision`, `enableCollision`, `getID`, `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoMode`, `setAxisGizmoSelectedElement`, `setHoveredObjectId`

**Charge les extensions :** `core_orthoCamera`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/controller.lua`.*
