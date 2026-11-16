# `editor_api_gizmo`

*Fichier : `lua/ge/extensions/editor/api/gizmo.lua` · VM : Game Engine (GE) · 586 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_gizmo` : `extensions.load("editor_api_gizmo")`, puis la globale `editor_api_gizmo`

API de l'éditeur pour le gizmo d'axes 3D (déplacer / tourner / mettre à l'échelle) et pour les icônes d'objets dans la vue monde. Il enveloppe `worldEditorCppApi` : choix du mode et de l'alignement, verrous par axe, magnétisme (snap) de translation/rotation/échelle, détection du survol/glisser à la souris, et calcul des transformations d'objets pendant un déplacement avec accrochage au terrain (raycast ou core_terrain). `initialize` installe tout sur l'objet `editor` et définit les constantes `editor.AxisGizmoMode_*` et `editor.AxisGizmoAlignment_*`.

## Exemple

```lua
editor.setAxisGizmoMode(editor.AxisGizmoMode_Translate)
editor.setAxisGizmoTransform(myMatrix)
-- chaque frame :
editor.updateAxisGizmo(onStart, onEnd, onDragging)
editor.drawAxisGizmo()
```

## Remarques

- Constantes définies : editor.AxisX/Y/Z/W = 0/1/2/3 ; AxisGizmoMode_Translate/Rotate/Scale = 1/2/3 ; AxisGizmoAlignment_World = 0, _Local = 1 ; editor.objectIconHitId = 0 au départ.
- `updateAxisGizmo` et `drawAxisGizmo` doivent être appelés ensemble à chaque frame. Pendant un glisser, la simulation est mise en pause (simTimeAuthority.pause) puis restaurée à la fin ou à l'annulation.
- onEndGizmoDragFunc n'est appelée que si le gizmo a réellement été glissé (objectSelectionManipulated).
- Les verrous setAxisGizmo*Lock(x, y, z) : true = l'axe est autorisé (le commentaire dit « allow »).
- Accrochage au terrain (beginGizmoTranslate/getTransformsGizmoTranslate) piloté par les préférences snapping.terrain.* : enabled, useRayCast, indObjects, relRotation, keepHeight, snapToCenter, snapToBB.
- Dans getTransformsGizmoTranslate, la hauteur de chaque objet utilise core_terrain.getTerrainHeight même en mode raycast (appelée avant de tester le raycast) : sans terrain, ces appels peuvent renvoyer nil (déduit du code, une valeur 0 de repli est utilisée avec `or`).
- Le commentaire de code signale que getTransformsGizmoTranslate n'a pas d'équivalent pour la rotation (TODO).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_gizmo.initialize(editorInstance)` | Mémorise l'éditeur, définit les constantes d'axe/mode/alignement et installe toutes les fonctions gizmo/icônes sur `editor`. *(interne)* | 533 |

### Détail des paramètres

#### `editor_api_gizmo.initialize(editorInstance)`

Mémorise l'éditeur, définit les constantes d'axe/mode/alignement et installe toutes les fonctions gizmo/icônes sur `editor`.

- `editorInstance` (*table*) : objet `editor`

## Classe `editor`

