# `editor_toolUtilities_ribbonInput`

*Fichier : `lua/ge/extensions/editor/toolUtilities/ribbonInput.lua` · VM : Game Engine (GE) · 492 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_ribbonInput` : `extensions.load("editor_toolUtilities_ribbonInput")`, puis la globale `editor_toolUtilities_ribbonInput`

Gestion des événements souris et clavier pour les splines « ruban » des outils d'édition de l'éditeur. Un ruban est une spline posée en paires de nœuds gauche/droite (chaque paire a une profondeur). handleRibbonEvents (alias handlePrismEvents) dessine le curseur, l'aide à la pose des paires (premier nœud, second nœud), cherche le segment de ruban le plus proche du curseur, gère sélection, glissement de nœuds (libre ou rigide), gizmo (Alt), réglage de profondeur au glisser (0.1 m par pixel, entre 1 et 500 m), suppression (Suppr), insertion, et enregistre les modifications dans l'historique d'annulation.

## Remarques

- handleRibbonEvents et handlePrismEvents sont la même fonction (même ligne 281 dans la page auto).
- out.ribbonIdx est l'indice du ruban actif ; l'ancien nom out.prismIdx est accepté et recopié dans out.ribbonIdx. Sans ruban valide à cet indice, la fonction retourne sans rien renvoyer.
- out est mis à jour pendant les interactions avec ribbonIdx, nodeIdx, isGizmoActive.
- Les tampons de texte d'aide apparaissent après 1.0 s d'immobilité de la souris (timeUntilTextAppears).
- La poignée de profondeur est dessinée à l'échelle 0.5 mais la profondeur stockée n'est pas mise à l'échelle.
- L'état (souris, nœud gauche placé, minuteries, segment le plus proche) est local au module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)` | Alias de handleRibbonEvents (ancien nom, « prism » pour ruban prisme). Mêmes paramètres et valeurs de retour. | 281 |
| `editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)` | Gère les événements utilisateur pour les rubans, à appeler chaque frame par l'outil actif. Met à jour out, appelle updateRibbonDataFn après chaque modification et enregistre l'état complet via deepCopyFn / undoFn / redoFn. Renvoie le meilleur segment trouvé pour la recherche du segment sous le curseur, sur le ruban sélectionné. | 281 |

### Détail des paramètres

#### `editor_toolUtilities_ribbonInput.handlePrismEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)`

Alias de handleRibbonEvents (ancien nom, « prism » pour ruban prisme). Mêmes paramètres et valeurs de retour.

- `ribbons` (*table*) : Liste des rubans.
- `out` (*table*) : Table de sortie (ribbonIdx ou prismIdx, nodeIdx, isGizmoActive).
- `useGizmo` (*boolean*) : Gizmo utilisable.
- `isRigidTranslation` (*boolean*) : Translation rigide.
- `masterDepth` (*number*) : Profondeur des nouvelles paires.
- `updateRibbonDataFn` (*function*) : Callback de mise à jour.
- `deepCopyFn` (*function*) : Callback de copie profonde.
- `undoFn` (*function*) : Callback d'annulation.
- `redoFn` (*function*) : Callback de rétablissement.
- **renvoie** : integer Indice du segment le plus proche.
- **renvoie** : boolean Glissement de nœud en cours.

#### `editor_toolUtilities_ribbonInput.handleRibbonEvents(ribbons, out, useGizmo, isRigidTranslation, masterDepth, updateRibbonDataFn, deepCopyFn, undoFn, redoFn)`

Gère les événements utilisateur pour les rubans, à appeler chaque frame par l'outil actif. Met à jour out, appelle updateRibbonDataFn après chaque modification et enregistre l'état complet via deepCopyFn / undoFn / redoFn. Renvoie le meilleur segment trouvé pour la recherche du segment sous le curseur, sur le ruban sélectionné.

- `ribbons` (*table*) : Liste des rubans à éditer.
- `out` (*table*) : Table de sortie : ribbonIdx (ruban), nodeIdx (nœud), isGizmoActive (gizmo actif).
- `useGizmo` (*boolean*) : Le gizmo est-il utilisable.
- `isRigidTranslation` (*boolean*) : true : le glissement déplace tous les nœuds du même vecteur ; false : chaque nœud bouge indépendamment.
- `masterDepth` (*number*) : Profondeur utilisée pour les nouvelles paires de nœuds.
- `updateRibbonDataFn` (*function*) : Callback pour recalculer les données du ruban après modification.
- `deepCopyFn` (*function*) : Callback copiant en profondeur TOUTES les données de rubans (état complet) pour l'annulation.
- `undoFn` (*function*) : Callback d'annulation de l'état complet.
- `redoFn` (*function*) : Callback de rétablissement de l'état complet.
- **renvoie** : integer Indice du segment le plus proche du curseur sur le ruban sélectionné.
- **renvoie** : boolean true si un glissement de nœud est en cours (isNodeDrag).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/ribbonInput.lua`.*
