# `editor_toolUtilities_gizmo`

*Fichier : `lua/ge/extensions/editor/toolUtilities/gizmo.lua` · VM : Game Engine (GE) · 177 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_gizmo` : `extensions.load("editor_toolUtilities_gizmo")`, puis la globale `editor_toolUtilities_gizmo`

Gestion partagée du gizmo d'axes pour les outils d'édition de splines de l'éditeur. Place le gizmo sur le noeud sélectionné (ou sur une position d'ancrage d'affichage), déplace le noeud en translation (ou tous les noeuds en mode rigide), fait tourner les normales autour de la tangente locale, et enregistre le glissement dans l'historique d'annulation.

## Remarques

- L'état (splines, indices, callbacks) est gardé dans des variables du module : il est réécrit à chaque appel de handleGizmo.
- La rotation n'est possible qu'autour de la tangente locale ; le gizmo est forcé en alignement local en rotation et en alignement monde au passage en translation.
- setAxisGizmoTranslateLock(true, true, not isConformToTerrain) : la translation verticale (Z) dépend du mode conformité au terrain (verrou Z = non conforme, tel qu'écrit dans le code).
- À la fin du glissement, spline.isDirty est remis à true pour que le dernier état déclenche une reconstruction.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn)` | À appeler chaque frame : positionne, met à jour et dessine le gizmo sur le noeud sélectionné d'une spline, et configure les verrous d'axes. Pendant un glissement, le noeud suit le curseur ; relâcher valide l'action 'Gizmo Drag' dans l'historique. | 112 |
| `editor_toolUtilities_gizmo.isDragging()` | Vrai tant qu'un glissement du gizmo (translation ou rotation) est en cours ; permet de différer les reconstructions lourdes. | 170 |

### Détail des paramètres

#### `editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn)`

À appeler chaque frame : positionne, met à jour et dessine le gizmo sur le noeud sélectionné d'une spline, et configure les verrous d'axes. Pendant un glissement, le noeud suit le curseur ; relâcher valide l'action 'Gizmo Drag' dans l'historique.

- `isRotEnabledIn` (*boolean*) : Active la rotation (axe tangent).
- `selectedSplineIdx` (*integer*) : Indice de la spline sélectionnée.
- `selectedNodeIdx` (*integer*) : Indice du noeud sélectionné.
- `splinesIn` (*table[]*) : Liste des splines (chacune avec nodes, nmls, isDirty).
- `isConformToTerrainIn` (*boolean*) : Spline conforme au terrain (Z non libre au gizmo).
- `isRigidIn` (*boolean*) : Translation/rotation rigide appliquée à tous les noeuds.
- `deepCopyFunctIn` (*function*) : Copie profonde de l'état d'une spline, pour l'historique.
- `undoFunctIn` (*function*) : Callback d'annulation.
- `redoFunctIn` (*function*) : Callback de rétablissement.
- `commitHistoryOverrideIn` (*function|nil*) : Remplace editor.history:commitAction pour regrouper le glissement dans une action plus large.
- `anchorPosIn` (*vec3|nil*) : Position d'affichage du gizmo à la place du noeud ; nil = sur le noeud.

#### `editor_toolUtilities_gizmo.isDragging()`

Vrai tant qu'un glissement du gizmo (translation ou rotation) est en cours ; permet de différer les reconstructions lourdes.

- **renvoie** : boolean État du glissement.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/gizmo.lua`.*