Fonctions ajoutées à `editor` par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects)` | À appeler une fois au début du glissement : mémorise les transformations de départ et, si l'accrochage au terrain est activé, les décalages au sol, normales et boîtes englobantes (collision des objets désactivée temporairement pour le raycast). | 96 |
| `editor.cancelAxisGizmoInteraction()` | Annule une interaction en cours : relâche virtuellement la souris, restaure la pause de la simulation et désélectionne l'élément du gizmo. | 349 |
| `editor.drawAxisGizmo()` | Dessine le gizmo avec sa transformation et son mode actuels (si la caméra de l'éditeur existe). | 364 |
| `editor.drawObjectIcons()` | Dessine les icônes des objets les plus proches si la caméra existe et que editor.hideObjectIcons n'est pas vrai. | 14 |
| `editor.getAxisGizmoAlignment()` | Renvoie l'alignement actuel du gizmo. | 423 |
| `editor.getAxisGizmoMode()` | Renvoie le mode actuel du gizmo. | 417 |
| `editor.getAxisGizmoScale()` | Renvoie l'échelle actuelle du gizmo. | 54 |
| `editor.getAxisGizmoSelectedElement()` | Renvoie l'élément du gizmo sélectionné (axe ou plan). | 433 |
| `editor.getAxisGizmoTransform()` | Renvoie la transformation actuelle du gizmo. | 49 |
| `editor.getTransformsGizmoTranslate(objects, objectHeights)` | À appeler à chaque frame du glissement après beginGizmoTranslate : renvoie les nouvelles transformations des objets (translation du gizmo, avec accrochage terrain et rotation relative selon les préférences). Renvoie {} si beginGizmoTranslate n'a pas été appelé. | 170 |
| `editor.isAxisGizmoHovered()` | Indique si un élément (axe ou plan) du gizmo est survolé/sélectionné. | 428 |
| `editor.modifyFadeIconsDistance(deltaValue)` | Ajuste la distance de fondu des icônes d'objets (préférence gizmos.objectIcons.fadeIconsDistance += delta x fadeIconsDistanceModifySpeed, bornée à 1..50000) et affiche une notification. | 499 |
| `editor.setAxisGizmoAlignment(alignment)` | Choisit l'alignement du gizmo et émet onEditorAxisGizmoAligmentChanged. | 385 |
| `editor.setAxisGizmoMode(mode)` | Choisit le mode du gizmo et émet onEditorAxisGizmoModeChanged(mode). | 376 |
| `editor.setAxisGizmoRotateLock(x, y, z)` | Autorise ou non la rotation par axe. | 403 |
| `editor.setAxisGizmoRotateSnap(enabled, rotationSnap)` | Règle le magnétisme de rotation. | 447 |
| `editor.setAxisGizmoScaleLock(x, y, z)` | Autorise ou non la mise à l'échelle par axe. | 411 |
| `editor.setAxisGizmoScaleSnap(enabled, scaleSnap)` | Règle le magnétisme d'échelle. | 454 |
| `editor.setAxisGizmoTransform(matrix, scale)` | Place le gizmo dans le monde (pour éditer des parties d'objet ou des poignées personnalisées). | 44 |
| `editor.setAxisGizmoTranslateLock(x, y, z)` | Autorise ou non la translation par axe. | 395 |
| `editor.setAxisGizmoTranslateSnap(enabled, gridSize)` | Règle le magnétisme de translation. | 440 |
| `editor.toggleAxisGizmoAlignment()` | Bascule entre alignement monde et local. | 459 |
| `editor.toggleDrawGizmoPlane()` | Inverse la préférence gizmos.general.drawGizmoPlane et active/désactive plan, hachures et grille de déplacement du gizmo. | 468 |
| `editor.toggleDrawObjectIcons()` | Inverse la préférence gizmos.general.drawObjectIcons et l'applique au C++. | 482 |
| `editor.toggleDrawObjectText()` | Inverse la préférence gizmos.general.drawObjectText (affichage des noms d'objets) et l'applique au C++. | 488 |
| `editor.toggleSelectionHighlight()` | Inverse la préférence gizmos.general.highlightSelectedMeshes. | 494 |
| `editor.toggleSnapping(value)` | Active/désactive le magnétisme de rotation et de translation selon les préférences snapping.general.* (rotateSnapSize, gridSize), sauf si la préférence rotateSnapEnabled / snapToGrid correspondante est déjà vraie. | 513 |
| `editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc)` | Traite les événements souris du gizmo (début, glissement, fin, survol), relaie les modificateurs clavier au C++ et émet onEditorAxisGizmoAligmentChanged si l'alignement a changé côté C++. À appeler avec drawAxisGizmo. | 289 |
| `editor.updateObjectIcons()` | Met à jour editor.objectIconHitId (icône d'objet sous la souris, 0 si icônes masquées ou préférence gizmos.general.drawObjectIcons == false) et editor.objectIconHoverId (seulement si aucun bouton souris n'est enfoncé et que l'UI ne capture pas la souris). À appeler à chaque frame. | 24 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAxisGizmoAligmentChanged` — écouté par 4 module(s)
- `onEditorAxisGizmoModeChanged` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawAxisGizmo`
- `worldEditorCppApi.` `checkObjectIconHit`, `drawClosestObjectIcons`, `getAxisGizmoAlignment`, `getAxisGizmoMode`, `getAxisGizmoScale`, `getAxisGizmoSelectedElement`, `getAxisGizmoTotalRotateOffset`, `getAxisGizmoTransform`, `getAxisGizmoTranslateOffset`, `onAxisGizmoMouseDown`, `onAxisGizmoMouseDragged`, `onAxisGizmoMouseMove`, `onAxisGizmoMouseUp`, `setAxisGizmoAlignment`, `setAxisGizmoMode`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`, `setAxisGizmoRotateLock`, `setAxisGizmoScaleLock`, `setAxisGizmoSelectedElement`, `setAxisGizmoTransform`, `setAxisGizmoTranslateLock`, `setDrawObjectIcons`, `setDrawObjectsText`, `setEventControlModifiers`, `setGridSnap`, `setRotateSnap`, `setScaleSnap`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/gizmo.lua`.*
