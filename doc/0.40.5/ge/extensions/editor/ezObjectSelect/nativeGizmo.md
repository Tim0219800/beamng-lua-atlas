# `editor_ezObjectSelect_nativeGizmo`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_nativeGizmo` : `extensions.load("editor_ezObjectSelect_nativeGizmo")`, puis la globale `editor_ezObjectSelect_nativeGizmo`

Enveloppe de l'outil Easy Select autour du gizmo d'axes natif de l'éditeur (editor.updateAxisGizmo / drawAxisGizmo). Capture les transformations/échelles de la sélection au début du glisser, applique translation (avec snap grille), rotation et échelle pendant le glisser, puis à la fin enregistre des actions d'historique annulables (SetObjectTransform / SetObjectScale, transaction « EasySelectNativeTransform » ou « EasySelectNativeScale ») et émet le hook onEditorObjectSelectionTransformChanged. Les offsets de prefab sont mis à jour pour les objets contenus dans un prefab.

## Remarques

- Le snap grille/rotation natif est désactivé pendant la mise à jour du gizmo puis restauré ; Alt gauche force le snap traditionnel. Le snap grille est appliqué par ce module lui-même (options.gridSnapEnabled, gridRelative, gridSize), en relatif ou en absolu selon gridRelative.
- Si la sélection change pendant un glisser, l'état est restauré (reset) et le gizmo ne dessine rien cette frame.
- Un simple clic sans mouvement ne crée aucune action d'historique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_nativeGizmo.consumeFinished()` | Lit et efface l'indicateur « glisser terminé cette frame ». | 355 |
| `editor_ezObjectSelect_nativeGizmo.draw(options)` | À appeler chaque frame : vérifie que la sélection correspond au glisser capturé et que les objets supportent le mode courant (position/rotation/scale non vides, editor.canManipulateObject), met à jour le gizmo avec les options de snap puis le dessine. | 332 |
| `editor_ezObjectSelect_nativeGizmo.isInteracting()` | Indique si un glisser du gizmo est en cours. | 351 |
| `editor_ezObjectSelect_nativeGizmo.reset()` | Annule le glisser en cours : restaure transformations et échelles d'origine, efface les indicateurs et annule l'interaction du gizmo. | 363 |

### Détail des paramètres

#### `editor_ezObjectSelect_nativeGizmo.consumeFinished()`

Lit et efface l'indicateur « glisser terminé cette frame ».

- **renvoie** : boolean true si un glisser s'est terminé
- **renvoie** : table|nil {mode, anchorDistance} (distance de translation appliquée, 0 hors translation) si des changements ont été validés

#### `editor_ezObjectSelect_nativeGizmo.draw(options)`

À appeler chaque frame : vérifie que la sélection correspond au glisser capturé et que les objets supportent le mode courant (position/rotation/scale non vides, editor.canManipulateObject), met à jour le gizmo avec les options de snap puis le dessine.

- `options` (*table|nil*) : {gridSnapEnabled, gridRelative, gridSize, rotateSnapEnabled, rotateSnapSize}
- **renvoie** : boolean false si rien n'a été dessiné (sélection changée ou mode non supporté), sinon true

#### `editor_ezObjectSelect_nativeGizmo.isInteracting()`

Indique si un glisser du gizmo est en cours.

- **renvoie** : boolean 

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionTransformChanged`

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getField`, `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`
- `ui_imgui.` `IsMouseDown`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTranslateOffset`, `getGridSize`, `getRotateSnapAngle`, `setAxisGizmoSelectedElement`, `setGridSnap`, `setRotateSnap`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua`.*
